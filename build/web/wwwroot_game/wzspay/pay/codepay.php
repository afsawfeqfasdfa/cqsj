
<?php

$data = $_POST;

$type = $data['type'];


switch ((int)$type) {
    case 1:
        $typeName = '微信';
		$qrcode = "/wzspay/pay/img/wzs3325319.png";
        break;
    case 2:
        $typeName = 'QQ';
        $qrcode = "/wzspay/pay/img/wzs3325319.png";
        break;
    default:
        $typeName = '支付宝';
        $qrcode = "/wzspay/pay/img/wzs3325319.png";
}

//准备传给前端输出的JSON
$user_data = array(
    "type" => $type,
    "outTime" => 120,
    "out_trade_no" => "00000001",
    "price" => $data['price'],
    'money'=>$data['price'] * 10,
    'order_id'=> 1,
    "subject"=>'元宝',
);

?>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta name="apple-mobile-web-app-capable" content="no"/>
    <meta name="apple-touch-fullscreen" content="yes"/>
    <meta name="format-detection" content="telephone=no,email=no"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="white">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title><?php echo $typeName ?>扫码支付</title>
    <link rel="stylesheet" href="../style.css">
    <link href="css/wechat_pay.css" rel="stylesheet" media="screen">
</head>

<body>
<div class="body">
	
    <h1 class="mod-title">
        <span class="ico_log ico-<?php echo $type ?>"></span>
    </h1>
    
    <div style="margin-bottom:80px;">
    	
    	<div><h1 style="color:red;text-align:center;margin-top:20px;">请联系客服充值</h1></div>
    
    	<div class="mod-ct">
	        <div class="order"></div>
	        <!--<div class="amount" id="money">￥<?php echo $user_data['price'] ?></div>-->
	        <div class="qrcode-img-wrapper" data-role="qrPayImgWrapper">
	            <div data-role="qrPayImg" class="qrcode-img-area">
	                <div style="position: relative;display: inline-block;">
	                    <!--<img id='show_qrcode' alt="加载中..." src="<?php echo $qrcode ?>" width="210" height="210"-->
	                         <!--style="display: block;">-->
	                  
	                </div>
	            </div>
	        </div>
	        
	        <!--<div class="time-item" id="msg">-->
	        <!--    <h1>二维码过期时间</h1>-->
	        <!--    <strong id="hour_show">0时</strong>-->
	        <!--    <strong id="minute_show">0分</strong>-->
	        <!--    <strong id="second_show">0秒</strong>-->
	        <!--</div>-->
	
	        <div class="tip">
	            <div class="ico-scan"></div>
	            <div class="tip-text">
	                <p>已关闭充值业务</p>
	                <p>技术QQ：XXXXXX</p>
	                <p><div id="kf" ></div></p>
	            </div>
	        </div>
	        
	        <div class="foot">
		        <div class="inner">
		            <p>请通过微信或QQ联系客服充值</p>
		            <!--<p>在<?php echo $typeName  ?>扫一扫中选择“相册”即可</p>-->
		        </div>
		    </div>
	
	        <div class="detail" id="orderDetail">
	            <dl class="detail-ct" id="desc" style="display: none;">
	                <dt>状态</dt>
	                <dd id="createTime">订单创建</dd>
	            </dl>
	            <a href="javascript:void(0)" class="arrow"><i class="ico-arrow"></i></a>
	        </div>
	
	        <div class="tip-text">
	        </div>
	
	
	    </div>
   
    </div>
    
    
	<div class="flex_row footer">
	     
	</div>

</div>


<script src="js/jquery-1.10.2.min.js"></script>
    
<script src="js/codepay_util.js"></script>

<script src="js/clipboard.min.js"></script>


<script>

	var user_data = <?php echo json_encode($user_data);?>
	
	show_desc(user_data)

    var clipboard = new Clipboard('.copy');
    clipboard.on('success', function (e) {
        toastr.success("复制成功,可扫码付款时候粘贴到金额栏付款");

    });
    clipboard.on('error', function(e) {
        document.querySelector('.copy');
        toastr.warning("复制失败,请记住下必须付款的金额 不能多不能少否则不能成功");
    });
</script>
</body>
</html>
