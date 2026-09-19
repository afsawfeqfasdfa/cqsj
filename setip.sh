#!/bin/bash
# =============================================================================
#  CQSJ 一键改 IP / 域名
#  修改对外地址并自动重启服务, 不用重建镜像(秒级生效)
#
#  用法:
#    sudo bash setip.sh <IP或域名>    改成新地址并重启
#    sudo bash setip.sh status        查看当前各处配置
#    sudo bash setip.sh               交互模式
#
#  原理(为什么这样改就能生效):
#    - web  : 容器启动时 /start.sh 会读 games__/config.php 的 CFG_SERVER_IP
#             然后 sed 进 version.php。所以只要换掉容器里的 config.php 即可。
#    - game : entrypoint 会把两个 lua 的 connectAddr / loginAddr 都钉成
#             $GAME_HOST_IP。所以只要改 compose 的环境变量, 重建容器即可。
#             (game 用 network_mode: host, 因此 loginAddr 可以填真实 IP)
#    - 两者都顺带更新宿主源 build/, 保证以后重建镜像不会回退到旧 IP。
#    - 不产生任何备份文件。
#
#  改这 5 处:
#    1) version.php        客户端第一步拿的 ip
#    2) config.php         CFG_SERVER_IP (单一信息源)
#    3) gateway_cfg.lua    connectAddr (回传给客户端的网关地址) —— 已改为固定公网域名, 本工具不再动它
#    4) gateway_cfg.lua    loginAddr   (网关监听地址, 内网)
#    5) session_cfg.lua    loginAddr   (SessionServer 监听地址, 内网)
# =============================================================================

BASE=/vol1/docker/cqsj
COMPOSE="$BASE/docker-compose.yml"
VP="$BASE/build/web/wwwroot_game/games__/version/version.php"
CFG="$BASE/build/web/wwwroot_game/games__/config.php"
GW="$BASE/build/game/sbin/resource/config/gateway_cfg.lua"
SC="$BASE/build/game/sbin/resource/config/session_cfg.lua"
PROJECT=cqsj

SUDO=sudo
[ "$(id -u)" = "0" ] && SUDO=""

# 保证中文正常输出
export LANG=C.UTF-8 2>/dev/null || export LANG=en_US.UTF-8 2>/dev/null || true

C_B='\033[36m'; C_G='\033[32m'; C_Y='\033[33m'; C_R='\033[31m'; C_0='\033[0m'
ok()   { echo -e "${C_G}[OK]${C_0} $1"; }
info() { echo -e "${C_B}[..]${C_0} $1"; }
warn() { echo -e "${C_Y}[!!]${C_0} $1"; }
err()  { echo -e "${C_R}[XX]${C_0} $1"; exit 1; }

# ---------------------------------------------------------------- 当前状态
cur_compose() { grep -oE 'GAME_HOST_IP: *"[^"]*"' "$COMPOSE" 2>/dev/null | grep -oE '"[^"]*"' | tr -d '"'; }
cur_cfg()     { grep -oE "define\('CFG_SERVER_IP', *'[^']*'" "$CFG" 2>/dev/null | sed -E "s/.*'([^']*)'/\1/"; }
cur_vp()      { grep -oE '"ip":"[^"]*"' "$VP" 2>/dev/null | head -1 | sed -E 's/.*:"([^"]*)"/\1/'; }
# 注意: 必须跳过注释行(-- 开头), 否则会读到历史遗留的旧地址
cur_gw()      { grep -vE '^[[:space:]]*--' "$GW" 2>/dev/null | grep -oE "connectAddr *= *'[^':]*:" | head -1 | sed -E "s/.*'([^':]*):/\1/"; }
cur_gw_login(){ grep -vE '^[[:space:]]*--' "$GW" 2>/dev/null | grep -oE "loginAddr *= *'[^']*'" | head -1 | sed -E "s/.*'([^']*)'/\1/"; }
cur_sc_login(){ grep -vE '^[[:space:]]*--' "$SC" 2>/dev/null | grep -oE "loginAddr *= *'[^']*'" | head -1 | sed -E "s/.*'([^']*)'/\1/"; }

