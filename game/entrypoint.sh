#!/bin/sh
# CQSJ 游戏服容器 entrypoint
# 作用: 把单机部署时代的配置适配到 Docker 容器环境
#  1) MySQL 地址 127.0.0.1 -> $DB_HOST (host 网络下就是 127.0.0.1, 走宿主 3306)
#  2) 监听地址 loginAddr -> $GAME_HOST_IP (真实 LAN IP; 需 network_mode: host 才能 bind)
#  3) 回传给客户端的网关地址 connectAddr -> 不再钉, 用 gateway_cfg.lua 里写死的域名(外网访问需要)
#  4) 钉死网关 GateID 为 3008000 (start 0800 0)
set -x

ulimit -s 10240 2>/dev/null || true

CFG=/data/sbin/resource/config
DB_HOST_ENV="${DB_HOST:-127.0.0.1}"
GAME_HOST_IP_ENV="${GAME_HOST_IP:-<<LAN_IP>>}"

echo "==> [entrypoint] DB_HOST=$DB_HOST_ENV GAME_HOST_IP=$GAME_HOST_IP_ENV"

# --- 1) MySQL 地址: 只改 DB 相关 xml, 绝不动进程互联地址(world_cfg 等) ---
for f in DBConfig.xml NameDBConfig.xml LogConfig.xml; do
  if [ -f "$CFG/$f" ]; then
    sed -i "s/127\.0\.0\.1/$DB_HOST_ENV/g" "$CFG/$f"
    echo "  -> $f : 127.0.0.1 => $DB_HOST_ENV"
  fi
done

# --- 2) 监听地址: 一律钉成对外真实地址 GAME_HOST_IP ---
#     注意: 这要求容器用 network_mode: host, 否则容器内没有该网卡会 bind 失败。
#     gateway_cfg.lua / session_cfg.lua 都会被处理。
for f in "$CFG"/gateway_cfg.lua "$CFG"/session_cfg.lua; do
  [ -f "$f" ] || continue
  sed -i -E "s/(loginAddr[[:space:]]*=[[:space:]]*)'[^']*'/\1'$GAME_HOST_IP_ENV'/g" "$f"
done
echo "  -> loginAddr pinned to $GAME_HOST_IP_ENV"

# --- 3) 回传给客户端的网关地址(connectAddr) ---
#     外网访问时 connectAddr 必须是公网域名(如 <<GAME_DOMAIN>>),
#     不能再钉成内网 GAME_HOST_IP, 否则外网客户端连不到网关。
#     因此这里【不再改写】connectAddr, 直接用 gateway_cfg.lua 里写死的值。
#     (loginAddr 仍由上面的步骤钉成 GAME_HOST_IP 用于内网监听绑定)
echo "  -> connectAddr 保持 gateway_cfg.lua 原值(公网域名), 不再钉内网 IP"

# --- 4) 网关 GateID ---
#     start.sh 已通过 bind mount 挂载并写死各区 GateID 尾号 0,
#     不能在这里对挂载的 start.sh 做 sed -i (单文件挂载 rename 会报 Device or resource busy)。

echo "--- gateway_cfg.lua ---"
grep -n "connectAddr\|loginAddr\|loginPort" "$CFG/gateway_cfg.lua" | grep -v "^\s*--" | head -10
echo "--- session_cfg.lua ---"
grep -n "loginAddr\|loginPort" "$CFG/session_cfg.lua" | head -8
echo "--- DBConfig.xml ---"
grep -o "127\.0\.0\.1\|db" "$CFG/DBConfig.xml" 2>/dev/null | sort -u | head -5

chmod +x /data/sbin/linux/*_d 2>/dev/null || true
chmod +x /data/sbin/linux/*.sh 2>/dev/null || true
export LD_LIBRARY_PATH=/data/sbin/linux:/usr/lib64/mysql:$LD_LIBRARY_PATH
ldconfig 2>/dev/null || true

cd /data/sbin/linux
bash start.sh
exec tail -F /data/sbin/linux/nohup.out 2>/dev/null || sleep infinity
