# build/game/libs — 游戏服运行依赖库(需自备)

`game/Dockerfile` 会执行 `COPY build/game/libs/ /`,因此**这个目录必须存在**,
否则 `docker compose build` 会失败。仓库里只放了本说明文件占位。

## 你需要放什么

CentOS 7 基础镜像自带的 MySQL 客户端库版本与游戏服二进制不匹配,
需要把下面这个文件放到本目录(`usr/lib64/mysql/`):

```
build/game/libs/usr/lib64/mysql/libmysqlclient.so.18
```

获取方式(任选其一):

1. 从你已有的游戏服部署机上拷贝:
   ```bash
   scp root@<你的旧服务器>:/usr/lib64/mysql/libmysqlclient.so.18 \
       build/game/libs/usr/lib64/mysql/
   ```
2. 从 CentOS 7 的 `mysql-libs` 包里提取:
   ```bash
   yum install -y mysql-libs     # 或 rpm -i mysql-libs-5.1.73-*.rpm
   cp /usr/lib64/mysql/libmysqlclient.so.18 build/game/libs/usr/lib64/mysql/
   ```

> 该文件是开源库(MySQL Connector/C, GPL/LGPL),可从公开渠道自行获取,
> 因此未随本仓库分发。

## 只部署 GM 网站时

不需要准备这个文件 —— 执行 `docker compose up -d db web` 不会构建 `game` 镜像。
但目录请保留,以免他人克隆后 `docker compose build` 报错。
