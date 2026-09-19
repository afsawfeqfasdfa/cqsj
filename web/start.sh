#!/bin/sh
# web 容器启动: php-fpm 后台 + nginx 前台(作为容器主进程)
set -e

mkdir -p /tmp /www/server/nginx/logs
chown www /tmp 2>/dev/null || true

# SFTP 上传会丢失可执行位,启动时补回(php/nginx 运行时来自 build/ 快照)
chmod +x /www/server/php/56/sbin/php-fpm \
        /www/server/php/56/bin/php \
        /www/server/nginx/sbin/nginx 2>/dev/null || true

# ============================================================================
#  全站连接信息同步 (单一信息源: games__/config.php)
#  改 config.php 一处, 重启即全站生效。已正确的就是 no-op, 不会破坏任何文件。
# ============================================================================
CFG=/www/wwwroot/game/games__/config.php
WEB_ROOT=/www/wwwroot/game

cfg_get() {
    grep -E "define\('$1'" "$CFG" 2>/dev/null | head -1 \
        | sed -E "s/.*define\('$1',[[:space:]]*'([^']*)'.*/\1/"
}

if [ -f "$CFG" ]; then
    DB_HOST=$(cfg_get CFG_DB_HOST)
    SERVER_IP=$(cfg_get CFG_SERVER_IP)
    GW800=$(cfg_get CFG_GW_800)
    GW801=$(cfg_get CFG_GW_801)
    GW802=$(cfg_get CFG_GW_802)
    GW803=$(cfg_get CFG_GW_803)
    echo "[start.sh] sync config: DB_HOST=$DB_HOST SERVER_IP=$SERVER_IP GW=$GW800/$GW801/$GW802/$GW803"

    # 1) 数据库主机: array('127.0.0.1','root' -> array('db','root'
    find "$WEB_ROOT" -name '*.php' -type f -exec sed -i \
        -e "s/array('127\.0\.0\.1','root'/array('$DB_HOST','root'/g" {} + 2>/dev/null || true

    # 2) 服务器对外 IP: 占位符 -> config.php 里配置的 IP
    [ -n "$SERVER_IP" ] && find "$WEB_ROOT" -name '*.php' -type f -exec sed -i \
        -e "s/<<LAN_IP>>/$SERVER_IP/g" {} + 2>/dev/null || true

    # 3) 网关端口映射
    [ -n "$GW800" ] && find "$WEB_ROOT" -name '*.php' -type f -exec sed -i \
        -e "s/20013/$GW800/g" -e "s/20023/$GW801/g" -e "s/20033/$GW802/g" -e "s/20043/$GW803/g" {} + 2>/dev/null || true

    # 4) GM 站 $db_host 写法
    find "$WEB_ROOT" -name '*.php' -type f -exec sed -i \
        -e "s/\\\$db_host *= *'127\.0\.0\.1'/\\\$db_host = '$DB_HOST'/g" {} + 2>/dev/null || true

    echo "[start.sh] sync done."
else
    echo "[start.sh] WARNING: $CFG not found, 跳过连接信息同步"
fi

# ============================================================================
#  强制钉死 version.php
#   - version 必须是 0.0.1 (服务器上只有 md5files/0.0.1.pack)
#   - ip 必须是当前宿主机 IP (客户端第 1 步入口)
#   - port 必须是 SessionServer loginPort 20013 (不是网关端口!)
# ============================================================================
VP=/www/wwwroot/game/games__/version/version.php
TARGET_IP=$(cfg_get CFG_SERVER_IP)
[ -z "$TARGET_IP" ] && TARGET_IP="<<LAN_IP>>"

if [ -f "$VP" ]; then
    sed -i "s/\\\$version = '[^']*'/\\\$version = '0.0.1'/" "$VP"
    echo "[start.sh] version pinned to 0.0.1"

    sed -i -E "s/(\"ip\":\")[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+(\")/\1$TARGET_IP\2/g" "$VP"
    # 占位符 / 域名形式也一并钉成 CFG_SERVER_IP(只动 "id":800 这个对象, 不影响其它区)
    sed -i -E "s/(\"id\":800,[^}]*\"ip\":\")[^\"]*(\")/\1$TARGET_IP\2/g" "$VP"
    echo "[start.sh] version.php ip pinned to $TARGET_IP"

    # 注意 [^}]*: 只在 "id":800 的同一个 {} 对象内找 port, 避免贪婪匹配跨对象改掉 803 的端口。
    # GNU sed 的 \1 后直接跟数字有歧义, 用两步替换。
    # 端口统一取 config.php 的 CFG_GW_800(默认 20013)。
    # 若你的 800 区走云端口映射(如外部 38913 -> 内部 20013), 把 config.php 的 CFG_GW_800 改成 38913 即可。
    [ -z "$GW800" ] && GW800="20013"
    sed -i -E 's/("id":800,[^}]*"port":)[0-9]+/\1PORT800PIN/' "$VP"
    sed -i "s/PORT800PIN/$GW800/" "$VP"
    echo "[start.sh] 800-area port pinned to $GW800"

    echo "[start.sh] version.php now:"
    grep -n "servers" "$VP" | head -3
fi

# 启动 PHP 5.6-fpm(后台守护)
/www/server/php/56/sbin/php-fpm -D

# 启动 Nginx(前台,保证容器存活)
exec /www/server/nginx/sbin/nginx -g 'daemon off;'
