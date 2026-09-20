# 部署指南(给其他人的说明)

> 本仓库是「传奇世界(CQSJ)私服」的 Docker 化工程快照,**所有敏感信息已替换为占位符**。
> 请先把下文《占位符替换》一节做完,否则跑不起来。

---

## 1. 先看清:仓库里有什么、缺什么

| 部分 | 是否包含 | 说明 |
|------|---------|------|
| GM 网站(PHP5.6 + Nginx + ZendGuardLoader) | ✅ 完整 | 含 nginx/php 运行时**及其依赖库**(`build/web/libs`、`libs64`),可直接构建 |
| MySQL 5.6 + `longwen` 游戏库初始化 SQL | ✅ 完整 | `db/init/01-longwen.sql` |
| 游戏服 **配置文件**(`.lua` / `.xml`) | ✅ 完整 | `build/game/sbin/resource/config/`,含 4 区端口方案 |
| 游戏服 **启动脚本** | ✅ 完整 | `build/game/sbin/linux/*.sh` |
| 游戏服 **编译二进制**(`*_d`、`*.so`) | ❌ **不含** | 专有程序,需自备(见第 5 节) |
| 游戏服依赖库 `libmysqlclient.so.18` | ❌ 不含(已占位) | 目录 `build/game/libs/` 已存在说明文件,**不会导致构建失败**;跑全栈时才需自备 |
| 安卓客户端 `.pack` 更新包 | ❌ 不含 | 专有资产 |
| 运行时日志 / 支付日志 / PID 文件 | ❌ 不含 | 已被 `.gitignore` 排除 |

**因此部署分两种:只跑网站+数据库(开箱即用),或自备游戏服二进制跑全栈。**

---

## 2. 前置条件

- 一台 **Linux x86_64** 主机(已在 Debian 12 / Docker 28 验证),已装 **Docker + Docker Compose v2**
- 内存:仅 web+db 约 1GB 足够;跑游戏服建议 ≥4GB
- 开放端口:GM 站 `1515`,MySQL `3306`,游戏服 `20010-20059 / 2200-2230 / 2300-2330 / 2500-2530 / 3000-3030 / 3210`

> ⚠️ **必须是 Linux,Windows / macOS 的 Docker Desktop 跑不了。**
> `docker-compose.yml` 里 `game` 用了 `network_mode: host`(游戏服要 bind 真实 LAN IP),
> `web` 用了 `pid: "host"`(读宿主 `/proc/net/tcp` 统计在线人数)。
> Docker Desktop 的虚拟机后端**不支持 host 网络与 host PID 命名空间**,
> `docker compose up` 会失败或行为异常。没 Linux 机器就用虚拟机/云服务器(桥接或 NAT 均可)。

---

## 3. 占位符替换(必做)

仓库里所有真实密码/IP 已替换为 `<<XXX>>`,**部署前必须全部替换成你自己的值**:

| 占位符 | 含义 | 出现在 |
|--------|------|--------|
| `<<LAN_IP>>` | Docker 宿主机的 **局域网 IP**(客户端要能连通) | `docker-compose.yml`、`gateway_cfg.lua`、`session_cfg.lua`、`games__/config.php`、`bootstrap.sh`、`deploy_fnos.py` |
| `<<DB_OR_GM_PASSWORD>>` | MySQL root 密码(你自己设一个强密码) | `docker-compose.yml`、`games__/config.php`、`gm/user/config.php`、各 DB 配置 XML |
| `<<GAME_DB_PASSWORD>>` | 游戏服连库密码 | `center_cfg.lua`、`DirDbConfig.xml`、`LogConfig.xml` |
| `<<DIR_DB_PASSWORD>>` | 目录服务器库密码 | `DirDbConfig.xml`、`tdlog_cfg.lua` |
| `<<LOG_DB_PASSWORD>>` | 日志库密码 | `LogConfig.xml` |
| `<<CENTER_SECRET_1/2>>` | center 服务密钥(若不用可留空) | `center_cfg.lua` |
| `<<MSDK_APPKEY>>` | MSDK appKey(若不用可留空) | `session_cfg.lua` |
| `<<GAME_PUBLIC_IP>>` / `<<GAME_DOMAIN>>` | 外网域名 / 公网 IP(对外运营时才用) | `gateway_cfg.lua` 的 `connectAddr` |
| `<<SMS_GATEWAY_IP>>` | 短信网关(注册功能用) | `games__/registered/api/send.php` |
| `<<SSH_USER>>` / `<<SSH_PASSWORD>>` / `<<SSH_PORT>>` | 部署脚本用的 SSH 凭据 | `bootstrap.sh`、`deploy_fnos.py` |
| `<<GM_KEY>>` / `<<WZSPAY_TOKEN>>` / `<<WZSPAY_KEY>>` | GM 后台密钥 / 支付密钥 | `gm/user/config.php`、`wzspay/config.php` |
| `<<CONTACT_DOMAIN>>` | 联系/客服邮箱域名 | `games__/registered/api/*.php` |
| `<<GM_ACCOUNT_PASSWORD>>` / `<<REG_PAGE_KEY>>` / `<<LEGACY_SSH_PASSWORD>>` | GM 表账号口令 / 注册页 key / 旧机 SSH 密码(均为历史遗留,改不改都不影响部署) | `db/init/01-longwen.sql`、`registered/index2.php`、`bootstrap_paramiko.py` |

