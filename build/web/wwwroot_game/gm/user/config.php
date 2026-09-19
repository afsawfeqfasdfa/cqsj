<?php
error_reporting(0);
header("Content-type: text/html; charset=utf-8");
ini_set('date.timezone','Asia/Shanghai');
session_start();
//==================================================
$key='// 版本 2021 Powered by 源码屋 www.51boshao.com';
//==================================================
//仅供本地学习娱乐使用
//仅供本地学习娱乐使用
//仅供本地学习娱乐使用
//==================================================

    $_SESSION['gmbt'] ='<<DB_OR_GM_PASSWORD>>';
	$gmbt = '上古传世';  //标题	
	$gmcodeb = '<<DB_OR_GM_PASSWORD>>';  //GM码
	$gmkey="<<GM_KEY>>";
	$sa="上古传世";
    $item1 = array('222222', '888888', '999998', '777777', '333333', '444444', '555555', '666666', '111111');	
	$disables=array();
	$enables=array('222222','333333','777777','555555','888888','999998','999999');
	$vip='cqsj_';
	$frefresh=5;//防刷新间隔 秒
	$max=999999;//最大发送数量
    $title   = 'GM';
    $content = 'GM邮件';
	$yzfvip=array(//自行修改VIP权限
	'1'=>'VIP1只充值',   
	'2'=>'VIP2充值+邮件',
	);		

			
	$quarr=array(
		'1'=>array(
			'name'=>'1区玄武',
			'db_ip'=>'db',
			'db_port'=>3306,
			'db_name'=>'longwen',
			'db_user'=>'root',
			'db_pswd'=>'<<DB_OR_GM_PASSWORD>>',
	        "log" =>"/data/sbin/logs/TLog/Tlog.1.0_",	
            'hidde'=>false
		),
      	'2'=>array(
			'name'=>'2区朱雀',
			'db_ip'=>'db',
			'db_port'=>3306,
			'db_name'=>'longwen',
			'db_user'=>'root',
			'db_pswd'=>'<<DB_OR_GM_PASSWORD>>',
	        "log" =>"/data/sbin/logs/Tlog.1.0_",	
            'hidde'=>false
		),
      	'3'=>array(
			'name'=>'3区青龙',
			'db_ip'=>'db',
			'db_port'=>3306,
			'db_name'=>'longwen',
			'db_user'=>'root',
			'db_pswd'=>'<<DB_OR_GM_PASSWORD>>',
	        "log" =>"/data/sbin/logs/Tlog.1.0_",
            'hidde'=>false
		),
      	'4'=>array(
			'name'=>'4区白虎',
			'db_ip'=>'db',
			'db_port'=>3306,
			'db_name'=>'longwen',
			'db_user'=>'root',
			'db_pswd'=>'<<DB_OR_GM_PASSWORD>>',
	        "log" =>"/data/sbin/logs/Tlog.1.0_",
            'hidde'=>false
		),
	);

include_once 'conn.php';	
