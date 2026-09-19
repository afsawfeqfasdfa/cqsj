<?php
include 'user/config.php';
$last_uid = isset($_COOKIE['gm_uid']) ? $_COOKIE['gm_uid'] : '';
require_once 'user/access.php';

// ===== GM后台访问门禁（密码 + 封禁IP） =====
$ip = gm_client_ip();
if (gm_is_banned($ip)) {
    die('网络错误，请联系管理员');
}
if (!isset($_SESSION['gm_access_ok'])) {
    $access_err = '';
    if (isset($_POST['accesspwd'])) {
        if (trim($_POST['accesspwd']) === $gmaccesspwd) {
            $_SESSION['gm_access_ok'] = 1;
            header('Location: gm.php');
            exit;
        }
        $access_err = '访问密码错误';
    }
    echo '<!DOCTYPE html><html lang="zh-CN"><head><meta charset="UTF-8">';
    echo '<title>GM后台 - 访问验证</title>';
    echo '<style>body{font-family:sans-serif;background:#1a1a2e;color:#eee;display:flex;align-items:center;justify-content:center;height:100vh;margin:0}.box{background:#16213e;padding:30px 40px;border-radius:8px;text-align:center;box-shadow:0 0 20px rgba(0,0,0,.4)}.box h3{margin:0 0 16px}.box input{padding:10px;font-size:16px;width:240px;margin:6px 0;border-radius:4px;border:1px solid #444;background:#0f3460;color:#eee}.box button{padding:10px 28px;font-size:16px;background:#e94560;color:#fff;border:none;border-radius:4px;cursor:pointer}.err{color:#ff6b81;margin:8px 0}</style>';
    echo '</head><body><div class="box"><h3>GM 后台访问验证</h3>';
    if ($access_err) echo '<div class="err">'.$access_err.'</div>';
    echo '<form method="post"><input type="password" name="accesspwd" placeholder="请输入访问密码" autofocus><br><button type="submit">进入</button></form></div></body></html>';
    exit;
}
?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title><?php echo $gmbt; ?> GM后台tttt</title>
	<meta name="keywords" content="<?php echo $gmbt; ?> GM后台" />
	<meta name="description" content="<?php echo $gmbt; ?> GM后台" /> 

	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<script src="js/popup.js"></script>
</head>

<body>

	<div class="limiter">
		<div class="bg container-login100">
			<div class="wrap-login100">								
				<span class="login100-form-title"><?php echo $gmbt; ?> 授权后台</span>
		<a href="roles.php" class="btn btn-info btn-block" style="margin:6px 0 6px;">查看所有角色</a>
		<a href="unban.php" class="btn btn-warning btn-block" style="margin:0 0 14px;">IP 封禁列表 / 解封</a>
								
      <div class="modal-body">
            <div class="form-group">
                <div class="form-group">
                    <div class="form-group">
  <div><span></span><input type='password' class="form-control" placeholder="输入GM校验码" value='<?php echo htmlspecialchars($gmcodeb, ENT_QUOTES, 'UTF-8'); ?>' id='checknum'></div>
  
                        <select id="qu" name="qu" class="form-control selectpicker" data-size="5" title="请选择区服" required>
						<?php
						foreach($quarr as $key=>$value){
							if($value['hidde']!=true){
								echo '<option value="'.$key.'">'.$value['name'].'</option>';
						}
						}
						?>
                        </select>
                    </div>
                </div>
				 <hr/>
  <div><span></span><input type='text' value='<?php echo htmlspecialchars($last_uid, ENT_QUOTES, 'UTF-8'); ?>' id='uid' class="form-control" placeholder='请输入角色名'>
  <input type='text' value='' id='upass' class="form-control" placeholder='请输入授权密码。'>
  <select id="vip" name="vip" class="selectpicker show-tick form-control" data-live-search="true" data-size="5" title="选物品">
								<?php
							  foreach($yzfvip as $k=>$v){
								  echo '<option value="'.$k.'">'.$v.'</option>';
							  }
							  ?>
  </select>  
  <input type='button' class="btn btn-success" value='添加授权' id='addvipbtn'>
  <input type='button' class="btn btn-success" value='修改权限等级' id='editvip'>
  <input type='button' class="btn btn-success" value='修改权限密码' id='editpwd'>
  <input type='button' class="btn btn-danger" value='删除玩家权限' id='delvip'>
  </div>
  <span>权限提醒: </span><span style='color:red'>提示授权成功，玩家登陆无权限，请检查文件夹是否给予777权限！！</span>
  <hr/>
 <div><span></span>

