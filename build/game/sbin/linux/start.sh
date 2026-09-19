#!/bin/sh

bash db_service.sh start 0800
bash session_service.sh start 0800
bash gamegate_service.sh start 0800 0
bash world_service.sh start 0800
# 集群(NameServer 2 需和 3210 上的姐妹节点 1 同步). 只起 2 会让 cluster sync 失败, 进而网关无法返回正确的服务器信息(客户端表现为"服务器信息解码失败").
bash nameserver_service.sh start 1
bash nameserver_service.sh start 2