一键批量替换示例(**按你的实际值修改**,注意 `<<LAN_IP>>` 要换成宿主机真实 IP)。
`.sql` 也必须替换——初始化 SQL 里的账号表含真实注册 IP,玩家表含明文口令:

```bash
cd cqsj
grep -rl '<<' --include='*.yml' --include='*.php' --include='*.lua' --include='*.xml' \
           --include='*.sh' --include='*.sql' . \
  | xargs sed -i \
    -e 's/<<LAN_IP>>/192.168.1.100/g' \
    -e 's/<<GAME_PUBLIC_IP>>/192.168.1.100/g' \
    -e 's/<<DB_OR_GM_PASSWORD>>/YourStrongPassword/g' \
    -e 's/<<GAME_DB_PASSWORD>>/YourStrongPassword/g' \
    -e 's/<<DIR_DB_PASSWORD>>/YourStrongPassword/g' \
    -e 's/<<LOG_DB_PASSWORD>>/YourStrongPassword/g'
```

> ⚠️ **初始化 SQL 里有一份真实运营快照**:`db/init/01-longwen.sql` 含若干真实玩家/账号行
> (账号名、注册 IP、口令明文)。口令已被脱敏成 `<<DB_OR_GM_PASSWORD>>`,替换后会变成你设的密码。
> 若不想带这些数据,导入后自行 `TRUNCATE` 相关表即可。

---

## 4. 方式 A:只跑 GM 网站 + 数据库(无需游戏服二进制)

### 4.0 一键脚本(推荐)

全新 Linux 主机上,一条命令搞定(自动装 Docker、克隆仓库、替换占位符、起 db+web):

```bash
curl -fsSL https://raw.githubusercontent.com/afsawfeqfasdfa/cqsj/main/quickstart.sh | sudo bash
# 或手动指定 IP 与密码:
#   sudo bash quickstart.sh 192.168.1.100 'YourStrongPass123'
```

脚本会把仓库克隆到 `/opt/cqsj`,随机生成一个数据库密码并打印,最后输出 GM 后台地址。
想看它具体做了什么,直接读仓库根目录的 `quickstart.sh`(约 100 行,可离线审计)。

### 4.1 手动步骤(飞牛 FnOS 见 4.2)

```bash
# 1. 替换占位符(见第 3 节)
# 2. 只启动 db 与 web,不构建 game
docker compose up -d db web

# 3. 查看状态
docker ps
docker logs -f cqsj_web
```

验证:

- GM 站:`http://<宿主机IP>:1515/gm/gm.php`
- 版本接口(客户端第一段入口):`http://<宿主机IP>:1515/games__/version/version.php`
  应返回含 `"ip":"<你的IP>"`、`"port":20013` 的 JSON
- 数据库:`docker exec cqsj_db mysql -uroot -p<你的密码> -e "show databases;"`
  (应看到 `longwen`、`longwen_name`)

