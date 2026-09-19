<?php
header('Content-Type:application/json; charset=utf-8');
session_start();
date_default_timezone_set('PRC');
$key = isset($_POST['key']) ? $_POST['key'] : (isset($_GET['key']) ? $_GET['key'] : '');
$select = isset($_POST['select']) ? $_POST['select'] : (isset($_GET['select']) ? $_GET['select'] : '');
// private server: do not block by key
$db=array('db','root','<<DB_OR_GM_PASSWORD>>','longwen');
$so8=@mysql_pconnect($db[0],$db[1],$db[2]) or die(mysql_error());
mysql_query("set names utf8");
mysql_select_db($db[3], $so8);
$version = '0.0.1';
$data='{"version":"'.$version.'","default":[800,801],"servers":['
    .'{"id":800,"name":"<1区>玄武","status":1,"ip":"<<GAME_PUBLIC_IP>>","port":38913,"serverId":800},'
    .'{"id":801,"name":"<2区>朱雀","status":1,"ip":"<<GAME_DOMAIN>>","port":20023,"serverId":801}]}';
echo $data;
?>
