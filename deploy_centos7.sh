#!/usr/bin/env bash
# ============================================================================
# deploy_centos7.sh — 传奇世界(传世/CQSJ)一键部署脚本, 目标机: 裸 CentOS 7 / RHEL 7
#
# 两种模式:
#   --bare    裸机还原(推荐, 复刻原 194 环境, 不用 Docker)
#               nginx + PHP5.6(ZendGuardLoader) + MySQL + 游戏服, 全部直接跑在宿主
#   --docker  Docker 化: 装 Docker 后跑 docker compose 三服务(db/web/game)
#
# 用法:
#   sudo bash deploy_centos7.sh --bare   192.168.1.100 'MyPass123'
#   sudo bash deploy_centos7.sh --docker 192.168.1.100 'MyPass123'
#
# 素材(从原机备份出来的 tar 包)来源, 二选一:
#   --payload <目录>   本机/挂载目录, 里面有 194_*.tgz (默认: 脚本所在目录的 payload/)
#   --src root@1.2.3.4 从源机 SSH 现拉(需能免密登录或手动输密码)
#
# 素材包清单(由 backup194 系列脚本产出, 文件名可用环境变量覆盖):
#   194_sbin.tgz        游戏服程序 + 资源(/data/sbin)
#   194_wwwroot_game.tgz GM 站 + 官网代码(/www/wwwroot/game)
#   194_php56.tgz       PHP 5.6 运行时(含 php-fpm)
#   194_nginx.tgz       nginx(宝塔编译版二进制)
#   194_zend.tgz        ZendGuardLoader.so(GM 站代码是 Zend 加密的, 没它跑不了)
#   194_libmysql.tgz    libmysqlclient.so.18(NameServer 依赖)
#   194_db.sql.gz       数据库 longwen + longwen_name
#
# 前置: CentOS 7.x / x86_64 / root / 能 yum
# ============================================================================
set -euo pipefail

# ---------- 默认值 ----------
MODE="bare"
IP=""
PW=""
PAYLOAD=""
SRC=""

SBIN_PKG="${SBIN_PKG:-194_sbin.tgz}"
WEB_PKG="${WEB_PKG:-194_wwwroot_game.tgz}"
PHP_PKG="${PHP_PKG:-194_php56.tgz}"
NGINX_PKG="${NGINX_PKG:-194_nginx.tgz}"
ZEND_PKG="${ZEND_PKG:-194_zend.tgz}"
LIBMYSQL_PKG="${LIBMYSQL_PKG:-194_libmysql.tgz}"
DB_PKG="${DB_PKG:-194_db.sql.gz}"

SRC_IP_OLD="${SRC_IP_OLD:-192.168.50.194}"   # 备份包里写死的源机 IP, 替换成目标机 IP
DB_USER="${DB_USER:-root}"
OLD_DB_PW="${OLD_DB_PW:-123456}"             # 备份包里 DBConfig.xml 写死的库密码

NGINX_ROOT="/www/server/nginx"
PHP_ROOT="/www/server/php/56"
WEB_ROOT="/www/wwwroot/game"
GAME_ROOT="/data/sbin"
SRC_IP_FILE="${SRC_IP_FILE:-$GAME_ROOT/linux/.src_ip}"   # 记录包里原来的 IP

# ---------- 参数解析 ----------
while [ $# -gt 0 ]; do
  case "$1" in
    --bare)   MODE="bare";   shift ;;
    --docker) MODE="docker"; shift ;;
    --payload) PAYLOAD="$2"; shift 2 ;;
    --src)     SRC="$2";     shift 2 ;;
    -h|--help) sed -n '2,40p' "$0"; exit 0 ;;
    *)
      if [ -z "$IP" ]; then IP="$1"
      elif [ -z "$PW" ]; then PW="$1"
      else echo "未知参数: $1"; exit 1
      fi
      shift ;;
  esac
done

say()  { echo; echo "==> $*"; }
ok()   { echo "    [OK] $*"; }
warn() { echo "    [!] $*"; }
die()  { echo "    [X] $*"; exit 1; }

