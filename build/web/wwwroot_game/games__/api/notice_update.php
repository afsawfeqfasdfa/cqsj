<?php
header('Content-Type:application/json; charset=utf-8');
session_start();
date_default_timezone_set('PRC');
$sid = $_POST['sid'];
$serverid = $_POST['serverid']; //区服ID
if($serverid == "800"){
    
$arr = array('color_a'=>171,'color_b'=>42,'color_c'=>27,'x'=>270,'y'=>270,'size'=>20,'content'=>"   


        欢迎来到【怀旧传世公益服】
    
     1.请前往落霞岛查看（游戏指南）
     2. 世界BOSS每1个小时整点刷新
            活动BOSS每2个小时整点刷新
            材料地图BOSS死亡后2小时刷新
            地图掉落：请查看各地图NPC介绍
         
               游戏内如有疑问请联系
                   
                   mail@<<CONTACT_DOMAIN>>
           
   
"); 

}



echo urldecode(json_encode($arr,JSON_UNESCAPED_UNICODE));



?>