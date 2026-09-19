<?php
header('Content-Type:application/json; charset=utf-8');
session_start();
date_default_timezone_set('PRC');
$sid = $_POST['sid']; //IP
$serverid = $_POST['serverid']; //区服ID
$type = $_POST['type'];
$Skey = $_POST['Skey'];




if($type == 1) {
$arr = array('code'=>1000,'content'=>" {
{objid=1900, num=20, bind=1, prob=0, name='20通宝积分',hint =1,lucky = 1},
{objid=1074, num=10, bind=1, prob=16000, name='洗练符',hint =0},
{objid=6200091, num=10, bind=1, prob=1000, name='仙翼技能灵丹',hint =0},
{objid=5018, num=10, bind=1, prob=500, name='点金石',hint =0},
{objid=1403, num=10, bind=1, prob=6000, name='黑铁矿(纯度3)',hint =0},
{objid=1682, num=10, bind=1, prob=4000, name='百炼钨钢',hint =0},
{objid=1683, num=10, bind=1, prob=4000, name='百年玄铁',hint =0},
{objid=777777, num=10000, bind=0, prob=30000, name='1000声望',hint =0},
};
");   

}elseif($type == 2){
    
 $arr = array('code'=>1000,'content'=>" {
{objid=1680, num=1, bind=1, prob=0, name='特戒碎片',hint =1,lucky = 1},
{objid=1074, num=1, bind=1, prob=16000, name='洗练符',hint =0},
{objid=6200091, num=1, bind=1, prob=1000, name='仙翼技能灵丹',hint =0},
{objid=5018, num=1, bind=1, prob=500, name='点金石',hint =0},
{objid=1403, num=1, bind=1, prob=6000, name='黑铁矿(纯度3)',hint =0},
{objid=1682, num=1, bind=1, prob=2000, name='百炼钨钢',hint =0},
{objid=1900, num=1, bind=1, prob=500, name='通宝积分',hint =0},
{objid=1683, num=1, bind=1, prob=4000, name='百年玄铁',hint =0},
{objid=777777, num=1000, bind=0, prob=30000, name='1000声望',hint =0},

};

");  
    
    
}elseif($type == 100){
    

  $ServerName = "\u5f00\u670d\u6216\u8d2d\u4e70\u6708\u5361\u670d\u52a1\u53ef\u8054\u7cfb\u7ba1\u7406\u5458\u90ae\u7bb1\uff1amail@<<CONTACT_DOMAIN>>";
 $arr = array('color_a'=>255,'color_b'=>204,'color_c'=>153,'x'=>178,'y'=>219,'size'=>25,'content'=>unicode_decode($ServerName)); 

    
    
    
    
    
    
    
}elseif($type == 7){
    
 $arr = array('code'=>1000,'content'=>"{


 {q_id = 1,q_item = 1559,q_jp = 0,q_property = 8000,q_num = 5,q_bd = 1,},
 {q_id = 2,q_item = 3014,q_jp = 0,q_property = 9000,q_num = 1,q_bd = 0,q_limit = 150,},
 {q_id = 3,q_item = 2019,q_jp = 0,q_property = 1000,q_num = 1,q_bd = 1,},
 {q_id = 4,q_item = 6200024,q_jp = 0,q_property = 1000,q_num = 1,q_bd = 1,},
 
 {q_id = 5,q_item = 3018,q_jp = 0,q_property = 7000,q_num = 1,q_bd = 1,},
 {q_id = 6,q_item = 1680,q_jp = 0,q_property = 1000,q_num = 1,q_bd = 1,},
 {q_id = 7,q_item = 1679,q_jp = 0,q_property = 1000,q_num = 1,q_bd = 0,},
 {q_id = 8,q_item = 3019,q_jp = 0,q_property = 1000,q_num = 1,q_bd = 0,},
 
 {q_id = 9,q_item = 1223,q_jp = 0,q_property = 10000,q_num = 1,q_bd = 1,q_limit = 300,},
 {q_id = 10,q_item = 2358,q_jp = 0,q_property = 10000,q_num = 1,q_bd = 0,},
 {q_id = 11,q_item = 1410,q_jp = 0,q_property = 8000,q_num = 1,q_bd = 0,q_limit = 150,},
 {q_id = 12,q_item = 1681,q_jp = 0,q_property = 1000,q_num = 1,q_bd = 0,q_limit = 150,},

 {q_id = 13,q_item = 1683,q_jp = 0,q_property = 1000,q_num = 1,q_bd = 1,q_limit = 1,},
 {q_id = 14,q_item = 3867,q_jp = 0,q_property = 1000,q_num = 1,q_bd = 0,q_limit = 300,},
 {q_id = 15,q_item = 10001,q_jp = 0,q_property = 500,q_num = 1,q_bd = 0,q_limit = 400,},
 {q_id = 16,q_item = 6965,q_jp = 1,q_property = 1000,q_num = 5,q_bd = 0,},


	

	
	};

"

,'reward_a'=>"{
    --{q_id = 2000,q_dropid = 22264,count = 5,bind = 1,q_showicon = 4,},
	--{q_id = 20000,q_dropid = 1814,count = 1,bind = 1,q_showicon = 4,},
	--{q_id = 300,q_dropid = 1814,count = 1,bind = 1,q_showicon = 5,},
	--{q_id = 500,q_dropid = 1814,count = 1,bind = 1,q_showicon = 5,},
	--{q_id = 500,q_dropid = 1219,count = 1,bind = 1,q_showicon = 6,},
	--{q_id = 800,q_dropid = 1219,count = 1,bind = 1,q_showicon = 6,},
	--{q_id = 1200,q_dropid = 1219,count = 1,bind = 1,q_showicon = 6,},
	--{q_id = 1500,q_dropid = 1219,count = 1,bind = 1,q_showicon = 6,},
	};