# ---------- 0. 环境与参数 ----------
[ "$(id -u)" = 0 ] || die "请用 root 运行(sudo bash $0 ...)"
[ -f /etc/redhat-release ] || die "本脚本只支持 CentOS 7 / RHEL 7"
grep -qE "release 7" /etc/redhat-release || warn "系统不是 CentOS 7, 继续但可能不兼容: $(cat /etc/redhat-release)"

[ -n "$IP" ] || IP="$(ip route get 1.1.1.1 2>/dev/null | awk '{for(i=1;i<=NF;i++) if($i=="src") print $(i+1)}' | head -1)"
[ -n "$IP" ] || die "拿不到本机 IP, 请手动传: bash $0 --bare 192.168.1.100 '密码'"
[ -n "$PW" ] || PW="Cqsj@$(head -c 4 /dev/urandom | od -An -tx1 | tr -d ' \n')"

if [ -z "$PAYLOAD" ]; then
  PAYLOAD="$(cd "$(dirname "$0")" && pwd)/payload"
fi
mkdir -p "$PAYLOAD"

say "部署参数"
echo "    模式     : $MODE"
echo "    本机 IP  : $IP"
echo "    数据库密码: $PW"
echo "    素材目录 : $PAYLOAD"
echo "    源机 IP  : ${SRC:-$SRC_IP_OLD}(配置里的这个值会被替换成 $IP)"

# ---------- 素材获取 ----------
# 有包就直接用; 没有就从源机 SSH 拉; 都没有就报错
have() { [ -f "$PAYLOAD/$1" ]; }

fetch() {   # fetch <包名> <源机上的路径> <源机tar的-C目录>
  local pkg="$1" rpath="$2" rdir="$3"
  if have "$pkg"; then ok "$pkg 已存在, 跳过"; return 0; fi
  if [ -n "$SRC" ]; then
    echo "    从 $SRC 拉取 $rpath ..."
    ssh -o StrictHostKeyChecking=no "$SRC" "tar czf - -C $rdir ${rpath##*/}" > "$PAYLOAD/$pkg" \
      || die "拉取 $rpath 失败"
    ok "$pkg 拉取完成($(du -h "$PAYLOAD/$pkg" | cut -f1))"
  else
    die "缺少 $PAYLOAD/$pkg, 也没有指定 --src 从源机拉取"
  fi
}

# ---------- 通用: 替换 IP / 密码(perl \Q\E, 密码带 & | 也安全) ----------
replace_in() {   # replace_in <文件> <旧值> <新值>
  local f="$1" o="$2" n="$3"
  [ -f "$f" ] || return 0
  OLD="$o" NEW="$n" perl -pi -e 's/\Q$ENV{OLD}\E/$ENV{NEW}/g' "$f"
}

