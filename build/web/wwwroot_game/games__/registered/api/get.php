<?php
header('Content-Type:application/json; charset=utf-8');
session_start();
date_default_timezone_set('PRC');
$TP = $_GET["Type"];

if($TP == 1){
echo func_Gonggao($_GET["id"]);
    
}elseif($TP == 2){
    
echo func_Spay($_GET["id"]);    
    
}else{
echo func_Sname($_GET["id"]);
}



function func_Sname($id)
{
$db=array('db','root','<<DB_OR_GM_PASSWORD>>','Godweb');
$so8=so8($db[0],$db[1],$db[2],$db[3]) or die(mysql_error());
$result_data=mysql_query("SELECT Name FROM `Server` WHERE `Skey` = '$id'");

if($result_data&&mysql_num_rows($result_data)>0){
$row=mysql_fetch_array($result_data,MYSQL_NUM);
echo $row[0];  
}else{
   
echo '复古传世';    
}



}


function func_Spay($id)
{
$db=array('db','root','<<DB_OR_GM_PASSWORD>>','Godweb');
$so8=so8($db[0],$db[1],$db[2],$db[3]) or die(mysql_error());
$result_data=mysql_query("SELECT Pay FROM `Server` WHERE `Skey` = '$id'");

if($result_data&&mysql_num_rows($result_data)>0){
$row=mysql_fetch_array($result_data,MYSQL_NUM);
echo $row[0];  
}else{
   
echo '404';    
}



}













function func_Gonggao($id)
{
$db=array('db','root','<<DB_OR_GM_PASSWORD>>','Godweb');
$so8=so8($db[0],$db[1],$db[2],$db[3]) or die(mysql_error());
$result_data=mysql_query("SELECT Gog FROM `Server` WHERE `Skey` = '$id'");

if($result_data&&mysql_num_rows($result_data)>0){
$row=mysql_fetch_array($result_data,MYSQL_NUM);
echo $row[0];  
}else{
   
echo '敬请留意';    
}



}





function so8($a,$b,$c,$d){
    $so8 = @mysql_pconnect($a,$b,$c);
    mysql_query("set names utf8");
    mysql_select_db($d, $so8);
    return $so8;
}



?>