"

,'reward_b'=>"{
     {q_id = 4000,q_dropid = 7430901,count = 1,bind = 1,q_showicon = 4,},
	--{q_id = 500,q_dropid = 1814,count = 1,bind = 1,q_showicon = 4,},
	--{q_id = 800,q_dropid = 1814,count = 1,bind = 1,q_showicon = 5,},
	--{q_id = 1000,q_dropid = 1814,count = 1,bind = 1,q_showicon = 5,},
	--{q_id = 500,q_dropid = 1219,count = 1,bind = 1,q_showicon = 6,},
	--{q_id = 800,q_dropid = 1219,count = 1,bind = 1,q_showicon = 6,},
	--{q_id = 1200,q_dropid = 1219,count = 1,bind = 1,q_showicon = 6,},
	--{q_id = 1500,q_dropid = 1219,count = 1,bind = 1,q_showicon = 6,},
	};

"

,'reward_c'=>"{
    --{q_id = 5000,q_dropid = 1814,count = 1,bind = 1,q_showicon = 4,},
	--{q_id = 10000,q_dropid = 1814,count = 1,bind = 1,q_showicon = 4,},
	--{q_id = 30000,q_dropid = 1814,count = 1,bind = 1,q_showicon = 5,},
	--{q_id = 50000,q_dropid = 1814,count = 1,bind = 1,q_showicon = 5,},
	--{q_id = 500,q_dropid = 1219,count = 1,bind = 1,q_showicon = 6,},
	--{q_id = 800,q_dropid = 1219,count = 1,bind = 1,q_showicon = 6,},
	--{q_id = 1200,q_dropid = 1219,count = 1,bind = 1,q_showicon = 6,},
	--{q_id = 1500,q_dropid = 1219,count = 1,bind = 1,q_showicon = 6,},
	};

"


,'hellp'=>"测试上古宝藏信息

"






);  
    
}else{
    
    $arr ="empty" ;
    
}












echo urldecode(json_encode($arr,JSON_UNESCAPED_UNICODE));


	function unicode_decode($name) {
 	$json = '{"str":"' . $name . '"}';
	$arr = json_decode($json, true);
	if (empty ($arr))
	return '';
	return $arr['str'];
	}
?>