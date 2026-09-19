/* gm 通用弹出层: toast(提示, 4秒自动关闭) + confirmBox(确认弹出层) */
(function(){
    var DURATION = 4000; // 提示自动关闭时长(毫秒)

    // 注入关键帧动画
    if(!document.getElementById('gm-popup-style')){
        var st = document.createElement('style');
        st.id = 'gm-popup-style';
        st.textContent = '@keyframes gmToastIn{from{opacity:0;transform:translateY(-18px);}to{opacity:1;transform:translateY(0);}}'
                       + '@keyframes gmBoxIn{from{opacity:0;transform:scale(.92);}to{opacity:1;transform:scale(1);}}';
        document.head.appendChild(st);
    }

    function ensureContainer(){
        var c = document.getElementById('gm-toast-container');
        if(!c){
            c = document.createElement('div');
            c.id = 'gm-toast-container';
            c.style.cssText = 'position:fixed;top:20px;left:50%;transform:translateX(-50%);z-index:99999;'
                            + 'display:flex;flex-direction:column;gap:10px;pointer-events:none;';
            document.body.appendChild(c);
        }
        return c;
    }

    // 提示弹出层: type = 'info' | 'success' | 'error'  -> 4秒自动关闭
    function toast(msg, type){
        type = type || 'info';
        var bg;
        if(type === 'error')        bg = 'linear-gradient(135deg,#dc3545,#e85563)';
        else if(type === 'success') bg = 'linear-gradient(135deg,#28a745,#20c997)';
        else                        bg = 'linear-gradient(135deg,#2a5298,#1e3c72)';
        var c = ensureContainer();
        var t = document.createElement('div');
        t.style.cssText = 'min-width:220px;max-width:90vw;padding:12px 22px;border-radius:8px;color:#fff;'
                        + 'font-size:14px;text-align:center;line-height:1.5;box-shadow:0 8px 24px rgba(0,0,0,.25);'
                        + 'pointer-events:auto;animation:gmToastIn .3s ease both;background:' + bg + ';';
        t.textContent = msg;
        c.appendChild(t);
        setTimeout(function(){
            t.style.transition = 'opacity .35s, transform .35s';
            t.style.opacity = '0';
            t.style.transform = 'translateY(-18px)';
            setTimeout(function(){ if(t.parentNode) t.parentNode.removeChild(t); }, 380);
        }, DURATION);
    }

    // 确认弹出层: 带 确定/取消 按钮(需用户决策, 不自动关闭)
    function confirmBox(msg, onYes){
        var overlay = document.createElement('div');
        overlay.style.cssText = 'position:fixed;inset:0;background:rgba(0,0,0,.45);z-index:100000;'
                              + 'display:flex;align-items:center;justify-content:center;';
        var box = document.createElement('div');
        box.style.cssText = 'background:#fff;border-radius:12px;max-width:380px;width:86%;padding:22px 22px 16px;'
                          + 'box-shadow:0 18px 50px rgba(0,0,0,.35);font-family:Microsoft YaHei,"PingFang SC",sans-serif;'
                          + 'animation:gmBoxIn .25s ease both;';
        var p = document.createElement('div');
        p.style.cssText = 'font-size:15px;color:#333;line-height:1.6;white-space:pre-wrap;margin-bottom:18px;';
        p.textContent = msg;
        var btnWrap = document.createElement('div');
        btnWrap.style.cssText = 'display:flex;gap:12px;';
        var yes = document.createElement('button');
        yes.textContent = '确定';
        yes.style.cssText = 'flex:1;height:40px;border:none;border-radius:8px;background:linear-gradient(135deg,#2a5298,#1e3c72);'
                          + 'color:#fff;font-size:15px;cursor:pointer;';
        var no = document.createElement('button');
        no.textContent = '取消';
        no.style.cssText = 'flex:1;height:40px;border:none;border-radius:8px;background:#e1e6ef;color:#444;'
                         + 'font-size:15px;cursor:pointer;';
        function close(){ if(overlay.parentNode) overlay.parentNode.removeChild(overlay); }
        yes.onclick = function(){ close(); if(onYes) onYes(); };
        no.onclick  = function(){ close(); };
        overlay.onclick = function(e){ if(e.target === overlay) close(); };
        btnWrap.appendChild(yes); btnWrap.appendChild(no);
        box.appendChild(p); box.appendChild(btnWrap);
        overlay.appendChild(box);
        document.body.appendChild(overlay);
        yes.focus();
    }

    window.toast = toast;
    window.confirmBox = confirmBox;
})();