show_status() {
    echo -e "${C_B}===== CQSJ 当前对外地址 =====${C_0}"
    printf "  %-22s %s\n" "compose GAME_HOST_IP" "$(cur_compose)"
    printf "  %-22s %s\n" "config.php SERVER_IP" "$(cur_cfg)"
    printf "  %-22s %s\n" "version.php ip"      "$(cur_vp)"
    printf "  %-22s %s\n" "gateway connectAddr" "$(cur_gw)"
    printf "  %-22s %s\n" "gateway loginAddr"   "$(cur_gw_login)"
    printf "  %-22s %s\n" "session loginAddr"   "$(cur_sc_login)"
    echo
    echo -e "${C_B}===== 游戏服实际监听 (host 网络) =====${C_0}"
    ss -ltn 2>/dev/null | grep -E ':(20013|20023|20033|20043|20020|20030|20040|20050|3000|3210|3220) ' | awk '{print "  " $4}'
    echo
    echo -e "${C_B}===== 容器状态 =====${C_0}"
    $SUDO docker ps -a --format '  {{.Names}}\t{{.Status}}' 2>/dev/null | grep cqsj
    echo
    echo -e "${C_B}===== 线上实际生效 (version.php) =====${C_0}"
    curl -s -X POST http://127.0.0.1:1515/games__/version/version.php \
         -d 'key=YZ4UO6p4MnV4CnSl&username=111&select=jindian' --max-time 10 2>/dev/null
    echo; echo
}

