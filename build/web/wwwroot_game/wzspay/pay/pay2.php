<?php

    require '../config.php';
    
    $roleName = $_REQUEST['roleName'];
    $money = $_REQUEST['money'];
    
    // $response = '{ "code" : "-1", "message" : "404 IP地址和端口错误" }';
    // exit($response);
?>

<!DOCTYPE html>
<html lang="en">
<head>
     <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=Edge">
     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
     <title>传世· 充值</title>
     <meta name="keywords" content=""/>
     <meta name="description" content=""/>
	 <link rel="stylesheet" href="../style.css">
	 <link rel="stylesheet" type="text/css" href="css/style.css">

     <style>
        a:link {
            text-decoration: none;
        }

        　　 a:active {
            text-decoration: blink
        }

        　　 a:hover {
            text-decoration: underline;
        }

        　　 a:visited {
            text-decoration: none;
        }

        *, :after, :before {
            /* -webkit-box-sizing: border-box; */
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        button, html input[type=button], input[type=reset], input[type=submit] {
            -webkit-appearance: button;
            cursor: pointer;
        }
        .pay, .pay button, .pay input, .pay select, .pay textarea {
    font-size: 12px;
    font-family: arial, 微软雅黑;
}
        
        
        
        
        
     </style>
</head>
<body>
<div class="flex_row" style="width:100%;height:60px;position:fixed;top:0px;left:0px;background:#000000">
   <img src="../images/logo.png" width="50" height="50" style="margin:5px;"/>
   <div class="flex_column_left flex_grow_fill" style="color:#FFF;margin-left:20px;">
		<!--<div style="font-size:16px;font-weight:bold">传世</div>-->
		<!--<div style="font-size:12px;margin-top:2px;">经典传世，震撼公测</div>-->
   </div>
   <!--<img src="../images/download.png" style="margin-right:20px;" height="40" width="100" -->
   <!--              onclick="javascript:window.location.href='./pay2.php'"/>-->
</div>
<div class="flex_column widthP100" style="margin-top:60px;">
	
	<div id="loadingPicBlock" style="max-width: 720px;margin:0 auto;" class="pay">

    <div class="g-Total gray9">充值比例：1/10000</div>
    <section class="clearfix g-member">
        <div class="g-Recharge">
            <ul id="ulOption">
                <li money="10"><a class="z-sel" href="javascript:;">12万元宝<s></s></a></li>
                <!--<li money="20"><a href="javascript:;">40000元宝<s></s></a></li>-->
                <!--<li money="30"><a href="javascript:;">300W元宝<s></s></a></li>-->
                <li money="100"><a href="javascript:;">130万元宝<s></s></a></li>
                <li money="300"><a href="javascript:;">500万元宝<s></s></a></li>
                <!--<li money="200"><a href="javascript:;">1500W元宝<s></s></a></li>-->
              <!--  <li money="500"><a href="javascript:;">1000000元宝<s></s></a></li>
                <li money="1000"><a href="javascript:;">1000000元宝<s></s></a></li>-->
            </ul>
        </div>
        <form action="codepay.php" method="post">
            <article class="clearfix mt10 m-round g-pay-ment g-bank-ct">
                <ul id="ulBankList">
                    <li class="gray6" style="width: 100%;padding: 10px 0px 0px 10px;height: 60px;">您选择充值：<label
                            class="input" style="border: 1px solid #EAEAEA;height: 30px;font-size: 14px;padding:10px;">
                            <input type="text" name="money" id="money" placeholder="如：10" value="充值：10元"
                                   style="width: 170px;color: red;font-size:14px;">
                        </label> 
                    </li>
                    <!--<li class="gray6"-->
                    <!--    style="width: 100%;padding: 10px 0px 0px 10px;display:inline;height: 60px;">-->
                    <!--    游戏角色名：<label-->
                    <!--        class="input" style="border: 1px solid #EAEAEA;height: 30px;font-size: 14px;padding:10px;">-->
                    <!--        <input type="text" name="user" id="user" placeholder="请输入游戏角色名" value=""-->
                    <!--               style="width: 180px;font-size: 14px;">-->
                    <!--    </label>-->
                    <!--</li>-->
                    
                    <li paytype="1" class="gray9" type="codePay" style="width: 100px;margin:10px;border-top:0px">
                        <a href="javascript:;" class="z-initsel"><img src="img/weixin.jpg"><s></s></a>

                    </li>
                   <!--
                    <li paytype="2" class="gray9" type="codePay" style="width: 100px;margin:10px;border-top:0px">
                        <a href="javascript:;"><img src="img/qqpay.jpg"><s></s></a>
                    </li>
                    
                    <li paytype="3" class="gray9" type="codePay" style="width: 100px;margin:10px;border-top:0px">
                        <a href="javascript:;" ><img src="img/alipay.jpg"><s></s></a>
                    </li>
                    -->
                    

                </ul>
            </article>
            <input type="hidden" id="pay_type" value="1" name="type">
            <input type="hidden" value="" name="salt">
            <input type="hidden" value="<?php echo $roleName ?>" name="$roleName">

            <div class="mt10 f-Recharge-btn" style="margin-top:100px;margin-bottom:80px;">
                <button id="btnSubmit" type="submit" href="javascript:;" class="orgBtn">确认支付</button>
            </div>
        </form>
    </section>

    <input id="hidIsHttps" type="hidden" value="0"/>
    <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">

        $(function () {
            var c;
            var g = false;
            var a = null;
            var e = function () {
                $("#ulOption > li").each(function () {
                    var n = $(this);
                    n.click(function () {
                        g = false;
                        c = n.attr("money");
                        n.children("a").addClass("z-sel");
                        n.siblings().children().removeClass("z-sel").removeClass("z-initsel");
                        var needMoney = parseFloat(n.attr("money")).toFixed(2);
                        if (needMoney <= 0)needMoney = 0.001;
                        $("#money").val(needMoney);
                    })
                });
                $("#ulBankList > li").each(function (m) {
                    var n = $(this);
                    n.click(function () {
                        if (m < 2)return;
                        $("#pay_type").val(n.attr("payType"));
                        n.children("a").addClass("z-initsel");
                        n.siblings().children().removeClass("z-initsel");
                    })
                });

            };
            e()
        });

    </script>

	</div>
</div>
<div class="flex_row footer">
      
</div>
</body>
</html>