<?php
require_once 'user/access.php';

// ===== 与 gm.php 相同的访问门禁 =====
$ip = gm_client_ip();
if (gm_is_banned($ip)) {
    die('网络错误，请联系管理员');
}
if (!isset($_SESSION['gm_access_ok'])) {
    $access_err = '';
    if (isset($_POST['accesspwd'])) {
        if (trim($_POST['accesspwd']) === $gmaccesspwd) {
            $_SESSION['gm_access_ok'] = 1;
            header('Location: unban.php');
            exit;
        }
        $access_err = '访问密码错误';
    }
    echo '<!DOCTYPE html><html lang="zh-CN"><head><meta charset="UTF-8">';
    echo '<title>IP封禁列表 - 访问验证</title>';
    echo '<style>body{font-family:sans-serif;background:#1a1a2e;color:#eee;display:flex;align-items:center;justify-content:center;height:100vh;margin:0}.box{background:#16213e;padding:30px 40px;border-radius:8px;text-align:center;box-shadow:0 0 20px rgba(0,0,0,.4)}.box h3{margin:0 0 16px}.box input{padding:10px;font-size:16px;width:240px;margin:6px 0;border-radius:4px;border:1px solid #444;background:#0f3460;color:#eee}.box button{padding:10px 28px;font-size:16px;background:#e94560;color:#fff;border:none;border-radius:4px;cursor:pointer}.err{color:#ff6b81;margin:8px 0}</style>';
    echo '</head><body><div class="box"><h3>IP 封禁列表 - 访问验证</h3>';
    if ($access_err) echo '<div class="err">' . $access_err . '</div>';
    echo '<form method="post"><input type="password" name="accesspwd" placeholder="请输入访问密码" autofocus><br><button type="submit">进入</button></form></div></body></html>';
    exit;
}

// ===== 处理解封 =====
$notice = '';
if (isset($_POST['unban_ip'])) {
    $uip = trim($_POST['unban_ip']);
    if (gm_unban($uip)) {
        $notice = '已解封：' . htmlspecialchars($uip, ENT_QUOTES, 'UTF-8');
    } else {
        $notice = '该 IP 不在封禁列表中：' . htmlspecialchars($uip, ENT_QUOTES, 'UTF-8');
    }
}

$list = gm_ban_list();
?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>IP 封禁列表</title>
<style>
body{font-family:"Microsoft YaHei",sans-serif;background:#f4f6f9;color:#333;margin:0;padding:30px}
h2{margin:0 0 18px;color:#2c3e50}
.msg{padding:10px 14px;border-radius:4px;background:#d4edda;color:#155724;margin-bottom:16px;display:inline-block}
.empty{color:#888;padding:20px;background:#fff;border-radius:6px}
table{width:100%;border-collapse:collapse;background:#fff;box-shadow:0 1px 3px rgba(0,0,0,.08);border-radius:6px;overflow:hidden}
th,td{padding:12px 14px;text-align:left;border-bottom:1px solid #eee;font-size:14px}
th{background:#2c3e50;color:#fff;font-weight:normal}
tr:hover{background:#f9fbfd}
.ip{font-family:Consolas,monospace;font-weight:bold;color:#c0392b}
button.unban{padding:6px 16px;background:#27ae60;color:#fff;border:none;border-radius:4px;cursor:pointer}
button.unban:hover{background:#219150}
a.back{display:inline-block;margin-top:18px;color:#2980b9;text-decoration:none}
a.back:hover{text-decoration:underline}
</style>
</head>
<body>
<h2>IP 封禁列表</h2>
<?php if ($notice) echo '<div class="msg">' . $notice . '</div>'; ?>

<?php if (empty($list)): ?>
  <div class="empty">当前没有封禁的 IP。</div>
<?php else: ?>
  <table>
    <thead><tr><th>IP 地址</th><th>封禁时间</th><th>原因</th><th>非法次数</th><th>操作</th></tr></thead>
    <tbody>
    <?php foreach ($list as $row): ?>
      <tr>
        <td class="ip"><?php echo htmlspecialchars($row['ip'], ENT_QUOTES, 'UTF-8'); ?></td>
        <td><?php echo htmlspecialchars($row['banned_at'] ?: '-', ENT_QUOTES, 'UTF-8'); ?></td>
        <td><?php echo htmlspecialchars($row['reason'] ?: '-', ENT_QUOTES, 'UTF-8'); ?></td>
        <td><?php echo (int)$row['attempts']; ?></td>
        <td>
          <form method="post" onsubmit="return confirm('确定解封 <?php echo htmlspecialchars($row['ip'], ENT_QUOTES, 'UTF-8'); ?> ？');">
            <input type="hidden" name="unban_ip" value="<?php echo htmlspecialchars($row['ip'], ENT_QUOTES, 'UTF-8'); ?>">
            <button type="submit" class="unban">解封</button>
          </form>
        </td>
      </tr>
    <?php endforeach; ?>
    </tbody>
  </table>
<?php endif; ?>

<a class="back" href="gm.php">&larr; 返回 GM 后台</a>
</body>
</html>
