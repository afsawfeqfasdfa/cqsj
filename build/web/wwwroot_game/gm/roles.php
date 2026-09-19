<?php
require_once __DIR__ . '/user/access.php';

// ===== 入口保护: 必须经 gm.php 鉴权跳转, 直接访问视为非法 =====
$ip = gm_client_ip();
if (gm_is_banned($ip)) {
    die('网络错误，请联系管理员');
}
if (!isset($_SESSION['gm_access_ok'])) {
    if (gm_record_illegal($ip)) {
        die('网络错误，请联系管理员');
    }
    die('网络错误，请联系管理员');
}
// roles.php - GM后台: 列出所有角色 + 删除角色
// 数据来源: MySQL longwen 库 player 表(角色) + user 表(所属账号)
$db_host = 'db';
$db_user = 'root';
$db_pass = '<<DB_OR_GM_PASSWORD>>';
$db_name = 'longwen';

$mysqli = new mysqli($db_host, $db_user, $db_pass, $db_name);
if ($mysqli->connect_error) {
    die('DB连接失败: ' . $mysqli->connect_error);
}
$mysqli->set_charset('utf8');

// ===== 反转 double-encoded UTF-8 (MySQL 连接字符集错配留下的乱码) =====
// 库字段是 utf8_bin, 但实际数据曾被按 latin1/cp1252 中转过.
// 每个可见字符对应原 UTF-8 的一个字节; 对 cp1252 映射的 0x80-0x9F 做回查表恢复.
function utf8_codepoints($s) {
    $cps = array(); $len = strlen($s); $i = 0;
    while ($i < $len) {
        $b = ord($s[$i]);
        if ($b < 0x80) { $cps[] = $b; $i++; }
        elseif (($b & 0xE0) === 0xC0) { $cps[] = (($b & 0x1F) << 6) | (ord($s[$i+1]) & 0x3F); $i += 2; }
        elseif (($b & 0xF0) === 0xE0) { $cps[] = (($b & 0x0F) << 12) | ((ord($s[$i+1]) & 0x3F) << 6) | (ord($s[$i+2]) & 0x3F); $i += 3; }
        elseif (($b & 0xF8) === 0xF0) { $cps[] = (($b & 0x07) << 18) | ((ord($s[$i+1]) & 0x3F) << 12) | ((ord($s[$i+2]) & 0x3F) << 6) | (ord($s[$i+3]) & 0x3F); $i += 4; }
        else { $i++; }
    }
    return $cps;
}
function fix_mojibake($s) {
    static $cp1252_to_byte = array(
        0x20AC=>0x80, 0x201A=>0x82, 0x0192=>0x83, 0x201E=>0x84,
        0x2026=>0x85, 0x2020=>0x86, 0x2021=>0x87, 0x02C6=>0x88,
        0x2030=>0x89, 0x0160=>0x8A, 0x2039=>0x8B, 0x0152=>0x8C,
        0x017D=>0x8E, 0x2018=>0x91, 0x2019=>0x92, 0x201C=>0x93,
        0x201D=>0x94, 0x2022=>0x95, 0x2013=>0x96, 0x2014=>0x97,
        0x02DC=>0x98, 0x2122=>0x99, 0x0161=>0x9A, 0x203A=>0x9B,
        0x0153=>0x9C, 0x017E=>0x9E, 0x0178=>0x9F,
    );
    $bytes = '';
    foreach (utf8_codepoints($s) as $cp) {
        if ($cp <= 0xFF)        { $bytes .= chr($cp); }
        elseif (isset($cp1252_to_byte[$cp])) { $bytes .= chr($cp1252_to_byte[$cp]); }
        else                    { $bytes .= '?'; }
    }
    return $bytes;
}

// ===== 处理删除角色 =====
if (isset($_POST['act']) && $_POST['act'] === 'del') {
    header('Content-Type: application/json; charset=utf-8');
    $roleid = trim($_POST['roleid']);
    if ($roleid === '') {
        echo json_encode(array('code' => 0, 'msg' => '角色ID为空'));
        exit;
    }
    // 用预处理防注入, 仅删除 player 主表(角色记录)
    $stmt = $mysqli->prepare('DELETE FROM player WHERE RoleID = ?');
    $stmt->bind_param('s', $roleid);
    if ($stmt->execute()) {
        if ($stmt->affected_rows > 0) {
            echo json_encode(array('code' => 1, 'msg' => '角色已删除'));
        } else {
            echo json_encode(array('code' => 0, 'msg' => '角色不存在或已删除'));
        }
    } else {
        echo json_encode(array('code' => 0, 'msg' => '删除失败: ' . $mysqli->error));
    }
    exit;
}

// ===== 职业映射 (依据 RankManager.lua: 1战士 2法师 3道士 4灵枪) =====
$SCHOOL = array(1 => '战士', 2 => '法师', 3 => '道士', 4 => '灵枪');

