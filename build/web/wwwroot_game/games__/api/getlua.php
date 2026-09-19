<?php
header('Content-Type:application/json; charset=utf-8');
session_start();
date_default_timezone_set('PRC');
$sid = $_POST['sid']; //IP
$serverid = $_POST['serverid']; //区服ID
$file = $_POST['file'];



 if(!empty($file)){
     
    $arr = array('code'=>1000,'content'=>"{".getLua($file)."};");
     
     
   }  
     
     
     
echo urldecode(json_encode($arr,JSON_UNESCAPED_UNICODE));



function getLua($str)
 {
     $filename = "./apk_fig/".$str.".lua";
     $handle = fopen($filename, "r");
     $msg = fread($handle,filesize($filename));
     fclose($handle); 
     return $msg;
 }



    
?>