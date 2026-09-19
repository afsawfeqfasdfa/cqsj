<?php
session_start();
date_default_timezone_set('PRC');
$db=array('db','root','<<DB_OR_GM_PASSWORD>>','longwen','/data/sbin/logs/TLog/Tlog.800.0_');
//              ＩＰ　     账号　密码　   数据库       log路径
$item1=array('222222'=>'元宝','888888'=>'绑定元宝','999998'=>'金钱','777777'=>'声望','333333'=>'荣誉','444444'=>'经验','555555'=>'功勋','666666'=>'熔炼值','111111'=>'个人贡献');
function so8($a,$b,$c,$d){
    $so8 = @mysql_pconnect($a,$b,$c);
    mysql_query("set names latin1");
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





function c86($a){return intval(floor($a/128));}
function b86($a,$b){return $a%128+$b;}
function item($a){
	if($a>=128){
	$a1=c86($a);
	$a0=b86($a,128);
	if($a1>=128){$a2=c86($a1);$a1=b86($a1,128);}else{$a2='';}
	if($a2>=128){$a3=c86($a2);$a2=b86($a2,128);}else{$a3='';}
	if($a3>=128){$a4=c86($a3);$a3=b86($a3,128);}else{$a4='';}
	}else{$a2='';$a1=$a%128;$a0='';}
	$b='';
	if($a4!=''){$b=pack('c', $a4);}
	if($a3!=''){$b=pack('c', $a3).$b;}
	if($a2!=''){$b=pack('c', $a2).$b;}
	if($a1!=''){$b=pack('c', $a1).$b;}
	if($a0!=''){$b=pack('c', $a0).$b;}
	return bin2hex($b);
}
function itemnum($a,$b){
	if($a>=128){
	$aa=7+$b;
	$a1=c86($a);
	$a0=b86($a,128);
	if($a1>=128){$a2=c86($a1);$a1=b86($a1,128);$aa=8+$b;}else{$a2='';}
	if($a2>=128){$a3=c86($a2);$a2=b86($a2,128);$aa=9+$b;}else{$a3='';}
	if($a3>=128){$a4=c86($a3);$a3=b86($a3,128);$aa=10+$b;}else{$a4='';}
	}else{$aa=6+$b;}
	return dechex($aa);
}
function Tlog($a){

$a1='';

return $a1;
}
if($_POST[t]==''){$time1=date('Y-m-d').' 00:00:00';$time2=date('Y-m-d').' 23:59:59';}else{$time1=$_POST[t].' 00:00:00';$time2=$_POST[t].' 23:59:59';}
$log6=Tlog($db[4].date('Ymd').'.log');
if($_POST[acc]!='' and ($_POST[num]!='' or $_POST[wid1]!='' or $_POST[passwd]!='')){
$so8=so8($db[0],$db[1],$db[2],$db[3]) or die(mysql_error());
$result=mysql_query("SELECT * FROM `GM_LOG` WHERE `time` >= '$time1' AND `time` <= '$time2' ORDER BY `time` DESC");
if($result&&mysql_num_rows($result)>0){while($gm[] = mysql_fetch_array($result, MYSQL_NUM)) {}array_pop($gm);}
if($_POST[t3]=='角色转职' or $_POST[t3]=='变性' or $_POST[t3]=='改密' or $_POST[t3]=='恢复角色' or $_POST[t3]=='查封' or $_POST[t3]=='解封' or $_POST[t3]=='取消限制' or $_POST[t3]=='解禁' or $_POST[t3]=='发送邮件' or $_POST[t3]=='全服邮件' or $_POST[t3]=='改名' or $_POST[t3]=='禁言'){
$sql="SELECT `RoleID`,`UserID` FROM player WHERE `Name` = '$_POST[acc]' LIMIT 1";
$result=mysql_query($sql,$so8);
if($result&&mysql_num_rows($result)>0){
$dwID = mysql_fetch_array($result, MYSQL_NUM);
}}}
switch($_POST[t3]) {
case '登陆':{
if($_POST[acc]!='' and $_POST[passwd]!=''){
$result=mysql_query("SELECT `type` FROM GM WHERE `acc` = '$_POST[acc]' AND `pass` = '$_POST[passwd]'");
if($result&&mysql_num_rows($result)>0){$t = mysql_fetch_array($result, MYSQL_NUM);$_SESSION['acc']=array($_POST[acc],$t[0]);}else{echo '<script>alert("账号密码错误，请重新登陆");</script>';}
}
break;
}
case '退出':{
$_SESSION['acc']='';
break;
}
case '提升权限':{
if($_POST[acc]!=''){
mysql_query("UPDATE `GM` SET `type`='1' WHERE (`acc`='$_POST[acc]')");
echo '<script>alert("提升权限成功");</script>';
}
break;
}
case '撒消权限':{
if($_POST[acc]!=''){
mysql_query("UPDATE `GM` SET `type`='0' WHERE (`acc`='$_POST[acc]')");
echo '<script>alert("撒消权限成功");</script>';
}
break;
}

case '角色转职':{
if($dwID!='' and $_SESSION['acc'][1]>0){
mysql_query("UPDATE `player` SET `School`='$_POST[num]' WHERE (`RoleID`='$dwID[0]')");
mysql_query("CALL gm('$dwID[0]')");
mysql_query("INSERT INTO `GM_LOG` (`a1`, `a2`, `a3`) VALUES ('角色转职', '$_POST[acc]', '$_POST[num]')");
echo '<script>alert("转职成功");</script>';
}else{echo '<script>alert("权限不足，不能操作");</script>';}
break;
}

case '变性':{
if($dwID!='' and $_SESSION['acc'][1]>0){
mysql_query("UPDATE `player` SET `Sex`='$_POST[num]' WHERE (`RoleID`='$dwID[0]')");
mysql_query("CALL gm('$dwID[0]')");
mysql_query("INSERT INTO `GM_LOG` (`a1`, `a2`, `a3`) VALUES ('变性', '$_POST[acc]', '$_POST[num]')");
echo '<script>alert("变性成功");</script>';
}else{echo '<script>alert("权限不足，不能操作");</script>';}
break;
}


case '改密':{
if($_POST[acc]!=''){
$PwdHash=$_POST[num];
mysql_query("UPDATE `user` SET `PwdHash`='$PwdHash' WHERE (`UserID`='$_POST[acc]')");
$t=$_POST[acc]."|".$_POST[num];
mysql_query("INSERT INTO `GM_LOG` (`a1`, `a2`, `a3`) VALUES ('修改密码', '$t', '$_POST[num]')");




echo '<script>alert("修改密码成功");</script>';
}else{echo '<script>alert("权限不足，不能操作");</script>';}
break;
}



case '恢复角色':{
if($dwID!='' and $_SESSION['acc'][1]>0){
mysql_query("UPDATE `player` SET `DeleteTime`='0000-00-00 00:00:00' WHERE (`RoleID`='$dwID[0]')");
mysql_query("CALL gm('$dwID[0]')");
mysql_query("INSERT INTO `GM_LOG` (`a1`, `a2`, `a3`) VALUES ('恢复角色', '$t', '0000')");
echo '<script>alert("修改密码成功");</script>';
}else{echo '<script>alert("权限不足，不能操作");</script>';}
break;
}

case '禁言':{
if($dwID!='' and $_SESSION['acc'][1]>0){
 $filename = "/data/sbin/player_pay/".$dwID[0]."/Time.txt";
 
 if(!is_dir("/data/sbin/player_pay/".$dwID[0])){
 	
 	mkdir("/data/sbin/player_pay/".$dwID[0],0777);
 	
 }
 
 $handle = fopen($filename, "w+");//读取二进制文件时，需要将第二个参数设置成'rb'
 $data='-1';
 fwrite ($handle,$data);
 fclose($handle);
echo '<script>alert("禁言成功");</script>';
}else{echo '<script>alert("权限不足，不能操作");</script>';}
  break;
  }

case '查封':{
if($dwID!='' and $_SESSION['acc'][1]>0){
mysql_query("replace into lockplayer(RoleID, LockDate) value('$dwID[0]', '-1')");
mysql_query("INSERT INTO `GM_LOG` (`a1`, `a2`) VALUES ('封号', '$_POST[acc]')");
echo '<script>alert("查封['.$dwID[0].']成功");</script>';
}else{echo '<script>alert("权限不足，不能操作");</script>';}
break;
}
case '解封':{
if($dwID!='' and $_SESSION['acc'][1]>0){
mysql_query("replace into lockplayer(RoleID, LockDate) value('$dwID[0]', '0')");
mysql_query("INSERT INTO `GM_LOG` (`a1`, `a2`) VALUES ('解封', '$_POST[acc]')");
echo '<script>alert("解封成功");</script>';
}else{echo '<script>alert("权限不足，不能操作");</script>';}
  break;
  }
case '取消限制':{
if($_POST[acc]!=''){
$PwdHash=md5($_POST[acc].$_POST[num]);
mysql_query("UPDATE `user` SET `Calle_F`='2' WHERE (`UserID`='$_POST[acc]')");
$t=$_POST[acc]."|".$_POST[num];
mysql_query("INSERT INTO `GM_LOG` (`a1`, `a2`, `a3`) VALUES ('修改密码', '$t', '$_POST[num]')");
echo '<script>alert("修改密码成功");</script>';
}else{echo '<script>alert("权限不足，不能操作");</script>';}
break;
}

  
  
  
case '改名':{
if($dwID!='' and $_SESSION['acc'][1]>0){
mysql_query("UPDATE `player` SET `Name`='".$_POST[wid1]."' WHERE (`RoleID`='$dwID[0]')");
mysql_query("INSERT INTO `GM_LOG` (`a1`, `a2`) VALUES ('改名', '$_POST[acc]')");
echo '<script>alert("改名成功 请重新登录后台");</script>';
}else{echo '<script>alert("权限不足，不能操作改名");</script>';}
  break;
  }  
  
case 'Games停止':{
    
 $last_line = system('/data/t1.sh', $retval);   

echo '

</pre>

<hr />Last line of the output: ' . $last_line . '

<hr />Return value: ' . $retval;



  break;
  }   
  
  
 case 'Games启动':{
    
$last_line = system('/data/t.sh', $retval);   
$last_line = system('/data/q.sh', $retval);   
echo '

</pre>

<hr />Last line of the output: ' . $last_line . '

<hr />Return value: ' . $retval;



  break;
  }    
    
 
  
  
  
case '解禁':{
if($dwID!='' and $_SESSION['acc'][1]>0){
 $filename = "/data/sbin/player_pay/".$dwID[0]."/Time.txt";
 
 if(!is_dir("/data/sbin/player_pay/".$dwID[0])){
 	
 	mkdir("/data/sbin/player_pay/".$dwID[0],0777);
 	
 }
 
 $handle = fopen($filename, "w+");//读取二进制文件时，需要将第二个参数设置成'rb'
 $data='0';
 fwrite ($handle,$data);
 fclose($handle);
echo '<script>alert("解禁成功");</script>';
}else{echo '<script>alert("权限不足，不能操作");</script>';}
  break;
  }
case '发送邮件':{
$num = 0 ;
if($dwID!='' and $_SESSION[acc][1]>0){
$_POST[wid1]=rtrim($_POST[wid1],';');
$it0=explode(';',$_POST[wid1]);$it='';
foreach($it0 as $it1){
$it2=explode('-',$it1);
if($item1[$it2[0]]!=''){$t=$_POST[acc].'｜获得｜'.$item1[$it2[0]];
	
	
if ($it2[0] == '222222'){
	
	
$num =  $num + $it2[1];
	
	
}	
	
	
	
	
	
	
	
	
}else{$t=$_POST[acc].'｜获得｜'.$it2[0];}
mysql_query("INSERT INTO `GM_LOG` (`a1`, `a2`, `a3`) VALUES ('发送邮件', '$t', '$it2[1]')");
$it1=item($it2[0]);$it3=str_pad(itemnum($it2[1],$it2[2]),2,'0',STR_PAD_LEFT);$it2=item($it2[1]);
$it='52'.$it3.'08'.$it1.'10'.$it2.'2801'.$it;
}
$it1='3018'.$it;
mysql_query("INSERT INTO `email` (`roleID`, `emailIndex`, `datas`) VALUES ('$dwID[0]',CONCAT('00',HEX(UNIX_TIMESTAMP()),'43820C'), CAST(UNHEX('$it1') AS CHAR))") or die(mysql_error());
echo '<script>alert("发送邮件成功，重上游戏到账");</script>';
if($num > 0){
	
 $datas = date('Y-n-j',time());	
 $datab = date('y-m-d h:i:s',time());	
 
 mysql_query("INSERT INTO Player_Pay(`roleID`,`Amount`,`Time`,`TIME_DATA`) VALUES ('$dwID[0]','$num','$datas','$datab');");
 
 $result=mysql_query("SELECT SUM(Amount) as Cont FROM `Player_Pay` WHERE `Time` = '$datas' and  `roleID` = '$dwID[0]'");
 $row=mysql_fetch_array($result,MYSQL_NUM);
 //$filename = "22/".$datas.".txt";
 $filename = "/data/sbin/player_pay/".$dwID[0]."/".$datas.".txt";
 
 if(!is_dir("/data/sbin/player_pay/".$dwID[0])){
 	
 	mkdir("/data/sbin/player_pay/".$dwID[0],0777);
 	
 }
 
 
 
 
 
 
 $handle = fopen($filename, "w+");//读取二进制文件时，需要将第二个参数设置成'rb'
 $data='{"total_gold":"'.$row[0].'"}';
 fwrite ($handle,$data);
 fclose($handle);
 
 
  
    $resultA=mysql_query("SELECT SUM(Amount) as Cont FROM `Player_Pay` WHERE  `roleID` = '$dwID[0]'");
         $rowA=mysql_fetch_array($resultA,MYSQL_NUM);
         $filenameS = "/data/sbin/player_pay/".$dwID[0]."/1.txt";
                $handleA = fopen($filenameS, "w+");
                 $dataA='{"total_gold":"'.$rowA[0].'"}';
                 fwrite ($handleA,$dataA);
                 fclose($handleA);
 
 

}

}else{echo '<script>alert("权限不足，不能操作");</script>';}
break;
}
case '全服邮件':{
$bugist = 2;	
	
if($bugist>1){
$t='';
$_POST[wid1]=rtrim($_POST[wid1],';');
$it0=explode(';',$_POST[wid1]);$it='';
foreach($it0 as $it1){
$it2=explode('-',$it1);
if($item1[$it2[0]]!=''){$tt=$item1[$it2[0]];}else{$tt=$it2[0];}
$t[]=array($tt,$it2[1]);
$it1=item($it2[0]);$it3=str_pad(itemnum($it2[1],$it2[2]),2,'0',STR_PAD_LEFT);$it2=item($it2[1]);
$it='52'.$it3.'08'.$it1.'10'.$it2.'2801'.$it;
}
$it1='3018'.$it;
$sql="SELECT `RoleID`,`Name` FROM player";
$result=mysql_query($sql,$so8);
if($result&&mysql_num_rows($result)>0){
while($dwID = mysql_fetch_array($result,MYSQL_NUM)){
foreach($t as $value){
$tt=$dwID[1].'｜获得｜'.$value[0];
mysql_query("INSERT INTO `GM_LOG` (`a1`, `a2`, `a3`) VALUES ('全服邮件', '$tt', '$value[1]')");
}
mysql_query("INSERT INTO `email` (`roleID`, `emailIndex`, `datas`) VALUES ('$dwID[0]',CONCAT('00',HEX(UNIX_TIMESTAMP()),'43820C'), CAST(UNHEX('$it1') AS CHAR))") or die(mysql_error());
}
echo '<script>alert("全服邮件成功，重上游戏到账");</script>';


}
}else{echo '<script>alert("权限不足，不能操作");</script>';}
break;
}

}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>【怀旧传世】GM后台</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
				html {font-size: 50px;}
				* {margin: 0;padding: 0;}
				.cs-titile {height: 1.5rem;line-height: 1.5rem;text-align: center;width: 100%;font-size: 0.5rem;}
				.cs-div {width: 90%;margin: 0 auto;}
				.cs-btn {display: flex;flex-wrap: wrap;justify-content: space-between;margin-top: 20px;}
				.cs-btn input {width: 4rem;height: 50px;margin-bottom: 20px;}
				.cs-mail {display: flex;justify-content: space-between;}
				.cs-mail input {width: 47.5%;height: 50px;}
				.login{width:100%;border:1px solid pink;padding: 10px 10px;}
				.login div:first-child{display: flex;flex-direction: column;height:100px;justify-content: space-between;}
				.login div:last-child{display: flex;
    justify-content: space-around;
    margin-top: 29px;
   
    flex-direction: row-reverse;
    align-content: flex-end;
    align-items: stretch;
    flex-wrap: nowrap;}
				.login div:last-child input{width:47.5%; background-color: #e16eb3;}
				.form-group div{
					padding: 0.2rem 0;
				}
				table{
					margin-top:1rem;
				}
				table th{
					color:red;
				}
				table td{
					color:#000000;
				}
				@media screen and (max-width: 700px) {
					.cs-btn input {
						width: 2rem;
					}
				}
		</style>
</head>
<body>
<div id="login" style="height:100%;">
<div class="cs-titile">GM后台</div>

<div class="cs-div">
<form action="" method="post">
<?php if($_SESSION['acc']==''){ ?>
	

	
<div class="login">
		<div>
			<input type="text" class="form-control" name="acc" placeholder="用户名">
			<input type="password" class="form-control" name="passwd" placeholder="密码">
		</div>
		<div>
			<input type="submit" value="登陆" class="btn" name="t3">
		</div>
</div>
	
	
<?php }else{ if($_SESSION['acc'][1]>0){ ?>
	



<div class="form-group">
					<div class="col-sm-12">
						<input type="text" class="form-control" id="acc" name="acc" value="<?php echo $_POST[acc]; ?>" placeholder="角色名">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<input type="tel" id="wid" class="form-control" placeholder="物品ID">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<input type="tel" id="num" class="form-control" name="num" value="1" placeholder="num">
					</div>
</div>


<textarea class="form-control" rows="3" cols="40" id="wid1" name="wid1" placeholder="id-数量;id-数量;id-数量;"></textarea>


















				<div class="cs-btn">

<input type="button" class="btn btn-info" value="添加" onclick="wid1.value+=wid.value+'-'+num.value+'-1;';"/>
<input type="button" class="btn btn-info" value="+元宝" onclick="wid1.value+='222222-'+num.value+'-0;';" />
<input type="button" class="btn btn-info" value="+绑元" onclick="wid1.value+='888888-'+num.value+'-0;';"/>
<!--<input type="button" class="btn btn-warning" value="+通宝币" onclick="wid1.value+='999999-'+num.value+'-0;';"/>

<input type="button" class="btn btn-success" value="+金钱" onclick="wid1.value+='999998-'+num.value+'-0;';"/>-->
<input type="button" class="btn btn-success" value="+声望" onclick="wid1.value+='777777-'+num.value+'-0;';"/>

<!--<input type="submit" class="btn" value="禁言" name="t3" />-->

<input type="button" class="btn btn-warning" value="+经验" onclick="wid1.value+='444444-'+num.value+'-0;';"/>
<input type="submit" class="btn btn-primary" value="变性" name="t3" />

<!--<input type="button" class="btn btn-warning" value="+熔炼值" onclick="wid1.value+='666666-'+num.value+'-0;';"/>
<input type="button" class="btn btn-primary" value="+个人贡献" onclick="wid1.value+='111111-'+num.value+'-0;';"/>  
<input type="button" class="btn btn-primary" value="+元神经验丹" onclick="wid1.value+='1693-'+num.value+'-1;';"/> -->
<input type="submit" class="btn btn-danger" value="查封" name="t3" />
<input type="submit" class="btn btn-danger" value="解封" name="t3" />
<input type="submit" class="btn btn-primary" value="改名" name="t3" />
<input type="submit" class="btn btn-danger" value="改密" name="t3" />
<input type="submit" class="btn btn-danger" value="恢复角色" name="t3" />
<input type="submit" class="btn btn-primary" value="角色转职" name="t3" />
<!--<input type="submit" class="btn btn-danger" value="Games停止" name="t3" />
<input type="submit" class="btn btn-danger" value="Games启动" name="t3" />





<input type="submit" class="btn" value="取消限制" name="t3" />
<input type="submit" class="btn" value="解禁" name="t3" />-->

				</div>
				<div class="cs-mail">
					<input type="submit" class="btn btn-success" value="发送邮件" name="t3" />
					<input type="submit" class="btn btn-success" value="全服邮件" name="t3" />
				</div>




<?php } if($_SESSION['acc'][1]==2){ ?>
	
<div style="display: none;">
	<fieldset><legend>管理员后台</legend>
	
	<input type="submit" class="btn" value="提升权限" name="t3" />
	<input type="submit" class="btn" value="撒消权限" name="t3" /><br />
	</fieldset>
	<?php } ?>
	
	<input type="date" name="t" class="btn" style="width: 3.3rem; background-color: #c589fb; margin-top: 0.3rem;" /><br />


	<input type="submit" class="btn btn-success " value="查询" name="t3" style="
    margin-top: 0.3rem; width: 1.6rem;" />
	<input type="submit" class="btn btn-success" value="退出" name="t3" style="
    margin-top: 0.3rem; width: 1.6rem;" /><br />
</div>

<table class="table table-bordered">
<tr>
							<th>操作</th>
							<th>过程</th>
							<th>数量</th>
							<th>日期</th>
</tr>

<?php
if($gm!=''){
foreach($gm as $value){
echo '<tr style="color:#fff;"><td>'.$value[1].'</td><td>'.$value[2].'</td><td>'.$value[3].'</td><td>'.$value[4].'</td></tr>';
}
}
?>
</table>
<?php } ?>
</form>
</div>
</div>
<div id="common_box" style="display: none;">
	<div id="cli_on" onclick="bn2(this.id,common_box.id)">点击我可以收起或展开</div>
	<div id="num2" style="font-size:10px;">
<?php
if($log6!=""){
echo $log6;
}else{echo "当前没有数据";}
?>
</div>
</div>
</body>
</html>
<script>
    function bn2(str,str1){
	var combox = document.getElementById(str1);
	var cli_on = document.getElementById(str);
	var flag = true;
cli_on.onclick = function () {
		combox.style.right = flag?'-270px':0;
		flag = !flag;
	}
	}
</script>