<select id="chargenum1" name="chargenum1" class="form-control selectpicker" data-size="5" title="请选择类型" required>
 <option value="222222">元宝
</option><option value="888888">绑定元宝
</option><option value="999998">金币
</option><option value="999999">金币
</option>
</select> 
<input type='number' id='chargenum'class="form-control selectpicker"  placeholder='请输入数量'>
 
 <input type='button'class="btn btn-danger btn-block"  value='充值' id='chargebtn'></div> 
  <hr/>
 <div><span>充值提醒: </span><span style='color:red'>数量不宜过多,按需求使用，用完再发，发爆号概不负责！！</span><td>
 
 <hr/>
     <div>
  <input type='text' value='' id='searchipt' class="form-control" placeholder='物品搜索'>	 
  <select id="mailid" name="mailid" class="selectpicker show-tick form-control" data-live-search="true" data-size="5" title="选物品">
    <?php
		$file = fopen("user/item_gm.txt", "r");
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
        <div><span></span><input type='text' value='' id='mailnum' class="form-control"  placeholder='请输入发放数量'>
    <input type='button'  class="btn btn-primary btn-block"  value='发送物品' id='mailbtn'>
	<input type='button'  class="btn btn-danger btn-block"  value='全服邮件' id='mailbtnall'>
<span>友情提醒: </span>
<span style='color:red'>发送后背包查看,按需求使用，用完再发，发爆号概不负责！！</span>
<span style='color:red'>有些物品默认发送是收到空的，这样就选择特殊发送，这类特殊物品最多发99个！！</span>	
</div>
 <hr/>
<select class="form-control selectpicker" id="chargenum2" name="num">
<option value='77' desc=''>清理邮件（小退生效）</option>
<option value='11' desc=''>查封</option>
<option value='22' desc=''>解封</option>
<option value='33' desc=''>禁言</option>
<option value='44' desc=''>解禁</option>
<option value='55' desc=''>修改等级(下线后修改)</option>
<option value='66' desc=''>修改密码</option>
 </select>
 <input type='text' value='' id='unum' class="form-control" placeholder='请输入修改等级/密码'> 
<input type='button'class="btn btn-primary btn-block"  value='修改属性' id='chargebtn2'></div>
<hr/>
<div>
	
</div>

<div class="txt1 text-center">
		<span><?php echo $gmbt; ?></span>
