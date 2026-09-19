 <?php
header('Content-Type:application/json; charset=utf-8');
session_start();
date_default_timezone_set('PRC');
$fromuser = $_POST['fromuser'];
$frompass = $_POST['frompass'];
$db=array('db','root','<<DB_OR_GM_PASSWORD>>','longwen');
$so8=so8($db[0],$db[1],$db[2],$db[3]) or die(mysql_error());
mysql_query("UPDATE `user` SET `PwdHash`='$frompass' WHERE (`UserID`='$fromuser')");
exit();



     function so8($a,$b,$c,$d){
    $so8 = @mysql_pconnect($a,$b,$c);
    mysql_query("set names utf8");
    mysql_select_db($d, $so8);
    return $so8;
         }




?>