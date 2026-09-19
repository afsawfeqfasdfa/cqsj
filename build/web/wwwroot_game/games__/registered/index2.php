<?php

//$page_title=file_get_contents("https://cqsj.lovxe.cn/game/registered/api/get.php?id=".$_GET["s"]);//网页标题设置为变量
//$code = $_GET["s"] ;
$page_title= '传奇世界';
$code ='zhcs';
if ($page_title == '复古传世')

{

Header("HTTP/1.1 303 See Other");

Header("Location: ".$code);

exit; //from

}



?>



<!DOCTYPE html>

<html lang="en">
<head>
          <title><?php echo $page_title;?></title>
     
        <meta charset="UTF-8">
        <script src="https://lib.sinaapp.com/js/jquery/1.9.1/jquery-1.9.1.min.js"></script>
     
          
         <link rel="stylesheet" type="text/css" href="ccs/s.css">
</head>

<body>
          <div class="register">
               <form id="ajaxForm">
                    <ul>
                        
                        
                           <h2>
       
      &emsp;&emsp;<?php  $page_title;?>注册联系微信：   
      试玩账号123  密码123  
      
                             
                         </h2>

                         
                   
                   
                              <input id="mazey"   type="hidden"  value=<?php echo $code;?>>
                         
                         
                    </ul>
               </form>
          </div>
          <!-- 提示信息 -->
          <div class="tips">
                    <p>用户名不能为空</p>
          </div>
</body>

</html>
   
       <script type="text/javascript"> 
     
                var code_str = ""; 
                        
               
           
           
                           function get_reg(thisBth) {
                          thisBth.setAttribute("disabled", true); 	
                	      var mobile = document.getElementById("mobile"); 
                          var pass = document.getElementById("pass");
                          var repass = document.getElementById("repass");
                            var mazey = document.getElementById("mazey");
         
                       if (mobile.value.length == "") { 
                        	   thisBth.removeAttribute("disabled");
                                alert("游戏账号不能为空"); 
                                return; 
                        }
                   
                          if (pass.value.length == "") {
                          	    thisBth.removeAttribute("disabled");
                                alert("密码不能为空"); 
                                return; 
                        }
                             if (repass.value.length == "") {
                             	thisBth.removeAttribute("disabled");
                                alert("确认密码不能为空"); 
                                return; 
                        }
                        
                                if (pass.value  != repass.value) { 
                                thisBth.removeAttribute("disabled");	
                                alert("二次密码不一致"); 
                                return; 
                        } 
                         
                         
                         var myreg=/[\u4e00-\u9fa5]/;
                        if (myreg.test(mobile.value)) { 
                        	   thisBth.removeAttribute("disabled");
                                alert("不能使用中文账号"); 
                                return; 
                        }
                         
             
                             document.getElementById("mobile").disabled = true;
                    	   	 document.getElementById("pass").disabled = true;
                    	   	 document.getElementById("repass").disabled = true;
            
                     $.ajax({
                         url:'api/reg.php?mobile=' + mobile.value+"&pass="+pass.value+"&code="+mazey.value+"&key=<<REG_PAGE_KEY>>",
                         dataType:'text',
                          success:function(res) {
                    	 var obj = JSON.parse(res);
                    	  if (obj.code == '10004') { 
                    	      alert(obj.msg); 
                    	      window.location.href = 'index.php';
                                return; 
                             }else{
                             document.getElementById("mobile").disabled = false;
                             document.getElementById("pass").disabled = false;
                             document.getElementById("repass").disabled = false; 	
                             thisBth.removeAttribute("disabled");	
                        	  alert(obj.msg); 
                                return; 
                        }}
               })
            
  
}

           
           
                function get_code(thisBth) {
                	 thisBth.setAttribute("disabled", true);
                	 
                	   
                	 
                	 
                	      var mobile = document.getElementById("mobile"); 
                          var pass = document.getElementById("pass");
                          var repass = document.getElementById("repass");
                          var code = document.getElementById("code"); 
                	      var code_strm = "";  
                	     
                	  
                	
                	
                	
                	
                   
                        if (mobile.value.length == "") { 
                        	   thisBth.removeAttribute("disabled");
                                alert("游戏账号不能为空"); 
                                return; 
                        }
                          if (pass.value.length == "") { 
                          	   thisBth.removeAttribute("disabled");
                                alert("密码不能为空"); 
                                return; 
                        }
                             if (repass.value.length == "") { 
                             	thisBth.removeAttribute("disabled");
                                alert("确认密码不能为空"); 
                                return; 
                        }
                        
                                if (pass.value  != repass.value) { 
                                thisBth.removeAttribute("disabled");	
                                alert("二次密码不一致"); 
                                return; 
                        } 
                         
                         
                         
                        	 
                             //var code_str = code_num; 
                           
                        	 document.getElementById("mobile").disabled = true;
                    	   	 document.getElementById("pass").disabled = true;
                    	   	 document.getElementById("repass").disabled = true;
                            // code_str == '';
                             for (var i = 0; i < 5; i++) { 
                              code_strm += Math.round(Math.random() * 10); 
                                } 
                             
                                  code_str = code_strm;
                                  
                                
                                  
                                  
            
            
            
            
                     $.ajax({
                         url:'api/send.php?mobile=' + mobile.value+"&key=<<REG_PAGE_KEY>>",
                         dataType:'text',
                          success:function(res) {
                    	 var obj = JSON.parse(res);
                    
                    	  if (obj.code == '10004') { 
                    
                            alert(obj.msg); 
                    	  	  settime(thisBth);
                                return; 
                             }else{
                             document.getElementById("mobile").disabled = false;
                             document.getElementById("pass").disabled = false;
                             document.getElementById("repass").disabled = false; 	
                             thisBth.removeAttribute("disabled");
                        	  alert(obj.msg); 
                                return; 
                        }}
               })
            
  
}


	var countdown = 60;
  function settime(obj) {
  	
    if (countdown == 0) {
    	 var code_str = ""; 
    	 document.getElementById("mobile").disabled = false;
         document.getElementById("pass").disabled = false;
         document.getElementById("repass").disabled = false;
        obj.removeAttribute("disabled");
        obj.value="获取验证码";
        countdown = 60;
        return;
    } else {
      
        obj.value="重新发送(" + countdown + ")";
        countdown--;
    }
setTimeout(function() {
    settime(obj) }
    ,1000)
}








                      
   
    </script> 
























