<?php


if ($key == '<<DB_OR_GM_PASSWORD>>' and $code != '' and $mobile != '' and $pass != ''){
	
$db=array('db','root','<<DB_OR_GM_PASSWORD>>','longwen');
$so8=so8($db[0],$db[1],$db[2],$db[3]) or die(mysql_error());




$result=mysql_query("SELECT * FROM `user` WHERE `Username` = '$mobile'");
$link=mysql_query("SELECT * FROM `user` WHERE `Reg_IP` = '$ip'");



if($result&&mysql_num_rows($result)>0){
	
	
	
$arr = array('code'=>10003,'msg'=>'账号已经被注册');
echo json_encode($arr);	
	
}elseif( $space == 0 ){
    
$arr = array('code'=>10003,'msg'=>'请联系客服注册');
echo json_encode($arr);	  
    
    
}else{
	
	
$PwdHash=$pass;	
$date = date('y-m-d h:i:s',time()); 	
	
$result=mysql_query("INSERT INTO user(`Username`,`UserID`,`CreateDate_obj`,`PwdHash`,`WorldID`,`Reg_IP`,`Reg_ADD`,`State`,`Calle_F`,`Skey`) VALUES ('$mobile','$mobile','$date','$PwdHash','800','$ip','NET','1','1','$code');");	



$arr = array('code'=>10004,'msg'=>'注册成功');
echo json_encode($arr);		
	
	
}
	
	
	

	
	







}else{
	
$arr = array('code'=>10001,'msg'=>'无效的访问');
echo json_encode($arr);		
	
	
	
}









?>





 