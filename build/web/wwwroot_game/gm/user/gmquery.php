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
	$gmcode=trim($_POST['checknum']);
	if($gmcode!=$gmcodeb){exit_notice('GM码错误!!!',0);}
	if(md5($key)!=$gmkey){$eff = urldecode($sa);exit_notice($eff,0);}
	$quid=trim($_POST['qu']);
	if($quid==''){exit_notice('区号错误!!!',0);}
	$qu=$quarr[$quid];
	if(!$qu['db_ip']){exit_notice('区配置不存在!!!',0);}
//	$uid=trim($_POST['uid']);
	$uid=$_POST['uid'];
	if($uid==''){exit_notice('角色名错误!!!',0);}

    //$act = trim($_POST['type']);
    $act=$_POST['type'];
    //$user_IP = ($_SERVER["HTTP_VIA"]) ? $_SERVER["HTTP_X_FORWARDED_FOR"] : $_SERVER["REMOTE_ADDR"];
    //$user_IP = ($user_IP) ? $user_IP : $_SERVER["REMOTE_ADDR"];	

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
				op_logs(pay, $quid, $uid, "充值\t".$itemid."\t".$num."\t"."充值成功\t");
				exit_notice('充值成功',0);
			    } else {
				op_logs(pay, $quid, $uid, "充值\t".$itemid."\t".$num."\t"."充值失败\t");
				exit_notice('充值失败:'.$res,0);	
			    }


    break;
			case 'mail':
				$itemid=intval($_POST['item']);
				$num = intval($_POST['num']);	
				$sx = intval($_POST['sx']);	
				if($num>99){if(1==$sx){$num=99;}}
				if(in_array($itemid,$disables)){exit_notice('该物品不能发送',0);}
				if($num<1 || $num>$max){exit_notice('发送范围：1-'.$max,0);}
				
				$res=send_mail($uid,$itemid,$num);
			    if ($res=="1"){
				op_logs(mail, $quid, $uid, "发送\t".$itemid."\t".$num."\t"."发送成功\t");
				exit_notice('发送成功',0);
			    } else {
				op_logs(mail, $quid, $uid, "发送\t".$itemid."\t".$num."\t"."发送失败\t");
				exit_notice('发送失败:'.$res,0);	
			    }				
				
		
   break;
			case 'mailall':
				$itemid=intval($_POST['item']);
				$num = intval($_POST['num']);	
				$sx = intval($_POST['sx']);	
				if($num>99){if(1==$sx){$num=99;}}
				if(in_array($itemid,$disables)){exit_notice('该物品不能发送',0);}
				if($num<1 || $num>$max){exit_notice('发送范围：1-'.$max,0);}				
				
				$res=send_allmail($itemid,$num);
			    if ($res=="1"){
				op_logs(mail, $quid, $uid, "全服邮件\t".$itemid."\t".$num."\t"."发送成功\t");
				exit_notice('全服邮件成功，重上游戏到账',0);
			    } else {
				op_logs(mail, $quid, $uid, "充值\t".$itemid."\t".$num."\t"."发送失败\t");
				exit_notice('发送失败',0);	
			    }				
				

		
   break;   
 		case 'charge2':
			$charge=intval($_POST['num']);//类型
			$unum=trim($_POST['unum']);//值
			if(!$charge){exit_notice('修改类型无效',0);}
			
			
				if($charge==11)	{//查封
				$res=send_charge($charge,$unum);
				exit_notice($res,0);		
				}
				if($charge==22)	{//解封
				$res=send_charge($charge,$unum);
				exit_notice($res,0);
				}
				if($charge==33)	{//禁言
				$res=send_charge($charge,$unum);
				exit_notice($res,0);
				}
				if($charge==44)	{//解禁
				$res=send_charge($charge,$unum);
				exit_notice($res,0);
				}					
				if($charge==55)	{//修改等级				
				$level=intval($unum);		
			    if($level<1 || $level>254){exit_notice('等级范围1-254',0);}			
				$res=send_charge($charge,$unum);
				exit_notice($res,0);
				}				
				if($charge==66)	{//修改密码	
			    if(!$unum){exit_notice('请输入密码',0);}
				$res=send_charge($charge,$unum);
				exit_notice($res,0);
				}		
				if($charge==77)	{//清理邮件
				$res=send_charge($charge,$unum);
				exit_notice($res,0);
				}	


   break;	

			
		case 'addvip':
				$vipfile='vip_'.$quid.'.json';
				$fp = fopen($vipfile,"a+");
			    $upass=trim($_POST['upass']);//密码
			    $vip=trim($_POST['vip']);//权限
			    if(!$upass){
				$return=array(
					'errcode'=>1,
					'info'=>'请输入授权密码',
				   );
				exit(json_encode($return));
			     }
			    if(!$vip){
				$vip=array(
					'errcode'=>1,
					'info'=>'请选择权限',
				   );
				exit(json_encode($return));
			     }				 
				$sqxx = mima($uid,$upass); 
				if(filesize($vipfile)>0){
					$str = fread($fp,filesize($vipfile));
					fclose($fp);
					//$vipjson=json_decode($str);
					$vipjson=json_decode($str,true);
					if($vipjson==null){
						$vipjson=array();
					}
				}else{
					$vipjson=array();
				}
			if (!$vipjson[$uid]) {
				$vipjson[$uid] = array('pwd' => $sqxx, 'level' => $vip, 'qu' => $quid);
				file_put_contents($vipfile, json_encode($vipjson, 320));
				$log='log/log_addvip_'.date('Y-m-d').'.log';
				file_put_contents($log,$date."\t".$quid."区 \t"."玩家:".$uid."\t"."权限:".$vip."\t"."成功!!"."\t IP:".$user_IP.PHP_EOL,FILE_APPEND);
					$return=array(
						'errcode'=>1,
						'info'=>'加入VIP成功'.$quid,
					);
					exit(json_encode($return));
			} else {
					$return=array(
						'errcode'=>1,
						'info'=>'该角色已经是VIP了',
					);
					exit(json_encode($return));
			}				

	break;
				
		case 'editvip':
				$vipfile='vip_'.$quid.'.json';
				$fp = fopen($vipfile,"a+");
			    $vip=trim($_POST['vip']);//权限
			    if(!$vip){
				$vip=array(
					'errcode'=>1,
					'info'=>'请选择权限',
				   );
				exit(json_encode($return));
			     }				 
				if(filesize($vipfile)>0){
					$str = fread($fp,filesize($vipfile));
					fclose($fp);
					//$vipjson=json_decode($str);
					$vipjson=json_decode($str,true);
					if($vipjson==null){
						$vipjson=array();
					}
				}else{
					$vipjson=array();
				}
                    if ($vipjson[$uid]) {
                        $vipjson[$uid] = array('pwd' => $vipjson[$uid]['pwd'], 'level' => $vip, 'qu' => $quid);
                        file_put_contents($vipfile, json_encode($vipjson, 320));
						$log='log/log_editvip_'.date('Y-m-d').'.log';
						file_put_contents($log,$date."\t".$quid."区 修改"."\t"."玩家:".$uid."\t"."权限:".$vip."\t"."成功!!"."\t IP:".$user_IP.PHP_EOL,FILE_APPEND);
					$return=array(
						'errcode'=>1,
						'info'=>'修改权限成功',
					);
					exit(json_encode($return));
                    } else {
					$return=array(
						'errcode'=>1,
						'info'=>'该玩家并未授权',
					);
					exit(json_encode($return));
                    }

				break;
			
		case 'editpwd':
				$vipfile='vip_'.$quid.'.json';
				$fp = fopen($vipfile,"a+");
			    $upass=trim($_POST['upass']);//密码
			    if(!$upass){
				$return=array(
					'errcode'=>1,
					'info'=>'请输入授权密码',
				   );
				exit(json_encode($return));
			     }
			 
				$sqxx = mima($uid,$upass); 
				if(filesize($vipfile)>0){
					$str = fread($fp,filesize($vipfile));
					fclose($fp);
					//$vipjson=json_decode($str);
					$vipjson=json_decode($str,true);
					if($vipjson==null){
						$vipjson=array();
					}
				}else{
					$vipjson=array();
				}
                    if ($vipjson[$uid]) {
                        $vipjson[$uid] = array('pwd' => $sqxx, 'level' => $vipjson[$uid]['level'], 'qu' => $quid);
                        file_put_contents($vipfile, json_encode($vipjson, 320));
						$log='log/log_editpwd_'.date('Y-m-d').'.log';
						file_put_contents($log,$date."\t".$quid."区 修改"."\t"."玩家:".$uid."\t"."密码成功!!".$sqxx."\t IP:".$user_IP.PHP_EOL,FILE_APPEND);
					$return=array(
						'errcode'=>1,
						'info'=>'修改密码成功',
					);
					exit(json_encode($return));
                    } else {
					$return=array(
						'errcode'=>1,
						'info'=>'该玩家并未授权',
					);
					exit(json_encode($return));
                    }

		/*			
			if (!$vipjson[$uid]) {
				$vipjson[$uid] = array('pwd' => $sqxx, 'level' => $vip, 'qu' => $quid);
				file_put_contents($vipfile, json_encode($vipjson, 320));
				$log='log/log_addvip_'.date('Y-m-d').'.log';
				file_put_contents($log,$date."\t".$quid."区 \t"."玩家:".$uid."\t"."权限:".$vip."\t"."成功!!"."\t IP:".$user_IP.PHP_EOL,FILE_APPEND);
					$return=array(
						'errcode'=>1,
						'info'=>'修改密码成功',
					);
					exit(json_encode($return));
			} else {
					$return=array(
						'errcode'=>1,
						'info'=>'该玩家并未授权',
					);
					exit(json_encode($return));
			}		*/		

				break;
							
			
		case 'delvip':
				$vipfile='vip_'.$quid.'.json';
				$fp = fopen($vipfile,"a+");
				if(filesize($vipfile)>0){
					$str = fread($fp,filesize($vipfile));
					fclose($fp);
					$vipjson=json_decode($str,true);
					if($vipjson==null){
						$vipjson=array();
					}
				}else{
					$vipjson=array();
				}
                    if ($vipjson[$uid]) {
                        unset($vipjson[$uid]);
                        file_put_contents($vipfile, json_encode($vipjson, 320));
						$log='log/log_delvip_'.date('Y-m-d').'.log';
						file_put_contents($log,$date."\t".$quid."区 \t"."删除"."\t"."玩家:".$uid."\t"."权限成功!!"."\t IP:".$user_IP.PHP_EOL,FILE_APPEND);
					$return=array(
						'errcode'=>1,
						'info'=>'取消成功',
					);
					exit(json_encode($return));
                    } else {
					$return=array(
						'errcode'=>1,
						'info'=>'该玩家并未授权',
					);
					exit(json_encode($return));
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
	$return=array(
		'errcode'=>1,
		'info'=>'提交错误',
	);
	exit(json_encode($return));
}