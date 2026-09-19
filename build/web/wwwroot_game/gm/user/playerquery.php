<?php
include 'config.php';
//session_start();
//error_reporting(0);
//header("Content-type: text/html; charset=utf-8");
//ini_set('date.timezone','Asia/Shanghai');
$time=time();
if(abs($time-(int)$_SESSION['lasttime'])<$frefresh){exit_notice('刷太快了!!!',0);}
$_SESSION['lasttime']=$time;
if($_POST){
	//include 'config.php';
	$quid=$_SESSION["quid"];
	if($quid==''){exit_notice('区号错误!!!',0);}
	$qu=$quarr[$quid];
	if(!$qu['db_ip']){exit_notice('区配置不存在!!!',0);}

	$uid=$_SESSION["uid"];	
	if($uid==''){exit_notice('角色名错误!!!',0);}
	$viplevel=$_SESSION["vip"];
	$act=$_POST['type'];
	//\u963f\u6cfd\u6e90\u7801\u7f51\u0020\u0077\u0077\u0077\u002e\u006c\u0079\u007a\u0077\u006c\u006b\u006a\u002e\u0076\u0069\u0070
    $date=date('Y-m-d H:i:s');
    $time=time();
	$db_ip=$qu['db_ip'];
	$db_user=$qu['db_user'];
	$db_pswd=$qu['db_pswd'];
	$db_port=$qu['db_port'];
	$db_name=$qu['db_name'];
	
	switch($act){
			case 'charge':
				$itemid=intval($_POST['num2']);
				$num = intval($_POST['num']);	
				if(!in_array($itemid,$enables)){exit_notice('没有权限',0);}				
				if($num<1 || $num>$max){exit_notice('充值范围：1-'.$max,0);}
				$res=send_mail($uid,$itemid,$num);
			    if ($res=="1"){
				op_logs(pay, $quid, $uid, "个人充值\t".$itemid."\t".$num."\t"."充值成功\t");
				exit_notice('充值成功',0);
			    } else {
				op_logs(pay, $quid, $uid, "个人充值\t".$itemid."\t".$num."\t"."充值失败\t");
				exit_notice('充值失败:'.$res,0);	
			    }

	break;

			
		case 'mail':
				if($viplevel<2){exit_notice('物品后台权限未开通',0);}		
				$itemid=intval($_POST['item']);
				$num = intval($_POST['num']);	
				$sx = intval($_POST['sx']);	
				if($num>99){if(1==$sx){$num=99;}}
				if(in_array($itemid,$disables)){exit_notice('该物品不能发送',0);}
				if($num<1 || $num>$max){exit_notice('发送范围：1-'.$max,0);}
				$res=send_mail($uid,$itemid,$num);
			    if ($res=="1"){
				op_logs(mail, $quid, $uid, "个人物品发送\t".$itemid."\t".$num."\t"."发送成功\t");
				exit_notice('发送成功',0);
			    } else {
				op_logs(mail, $quid, $uid, "个人物品发送\t".$itemid."\t".$num."\t"."发送失败\t");
				exit_notice('发送失败:'.$res,0);	
			    }	


				break;
				
		default:
			$return=array(
				'errcode'=>1,
				'info'=>'数据错误',
			);
			exit(json_encode($return));
			break;
	}
}else{
	$return=array(// 阿 泽 源 码 网 w w w . l y z w l k j . v i p
		'errcode'=>1,
		'info'=>'提交错误',
	);
	exit(json_encode($return));
}