# game 服务: 传奇世界游戏服(C++ 服务端)
# 基于 centos:7(去掉原厂的 systemd,改为直接启动)。
# 不再用 systemd,改为直接启动 start.sh,并把配置里的 127.0.0.1 换成 db 服务名。
FROM centos:7

RUN yum install -y glibc libstdc++ libcurl openssl pcre gzip tar \
    && yum clean all \
    && useradd -M -s /sbin/nologin www 2>/dev/null || true

# 游戏服程序(专有二进制,需自备并放到 build/game/sbin)
COPY build/game/sbin/ /data/sbin/

# 让游戏服自带的 .so 可被动态链接器找到
RUN echo '/data/sbin/linux' > /etc/ld.so.conf.d/gameserver.conf \
    && ldconfig

# NameServer 依赖的 libmysqlclient.so.18(centos:7 镜像无)
COPY build/game/libs/ /
RUN echo '/usr/lib64/mysql' >> /etc/ld.so.conf.d/gameserver.conf \
    && ldconfig

COPY game/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# 暴露各服端口(覆盖 4 个区)
EXPOSE 20010-20059 2200-2230 2300-2330 2500-2530 3000-3030 3210

ENV DB_HOST=db
ENTRYPOINT ["/entrypoint.sh"]
