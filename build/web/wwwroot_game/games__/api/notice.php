<?php
header('Content-Type:application/json; charset=utf-8');
session_start();
date_default_timezone_set('PRC');
$sid = $_POST['sid'];
$serverid = $_POST['serverid']; //区服ID
if($serverid == "800"){


$arr = array('color_a'=>255,'color_b'=>204,'color_c'=>153,'x'=>80,'y'=>219,'size'=>25,'content'=>"         



                新人礼包码：666   VIP
"); 

}



echo urldecode(json_encode($arr,JSON_UNESCAPED_UNICODE));



?>