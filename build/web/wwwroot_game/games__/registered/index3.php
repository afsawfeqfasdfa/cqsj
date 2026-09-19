<!doctype html> 
<html> 
<head> 
<meta charset="utf-8"> 
 
</head> 
 
<body> 
 
<DIV id="CountMsg" class="HotDate"> 
  <h1>【战】【魂】【传】【世】</h1>
   <h2>---稳定运营❤感谢有你---</h2>
   <h3>注册开放时间：2024.11.30 9:00:00</h3>
  <h3>运营开放时间：
<span id="t_d">00 天</span>   
<span id="t_h">00 时</span> 
<span id="t_m">00 分</span> 
<span id="t_s">00 秒</span> 
</h3>
</DIV> 
<script type="text/javascript"> 
function getRTime(){ 
var EndTime= new Date('2024/12/30 11:00:00'); //截止时间 
var NowTime = new Date(); 
var t =EndTime.getTime() - NowTime.getTime(); 
/*var d=Math.floor(t/1000/60/60/24); 
t-=d*(1000*60*60*24); 
var h=Math.floor(t/1000/60/60); 
t-=h*60*60*1000; 
var m=Math.floor(t/1000/60); 
t-=m*60*1000; 
var s=Math.floor(t/1000);*/
 
var d=Math.floor(t/1000/60/60/24); 
var h=Math.floor(t/1000/60/60%24); 
var m=Math.floor(t/1000/60%60); 
var s=Math.floor(t/1000%60); 
 
document.getElementById("t_d").innerHTML = d + " 天"; 
document.getElementById("t_h").innerHTML = h + " 时"; 
document.getElementById("t_m").innerHTML = m + " 分"; 
document.getElementById("t_s").innerHTML = s + " 秒"; 
} 
setInterval(getRTime,1000); 
</script> 
</body> 
</html>