# ============================================================================
#  模式 A: 裸机还原
# ============================================================================
deploy_bare() {
  say "[1/8] 系统准备"
  setenforce 0 2>/dev/null || true
  sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config 2>/dev/null || true
  ok "SELinux 已关闭"

  if command -v firewall-cmd >/dev/null 2>&1 && systemctl is-active --quiet firewalld; then
    for p in 1515/tcp 3306/tcp 20010-20059/tcp 2200-2230/tcp 2300-2330/tcp 2500-2530/tcp 3210-3220/tcp; do
      firewall-cmd --permanent --add-port="$p" >/dev/null 2>&1 || true
    done
    firewall-cmd --reload >/dev/null 2>&1 || true
    ok "防火墙已放行游戏/网站端口"
  else
    systemctl stop firewalld 2>/dev/null || true
    systemctl disable firewalld 2>/dev/null || true
    ok "firewalld 已停止"
  fi

  id -u www >/dev/null 2>&1 || useradd -M -s /sbin/nologin www
  mkdir -p /www/wwwlogs /www/server /www/wwwroot
  ok "www 用户与目录就绪"

  echo "    安装运行依赖(约 1-3 分钟) ..."
  yum install -y -q epel-release >/dev/null 2>&1 || true
  yum install -y -q libxml2 libxml2-devel openssl openssl-libs pcre pcre-devel \
      zlib zlib-devel libcurl libpng libjpeg freetype libmcrypt glibc libstdc++ \
      libgcc oniguruma net-tools lsof unzip >/dev/null 2>&1 || true
  ok "依赖安装完成"

  say "[2/8] 取素材"
  fetch "$SBIN_PKG"   /data/sbin          /
  fetch "$WEB_PKG"    /www/wwwroot/game   /www/wwwroot
  fetch "$PHP_PKG"    /www/server/php/56  /www/server/php
  fetch "$NGINX_PKG"  /www/server/nginx   /www/server
  fetch "$ZEND_PKG"   /usr/local/zend     /usr/local
  fetch "$LIBMYSQL_PKG" /usr/lib64/mysql  /usr/lib64
  fetch "$DB_PKG"     "bk_db.sql.gz"      /root

  say "[3/8] 装 PHP 5.6 + ZendGuardLoader"
  mkdir -p /www/server/php /usr/local/zend
  tar xzf "$PAYLOAD/$PHP_PKG"  -C /www/server/php
  tar xzf "$PAYLOAD/$ZEND_PKG" -C /usr/local
  chmod +x /usr/local/zend/php56/ZendGuardLoader.so 2>/dev/null || true
  # php.ini / php-cli.ini 里已带 [Zend ZendGuard Loader] 段, 路径与本脚本一致, 无需改
  ln -sf "$PHP_ROOT/bin/php" /usr/bin/php
  "$PHP_ROOT/bin/php" -v 2>&1 | grep -q "Zend Guard Loader" \
    && ok "ZendGuardLoader 已加载" \
    || warn "ZendGuardLoader 未生效! GM 站打开会是空白/源码泄露, 检查 $PHP_ROOT/etc/php.ini 末尾"
  "$PHP_ROOT/bin/php" -v 2>&1 | head -1

  cat > /etc/systemd/system/php56-fpm.service <<'EOF'
[Unit]
Description=PHP 5.6 FPM (CQSJ)
After=network.target

[Service]
Type=forking
ExecStart=/www/server/php/56/sbin/php-fpm --fpm-config /www/server/php/56/etc/php-fpm.conf
ExecReload=/bin/kill -USR2 $MAINPID
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
  systemctl daemon-reload
  systemctl enable php56-fpm >/dev/null 2>&1
  systemctl restart php56-fpm
  sleep 2
  [ -S /tmp/php-cgi-56.sock ] && ok "php-fpm 已就绪 (/tmp/php-cgi-56.sock)" \
                              || warn "php-fpm socket 未生成, 看 journalctl -u php56-fpm"

  say "[4/8] 装 nginx(1515)"
  mkdir -p /www/server
  tar xzf "$PAYLOAD/$NGINX_PKG" -C /www/server
  mkdir -p "$NGINX_ROOT/logs" /www/wwwlogs
  # 原机是宝塔版 nginx, 其 nginx.conf 依赖 /www/server/panel/... 的 include,
  # 裸机上没有那个目录会起不来 —— 所以这里写一份干净的配置, 不走宝塔那套。
  cat > "$NGINX_ROOT/conf/nginx.conf" <<'EOF'
user  www www;
worker_processes auto;
error_log  /www/wwwlogs/nginx_error.log crit;
pid        /www/server/nginx/logs/nginx.pid;
worker_rlimit_nofile 51200;

events {
    use epoll;
    worker_connections 51200;
    multi_accept on;
}

http {
    include       mime.types;
    default_type  application/octet-stream;
    sendfile      on;
    tcp_nopush    on;
    keepalive_timeout 60;
    client_max_body_size 50m;

    server {
        listen      1515;
        server_name _;
        root        /www/wwwroot/game;
        index       index.php index.html index.htm;

        location ~ [^/]\.php(/|$) {
            try_files      $uri =404;
            fastcgi_pass   unix:/tmp/php-cgi-56.sock;
            fastcgi_index  index.php;
            fastcgi_param  SCRIPT_FILENAME $document_root$fastcgi_script_name;
            include        fastcgi_params;
        }

        access_log /www/wwwlogs/game.access.log;
        error_log  /www/wwwlogs/game.error.log;
    }
}
EOF
  cat > /etc/systemd/system/cqsj-nginx.service <<'EOF'
[Unit]
Description=nginx (CQSJ)
After=network.target

[Service]
Type=forking
ExecStart=/www/server/nginx/sbin/nginx -c /www/server/nginx/conf/nginx.conf
ExecReload=/www/server/nginx/sbin/nginx -s reload
ExecStop=/www/server/nginx/sbin/nginx -s quit
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
  systemctl daemon-reload
  systemctl enable cqsj-nginx >/dev/null 2>&1
  systemctl restart cqsj-nginx
  sleep 2
  ss -lntp 2>/dev/null | grep -q ':1515' && ok "nginx 已监听 1515" \
                                         || warn "nginx 未起, 看 journalctl -u cqsj-nginx"

  say "[5/8] 放网站代码"
  mkdir -p /www/wwwroot
  tar xzf "$PAYLOAD/$WEB_PKG" -C /www/wwwroot
  chown -R www:www "$WEB_ROOT" 2>/dev/null || true
  ok "$WEB_ROOT 就绪($(find "$WEB_ROOT" -type f | wc -l) 个文件)"

  say "[6/8] 装 MySQL 并导入数据"
  install_mysql_bare
  mysql_import

  say "[7/8] 装游戏服"
  mkdir -p /data
  tar xzf "$PAYLOAD/$SBIN_PKG" -C /
  # libmysqlclient.so.18: NameServer 依赖, CentOS7 默认只有 .so.20
  mkdir -p /usr/lib64/mysql
  tar xzf "$PAYLOAD/$LIBMYSQL_PKG" -C /tmp
  cp -a /tmp/bk_lib/libmysqlclient.so.18* /usr/lib64/mysql/ 2>/dev/null || true
  echo '/usr/lib64/mysql' > /etc/ld.so.conf.d/cqsj-mysql.conf
  echo "$GAME_ROOT/linux"  > /etc/ld.so.conf.d/cqsj-game.conf
  ldconfig
  ldconfig -p | grep -q libmysqlclient.so.18 && ok "libmysqlclient.so.18 已注册" \
                                             || warn "libmysqlclient.so.18 缺失, NameServer 会起不来"
  chmod +x "$GAME_ROOT"/linux/*_d "$GAME_ROOT"/linux/*.sh 2>/dev/null || true
  ok "游戏服程序就位"

  say "[8/8] 替换 IP / 库密码并启动游戏服"
  reconfigure_ip
  start_game_bare
  verify_bare
}

# ---------- MySQL: 优先 MySQL 5.6(与原机一致), 拉不到就回落 mariadb ----------
install_mysql_bare() {
  if command -v mysqld >/dev/null 2>&1 || command -v mariadbd >/dev/null 2>&1; then
    ok "已存在 MySQL/MariaDB, 跳过安装"; return 0
  fi
  echo "    尝试安装 MySQL 5.6(官方源) ..."
  if timeout 180 bash -c '
      yum install -y -q wget >/dev/null 2>&1
      wget -q -O /tmp/mysql56.repo.rpm https://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm &&
      rpm -Uvh /tmp/mysql56.repo.rpm >/dev/null 2>&1 &&
      yum install -y -q mysql-community-server >/dev/null 2>&1
    '; then
    ok "MySQL 5.6 安装完成"
  else
    warn "MySQL 5.6 源不可用(国内网络常见), 回落 MariaDB 5.5"
    yum install -y -q mariadb-server mariadb >/dev/null 2>&1 || die "数据库安装失败"
    ok "MariaDB 安装完成(注: 原机是 MySQL 5.6, 5.5 未长期验证)"
  fi
  systemctl enable mysqld >/dev/null 2>&1 || systemctl enable mariadb >/dev/null 2>&1 || true
  systemctl start  mysqld 2>/dev/null || systemctl start mariadb 2>/dev/null || true
  for i in $(seq 1 30); do
    mysqladmin ping >/dev/null 2>&1 && break
    sleep 2
  done
}

mysql_import() {
  MYSQL="mysql -u$DB_USER"
  if ! $MYSQL -e "select 1;" >/dev/null 2>&1; then
    # 首次安装: 设 root 密码(用 socket 免密)
    mysql -u$DB_USER <<SQL
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$PW');
SET PASSWORD FOR 'root'@'127.0.0.1' = PASSWORD('$PW');
FLUSH PRIVILEGES;
SQL
  fi
  MYSQL="mysql -u$DB_USER -p$PW"
  $MYSQL -e "select version();" >/dev/null 2>&1 || die "连不上数据库, 请检查密码"
  ok "数据库可连: $($MYSQL -N -e 'select version();')"

  if [ -f "$PAYLOAD/$DB_PKG" ]; then
    gunzip -c "$PAYLOAD/$DB_PKG" | $MYSQL || die "导入失败"
    $MYSQL -e "show databases;" | tr '\n' ' '
    echo
    ok "数据库导入完成"
  else
    warn "没有 $DB_PKG, 跳过导入(游戏服会因为没表起不来)"
  fi
}

# ---------- 把所有写死的源机 IP 换成目标机 IP ----------
reconfigure_ip() {
  local OLD="$SRC_IP_OLD"
  [ -f "$SRC_IP_FILE" ] && OLD="$(cat "$SRC_IP_FILE")"
  echo "    替换 $OLD -> $IP"
  for f in "$GAME_ROOT"/resource/config/gateway_cfg.lua \
           "$GAME_ROOT"/resource/config/session_cfg.lua \
           "$GAME_ROOT"/resource/config/*.xml \
           "$WEB_ROOT"/games__/version/version.php \
           "$WEB_ROOT"/games__/login/localIP.txt \
           "$WEB_ROOT"/gm/user/config.php \
           "$WEB_ROOT"/games__/config.php; do
    [ -f "$f" ] && replace_in "$f" "$OLD" "$IP"
  done
  # 库密码: DBConfig.xml 里写的是源机密码
  [ "$PW" != "$OLD_DB_PW" ] && replace_in "$GAME_ROOT/resource/config/DBConfig.xml" "$OLD_DB_PW" "$PW"
  ok "IP/密码替换完成(残留 $(grep -rl "$OLD" "$GAME_ROOT/resource/config" "$WEB_ROOT" 2>/dev/null | wc -l) 处)"
}

start_game_bare() {
  cat > /etc/systemd/system/cqsj-game.service <<EOF
[Unit]
Description=CQSJ Game Server
After=network.target mysqld.service

[Service]
Type=oneshot
RemainAfterExit=yes
WorkingDirectory=$GAME_ROOT/linux
ExecStart=/bin/bash $GAME_ROOT/linux/start.sh
ExecStop=/bin/bash $GAME_ROOT/linux/stop.sh

[Install]
WantedBy=multi-user.target
EOF
  systemctl daemon-reload
  systemctl enable cqsj-game >/dev/null 2>&1
  systemctl restart cqsj-game
  echo "    等待游戏进程起来(约 20 秒) ..."
  sleep 20
}

verify_bare() {
  say "验收"
  echo "--- 监听端口 ---"
  ss -lntp 2>/dev/null | grep -E ':(1515|3306|20013|20020|3210)\b' || echo "(无)"
  echo "--- 游戏进程 ---"
  ps aux | grep -E '_d ' | grep -v grep | awk '{print $11, $12, $13}' || echo "(无)"
  echo "--- version 接口 ---"
  curl -s --max-time 5 "http://127.0.0.1:1515/games__/version/version.php" || echo "(无响应)"
  echo
}

# ============================================================================
#  模式 B: Docker 化
# ============================================================================
deploy_docker() {
  local DIR="${INSTALL_DIR:-/opt/cqsj}"

  say "[1/5] 安装 Docker"
  if ! command -v docker >/dev/null 2>&1; then
    yum install -y -q yum-utils device-mapper-persistent-data lvm2 >/dev/null 2>&1 || true
    timeout 300 bash -c 'curl -fsSL https://get.docker.com | sh' \
      || yum install -y -q docker >/dev/null 2>&1 \
      || die "Docker 安装失败(国内网络可改用 --bare 裸机模式)"
  fi
  systemctl enable docker >/dev/null 2>&1; systemctl start docker
  docker version --format '{{.Server.Version}}' >/dev/null 2>&1 || die "Docker 未就绪"
  ok "Docker $(docker version --format '{{.Server.Version}}' 2>/dev/null)"

  say "[2/5] 准备工程目录 $DIR"
  mkdir -p "$(dirname "$DIR")"
  if [ ! -f "$DIR/docker-compose.yml" ]; then
    if command -v git >/dev/null 2>&1; then
      git clone --depth 1 https://github.com/afsawfeqfasdfa/cqsj.git "$DIR" \
        || die "克隆失败: 网络不通时请手动把仓库解压到 $DIR 后重跑"
    else
      die "没有 git, 请手动把仓库放到 $DIR"
    fi
  fi
  cd "$DIR"

  say "[3/5] 补游戏服二进制(公开仓库不含)"
  fetch "$SBIN_PKG" /data/sbin /
  mkdir -p build/game
  tar xzf "$PAYLOAD/$SBIN_PKG" -C /tmp
  rm -rf build/game/sbin
  mv /tmp/data/sbin build/game/sbin
  fetch "$LIBMYSQL_PKG" /usr/lib64/mysql /usr/lib64
  mkdir -p build/game/libs/usr/lib64/mysql
  tar xzf "$PAYLOAD/$LIBMYSQL_PKG" -C /tmp
  cp -a /tmp/bk_lib/libmysqlclient.so.18* build/game/libs/usr/lib64/mysql/ 2>/dev/null || true
  chmod +x build/game/sbin/linux/*_d build/game/sbin/linux/*.sh 2>/dev/null || true
  ok "二进制就位"

  say "[4/5] 替换占位符并启动三服务"
  [ -f quickstart.sh ] && sed -i 's/^set -euo pipefail/set -euo pipefail/' quickstart.sh
  INSTALL_DIR="$DIR" bash quickstart.sh "$IP" "$PW" 2>&1 | tail -20 || true

  cp -f docker-compose.full.yml docker-compose.yml 2>/dev/null || true
  sed -i "s|GAME_HOST_IP:.*|GAME_HOST_IP: \"$IP\"|" docker-compose.yml
  docker compose up -d --build 2>&1 | tail -15

  say "[5/5] 等待与验收"
  sleep 45
  docker ps --format '{{.Names}} | {{.Status}}'
  echo "--- 游戏端口 ---"
  ss -lntp 2>/dev/null | grep -E ':(20013|20020|20023|20030)\b' || echo "(无)"
  echo "--- version 接口 ---"
  curl -s --max-time 5 "http://127.0.0.1:1515/games__/version/version.php" || echo "(无响应)"
  echo
}

# ============================================================================
say "开始部署($MODE)"
if [ "$MODE" = "docker" ]; then deploy_docker; else deploy_bare; fi

echo
echo "============================================================================"
echo "部署结束"
echo "  GM 后台   : http://$IP:1515/gm/gm.php"
echo "  官网      : http://$IP:1515/"
echo "  数据库    : mysql -u$DB_USER -p'$PW'  (库 longwen / longwen_name)"
echo "  游戏服日志: tail -f $GAME_ROOT/linux/*_service.log"
echo "  重启游戏服: systemctl restart cqsj-game"
echo "============================================================================"
