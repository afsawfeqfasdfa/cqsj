<?php
/**
 * CQSJ 全站连接信息 —— 单一信息源
 * 改这一个文件, 重启 cqsj_web 容器即全站生效 (web/start.sh 会读取并同步到各 PHP)
 */

// ---- 数据库 ----
define('CFG_DB_HOST', 'db');          // compose 服务名; 传统同机部署改成 127.0.0.1
define('CFG_DB_USER', 'root');
define('CFG_DB_PASS', '<<DB_OR_GM_PASSWORD>>');
define('CFG_DB_NAME', 'longwen');

// ---- 对外服务器地址 (客户端连的地址) ----
// 1 区用云映射 IP: <<GAME_PUBLIC_IP>> (端口经 start.sh 钉死 38913)
// 2 区仍走域名 <<GAME_DOMAIN>> (version.php 里写死, start.sh 只替换数字 IP 不碰域名)
define('CFG_SERVER_IP', '<<GAME_PUBLIC_IP>>');

// ---- 各区端口: 必须是 SessionServer loginPort, 不是网关端口 ----
define('CFG_GW_800', '20013');
define('CFG_GW_801', '20023');
define('CFG_GW_802', '20033');
define('CFG_GW_803', '20043');

// ---- 其它 ----
define('CFG_PAY_URL', 'http://127.0.0.1/');
define('CFG_DEBUG', '0');
