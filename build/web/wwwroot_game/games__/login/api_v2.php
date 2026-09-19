<?php
header('Content-Type:application/json; charset=utf-8');
require_once 'base64.php';//引用处理类文件
session_start();
date_default_timezone_set('PRC');


$filenameIP = "./localIP.txt";
$handleIP = fopen($filenameIP, "r");
$localIP = fread($handleIP,filesize($filenameIP));
fclose($handleIP); 

$key = $_POST['key'];
if ($key == 'oC3oVXOHSMSwwb16'){
$ip = getIp();   
$space = 0;
 
    


if (strpos($localIP,$ip) === false)
{

$space = 0;
}
else
{
 $space = 1;
}

$username = $_POST['username'];
$password = $_POST['password'];	
$version = $_POST['from'];
$username = str_replace("or","cca",$username);

if ($version == "2" ){






$db=array('db','root','<<DB_OR_GM_PASSWORD>>','longwen');

$so8=so8($db[0],$db[1],$db[2],$db[3]) or die(mysql_error());
$PwdHash=$password;

$result=mysql_query("SELECT Skey FROM `user` WHERE `Username` = '$username' and `PwdHash` = '$PwdHash'");

if($result&&mysql_num_rows($result)>0 or  $space >0 ){
$dwIDS = mysql_fetch_array($result, MYSQL_NUM);   

    
$result = 949456565;
if($result == 949456565){
	





$useripadd = 100;

if($useripadd  == 100){
	
$date = date('y-m-d h:i:s',time()); 







$sql="update user set `From_ADD`='$add',`From_IP`='$ip',`From_TIME`='$date',`Calle_T`='$linxustamp',Calle_Y=Calle_Y+1 where `Username`='$username'";
mysql_query($sql);



//$filenamemessageID = "/data/sbin/linux/messageID.txt";
//$handlemessageID = fopen($filenamemessageID, "r");
//$messageID = fread($handlemessageID,filesize($filenamemessageID));
//fclose($handlemessageID); 




$iden = rand(10000000, 30000000) ;
$cso = rand(10000000, 30000000) ;
$btk = rand(10000000, 30000000) ;
$db=array('db','root','<<DB_OR_GM_PASSWORD>>','longwen');
$so8=so8($db[0],$db[1],$db[2],$db[3]) or die(mysql_error());


$sql = "INSERT INTO under_cs (Armes,Account,Qts,Qiv,Address,Dtime,Stime,Platform) VALUES ('$iden','$username','$cso','$btk','$ip','$date','$linxustamp','cqsj_ys')";

mysql_query($sql);

$iden = $iden + 337525;
$cso = $cso + 726622;
$btk = $btk + 435152;


$base64 = new base64();
$iden = $base64->encode((string)$iden);

$base64 = new base64();
$cso = $base64->encode((string)$cso);

$base64 = new base64();
$btk = $base64->encode((string)$btk);



$base64 = new base64();
$msg = $base64->encode('登录成功祝你游戏愉快');

$Bcokey = $dwIDS[0];
$base64 = new base64();
$Spiritkey = $base64->encode('ideChangeStateProtocol');
$base64 = new base64();
$Thekey = $base64->encode('vNZtfMWDhjJs4jBjQygCtfqms0VRVE2F');
$base64 = new base64();
$ssio = $base64->encode('25537948');
$piecewise = 'Forge&DropAward&TitleDB&';
if($dynamicc == 2) 
{
  $dynamicc    = 999999999 ;   
}else
{
 $dynamicc    = 99999999 ;
}


$ServerName = '';




if ($space > 0){
$filename = "./resurgence.txt";
$handle = fopen($filename, "r");
$pk = fread($handle,filesize($filename));
fclose($handle);   
if($pk =="1")
{
$arr = array('code'=>10003,'msg'=>$msg,'Bcokey'=>$Bcokey,'Spiritkey'=>$Spiritkey,'Thekey'=>$Thekey,'ssio'=>$ssio,'piecewise'=>$piecewise,'pk'=>1,'dynamic'=>$dynamicc,'iden'=>$iden,'cso'=>$cso,'btk'=>$btk,'Skey'=>$dwIDS[0],'Payurl'=>$ServerName);    
}
else{
$arr = array('code'=>10003,'msg'=>$msg,'Bcokey'=>$Bcokey,'Spiritkey'=>$Spiritkey,'Thekey'=>$Thekey,'ssio'=>$ssio,'piecewise'=>$piecewise,'pk'=>0,'dynamic'=>$dynamicc,'iden'=>$iden,'cso'=>$cso,'btk'=>$btk,'Skey'=>$dwIDS[0],'Payurl'=>$ServerName);    
    
}



	  
}else{
 $arr = array('code'=>10003,'msg'=>$msg,'Bcokey'=>$Bcokey,'Spiritkey'=>$Spiritkey,'Thekey'=>$Thekey,'ssio'=>$ssio,'piecewise'=>$piecewise,'dynamic'=>$dynamicc,'iden'=>$iden,'cso'=>$cso,'btk'=>$btk,'Skey'=>$dwIDS[0],'Payurl'=>$ServerName);	   
    
}


echo urldecode(json_encode($arr,JSON_UNESCAPED_UNICODE));
	
	
}else{
$base64 = new base64();
$msg = $base64->encode('涉嫌账户多开');		
$arr = array('code'=>10004,'msg'=>$msg);
echo urldecode(json_encode($arr,JSON_UNESCAPED_UNICODE));	
	
}}else{
$base64 = new base64();
$msg = $base64->encode('登录已经超时,请勿重复登录');	
$arr = array('code'=>10004,'msg'=>$msg);
echo urldecode(json_encode($arr,JSON_UNESCAPED_UNICODE));		
	
}}
    
    
    else{
$base64 = new base64();
$msg = $base64->encode('账号或密码错误');		
$arr = array('code'=>10004,'msg'=> $msg);
echo urldecode(json_encode($arr,JSON_UNESCAPED_UNICODE)); 
    
    
    
}}else{
    
    
   $base64 = new base64();
$msg = $base64->encode('版本过低,请重新下载.');		
$arr = array('code'=>10004,'msg'=> $msg);
echo urldecode(json_encode($arr,JSON_UNESCAPED_UNICODE));  
    
    
}
    
    
}else{

$arr = array('code'=>10001,'msg'=>'无效的访问');
echo urldecode(json_encode($arr,JSON_UNESCAPED_UNICODE));
		
}



function so8($a,$b,$c,$d){
    $so8 = @mysql_pconnect($a,$b,$c);
    mysql_query("set names utf8");
    mysql_select_db($d, $so8);
    return $so8;
}




function send_post($url, $post_data) {

   

  $postdata = http_build_query($post_data);

  $options = array(

    'http' => array(

      'method' => 'POST',

      'header' => 'Content-type:application/x-www-form-urlencoded',

      'content' => $postdata,

      'timeout' => 15 * 60 // 超时时间（单位:s）

    )

  );

  $context = stream_context_create($options);

  $result = file_get_contents($url, false, $context);

   

  return $result;

}








function getSubstr($str, $leftStr, $rightStr)
 {
     $left = strpos($str, $leftStr);
     //echo '左边:'.$left;
     $right = strpos($str, $rightStr, $left + strlen($leftStr));
     //echo '<br>右边:'.$right;

     if($left < 0 or $right < $left) return '';
     return substr($str, $left + strlen($leftStr), $right-$left-strlen($leftStr));
 }
   function getIp()
    {

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