</div>
<script src='js/jquery-1.7.2.min.js'></script>
<script>
  var checknum=$('#checknum').val();
  var uid=$.trim($('#uid').val());
  var qu=$('#qu').val();
  $('#checknum').change(function(){
	  checknum=$(this).val();
  });
  $('#uid').change(function(){
	  uid=$.trim($(this).val());
	  document.cookie="gm_uid="+encodeURIComponent(uid)+";path=/;max-age=31536000";
  });
  $('#qu').change(function(){
	  qu=$.trim($(this).val());
  });
  
  
  $('#addvipbtn').click(function(){
	  if(checknum==''){
		  toast('请输入GM校验码。');
		  return false;
	  }
	  if(uid==''){
		  toast('角色名不能为空。');
		  return false;
	  }
	  var upass=$('#upass').val();
	  if(upass==''){
		  toast('请输入授权密码。');
		  return false;
	  }	 
	  var vip=$('#vip').val();
	  if(vip==''){
		  toast('请选择权限。');
		  return false;
	  }	  
	  $.ajax({
		  url:'user/gmquery.php',
		  type:'post',
		  'data':{type:'addvip',checknum:checknum,uid:uid,qu:qu,upass:upass,vip:vip},
          'cache':false,
          'dataType':'json',
		  success:function(data){
			  console.log('data',data);
			  toast(data.info);
		  },
		  error:function(){
			  toast('操作失败');
		  }
	  });
  });
  $('#editvip').click(function(){
	  if(checknum==''){
		  toast('请输入GM校验码。');
		  return false;
	  }
	  if(uid==''){
		  toast('角色名不能为空。');
		  return false;
	  }
	  var upass=$('#upass').val();
	  if(upass==''){
		  toast('请输入授权密码。');
		  return false;
	  }	 
	  var vip=$('#vip').val();
	  if(vip==''){
		  toast('请选择权限。');
		  return false;
	  }	  
	  $.ajax({
		  url:'user/gmquery.php',
		  type:'post',
		  'data':{type:'editvip',checknum:checknum,uid:uid,qu:qu,upass:upass,vip:vip},
          'cache':false,
          'dataType':'json',
		  success:function(data){
			  console.log('data',data);
			  toast(data.info);
		  },
		  error:function(){
			  toast('操作失败');
		  }
	  });
  });
   $('#editpwd').click(function(){
	  if(checknum==''){
		  toast('请输入GM校验码。');
		  return false;
	  }
	  if(uid==''){
		  toast('角色名不能为空。');
		  return false;
	  }
	  var upass=$('#upass').val();
	  if(upass==''){
		  toast('请输入授权密码。');
		  return false;
	  }	 
	  var vip=$('#vip').val();
	  if(vip==''){
		  toast('请选择权限。');
		  return false;
	  }	  
	  $.ajax({
		  url:'user/gmquery.php',
		  type:'post',
		  'data':{type:'editpwd',checknum:checknum,uid:uid,qu:qu,upass:upass,vip:vip},
          'cache':false,
          'dataType':'json',
		  success:function(data){
			  console.log('data',data);
			  toast(data.info);
		  },
		  error:function(){
			  toast('操作失败');
		  }
	  });
  });
 
  $('#delvip').click(function(){
	  if(checknum==''){
		  toast('请输入GM校验码。');
		  return false;
	  }
	  if(uid==''){
		  toast('请输入需要取消授权的账号。');
		  return false;
	  }
	  var upass=$('#upass').val();
	  if(upass==''){
		  toast('请输入以前授权时候的密码。');
		  return false;
	  }
	  var vip=$('#vip').val();
	  if(vip==''){
		  toast('请选择权限。');
		  return false;
	  }	  
	  $.ajax({
		  url:'user/gmquery.php',
		  type:'post',
		  'data':{type:'delvip',checknum:checknum,uid:uid,qu:qu,upass:upass,vip:vip},
          'cache':false,
          'dataType':'json',
		  success:function(data){
			  console.log('data',data);
			  toast(data.info);
		  },
		  error:function(){
			  toast('操作失败');
		  }
	  });
  });
  $('#chargebtn').click(function(){
	  if(checknum==''){
		  toast('请输入GM校验码。');
		  return false;
	  }
	  if(uid==''){
		  toast('角色名不能为空。');
		  return false;
	  }
	  var chargenum=$('#chargenum').val();
	  //if(chargenum<1 || chargenum>999999){
	//	  toast('数量范围:1-999999。');
	//	  return false;
	 // }	 
	  var chargenum1=$('#chargenum1').val();
	  
	  $.ajax({
		  url:'user/gmquery.php',
		  type:'post',
		  'data':{type:'charge',checknum:checknum,uid:uid,num:chargenum,num2:chargenum1,qu:qu},
          'cache':false,
          'dataType':'json',
		  success:function(data){
			  console.log('data',data);
			  toast(data.info);
		  },
		  error:function(){
			  toast('操作失败');
		  }
	  });
  });
    $('#chargebtn2').click(function(){
	  if(checknum==''){
		  toast('请输入GM校验码。');
		  return false;
	  }
	  if(uid==''){
		  toast('角色名不能为空。');
		  return false;
	  }
      var unum=$('#unum').val();
	  var chargenum2=$('#chargenum2').val();
      var msg = "您真的确定要清理操作吗？\n\n操作后将无法撤销！！！\n\n是否确认继续！！\n\n请确认！";
	  confirmBox(msg, function(){ 	
	  $.ajax({
		  url:'user/gmquery.php',
		  type:'post',
		  'data':{type:'charge2',checknum:checknum,uid:uid,num:chargenum2,qu:qu,unum:unum},
          'cache':false,
          'dataType':'json',
		  success:function(data){
			  console.log('data',data);
			  toast(data.info);
		  },
		  error:function(){
			  toast('操作失败');
		  }
	  });
	  });	  
  });
  
  $('#mailbtn').click(function(){
	  if(checknum==''){
		  toast('请输入GM校验码。');
		  return false;
	  }
	  if(uid==''){
		  toast('角色名不能为空。');
		  return false;
	  }
	  var itemid=$('#mailid').val();
	  if(itemid==''){
		  toast('请选择物品。');
		  return false;
	  }
	  var mailnum=$('#mailnum').val();
	  if(mailnum=='' || isNaN(mailnum)){
		  toast('数量不能为空。');
		  return false;
	  }
	 // if(mailnum<1 || mailnum>999999){
	//	  toast('数量范围:1-999999。');
	//	  return false;
	 // }
	  var chargesx=$('#chargesx').val();
	  $.ajax({
		  url:'user/gmquery.php',
		  type:'post',
		  'data':{type:'mail',checknum:checknum,uid:uid,item:itemid,num:mailnum,sx:chargesx,qu:qu},
          'cache':false,
          'dataType':'json',
		  success:function(data){
			  console.log('data',data);
			  toast(data.info);
		  },
		  error:function(){
			  toast('操作失败');
		  }
	  });	  
  });
  
  $('#mailbtnall').click(function(){
	  if(checknum==''){
		  toast('请输入GM校验码。');
		  return false;
	  }
	  if(uid==''){
		  toast('发送全局邮件，角色名处随便填个东西');
		  return false;
	  }
	  var itemid=$('#mailid').val();
	  if(itemid==''){
		  toast('请选择物品。');
		  return false;
	  }
	  var mailnum=$('#mailnum').val();
	  if(mailnum=='' || isNaN(mailnum)){
		  toast('数量不能为空。');
		  return false;
	  }
	  //if(mailnum<1 || mailnum>999999){
	//	  toast('数量范围:1-999999。');
		//  return false;
	  //}
	  var chargesx=$('#chargesx').val();
	  $.ajax({
		  url:'user/gmquery.php',
		  type:'post',
		  'data':{type:'mailall',checknum:checknum,uid:uid,item:itemid,num:mailnum,sx:chargesx,qu:qu},
          'cache':false,
          'dataType':'json',
		  success:function(data){
			  console.log('data',data);
			  toast(data.info);
		  },
		  error:function(){
			  toast('操作失败');
		  }
	  });	  
  });
 
  $('#searchipt').on('change',function(){
	  var keyword=$(this).val();
	  $.ajax({
		  url:'user/itemquery.php',
		  type:'post',
		  'data':{keyword:keyword,typea:'item_gm'},  
          'cache':false,
          'dataType':'json',
		  success:function(data){
			  if(data){
				  $('#mailid').html('');
				for (var i in data){
				  $('#mailid').append('<option value="'+data[i].key+'" data-desc="'+data[i].desc+'">'+data[i].val+'</option>');
				}
			  }else{
				  $('#mailid').html('<option value="0" data-desc="未找到">未找到</option>');
			  }
			  $('#maildesc').html('请选择');
		  },
		  error:function(){
			  toast('操作失败');
		  }
	  });
  });
  $('#mailid').live('change',function(){
	  console.log('test');
	  var desc=$('#mailid option:selected').data('desc');
	  $('#maildesc').html(desc);
  }); 

</script>
</body>
</html>