> ℹ️ **客户端连的地址由 `games__/config.php` 的 `CFG_SERVER_IP` 决定**,
> `web/start.sh` 每次启动都会把它同步进 `version.php` 的 `"id":800` 那条记录
> (其它区的 `ip` 不会被改写,801 那个域名请自行改 `version.php`)。
> 所以改 IP 只需改 `config.php` 一处,不用手改 `version.php`。

> ⚠️ 直接 `docker compose up -d` 会连 `game` 一起构建。构建本身**不会**失败
> (`build/game/libs/` 已占位、`sbin/` 只有配置),但游戏进程起不来——
> 没有 `*_d` 二进制时会反复重启。所以**没备好二进制就只起 db/web**。

### 4.2 飞牛 FnOS 手动部署(一步步来)

> 以下以**全新飞牛** `192.168.5.128` 为例。飞牛是 Debian 12 + Docker 28,完全满足第 2 节前置条件。

**第 0 步 · 网页端准备(全新机必做)**

| 操作 | 位置 |
|---|---|
| 装 Docker | 飞牛桌面 → **应用中心** → 搜 `Docker` → 安装 |
| 开 SSH | **系统设置** → `SSH` / 开发者模式 → 打开(默认端口 `22`,全新机默认**关闭**) |

验证 SSH 已开:`ssh adminn@192.168.5.128`(面板端口是 `5666`,别混)。

**第 1 步 · 拉代码到 `/vol1/docker`**

```bash
sudo -i                                   # 飞牛的普通账号不在 docker 组,全程用 root
mkdir -p /vol1/docker && cd /vol1/docker
apt-get install -y git                    # 全新机可能没 git
git clone --depth 1 https://github.com/afsawfeqfasdfa/cqsj.git
cd cqsj
```

> `git clone` 不通时:在电脑浏览器打开仓库页 → `Code` → `Download ZIP`,
> 用飞牛「文件管理」上传到 `/vol1/docker` 并解压,目录改名为 `cqsj` 即可,后续命令一样。

**第 2 步 · 替换占位符(手动版)**

```bash
IP=192.168.5.128                 # 飞牛的局域网 IP
PW='Cqsj@2026'                   # 自己设的数据库/GM 密码,记下来

FILES=$(grep -rl '<<' --include='*.yml' --include='*.php' --include='*.lua' \
        --include='*.xml' --include='*.sh' --include='*.sql' --include='*.py' \
        --include='*.conf' --include='*.json' .)

for ph in $(grep -rhoE '<<[A-Za-z0-9_]+>>' $FILES | sort -u); do
  case "$ph" in
    *IP*|*DOMAIN*) V="$IP" ;;      # 带 IP / DOMAIN 的填飞牛 IP
    SSH_USER)      V=root  ;;
    SSH_PORT)      V=22    ;;
    *)             V="$PW" ;;      # 其余全是口令类,统一填密码
  esac
  PH="$ph" VAL="$V" perl -pi -e 's/\Q$ENV{PH}\E/$ENV{VAL}/g' $FILES
done

grep -rn '<<' --include='*.yml' --include='*.php' --include='*.lua' --include='*.xml' \
     --include='*.sh' --include='*.sql' . | head    # 应无输出
```

用 `perl \Q...\E` 而非 `sed`,是因为密码里带 `&` `|` 会被 sed 当特殊字符吃掉。

**第 3 步 · 启动 db + web**

```bash
docker compose up -d db web       # 只起这两个,game 没二进制不要起
docker ps                         # 应看到 cqsj_db / cqsj_web 都是 Up
docker logs -f cqsj_web           # 看到 version.php ip pinned to 192.168.5.128 即正常
```

首次会构建 web 镜像(centos:7 + PHP5.6 + ZendGuardLoader),约 3–8 分钟。

**第 4 步 · 验收**

```bash
curl http://192.168.5.128:1515/games__/version/version.php   # 返回 JSON,ip 是 192.168.5.128
docker exec cqsj_db mysql -uroot -p"$PW" -e "show databases;" # 有 longwen / longwen_name
```

浏览器打开 <http://192.168.5.128:1515/gm/gm.php> → 出现访问密码登录页即成功。