// ===== 在线判定: 真实在线人数 = 宿主守护进程(cqsj_conn_count.sh)统计的各网关 ESTABLISHED 连接数 =====
// 为什么不用 player.Status? 该字段不登出不清零(全是残留 2/4), 完全不可信.
// 游戏服走 host 网络而 web 走 bridge 网络, web 容器看不到 game 的网关连接, 故由宿主侧
// 每 3 秒统计 /proc/net/tcp 里各网关端口的 ESTABLISHED 数, 写入 zone_conn.json.
// 该 JSON 放在 games__/version/ 下(此目录整体 bind mount 进 web 容器), 故 PHP 可读.
// 判定规则: 每个区把"最近登录的前 N 个"角色(N=该区 ESTABLISHED 连接数)标为在线, 其余离线.
// 这是无逐角色在线标记时的近似 —— 最近登录者最可能是当前在线者; 连接数=0 的区全部离线.
define('ZONE_CONN_JSON', __DIR__ . '/../games__/version/zone_conn.json');
$ZONES = array(800, 801, 802, 803);

function zone_conn_load() {
    global $ZONES;
    $def = array();
    foreach ($ZONES as $w) { $def[$w] = 0; }
    if (!is_file(ZONE_CONN_JSON)) return $def;
    $raw = @file_get_contents(ZONE_CONN_JSON);
    if ($raw === false) return $def;
    $j = @json_decode($raw, true);
    if (!is_array($j)) return $def;
    $out = array();
    foreach ($ZONES as $w) { $out[$w] = isset($j[$w]) ? (int)$j[$w] : 0; }
    return $out;
}

// 计算在线角色集合: 每个区取 LastLogin 最大的前 N 个(N=该区连接数)标在线.
function compute_online_roles($rows, $zone_conn) {
    $by_zone = array();
    foreach ($rows as $r) {
        $w = (int)$r['WorldID'];
        // 仅纳入真正登入过(LastLogin>0)的角色, 跳过从未登录的占位号
        if ((int)$r['LastLogin'] > 0) {
            $by_zone[$w][] = $r;
        }
    }
    $online = array();
    foreach ($zone_conn as $w => $n) {
        if ($n <= 0 || empty($by_zone[$w])) continue;
        $arr = $by_zone[$w];
        // 按 LastLogin 降序(最近登录的排最前)
        usort($arr, function ($a, $b) { return (int)$b['LastLogin'] - (int)$a['LastLogin']; });
        $n = min($n, count($arr));
        for ($i = 0; $i < $n; $i++) {
            $online[$arr[$i]['RoleID']] = true;
        }
    }
    return $online;
}

// 渲染单行 HTML(供整页渲染与 5 秒轮询复用, 保证新建角色也能出现在自动刷新里)
function render_row_html($r, $SCHOOL, $online_roles) {
    $school = isset($SCHOOL[$r['School']]) ? $SCHOOL[$r['School']] : ('职业' . $r['School']);
    $online = isset($online_roles[$r['RoleID']]) ? '在线' : '离线';
    $oncls  = ($online === '在线') ? 'on' : 'off';
    $acct   = $r['account'] ? $r['account'] : '未知';
    $cname  = $r['cname'];
    return '<tr data-kw="' . htmlspecialchars($cname . ' ' . $acct, ENT_QUOTES) . '">'
        . '<td>' . htmlspecialchars($cname) . '</td>'
        . '<td>' . htmlspecialchars($acct) . '</td>'
        . '<td>' . htmlspecialchars($r['WorldID']) . '</td>'
        . '<td>' . (int)$r['Level'] . '</td>'
        . '<td>' . $school . '</td>'
        . '<td>' . (int)$r['Ingot'] . '</td>'
        . '<td class="' . $oncls . ' online-cell" data-rid="' . htmlspecialchars($r['RoleID'], ENT_QUOTES) . '">' . $online . '</td>'
        . '<td><button class="btn-del" data-rid="' . htmlspecialchars($r['RoleID'], ENT_QUOTES) . '" data-name="' . htmlspecialchars($cname, ENT_QUOTES) . '">删除</button></td>'
        . '</tr>';
}

// 拉取全部未删除角色(含乱码修复 + LastLogin), 供整页与轮询共用
function fetch_role_rows($mysqli) {
    $sql = "SELECT p.RoleID, p.Name AS cname, p.WorldID, p.WorldName, p.Level, p.School, p.Ingot,
                   p.Status, p.LastLogin, u.Username AS account
            FROM player p
            LEFT JOIN user u ON p.UserID = u.UserID
            WHERE p.isdelete = 0 OR p.isdelete IS NULL
            ORDER BY p.WorldID ASC, p.Level DESC";
    $res = $mysqli->query($sql);
    $rows = array();
    if ($res) {
        while ($r = $res->fetch_assoc()) {
            $r['cname']     = fix_mojibake($r['cname']);
            $r['WorldName'] = fix_mojibake($r['WorldName']);
            if (!empty($r['account'])) {
                $r['account'] = fix_mojibake($r['account']);
            }
            $rows[] = $r;
        }
    }
    return $rows;
}

$zone_conn = zone_conn_load();

