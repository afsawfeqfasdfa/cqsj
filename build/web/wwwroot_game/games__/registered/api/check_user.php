<?php
header('Content-Type:application/json; charset=utf-8');
session_start();
date_default_timezone_set('PRC');

function so8($a,$b,$c,$d){
    $so8 = @mysql_pconnect($a,$b,$c);
    mysql_query("set names utf8");
    mysql_select_db($d, $so8);
    return $so8;
}

$mobile = isset($_GET['mobile']) ? trim($_GET['mobile']) : '';
if($mobile == ''){
    echo json_encode(array('available'=>false,'msg'=>'账号不能为空'));
    exit;
}
// 复杂度: 仅允许 6-12 位字母/数字, 禁止中文与特殊符号
if(!preg_match('/^[A-Za-z0-9]{6,12}$/', $mobile)){
    echo json_encode(array('available'=>false,'msg'=>'格式不符'));
    exit;
}
$db=array('db','root','<<DB_OR_GM_PASSWORD>>','longwen');
$so8=so8($db[0],$db[1],$db[2],$db[3]) or die(mysql_error());
$mobile = mysql_real_escape_string($mobile);
$result=mysql_query("SELECT * FROM `user` WHERE `Username` = '$mobile'");
if($result && mysql_num_rows($result)>0){
    echo json_encode(array('available'=>false,'msg'=>'账号已被注册'));
}else{
    echo json_encode(array('available'=>true,'msg'=>'账号可以使用'));
}
?>
