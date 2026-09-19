#!/usr/bin/env bash
# ============================================================================
# bootstrap.sh — 历史一次性工具: 在「能 SSH 到源机且装了 Docker」的机器上运行
# 作用: 把源机上的代码 / 游戏服二进制 / 数据库 拉到本地 build/ 目录,
#       供 `docker compose build` 使用。
# 用法:  bash bootstrap.sh
# 依赖:  ssh / tar(走 ssh 管道,无需 rsync)
# ============================================================================
set -euo pipefail

SRC="root@<<LAN_IP>>"
SSH_OPT="-o StrictHostKeyChecking=no"
MYSQL_PW="<<DB_OR_GM_PASSWORD>>"

ROOT="$(cd "$(dirname "$0")" && pwd)"
BUILD="$ROOT/build"
mkdir -p "$BUILD/web" "$BUILD/game" "$BUILD/db/init"

echo "==> [1/3] 拉取 web 运行时(PHP5.6 + Nginx) 和 GM 站代码"
ssh $SSH_OPT $SRC "tar czf - -C /www/server php/56 nginx" \
    | tar xzf - -C "$BUILD/web"
ssh $SSH_OPT $SRC "tar czf - -C /www/wwwroot game" \
    | tar xzf - --strip-components=1 -C "$BUILD/web/wwwroot_game"

echo "==> [2/3] 拉取游戏服程序(/data/sbin)"
ssh $SSH_OPT $SRC "tar czf - -C / data/sbin" \
    | tar xzf - --strip-components=1 -C "$BUILD/game"

echo "==> [3/3] 导出 MySQL(longwen + longwen_name)"
ssh $SSH_OPT $SRC "mysqldump -uroot -p$MYSQL_PW --databases longwen longwen_name --default-character-set=utf8" \
    > "$BUILD/db/init/01-longwen.sql"

echo ""
echo "完成。现在可以构建并启动:"
echo "    cd $ROOT"
echo "    docker compose build"
echo "    docker compose up -d"
echo ""
echo "(如需重新拉取最新代码,再次运行本脚本即可)"