**要不要跑游戏服?** 全新飞牛没有 `*_d` 二进制,只能到上一步为止。
想跑全栈:把现有机器的 `build/game/sbin/linux/*_d` 与 `libmysqlclient.so.18` 拷到
`/vol1/docker/cqsj/build/game/` 对应目录,再改 `docker-compose.yml` 的 `GAME_HOST_IP`
(此时必须已是 `192.168.5.128`),然后 `docker compose up -d`,并放行 `20010-20059` 端口。

---

## 5. 方式 B:跑完整三服务(需自备游戏服二进制)

### 5.1 准备游戏服程序

把游戏服二进制按下面结构放进仓库(这些文件**不在**本仓库里,需你自行准备):

```
build/game/sbin/linux/
├── WorldFrame_d        # 世界服
├── GameGateway_d       # 网关
├── SessionServer_d     # 会话服
├── NameServer_d        # 命名服
├── DBAServer_d         # DBA 服
├── ListenServer_d
└── *.so                # 依赖库(libSock_d.so / libtss_sdk.so / libDBAClient_d.so 等)
build/game/libs/usr/lib64/mysql/libmysqlclient.so.18   # centos:7 镜像缺的 MySQL 客户端库
```

> `build/game/libs/usr/lib64/mysql/` 目录**已存在**(内含 `README.md` 说明),
> 所以即使还没备好这个 `.so`,`docker compose build` 也不会失败,只是游戏进程起不来。

### 5.2 构建并启动

```bash
docker compose build          # 会拉 centos:7 基础镜像,首次较慢
docker compose up -d
docker logs -f cqsj_game      # 看游戏服启动日志
```

### 5.3 进游戏还必须做的四件事

0. **装安卓客户端**(上古传世四职业 apk):
   <https://1825049433.share.123pan.cn/123pan/oSU2jv-WUMtA?pwd=YHPx>(提取码 `YHPx`)。
   客户端是第三方专有资产,不在本仓库内。
1. **`GAME_HOST_IP` 必须填宿主机 LAN IP**(`docker-compose.yml` 里 `game` 服务的环境变量)。
   网关会把这个地址回传给客户端;填 `127.0.0.1` / 容器 IP 都进不去。
2. **客户端 `defServerList.json`** 要把网关指向 `<宿主机IP>:20020`(与 `GAME_HOST_IP` 一致)。
3. **防火墙放行** `20010-20059` 等游戏端口,以及 `1515`。

---

## 6. 四区端口方案(游戏服配置里已固化)

| 区 | Session login | Gateway login | Gateway world | Gate-Session | Session-World | GateID |
|---|---|---|---|---|---|---|
| 800 玄武 | 20013 | 20020 | 2200 | 2300 | 2500 | 3008000 |
| 801 朱雀 | 20023 | 20030 | 2210 | 2310 | 2510 | 3008010 |
| 802 青龙 | 20033 | 20040 | 2220 | 2320 | 2520 | 3008020 |
| 803 白虎 | 20043 | 20050 | 2230 | 2330 | 2530 | 3008030 |

- NameServer 1/2 在 `3210` / `3220`,**所有区** `session_cfg.lua` 的 `namePort` 都填 `3220`。
- 登录三段式:`version.php(ip:port)` → `SessionServer` → `GameGateway`。
  `version.php` 里的 port 是 **SessionServer 的 loginPort**,不是网关端口。

---

## 7. 关键设计点与已知坑(改配置前必读)

