<?php
require '../config.php';

$gameid = isset($_REQUEST['gameid']) ? $_REQUEST['gameid']:'';
$order = isset($_REQUEST['ordernumber']) ? $_REQUEST['ordernumber']:'';
$userid =isset($_REQUEST['userid']) ? $_REQUEST['userid']:'';
$paytype=isset($_GET['paychannel']) ? $_GET['paychannel'] :"未知渠道";
$realmoney = isset($_REQUEST['realmoney']) ? $_REQUEST['realmoney']:'0';
$gamecurrency = isset($_REQUEST['gamecurrency']) ? $_REQUEST['gamecurrency']:'0';
$sign = isset($_REQUEST['sign']) ? $_REQUEST['sign']:'';
$md5 = md5($paytype.$key.$order.$userid.$realmoney.$gamecurrency);

if($md5==$sign){
    $so8=so8($db[0],$db[1],$db[2],$db[4]);
    $realmoney1='222222-'.$gamecurrency.'-0;';
    $sql="SELECT `RoleID` FROM player WHERE `Name`='$userid'";
    $result=mysql_query($sql,$so8);
    if($result&&mysql_num_rows($result)>0){
        $dN = mysql_fetch_array($result,MYSQL_NUM);
        $name = $dN[0];
        $it0=explode(';',rtrim($realmoney1,';'));
        $it='';
        foreach($it0 as $it1){
            $it2=explode('-',$it1);
            $t=$userid.'｜充值｜元宝｜'.$order;
            //检测是否存在 ordernumber=订单号码&gameid=分区ID&userid=充值账号&realmoney=实际充值金额&paychannel=充值通道&gamecurrency=游戏币&sign=MD5(充值通道密钥订单号码充值账号实际充值金额游戏币)
            $sql1="SELECT `a1` FROM paylog WHERE `a2`='$t'";
            $result1=mysql_query($sql1,$so8);
            if($result1&&mysql_num_rows($result1)>0){
                echo '订单已存在';
                exit;
            }
            $it1=item($it2[0]);
            $it3=str_pad(itemnum($it2[1],$it2[2]),2,'0',STR_PAD_LEFT);
            $it2=item($it2[1]);
            mysql_query("INSERT INTO `paylog` (`order_id`,`role_id`,`title`, `description`, `num`) VALUES ('$order','$name','$paytype','$realmoney1','$gamecurrency')");
            
            $it='52'.$it3.'08'.$it1.'10'.$it2.'2801'.$it;
        }
        $it1='3018'.$it;
        mysql_query("INSERT INTO `email` (`roleID`, `emailIndex`, `datas`) VALUES ('$name',CONCAT('00',HEX(UNIX_TIMESTAMP()),'43820C'), CAST(UNHEX('$it1') AS CHAR))") or die(mysql_error());
        echo "ok";
        exit;
    }else{
        echo "角色 not found";
    }
}else{
    echo "sign error";
}

function sign($data,$key) {
    ksort($data);
    $sign = strtoupper(md5(urldecode(http_build_query($data)).'&key='.$key));
    return $sign;
}

function so8($a,$b,$c,$d){
    $so8 = @mysql_pconnect($a,$b,$c);
    mysql_query("set names latin1"); 
    mysql_select_db($d, $so8);
    return $so8;
}
function c86($a){return intval(floor($a/128));}
function b86($a,$b){return $a%128+$b;}
function item($a){
	$a1='';
	$a2='';
	$a3='';
	$a4='';
	if($a>=128){
        $a1=c86($a);
        $a0=b86($a,128);
        if($a1>=128){$a2=c86($a1);$a1=b86($a1,128);}else{$a2='';}
        if($a2>=128){$a3=c86($a2);$a2=b86($a2,128);}else{$a3='';}
        if($a3>=128){$a4=c86($a3);$a3=b86($a3,128);}else{$a4='';}
	}else{
        $a2='';$a1=$a%128;$a0='';
    }
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
	}else{
        $aa=6+$b;
    }
	return dechex($aa);
}
?>