// ===== 角色列表轮询接口(供前端每 5 秒局部刷新, 含新建角色 + 实时在线状态) =====
if (isset($_GET['act']) && $_GET['act'] === 'list') {
    header('Content-Type: text/html; charset=utf-8');
    $rows = fetch_role_rows($mysqli);
    $online_roles = compute_online_roles($rows, $zone_conn);
    foreach ($rows as $rr) {
        echo render_row_html($rr, $SCHOOL, $online_roles);
    }
    exit;
}

// 列出所有未删除角色(含所属账号与在线信号)
$rows = fetch_role_rows($mysqli);
$online_roles = compute_online_roles($rows, $zone_conn);
?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>角色管理 - GM后台</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/popup.js"></script>
    <script src="js/jquery-1.7.2.min.js"></script>
    <style>
        body { background:#f0f2f5; font-family:Microsoft YaHei,"PingFang SC",sans-serif; }
        .wrap { max-width:1120px; margin:24px auto; background:#fff; border-radius:10px;
                box-shadow:0 4px 18px rgba(0,0,0,.08); padding:22px 24px; }
        h3 { margin:0 0 4px; }
        .sub { color:#888; font-size:13px; margin-bottom:16px; }
        table { font-size:13px; }
        td, th { white-space:nowrap; }
        .on  { color:#28a745; font-weight:bold; }
        .off { color:#999; }
        .btn-del { background:linear-gradient(135deg,#dc3545,#e85563); color:#fff; border:none;
                   border-radius:6px; padding:5px 14px; cursor:pointer; }
        .btn-del:hover { opacity:.9; }
        .filter { margin-bottom:12px; }
    </style>
</head>
<body>
<div class="wrap">
    <h3>角色管理</h3>
    <div class="sub">共 <span id="cnt"><?php echo count($rows); ?></span> 个角色（数据来自 longwen.player）· 在线状态依据宿主实时统计的各网关连接数(权威), 标出每个区"最近登录的前 N 个"(N=该区在线连接数)为在线 · 每 5 秒自动刷新（含新建角色）</div>

    <div class="filter">
        <input id="kw" class="form-control" style="width:280px;display:inline-block;"
               placeholder="搜索 角色名 / 所属账号">
        <!-- 返回 GM 后台: 不依赖域名. 优先用浏览器后退(history.back), 无历史时退回同目录相对路径 gm.php -->
        <button type="button" class="btn btn-default" style="margin-left:8px;" onclick="if(history.length>1){history.back();}else{location.href='gm.php';}">返回 GM 后台</button>
    </div>

    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>角色名</th>
                <th>所属账号</th>
                <th>区服</th>
                <th>等级</th>
                <th>职业</th>
                <th>元宝</th>
                <th>是否在线</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
        <?php foreach ($rows as $r): ?>
            <?php echo render_row_html($r, $SCHOOL, $online_roles); ?>
        <?php endforeach; ?>
        </tbody>
    </table>
</div>

<script>
$(function () {
    // 搜索过滤(用 .attr 取原始字符串, 避免 jQuery 把数字串转 Number)
    function applyFilter() {
        var k = $('#kw').val().trim().toLowerCase();
        $('tbody tr').each(function () {
            var kw = $(this).attr('data-kw').toLowerCase();
            $(this).toggle(kw.indexOf(k) > -1);
        });
    }
    $('#kw').on('input', applyFilter);

    // 删除角色 -> 二次确认 -> 提交
    // 事件委托到 document, 让 5 秒刷新后新增的行也能正常触发
    // 注意: RoleID 是 18 位 varchar, 必须用 .attr('data-rid') 取原始字符串,
    // 不能用 .data('rid') (jQuery 会把它转成 Number, 18 位超 JS 安全整数被截断 -> 删不掉)
    $(document).on('click', '.btn-del', function () {
        var rid  = $(this).attr('data-rid');
        var name = $(this).attr('data-name');
        confirmBox('确定要删除角色【' + name + '】吗？\n此操作不可恢复，角色数据将被清除！', function () {
            $.post('roles.php', { act: 'del', roleid: rid }, function (res) {
                if (typeof res === 'string') {
                    try { res = JSON.parse(res); } catch (e) { res = { code: 0, msg: res }; }
                }
                if (res.code == 1) {
                    toast(res.msg, 'success');
                    $('.btn-del[data-rid="' + rid + '"]').closest('tr').remove();
                    $('#cnt').text($('tbody tr').length);
                } else {
                    toast(res.msg, 'error');
                }
            }, 'json').fail(function () {
                toast('请求失败，请重试', 'error');
            });
        });
    });

    // 每 5 秒局部刷新: 重建整张表(含新建角色 + 实时在线), 不整页重载, 再套用当前搜索词
    function refreshList() {
        $.get('roles.php?act=list', function (html) {
            $('tbody').html(html);
            applyFilter();
            $('#cnt').text($('tbody tr').length);
        }, 'html').fail(function () { /* 静默忽略轮询失败 */ });
    }
    setInterval(refreshList, 5000);
});
</script>
</body>
</html>
