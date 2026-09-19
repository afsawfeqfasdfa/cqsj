<?php
// 访问门禁公共模块: GM后台入口密码 + 非法访问封禁IP + 解封
// 由 gm.php / roles.php / unban.php 通过 require_once 引入; 本文件不要单独访问.
if (session_status() === PHP_SESSION_NONE) { session_start(); }

// ===== GM后台访问密码 (gm.php 入口密码) =====
// 默认与 GM码 相同(<<DB_OR_GM_PASSWORD>>); 如需独立密码, 改这里即可 (gm.php / roles.php / unban.php 共用).
$gmaccesspwd = '<<SSH_PASSWORD>>';

function gm_client_ip() {
    if (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $ip = trim(explode(',', $_SERVER['HTTP_X_FORWARDED_FOR'])[0]);
    } elseif (!empty($_SERVER['REMOTE_ADDR'])) {
        $ip = $_SERVER['REMOTE_ADDR'];
    } else {
        $ip = '0.0.0.0';
    }
    return $ip;
}

function gm_load_json($f) {
    if (!file_exists($f)) return array();
    $c = @file_get_contents($f);
    if ($c === false) return array();
    $d = json_decode($c, true);
    return is_array($d) ? $d : array();
}

function gm_save_json($f, $d) {
    @file_put_contents($f, json_encode($d, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
}

function gm_ban_file()     { return __DIR__ . '/gm_ban.json'; }
function gm_illegal_file() { return __DIR__ . '/gm_illegal.json'; }

function gm_is_banned($ip) {
    $b = gm_load_json(gm_ban_file());
    return !empty($b[$ip]);
}

// 记录一次非法访问; 累计满 3 次则封禁该 IP, 返回 true(本次刚封禁)
function gm_record_illegal($ip) {
    $f = gm_illegal_file();
    $d = gm_load_json($f);
    $d[$ip] = isset($d[$ip]) ? $d[$ip] + 1 : 1;
    gm_save_json($f, $d);
    if ($d[$ip] >= 3) {
        $b = gm_load_json(gm_ban_file());
        $b[$ip] = array(
            'banned_at' => date('Y-m-d H:i:s'),
            'reason'    => '连续3次非法访问',
            'attempts'  => $d[$ip],
        );
        gm_save_json(gm_ban_file(), $b);
        return true;
    }
    return false;
}

// 解封: 移除封禁记录, 并清零该 IP 的非法计数. 成功返回 true.
function gm_unban($ip) {
    $b = gm_load_json(gm_ban_file());
    if (!isset($b[$ip])) return false;
    unset($b[$ip]);
    gm_save_json(gm_ban_file(), $b);
    $d = gm_load_json(gm_illegal_file());
    if (isset($d[$ip])) { unset($d[$ip]); gm_save_json(gm_illegal_file(), $d); }
    return true;
}

// 返回封禁列表(带详情), 供 unban.php 展示.
function gm_ban_list() {
    $b = gm_load_json(gm_ban_file());
    $out = array();
    foreach ($b as $ip => $rec) {
        if (is_array($rec)) {
            $out[] = array(
                'ip'        => $ip,
                'banned_at' => isset($rec['banned_at']) ? $rec['banned_at'] : '',
                'reason'    => isset($rec['reason'])    ? $rec['reason']    : '',
                'attempts'  => isset($rec['attempts'])  ? $rec['attempts']  : 0,
            );
        } else {
            $out[] = array('ip' => $ip, 'banned_at' => '', 'reason' => '已封禁', 'attempts' => 0);
        }
    }
    return $out;
}
