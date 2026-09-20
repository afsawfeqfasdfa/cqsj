# 传奇世界私服 · data 网站环境 Docker 工程

把 GM 网站 + MySQL 游戏库 + 游戏服(C++) 整套环境容器化,可在一台装了 Docker 的机器上一条命令拉起。

## 客户端下载

安卓客户端(上古传世四职业):

- 地址:<https://1825049433.share.123pan.cn/123pan/oSU2jv-WUMtA?pwd=YHPx>
- 提取码:`YHPx`(链接已带 `pwd` 参数,一般打开即自动填入)
- 文件名:`上古传世四职业.apk`

> 客户端为第三方专有资产,**不在本仓库内**,仅提供上述外部下载链接。

装好客户端后,按 [DEPLOY.md](DEPLOY.md) 的「进游戏还必须做的三件事」把 `defServerList.json`
指向你自己的网关地址即可。

## 架构

| 服务 | 镜像 | 说明 | 端口 |
|------|------|------|------|
| `db`   | mysql:5.6            | 游戏库 `longwen`/`longwen_name`,root 密码 `<<DB_OR_GM_PASSWORD>>` | 3306 |
| `web`  | 自建(centos:7+PHP5.6+Zend+Nginx) | GM 站,运行时已随仓库提供 | 1515 / 80 / 88 |
| `game` | 自建(centos:7+游戏服二进制) | 游戏服,启动 0800 区 | 20020-20059 等 |

三服务在同一 bridge 网络 `cqsj` 内:游戏服与 GM 站都通过服务名 `db` 访问 MySQL。

## 目录

```
data-docker/
├── docker-compose.yml      # 编排三服务
├── quickstart.sh           # 全新 Linux 主机一键部署: 装 Docker → 克隆 → 替换占位符 → 起 db+web
├── bootstrap.sh            # 历史一次性拉取工具(生成 build/ 用),新部署不需要跑
├── web/                    # web 镜像: Dockerfile / nginx / 启动脚本 / Zend+php.ini 静态快照
├── game/                   # game 镜像: Dockerfile / entrypoint
├── db/init/                # 01-longwen.sql(库快照) + 02-extra.sql(补齐被引用的库)
└── build/                  # 部署配置与运行环境快照(Dockerfile COPY 进来),整体入库
```

## 使用步骤(在部署主机上)

> **完整步骤请看 [DEPLOY.md](DEPLOY.md)。** 下面的 `bootstrap.sh` 是历史工具,**新部署不需要跑**。

### 一键部署(推荐,仅网站 + 数据库)

```bash
curl -fsSL https://raw.githubusercontent.com/afsawfeqfasdfa/cqsj/main/quickstart.sh | sudo bash
```

须为 **Linux x86_64**;`game` 用 `network_mode: host`、`web` 用 `pid: "host"`,
Windows / macOS 的 Docker Desktop 不支持,会跑不起来。

1. 该主机需满足:已安装 Docker(含 compose v2)。
2. 运行时(PHP/Nginx/依赖库)、GM 站代码、初始化 SQL **已经全部在本仓库 `build/` 里**,
   克隆下来即可用,**全程不需要访问任何外部机器**。
3. 构建并启动:
   ```bash
   docker compose build
   docker compose up -d
   ```
4. 验证:
   - GM 站: `http://<部署主机IP>:1515/gm/gm.php`
   - 数据库: `docker exec cqsj_db mysql -uroot -p<<DB_OR_GM_PASSWORD>> -e "show databases;"`
   - 游戏服: `docker logs -f cqsj_game` 看启动日志

## 关键设计点

- **web 复用现成的 PHP5.6/Nginx 运行时**(而非重编译),避免 PHP5.6 + ZendGuardLoader 的兼容坑;
  ZendGuardLoader.so 与 php.ini 作为静态快照随仓库提供,直接打进镜像。
- **game 镜像基于 `centos:7`**:去掉 systemd,改为 `start.sh` 启动 0800 区;
  entrypoint 在运行时把游戏服配置里写死的 `127.0.0.1` 替换为 `db` 服务名(`DB_HOST` 环境变量可调)。
- **MySQL 密码统一为 `<<DB_OR_GM_PASSWORD>>`**:游戏服 `DBConfig.xml` 与 GM 站 `config.php` 都用它
  (`center_cfg.lua` 里的 `<<GAME_DB_PASSWORD>>` 是失效的备份工具配置,不影响)。

## 进游戏必须配置(否则进不去)

1. **GAME_HOST_IP**:`docker-compose.yml` 里 `game` 服务的 `GAME_HOST_IP` 必须填 **Docker 宿主机的 LAN IP**(客户端能连通的地址)。
   - 网关会把该地址回传给客户端作为后续连接目标;填 `127.0.0.1` / 容器 IP 都不行。
   - 换成**你自己宿主机的 LAN IP**(不要保留占位符)。
2. **客户端 `defServerList.json`**:你本地 Windows 客户端里也要把网关地址指向 `<宿主机IP>:20020`(与 `GAME_HOST_IP` 一致)。
3. **宿主机防火墙**:放行 `20020-20059` 等游戏端口(以及 `1515` 给 GM 站)。
4. **DirServer(外部依赖)**:`DirDbConfig.xml` 指向一个**第三方** dirserver(地址已脱敏为 `<<LAN_IP>>:53306`),本工程未包含。
   客户端走 `defServerList.json` 直连网关时**不影响进游戏**;连不上只会在游戏服日志里刷连接失败,可忽略。
   若你的客户端依赖目录服务器拉列表,需自行把 dirserver 也容器化。

## 部署需要访问外部机器吗?

**不需要。** 所有运行时、GM 站代码、依赖库、初始化 SQL **全部已入库**,
克隆下来 `docker compose up -d db web` 即可,全程不访问任何外部机器。

游戏服配置里可能出现的几个"连不上"的地址(都是第三方或原厂遗留,**不是**你的机器):

| 配置 | 值(已脱敏) | 说明 |
|------|-----------|------|
| `DirDbConfig.xml` | `<<LAN_IP>>:53306` | 第三方 dirserver,连不上只刷日志 |
| `center_cfg.lua` | `127.0.0.1` / `10.x.x.x` | 原厂 center 地址,本来就不可达 |
| `world_cfg.lua` tlog | `<<LAN_IP>>:6670` | 腾讯云 tlog 上报,连不上无影响 |

这些在你机器上同样连不上,**不会阻塞进游戏**。

## 注意事项

- 游戏服配置 `DirDbConfig.xml` 里的 dirserver 是第三方外部地址,
  本工程未包含;缺失时游戏服可能报相关日志但核心功能不影响,按需自行补。
- `DBConfig.xml` 还引用了 `longwen1` 库,`02-extra.sql` 已自动创建空库避免报错。
- 数据持久化:`db` 用命名卷 `db_data`;`game` 的运行时数据建议另行挂卷(本版未挂,重启会重置世界数据)。

## 许可

本仓库的**自研部分**(Docker 编排、镜像构建脚本、部署/启动脚本、脱敏后的配置与文档)
采用 [MIT License](LICENSE),可自由使用、修改与分发。

许可证**不覆盖**以下未包含在本仓库内的第三方专有资产:

- 游戏服务端可执行程序(`*_d` 二进制及其依赖 `.so`)
- 安卓客户端与 `.pack` 更新包资源
- 其中引用的第三方商业源码(如 GM 后台部分 PHP 源自第三方)

这些资产请自行合法获取,并遵守其各自的授权条款。本仓库仅用于学习与技术交流,
请勿用于任何侵犯第三方知识产权或违反当地法律法规的用途。
