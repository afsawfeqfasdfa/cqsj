<?php
header('Content-Type:application/json; charset=utf-8');
session_start();
date_default_timezone_set('PRC');
$key = $_POST['token'];
$username = $_POST['roleID'];
$sid = $_POST['sid'];
$serverid = $_POST['serverid']; //区服ID
$serverid = str_replace("80","",$serverid);

if ($key == "ActivityC_value"){
    
   if($sid == '<<LAN_IP>>') {
       
$arr = array('code'=>10000,'Flow_value'=>'1');
echo json_encode($arr);	   
  
   }else{
       
 $arr = array('code'=>10000,'Flow_value'=>'2');
echo json_encode($arr);	     
       
   }
    
    
    
    

    
}else{

$db=array('db','root','<<DB_OR_GM_PASSWORD>>','longwen');

// $db=array($sid,'BI6HtTqKv6nTZNi','wUqCDNVTo7fIdir','longwen');
$so8=so8($db[0],$db[1],$db[2],$db[3]) or die(mysql_error());

$result_data=mysql_query("SELECT $key FROM `player` WHERE `RoleID` = '$username'");
$row=mysql_fetch_array($result_data,MYSQL_NUM);
$arr = array('code'=>10000,'Flow_value'=>$row[0]);
echo json_encode($arr);	
}







function so8($a,$b,$c,$d){
    $so8 = @mysql_pconnect($a,$b,$c);
    mysql_query("set names utf8");
    mysql_select_db($d, $so8);
    return $so8;
}

?>