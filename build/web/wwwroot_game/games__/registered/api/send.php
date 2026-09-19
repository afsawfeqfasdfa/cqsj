<?php
header('Content-Type:application/json; charset=utf-8');
session_start();
date_default_timezone_set('PRC');
$key = $_GET['key'];
if ($key == '<<DB_OR_GM_PASSWORD>>'){
$mobile = $_GET['mobile'];	
if(preg_match("/^1[34578]\d{9}$/", $mobile)){
	
$ip = getIp();
$db=array('db','root','<<DB_OR_GM_PASSWORD>>','longwen');
$so8=so8($db[0],$db[1],$db[2],$db[3]) or die(mysql_error());

$result=mysql_query("SELECT * FROM `user` WHERE `Username` = '$mobile'");
$link=mysql_query("SELECT * FROM `user` WHERE `Reg_IP` = '$ip'");
if($result&&mysql_num_rows($result)>0){
	
$arr = array('code'=>10003,'msg'=>'此号码已经被注册');
echo json_encode($arr);	
	
}elseif($link&&mysql_num_rows($link)>=1){
	
$arr = array('code'=>10003,'msg'=>'已达到最大注册数');
echo json_encode($arr);		
	
}else{

$Time = date("Y-m-d");
$result=mysql_query("SELECT * FROM `User_RegIP` WHERE `From_IP` = '$ip' and `From_TIME` ='$Time'");	
if(mysql_num_rows($result) < 5 and $ip != 'unknown'){
mysql_query("INSERT INTO User_RegIP(`From_IP`,`From_TIME`) VALUES ('$ip','$Time');");

$Code =  rand(1000, 9999);
$lstime = time();

mysql_query("INSERT INTO User_Reg(`Mobile`,`Vcode`,`Ltime`) VALUES ('$mobile','$Code','$lstime');");


	
$post_data = array();
$post_data['userid'] = 2275;//用户ID（userid）登陆后台：http://cloud.yunsms.cn 通过“发短信”-“接入摘要”查询。
$post_data['account'] = 'viphome5';
$post_data['password'] = '3328379';
$post_data['content'] = '【传世】您的验证码：'.$Code; //短信内容
$post_data['mobile'] = $mobile;
//$post_data['sendtime'] = ''; //时定时发送，输入格式YYYY-MM-DD HH:mm:ss的日期值
//$url='http://<<SMS_GATEWAY_IP>>:8888/sms.aspx?action=send';
//$o='';
//foreach ($post_data as $k=>$v)
//{
//   $o.="$k=".urlencode($v).'&';
//}
//$post_data=substr($o,0,-1);
//$ch = curl_init();
//curl_setopt($ch, CURLOPT_POST, 1);
//curl_setopt($ch, CURLOPT_HEADER, 0);
//curl_setopt($ch, CURLOPT_URL,$url);
//curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
//curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //如果需要将结果直接返回到变量里，那加上这句。
//$result = curl_exec($ch);

$arr = array('code'=>10004,'msg'=>'发送成功 你的验证码是：'.$Code);
echo json_encode($arr);	

	

}else{
	
$arr = array('code'=>10002,'msg'=>'获取验证码失败');
echo json_encode($arr);	

}}}else{
	
$arr = array('code'=>10001,'msg'=>'请输入有效的手机号码');
echo json_encode($arr);		
	
}	
	
	
	
	
	
}else{
	
$arr = array('code'=>10000,'msg'=>'Access error');
echo json_encode($arr);	
}





function so8($a,$b,$c,$d){
    $so8 = @mysql_pconnect($a,$b,$c);
    mysql_query("set names utf8");
    mysql_select_db($d, $so8);
    return $so8;
}


function getIp(){

        if(!empty($_SERVER["HTTP_CLIENT_IP"]))
        {
            $cip = $_SERVER["HTTP_CLIENT_IP"];
        }
        else if(!empty($_SERVER["HTTP_X_FORWARDED_FOR"]))
        {
            $cip = $_SERVER["HTTP_X_FORWARDED_FOR"];
        }
        else if(!empty($_SERVER["REMOTE_ADDR"]))
        {
            $cip = $_SERVER["REMOTE_ADDR"];
        }
        else
        {
            $cip = '';
        }
        preg_match("/[\d\.]{7,15}/", $cip, $cips);
        $cip = isset($cips[0]) ? $cips[0] : 'unknown';
        unset($cips);

        return $cip;
}
?>