# ---------------------------------------------------------------- 执行修改
do_set() {
    NEW="$1"
    [ -z "$NEW" ] && err "地址不能为空"
    # 允许 IPv4 或域名
    if ! echo "$NEW" | grep -qE '^([0-9]{1,3}\.){3}[0-9]{1,3}$|^[a-zA-Z0-9][a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'; then
        err "地址格式不对: $NEW  (需要 IPv4 或域名, 例如 <<LAN_IP>> / server.<<CONTACT_DOMAIN>>)"
    fi

    OLD="$(cur_compose)"
    echo -e "${C_B}===== CQSJ 改地址: ${C_Y}$OLD${C_B} -> ${C_G}$NEW${C_0} ====="
    [ "$OLD" = "$NEW" ] && warn "新旧地址相同, 仍会执行一次同步(可用于修复配置漂移)"

    # 用户要求: 不做任何备份, 直接改
    info "已跳过备份(按设置不保留备份文件)"

    # --- 1) 宿主源: version.php ---
    [ -f "$VP" ] || err "找不到 $VP"
    sed -i -E "s/(\"ip\":\")[^\"]*(\")/\1$NEW\2/g" "$VP"
    ok "version.php ip -> $NEW"

    # --- 2) 宿主源: config.php (单一信息源) ---
    if [ -f "$CFG" ]; then
        if grep -q "CFG_SERVER_IP" "$CFG"; then
            sed -i -E "s/define\('CFG_SERVER_IP', *'[^']*'\)/define('CFG_SERVER_IP', '$NEW')/" "$CFG"
        else
            echo "define('CFG_SERVER_IP', '$NEW');" >> "$CFG"
        fi
        ok "config.php SERVER_IP -> $NEW"
    else
        warn "config.php 不存在, 已重建"
        cat > "$CFG" <<EOF
<?php
define('CFG_DB_HOST', 'db');
define('CFG_DB_USER', 'root');
define('CFG_DB_PASS', '<<DB_OR_GM_PASSWORD>>');
define('CFG_DB_NAME', 'longwen');
define('CFG_SERVER_IP', '$NEW');
define('CFG_GW_800', '20013');
define('CFG_GW_801', '20023');
define('CFG_GW_802', '20033');
define('CFG_GW_803', '20043');
define('CFG_PAY_URL', 'http://127.0.0.1/');
define('CFG_DEBUG', '0');
EOF
    fi

    # --- 3) 宿主源: gateway_cfg.lua connectAddr ---
    #     外网访问时 connectAddr 必须是公网域名(<<GAME_DOMAIN>>), 在 gateway_cfg.lua 里写死,
    #     这里【不再改写】它 —— 否则跑一次改 IP 会把域名覆盖成内网 IP, 外网客户端就断了。
    #     (loginAddr 仍由下面步骤改成内网 IP 用于网关监听绑定)
    info "gateway connectAddr 保持 gateway_cfg.lua 原值(公网域名), 跳过"

    # --- 3b) 宿主源: gateway_cfg.lua / session_cfg.lua 的 loginAddr (监听地址) ---
    sed -i -E "s/(loginAddr[[:space:]]*=[[:space:]]*)'[^']*'/\1'$NEW'/g" "$GW"
    ok "gateway loginAddr   -> $NEW"
    if [ -f "$SC" ]; then
        sed -i -E "s/(loginAddr[[:space:]]*=[[:space:]]*)'[^']*'/\1'$NEW'/g" "$SC"
        ok "session loginAddr   -> $NEW"
    else
        warn "找不到 $SC, 跳过 session loginAddr"
    fi

    # --- 4) compose 环境变量 ---
    [ -f "$COMPOSE" ] || err "找不到 $COMPOSE"
    if grep -q "GAME_HOST_IP" "$COMPOSE"; then
        sed -i -E "s/GAME_HOST_IP: *\"[^\"]*\"/GAME_HOST_IP: \"$NEW\"/" "$COMPOSE"
    else
        warn "compose 里没有 GAME_HOST_IP, 请手动加到 game 服务 environment 下"
    fi
    ok "compose GAME_HOST_IP -> $NEW"

    # --- 5) 热同步进运行中的容器(不重建镜像) ---
    if $SUDO docker ps --format '{{.Names}}' 2>/dev/null | grep -qx cqsj_web; then
        $SUDO docker cp "$CFG" cqsj_web:/www/wwwroot/game/games__/config.php      && ok "已同步 config.php -> cqsj_web"
        $SUDO docker cp "$VP"  cqsj_web:/www/wwwroot/game/games__/version/version.php && ok "已同步 version.php -> cqsj_web"
    else
        warn "cqsj_web 未运行, 跳过 docker cp"
    fi

    # --- 6) 重建容器让环境变量生效 (game 的 entrypoint 会写 connectAddr) ---
    info "重建 web / game 容器(用现有镜像, 不重新 build)..."
    $SUDO docker compose -p $PROJECT -f "$COMPOSE" up -d --force-recreate web game 2>&1 | tail -5

    info "等待服务启动..."
    sleep 25

    # --- 7) 验证 ---
    echo
    echo -e "${C_B}===== 验证 =====${C_0}"
    $SUDO docker ps -a --format '  {{.Names}}\t{{.Status}}' 2>/dev/null | grep cqsj
    echo
    echo -n "  version.php : "
    RES=$(curl -s -X POST http://127.0.0.1:1515/games__/version/version.php \
          -d 'key=YZ4UO6p4MnV4CnSl&username=111&select=jindian' --max-time 15 2>/dev/null)
    if [ -n "$RES" ]; then
        echo "$RES"
        echo "$RES" | grep -q "\"ip\":\"$NEW\"" && ok "地址已生效: $NEW" \
                                                || warn "返回的 ip 不是 $NEW, 请检查上面输出"
    else
        err "version.php 无响应, 服务可能未起来"
    fi

    echo
    echo -ne "  ${C_B}游戏服进程${C_0}: "
    $SUDO docker exec cqsj_game ps aux 2>/dev/null | grep -oE '(SessionServer_d|GameGateway_d|WorldFrame_d|NameServer_d) ' | sort -u | tr '\n' ' '
    echo
    echo
    ok "完成。客户端请把 netconfig.lua 的 local_ip / bbs_url / cdnHost 指向 $NEW:1515"
}

# ---------------------------------------------------------------- 入口
case "$1" in
    status|st|-s)
        show_status
        ;;
    ""|-h|--help|help)
        if [ -z "$1" ]; then
            echo -e "${C_B}===== CQSJ 改 IP 工具 =====${C_0}"
            show_status
            echo -n -e "请输入新的对外地址 (IP 或域名, 直接回车退出): "
            read -r ANS
            [ -z "$ANS" ] && { echo "已取消"; exit 0; }
            echo
            do_set "$ANS"
        else
            sed -n '2,20p' "$0"
        fi
        ;;
    *)
        do_set "$1"
        ;;
esac
