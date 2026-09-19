#!/bin/sh
# CQSJ 2 区启动脚本 (只开 800/801; 内存限制, 永久不跑 802/803)
# 800=玄武 801=朱雀
# 802/803 已注释(机器内存不够跑4区). 需要时取消注释本文件对应行再重启 cqsj_game.
# Session login:  20013/20023/20033/20043
# Gateway login:  20020/20030/20040/20050
# Gateway world侧: 2200/2210/2220/2230
# Gateway-Session: 2300/2310/2320/2330
# Session-World:  2500/2510/2520/2530
#
# 顺序注意: 先起 DBA/Session/World/NameServer, 网关最后起且各区间隔 —— 
# 依赖未就绪时网关会直接 core dump (表现为日志 success 但进程消失)。

bash db_service.sh start 0800
sleep 2

bash session_service.sh start 0800
bash world_service.sh start 0800
sleep 1
bash session_service.sh start 0801
bash world_service.sh start 0801
sleep 1
# bash session_service.sh start 0802
# bash world_service.sh start 0802
# sleep 1
# bash session_service.sh start 0803
# bash world_service.sh start 0803

sleep 3
# 集群(NameServer 2 需和 3210 上的姐妹节点 1 同步). 只起 2 会让 cluster sync 失败, 进而网关无法返回正确的服务器信息(客户端表现为"服务器信息解码失败").
bash nameserver_service.sh start 1
sleep 2
bash nameserver_service.sh start 2

sleep 5
bash gamegate_service.sh start 0800 0
sleep 2
bash gamegate_service.sh start 0801 0
sleep 2
# bash gamegate_service.sh start 0802 0
# sleep 2
# bash gamegate_service.sh start 0803 0
