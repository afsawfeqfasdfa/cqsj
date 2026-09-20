#!/usr/bin/env bash
# ============================================================================
# quickstart.sh — 全新 Linux x86_64 主机一键部署「GM 网站 + 数据库」
#
# 用法:
#   A. 全自动(IP 与密码自动生成):
#        curl -fsSL https://raw.githubusercontent.com/afsawfeqfasdfa/cqsj/main/quickstart.sh | sudo bash
#   B. 全参数:  sudo bash quickstart.sh <本机IP> <密码> [web端口] [db端口]
#        sudo bash quickstart.sh 192.168.1.100 'YourStrongPass123' 1515 3306
#
# 做了什么:
#   1) 检测/安装 Docker + Compose v2(没有才装)
#   2) 克隆仓库到 /opt/cqsj(可用 INSTALL_DIR 环境变量改目录)
#   3) 把所有 <<XXX>> 占位符替换成你自己的 IP / 密码
#   4) 只启动 db + web 两个容器(游戏服二进制不在本仓库,默认不启)
#   5) 等待 MySQL 就绪并打印验收地址
#
# 已经跑过一套 cqsj 的机器(比如飞牛 NAS)也不会被顶掉:
#   检测到 cqsj_db / cqsj_web 已存在、或 1515/3306 已被占用时,
#   自动给容器名加后缀、端口顺延(1516/3307),两套并存互不干扰。
#
# 前置: Linux x86_64 + root。Windows/macOS 的 Docker Desktop 跑不了(见 DEPLOY.md 第 2 节)。
# ============================================================================
set -euo pipefail

REPO_URL="https://github.com/afsawfeqfasdfa/cqsj.git"
INSTALL_DIR="${INSTALL_DIR:-/opt/cqsj}"

# ---------- 0. 环境检查 ----------
[ "$(id -u)" = "0" ] || { echo "请用 root 运行: sudo bash $0"; exit 1; }
[ "$(uname -s)" = "Linux" ] || { echo "只支持 Linux(Windows/macOS Docker Desktop 不支持 host 网络)"; exit 1; }
ARCH="$(uname -m)"; [ "$ARCH" = "x86_64" ] || { echo "只支持 x86_64,当前: $ARCH"; exit 1; }

# ---------- 1. 确定 IP 与密码 ----------
IP="${1:-}"
if [ -z "$IP" ]; then
  IP="$(ip route get 1.1.1.1 2>/dev/null | awk '{for(i=1;i<=NF;i++) if($i=="src") print $(i+1); exit}')"
  [ -n "$IP" ] || IP="$(hostname -I 2>/dev/null | awk '{print $1}')"
fi
[ -n "$IP" ] || { echo "无法自动检测本机 IP,请手动传参: sudo bash $0 192.168.1.100"; exit 1; }

PW="${2:-}"
[ -n "$PW" ] || PW="Cqsj@$(head -c 6 /dev/urandom | od -An -tx1 | tr -d ' \n')"

port_free() { (echo > "/dev/tcp/127.0.0.1/$1") >/dev/null 2>&1 && return 1 || return 0; }

WEB_PORT="${3:-1515}"
DB_PORT="${4:-3306}"

echo "==> 本机 IP : $IP"
echo "==> 数据库/GM 密码 : $PW   (请记下来)"
echo "==> 安装目录 : $INSTALL_DIR"

# ---------- 2. 安装 Docker(没有才装) ----------
if ! command -v docker >/dev/null 2>&1; then
  echo "==> [1/5] 安装 Docker ..."
  if command -v apt-get >/dev/null 2>&1; then
    apt-get update -y
    apt-get install -y ca-certificates curl gnupg git
    install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
    sh /tmp/get-docker.sh
  elif command -v dnf >/dev/null 2>&1; then
    dnf -y install git curl
    curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
    sh /tmp/get-docker.sh
    systemctl enable --now docker
  elif command -v yum >/dev/null 2>&1; then
    yum -y install git curl
    curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
    sh /tmp/get-docker.sh
    systemctl enable --now docker
  else
    echo "无法识别的包管理器,请手动安装 Docker 后重试"; exit 1
  fi
else
  echo "==> [1/5] Docker 已安装,跳过"
fi
docker version >/dev/null 2>&1 || { echo "Docker 未正常运行,请检查服务"; exit 1; }
docker compose version >/dev/null 2>&1 || { echo "缺少 Docker Compose v2 插件"; exit 1; }

# ---------- 3. 克隆仓库 ----------
echo "==> [2/5] 获取代码 ..."
if [ ! -d "$INSTALL_DIR/.git" ]; then
  git clone --depth 1 "$REPO_URL" "$INSTALL_DIR"
else
  git -C "$INSTALL_DIR" pull --ff-only || true
fi
cd "$INSTALL_DIR"

# ---------- 4. 替换占位符 ----------
echo "==> [3/5] 替换占位符 ..."
# 按占位符名字决定填什么: 带 IP/DOMAIN 的填本机 IP, SSH_USER/PORT 填默认值, 其余填密码
ph_value() {
  case "$1" in
    *IP*|*DOMAIN*) printf '%s' "$IP" ;;
    SSH_USER)      printf 'root' ;;
    SSH_PORT)      printf '22' ;;
    *)             printf '%s' "$PW" ;;
  esac
}

