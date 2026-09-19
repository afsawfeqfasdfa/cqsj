<?php
$page_title= '【上古传世】';
$code ='admin123';   // 邀请码(同时作为 Skey 写入)
if ($page_title == '复古传世'){
    Header("HTTP/1.1 303 See Other");
    Header("Location: ".$code);
    exit;
}
?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $page_title;?> - 账号注册</title>
    <link rel="stylesheet" type="text/css" href="ccs/s.css">
    <style>
        * { margin:0; padding:0; box-sizing:border-box; }
        body {
            font-family:"Microsoft YaHei","PingFang SC",sans-serif;
            min-height:100vh;
            display:flex; align-items:center; justify-content:center;
            background:linear-gradient(135deg,#1e3c72 0%,#2a5298 50%,#6dd5ed 100%);
            padding:20px;
        }
        .register-card {
            width:100%; max-width:560px;
            background:rgba(255,255,255,0.96);
            border-radius:16px;
            box-shadow:0 18px 50px rgba(0,0,0,0.35);
            padding:34px 36px 28px;
            animation:rise .5s ease;
        }
        @keyframes rise { from{opacity:0; transform:translateY(24px);} to{opacity:1; transform:translateY(0);} }
        .register-card h2 {
            text-align:center; font-size:24px; color:#1e3c72; margin-bottom:6px;
            letter-spacing:2px;
        }
        .register-card .sub { text-align:center; color:#888; font-size:13px; margin-bottom:22px; }
        .field {
            display:flex; align-items:center; gap:12px;
            margin-bottom:16px; position:relative;
        }
        .field label {
            width:74px; flex-shrink:0; text-align:right;
            font-size:14px; color:#444; font-weight:600;
        }
        .field input {
            flex:1 1 auto; height:42px; padding:0 14px;
            border:2px solid #e1e6ef; border-radius:10px;
            font-size:15px; transition:.2s; outline:none; background:#fafbfc;
        }
        .field input:focus { border-color:#2a5298; background:#fff; box-shadow:0 0 0 3px rgba(42,82,152,.12); }
        .field.ok input { border-color:#28a745; }
        .field.bad input { border-color:#dc3545; }
        .feedback {
            flex:0 0 168px; font-size:12.5px; min-height:17px;
            display:flex; align-items:center; gap:4px; line-height:1.3;
            transition:.2s;
        }
        .feedback.ok  { color:#28a745; }
        .feedback.bad { color:#dc3545; }
        .feedback .ico { font-weight:bold; }
        .submit {
            width:100%; height:46px; border:none; border-radius:10px; cursor:pointer;
            background:linear-gradient(135deg,#2a5298,#1e3c72); color:#fff; font-size:16px; font-weight:600;
            letter-spacing:3px; transition:.2s; margin-top:8px;
        }
        .submit:hover:not(:disabled) { filter:brightness(1.1); transform:translateY(-1px); }
        .submit:disabled { background:#b9c2d0; cursor:not-allowed; }
        /* Toast 弹出层 */
        .toast-container {
            position:fixed; top:24px; left:50%; transform:translateX(-50%);
            z-index:9999; display:flex; flex-direction:column; gap:10px;
            pointer-events:none;
        }
        .toast {
            min-width:220px; max-width:480px;
            padding:12px 22px; border-radius:8px;
            color:#fff; font-size:14px; text-align:center; line-height:1.5;
            box-shadow:0 8px 24px rgba(0,0,0,0.25);
            pointer-events:auto;
            animation:toastIn .3s ease both;
        }
        .toast.success { background:linear-gradient(135deg,#28a745,#20c997); }
        .toast.error   { background:linear-gradient(135deg,#dc3545,#e85563); }
        .toast.leaving { animation:toastOut .35s ease both; }
        @keyframes toastIn  { from{opacity:0; transform:translateY(-18px);} to{opacity:1; transform:translateY(0);} }
        @keyframes toastOut { from{opacity:1; transform:translateY(0);}     to{opacity:0; transform:translateY(-18px);} }
    </style>
</head>
<body>
    <div class="register-card">
        <h2><?php echo $page_title;?></h2>
        <div class="sub">欢迎注册 · 账号密码限 6-12 位字母数字</div>
        <form id="ajaxForm" autocomplete="off">
            <div class="field" id="f-mobile">
                <label>游戏账号</label>
                <input type="text" id="mobile" class="mobile" placeholder="6-12位字母或数字" maxlength="12">
                <div class="feedback" id="fb-mobile"></div>
            </div>
            <div class="field" id="f-pass">
                <label>设置密码</label>
                <input type="password" id="pass" class="pass" placeholder="6-12位字母或数字" maxlength="12">
                <div class="feedback" id="fb-pass"></div>
            </div>
            <div class="field" id="f-repass">
                <label>确认密码</label>
                <input type="password" id="repass" class="repass" placeholder="再次输入密码" maxlength="12">
                <div class="feedback" id="fb-repass"></div>
            </div>
            <div class="field" id="f-invite">
                <label>邀请码</label>
                <input type="text" id="invite" class="invite" placeholder="请填写邀请码" maxlength="32">
                <div class="feedback" id="fb-invite"></div>
            </div>
            <input type="button" onclick="get_reg(this)" class="submit" id="submitBtn" value="立即注册" disabled>
            <input id="mazey" type="hidden" value="<?php echo $code;?>">
        </form>
    </div>

<script type="text/javascript">
(function(){
    var RE = /^[A-Za-z0-9]{6,12}$/;   // 仅字母数字 6-12 位
    var timer = null;

    function $(id){ return document.getElementById(id); }

    function setFB(id, ok, msg){
        var fb = $('fb-'+id);
        fb.className = 'feedback ' + (ok ? 'ok' : 'bad');
        fb.innerHTML = '<span class="ico">' + (ok ? '✓' : '✗') + '</span>' + msg;
        $('f-'+id).className = 'field ' + (ok ? 'ok' : 'bad');
    }
    function clearFB(id){
        var fb = $('fb-'+id);
        fb.className = 'feedback';
        fb.innerHTML = '';
        $('f-'+id).className = 'field';
    }

    function allValid(){
        var fbMobile = $('fb-mobile');
        return RE.test($('mobile').value) &&
               RE.test($('pass').value) &&
               $('repass').value !== '' &&
               $('repass').value === $('pass').value &&
               $('invite').value.trim() !== '' &&
               fbMobile.className.indexOf('ok') !== -1 &&
               fbMobile.className.indexOf('bad') === -1;
    }
    function refreshSubmit(){
        $('submitBtn').disabled = !allValid();
    }

    function ajaxGet(url, onDone){
        var xhr = new XMLHttpRequest();
        xhr.open('GET', url, true);
        xhr.onreadystatechange = function(){
            if(xhr.readyState === 4){
                if(xhr.status === 200){ onDone(xhr.responseText); }
                else { onDone(null); }
            }
        };
        xhr.send();
    }

    // Toast 弹出层(自动消失): type = 'success' | 'error'
    function toast(msg, type){
        var c = $('toast-container');
        if(!c){
            c = document.createElement('div');
            c.id = 'toast-container';
            c.className = 'toast-container';
            document.body.appendChild(c);
        }
        var t = document.createElement('div');
        t.className = 'toast ' + (type || 'error');
        t.textContent = msg;
        c.appendChild(t);
        setTimeout(function(){
            t.classList.add('leaving');
            setTimeout(function(){ if(t.parentNode) t.parentNode.removeChild(t); }, 380);
        }, 2500);
    }

    // 账号: 复杂度 + 防抖查重
    $('mobile').addEventListener('input', function(){
        var v = this.value;
        if(v === ''){ clearFB('mobile'); refreshSubmit(); return; }
        if(!RE.test(v)){
            setFB('mobile', false, '需6-12位字母或数字,不含中文/特殊符号');
            refreshSubmit(); return;
        }
        setFB('mobile', true, '格式正确,正在检测...');
        if(timer) clearTimeout(timer);
        timer = setTimeout(function(){
            ajaxGet('api/check_user.php?mobile='+encodeURIComponent(v), function(res){
                if(res === null){ setFB('mobile', false, '检测失败,请重试'); refreshSubmit(); return; }
                try{
                    var obj = JSON.parse(res);
                    if(obj.available){ setFB('mobile', true, '账号可以使用'); }
                    else { setFB('mobile', false, '账号已被注册'); }
                }catch(e){ setFB('mobile', false, '检测失败,请重试'); }
                refreshSubmit();
            });
        }, 400);
    });

    // 密码: 复杂度
    $('pass').addEventListener('input', function(){
        var v = this.value;
        if(v === ''){ clearFB('pass'); }
        else if(!RE.test(v)){ setFB('pass', false, '需6-12位字母或数字,不含中文/特殊符号'); }
        else { setFB('pass', true, '密码格式正确'); }
        // 同步校验确认密码
        if($('repass').value !== '') $('repass').dispatchEvent(new Event('input'));
        refreshSubmit();
    });

    // 确认密码: 一致性
    $('repass').addEventListener('input', function(){
        var v = this.value;
        if(v === ''){ clearFB('repass'); }
        else if(v !== $('pass').value){ setFB('repass', false, '两次密码不一致'); }
        else { setFB('repass', true, '密码一致'); }
        refreshSubmit();
    });

    // 邀请码: 非空即可
    $('invite').addEventListener('input', function(){
        var v = this.value.trim();
        if(v === ''){ clearFB('invite'); }
        else { setFB('invite', true, '邀请码已填写'); }
        refreshSubmit();
    });

    window.get_reg = function(btn){
        if(!allValid()){ toast('请检查表单填写是否完整且符合要求', 'error'); return; }
        btn.disabled = true;
        var mobile = $('mobile').value;
        var pass   = $('pass').value;
        var repass = $('repass').value;
        var invite = $('invite').value.trim();
        var mazey  = $('mazey').value;   // 兜底默认
        if(pass !== repass){ toast('两次密码不一致', 'error'); btn.disabled = false; return; }
        ajaxGet('api/reg.php?mobile='+encodeURIComponent(mobile)+'&pass='+encodeURIComponent(pass)+'&code='+encodeURIComponent(invite)+'&key=<<DB_OR_GM_PASSWORD>>', function(res){
            if(res === null){ toast('网络错误,请重试', 'error'); btn.disabled = false; return; }
            try{
                var obj = JSON.parse(res);
                if(obj.code == '10004'){
                    toast(obj.msg, 'success');
                    setTimeout(function(){ window.location.href = 'index.php'; }, 1200);
                }else{
                    toast(obj.msg, 'error');
                    btn.disabled = false;
                }
            }catch(e){ toast('返回数据异常', 'error'); btn.disabled = false; }
        });
    };
})();
</script>
</body>
</html>
