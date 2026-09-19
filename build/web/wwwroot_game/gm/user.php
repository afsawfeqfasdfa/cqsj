<?php
include 'user/config.php';
//session_start();
if(empty($_SESSION["uid"])){
	echo "<script src='js/popup.js'></script><script>toast('非法访问');setTimeout(function(){history.go(-1)},4000)</script>";
	exit;
}
//if($_SESSION["vip"]!=1){
//	echo "<script>alert('VIP权限不足 ');history.go(-1)</script>";
//	exit;
//}
 if(isset($_SESSION['expiretime'])) {   
    if($_SESSION['expiretime'] < time()) {  
    unset($_SESSION['expiretime']);  
	header('Location: index.php?TIMEOUT'); // 登出  
	exit(0);  
	} else {  
	$_SESSION['expiretime'] = time() + 3600; // 刷新时间戳  
	}   
} 
$t=time();
?>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1"
    />
	<title><?php echo $gmbt; ?>玩家后台</title>
	<meta name="keywords" content="<?php echo $gmbt; ?>玩家后台" />
	<meta name="description" content="<?php echo $gmbt; ?>玩家后台" /> 
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
</head>

<body>
	<div class="limiter">
		<div class="bg container-login100">
			<div class="wrap-login100">									
					 <span class="login100-form-title"><?php echo $gmbt; ?>玩家后台[<?=$_SESSION["quid"]?>]区</span>										
      <div class="modal-body">
			<div class="form-group">
  <div><span></span><input type='name' disabled="disabled"   class="form-control" placeholder="<?=$_SESSION["uid"]?>" value='' id='name'></div>
 <hr/>
 <div><span></span>
 <input type='number' id='chargenum'class="form-control selectpicker"  placeholder='请输入数量'>

<select id="chargenum1" name="chargenum1" class="form-control selectpicker" data-size="5" title="请选择类型" required>
 <option value="222222">元宝
</option><option value="555555">功勋
</option><option value="888888">绑定元宝
</option><option value="999998">金币
</option><option value="999999">金币
</option>
</select> 
 <input type='button'class="btn btn-danger btn-block"  value='充值' id='chargebtn'></div> 
 <div><span>充值提醒: </span><span style='color:red'>数量不宜过多,按需求使用，用完再发，发爆号概不负责！！！</span><td>
  <hr/>
 
 <?php if ($_SESSION["vip"]>1){?>
  <div>
  <input type='text' value='' id='searchipt' class="form-control" placeholder='物品搜索'>	 
  <select id="mailid" name="mailid" class="selectpicker show-tick form-control" data-live-search="true" data-size="5" title="选物品">
    <?php
		$file = fopen("user/item_wj.txt", "r");
		while(!feof($file))
		{
			$line=fgets($file);
			$txts=explode(';',$line);
			if(count($txts)==2){
				echo '<option value="'.$txts[0].'">'.$txts[1].'</option>';
			}
		}
		fclose($file);
    ?>
            </select>
	<select id="chargesx" name="chargesx" class="form-control selectpicker" data-size="5" title="请选择属性" required>
	<option value="0">默认(一般默认即可)</option>
	<option value="1">特殊(默认发送收不到就是特殊物品,选这个发)</option>
	</select>
	</div>
        <div><span></span><input type='text' value='' id='mailnum' class="form-control"  placeholder='请输入发放数量'>
    <div><input type='button'  class="btn btn-primary btn-block"  value='发送物品' id='mailbtn'>
<span>友情提醒: </span><span style='color:red'>发送后背包查看,按需求使用，用完再发，发爆号概不负责！！</span>	
</div>
 <?php }?>

 </div>
  <hr/>  
  <div><button class="btn btn-danger btn-block" onclick="window.location.href='user/exit.php'">退出</button></div> 
  <hr/> 
 <div>

</div>
<div class="txt1 text-center">
<span><?php echo $gmbt; ?></span>
</div>
<script src='js/jquery-1.7.2.min.js'></script>
<script src="js/popup.js"></script>
<script src="js/msg.js?v=<?php echo $t;?>"></script>
<script>

</script>
</body>
</html>