if command -v perl >/dev/null 2>&1; then
  PH_LIST="$(grep -rhoE '<<[A-Za-z0-9_]+>>' --include='*.yml' --include='*.php' --include='*.lua' \
             --include='*.xml' --include='*.sh' --include='*.sql' --include='*.py' --include='*.conf' \
             --include='*.json' . 2>/dev/null | sort -u)"
  FILES="$(grep -rlE '<<[A-Za-z0-9_]+>>' --include='*.yml' --include='*.php' --include='*.lua' \
           --include='*.xml' --include='*.sh' --include='*.sql' --include='*.py' --include='*.conf' \
           --include='*.json' . 2>/dev/null)"
  for ph in $PH_LIST; do
    v="$(ph_value "${ph#<<}" )"
    v="${v%>>}"
    PH="$ph" VAL="$v" perl -pi -e 's/\Q$ENV{PH}\E/$ENV{VAL}/g' $FILES
  done
else
  # 无 perl 时退回 sed(密码里别带 & | 字符)
  FILES="$(grep -rl '<<' --include='*.yml' --include='*.php' --include='*.lua' --include='*.xml' \
           --include='*.sh' --include='*.sql' --include='*.py' --include='*.conf' --include='*.json' .)"
  sed -i -e "s|<<LAN_IP>>|$IP|g" -e "s|<<GAME_PUBLIC_IP>>|$IP|g" -e "s|<<GAME_DOMAIN>>|$IP|g" \
      -e "s|<<CONTACT_DOMAIN>>|$IP|g" -e "s|<<SMS_GATEWAY_IP>>|$IP|g" \
      -e "s|<<DB_OR_GM_PASSWORD>>|$PW|g" -e "s|<<GAME_DB_PASSWORD>>|$PW|g" \
      -e "s|<<DIR_DB_PASSWORD>>|$PW|g" -e "s|<<LOG_DB_PASSWORD>>|$PW|g" \
      -e "s|<<GM_ACCOUNT_PASSWORD>>|$PW|g" -e "s|<<LEGACY_SSH_PASSWORD>>|$PW|g" \
      -e "s|<<GM_KEY>>|$PW|g" -e "s|<<REG_PAGE_KEY>>|$PW|g" -e "s|<<WZSPAY_TOKEN>>|$PW|g" \
      -e "s|<<WZSPAY_KEY>>|$PW|g" -e "s|<<MSDK_APPKEY>>|$PW|g" -e "s|<<SSH_PASSWORD>>|$PW|g" \
      -e "s|<<SSH_USER>>|root|g" -e "s|<<SSH_PORT>>|22|g" $FILES
fi

LEFT="$(grep -rhoE '<<[A-Za-z0-9_]+>>' --include='*.yml' --include='*.php' --include='*.lua' \
        --include='*.xml' --include='*.sh' --include='*.sql' --include='*.py' . 2>/dev/null | sort -u | tr '\n' ' ')"
echo "    剩余未替换占位符: ${LEFT:-无}"

# ---------- 5. 避开已存在的 cqsj(容器名/端口冲突时自动顺延) ----------
SUFFIX=""
if docker ps -a --format '{{.Names}}' 2>/dev/null | grep -qx 'cqsj_db'; then SUFFIX="_oss"; fi
while ! port_free "$WEB_PORT"; do WEB_PORT=$((WEB_PORT+1)); done
while ! port_free "$DB_PORT";  do DB_PORT=$((DB_PORT+1));  done

if [ -n "$SUFFIX" ] || [ "$WEB_PORT" != 1515 ] || [ "$DB_PORT" != 3306 ]; then
  echo "==> 检测到已有 cqsj / 端口被占用 -> 容器名后缀 '$SUFFIX', web 端口 $WEB_PORT, db 端口 $DB_PORT"
  sed -i -e "s/^    container_name: cqsj_db$/    container_name: cqsj_db$SUFFIX/" \
      -e "s/^    container_name: cqsj_web$/    container_name: cqsj_web$SUFFIX/" \
      -e "s|\"3306:3306\"|\"$DB_PORT:3306\"|" \
      -e "s|\"1515:1515\"|\"$WEB_PORT:1515\"|" docker-compose.yml
fi

# ---------- 6. 启动 db + web ----------
echo "==> [4/5] 启动 db + web (首次构建镜像约 3-8 分钟) ..."
docker compose up -d db web

# ---------- 7. 等待并验收 ----------
echo "==> [5/5] 等待服务就绪 ..."
DBCT="cqsj_db$SUFFIX"
for i in $(seq 1 60); do
  if docker exec "$DBCT" mysql -uroot -p"$PW" -e "show databases;" >/dev/null 2>&1; then
    echo "    MySQL 就绪(第 ${i} 次探测)"; break
  fi
  sleep 3
done

echo ""
echo "=========== 部署完成 ==========="
docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'
echo ""
echo "GM 后台        : http://$IP:$WEB_PORT/gm/gm.php"
echo "版本接口(自检) : curl http://$IP:$WEB_PORT/games__/version/version.php"
echo "数据库         : docker exec $DBCT mysql -uroot -p'$PW' -e 'show databases;'"
echo "数据库密码     : $PW"
echo ""
echo "日志: docker logs -f cqsj_web$SUFFIX    |    停止: cd $INSTALL_DIR && docker compose down"
echo "完整文档见 $INSTALL_DIR/DEPLOY.md"
