<?php
header("Access-Control-Allow-Origin: *");
header('Content-Type:application/json; charset=utf-8');
session_start();
date_default_timezone_set('PRC');

// ===== 配置 =====
$SPECIAL_INVITE = 'admin123';   // 特殊邀请码: 可无限注册 (此值也直接作为 Skey 写入)
// ================

$key    = $_GET['key'];
$code   = $_GET['code'];        // 邀请码, 来自表单隐藏域 mazey, 同时作为 Skey 写入
$pass   = $_GET['pass'];
$mobile = $_GET['mobile'];

$ip = getIp();

// 基础完整性校验
if ($key != '<<DB_OR_GM_PASSWORD>>' || $code == '' || $mobile == '' || $pass == ''){
    echo json_encode(array('code'=>10001,'msg'=>'无效的访问或信息不完整'));
    exit;
}

// 复杂度: 账号/密码 仅允许 6-12 位字母或数字, 禁止中文与特殊符号
if(!preg_match('/^[A-Za-z0-9]{6,12}$/', $mobile)){
    echo json_encode(array('code'=>10002,'msg'=>'账号需6-12位字母或数字,不含中文/特殊符号'));
    exit;
}
if(!preg_match('/^[A-Za-z0-9]{6,12}$/', $pass)){
    echo json_encode(array('code'=>10002,'msg'=>'密码需6-12位字母或数字,不含中文/特殊符号'));
    exit;
}

$db=array('db','root','<<DB_OR_GM_PASSWORD>>','longwen');
$so8=so8($db[0],$db[1],$db[2],$db[3]) or die(mysql_error());

$mobile = mysql_real_escape_string($mobile);
$code   = mysql_real_escape_string($code);

// 重复账号检查
$result=mysql_query("SELECT * FROM `user` WHERE `Username` = '$mobile'");
if($result && mysql_num_rows($result)>0){
    echo json_encode(array('code'=>10003,'msg'=>'账号已经被注册'));
    exit;
}

// 邀请码逻辑: 特殊邀请码(写入 Skey 后)可无限注册; 否则同一IP仅限1个账号
if($code != $SPECIAL_INVITE){
    $r = mysql_query("SELECT * FROM `user` WHERE `Reg_IP` = '$ip' AND `Skey` != '$SPECIAL_INVITE'");
    if($r && mysql_num_rows($r)>0){
        echo json_encode(array('code'=>10005,'msg'=>'你已经有账号了,不能继续注册了'));
        exit;
    }
}

// 写库 (Skey = 邀请码, 不再使用 InviteCode 列)
$PwdHash = $pass;
$date = date('y-m-d h:i:s',time());
$result = mysql_query("INSERT INTO user(`Username`,`UserID`,`CreateDate_obj`,`PwdHash`,`WorldID`,`Reg_IP`,`Reg_ADD`,`State`,`Calle_F`,`Skey`) VALUES ('$mobile','$mobile','$date','$PwdHash','800','$ip','NET','1','1','$code');");

if($result){
    echo json_encode(array('code'=>10004,'msg'=>'注册成功'));
}else{
    echo json_encode(array('code'=>10006,'msg'=>'注册失败,请重试'));
}

function so8($a,$b,$c,$d){
    $so8 = @mysql_pconnect($a,$b,$c);
    mysql_query("set names utf8");
    mysql_select_db($d, $so8);
    return $so8;
}

function getIp() {
    if(!empty($_SERVER["HTTP_CLIENT_IP"])) {
        $cip = $_SERVER["HTTP_CLIENT_IP"];
    } else if(!empty($_SERVER["HTTP_X_FORWARDED_FOR"])) {
        $cip = $_SERVER["HTTP_X_FORWARDED_FOR"];
    } else if(!empty($_SERVER["REMOTE_ADDR"])) {
        $cip = $_SERVER["REMOTE_ADDR"];
    } else {
        $cip = '';
    }
    preg_match("/[\d\.]{7,15}/", $cip, $cips);
    $cip = isset($cips[0]) ? $cips[0] : 'unknown';
    unset($cips);
    return $cip;
}
?>