| 坑 | 说明 |
|---|---|
| **`/dev/shm` 只有 64MB** | 每个 `*_d` 进程会 mmap 一个 3MB 的 TSS 反外挂文件到 `/dev/shm`。4 区 12 个进程会写满,第 4 个网关启动即 `Bus error`(连日志都不生成)。已在 compose 里设 `shm_size: 256m`;若重开 4 区请改 `512m`。**排查同类崩溃先看 `df -h /dev/shm`。** |
| **`loginAddr` 会被启动脚本强钉** | `entrypoint.sh` 每次启动都把 `gateway_cfg.lua` / `session_cfg.lua` 的 `loginAddr` 改写成 `$GAME_HOST_IP`。手动改会被覆盖——**改 IP 请改 compose 的 `GAME_HOST_IP`**。 |
| **`connectAddr` 不被覆盖** | 下发客户端的网关地址,直接改 `gateway_cfg.lua` 即可,重启不回退(可填外网域名)。 |
| **`version.php` 不能单文件 bind mount** | `start.sh` 会对它 `sed -i`,单文件挂载会报 `Device or resource busy` 导致容器无限重启。它由 `config.php` 自动生成。推而广之:**任何被 `sed -i` 的文件都别单文件挂载,要挂就挂它所在目录**。 |
| **`web` 需要 `pid: "host"`** | GM 后台 `roles.php` 靠读宿主 `/proc/net/tcp` 判断各区在线人数;bridge 网络下看不到 `game`(host 网络)的端口连接,会全员误报离线。 |
| **`game` 用 host 网络** | 游戏服要 bind 真实 LAN IP,因此无端口映射;连 MySQL 走 `127.0.0.1:3306`(不是服务名 `db`)。 |
| **GM 后台门禁** | `gm.php` 有访问密码(`gm/user/access.php` 里的 `$gmaccesspwd`);`roles.php` 必须先经 `gm.php` 鉴权才能访问,直接敲地址会提示「网络错误」。连续 3 次非法访问会封 IP,可在 `gm/unban.php` 解封。 |
| **角色在线状态是近似值** | 无逐角色在线标记,靠「该区 ESTABLISHED 连接数 + 最近登录排序」推断。`player.Status` 不可信(登出不清零)。 |

---

## 8. 部署自检清单(按顺序打勾)

| # | 检查项 | 期望 |
|---|--------|------|
| 1 | `grep -rn '<<' --include='*.yml' --include='*.php' --include='*.lua' --include='*.xml' --include='*.sh' --include='*.sql' .` | 无输出(占位符已全部替换) |
| 2 | `docker compose config >/dev/null` | 无报错(compose 语法 OK) |
| 3 | `docker compose up -d db web` | 两个容器 `Up` |
| 4 | `docker logs cqsj_web` | 出现 `[start.sh] sync done.` 与 `version.php ip pinned to <你的IP>` |
| 5 | `curl http://<宿主机IP>:1515/games__/version/version.php` | 返回 JSON,`ip` 是你的地址 |
| 6 | 浏览器打开 `/gm/gm.php` | 出现访问密码登录页 |
| 7 | `docker exec cqsj_db mysql -uroot -p<密码> -e "show databases;"` | 有 `longwen` |

若第 4 步报 `php-fpm: error while loading shared libraries`,
说明 `build/web/libs` / `build/web/libs64` 没进镜像——这两个目录是必需的,重新克隆确认存在。

---

## 9. 目录结构

```
cqsj/
├── docker-compose.yml      # 三服务编排
├── README.md               # 项目总览
├── DEPLOY.md               # 本文件
├── bootstrap.sh            # 从原始部署机拉取运行时/代码到 build/(需你有该机器权限)
├── quickstart.sh           # 全新 Linux 主机一键部署(装 Docker→克隆→替换占位符→起 db+web)
├── deploy_fnos.py          # 一键上传+构建到飞牛 NAS(需你改 SSH 凭据)
├── web/                    # web 镜像:Dockerfile / nginx / start.sh / Zend+php.ini
├── game/                   # game 镜像:Dockerfile / entrypoint.sh / start.sh
├── db/init/                # 01-longwen.sql(库快照) + 02-extra.sql(补被引用的库)
└── build/                  # 部署配置与运行环境快照(Dockerfile COPY 的目标)
    ├── web/                # nginx + php5.6 运行时 + wwwroot_game(GM站/接口/支付)
    ├── game/sbin/          # 游戏服【配置】+【启动脚本】(二进制需自备)
    └── db/init/
```

---

## 10. 许可与免责

- 本仓库的**自研部分**(Docker 编排、镜像构建脚本、部署/启动脚本、脱敏后的配置与文档)
  采用 [MIT License](LICENSE),可自由使用、修改与分发。
- 许可证**不覆盖**未包含在本仓库内的第三方专有资产:游戏服务端 `*_d` 二进制及其依赖 `.so`、
  安卓客户端与 `.pack` 更新包资源、以及其中引用的第三方商业源码(如 GM 后台部分 PHP 源自第三方)。
  这些请自行合法获取并遵守各自授权条款。
- 本仓库仅用于**学习与技术交流**,请勿用于任何侵犯第三方知识产权或违反当地法律法规的用途。
