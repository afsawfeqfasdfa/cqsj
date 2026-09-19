#!/usr/bin/env python3
# 把本地 data-docker(含已生成的 build/) 上传到飞牛, 并构建/启动整套环境
# 飞牛: <<LAN_IP>>:<<SSH_PORT>>  <<SSH_USER>> / <<SSH_PASSWORD>>   Debian12 + Docker28 + Compose v2
import paramiko, os, sys

FNOS = ('<<LAN_IP>>', <<SSH_PORT>>, '<<SSH_USER>>', '<<SSH_PASSWORD>>')
LOCAL = r'C:/Users/Administrator/WorkBuddy/2026-08-27-14-29-50/data-docker'
REMOTE_DIR = '/vol1/docker/cqsj'

def connect():
    c = paramiko.SSHClient()
    c.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    c.connect(*FNOS, timeout=15)
    c.get_transport().set_keepalive(30)
    return c

def sftp_upload(sftp, local, remote):
    for name in sorted(os.listdir(local)):
        if name == '.git':
            continue
        l = os.path.join(local, name)
        r = remote + '/' + name
        if os.path.isdir(l):
            try:
                sftp.mkdir(r)
            except IOError:
                pass
            sftp_upload(sftp, l, r)
        else:
            print('  put', r)
            sftp.put(l, r)

def run(ssh, cmd, timeout=600):
    print('$', cmd)
    _, o, e = ssh.exec_command(cmd, timeout=timeout)
    out = o.read().decode('utf-8', 'ignore')
    err = e.read().decode('utf-8', 'ignore')
    if out.strip():
        print(out)
    if err.strip():
        print('[stderr]', err)
    return out

# 0) 确认 build/ 已就绪
build_ok = os.path.isdir(os.path.join(LOCAL, 'build', 'game')) and \
           os.path.isdir(os.path.join(LOCAL, 'build', 'web', 'php', '56'))
if not build_ok:
    print('ERROR: build/ 尚未生成完整, 请先跑 bootstrap_paramiko.py')
    sys.exit(1)

print('==> 连接飞牛 ...')
ssh = connect()
sftp = ssh.open_sftp()
try:
    sftp.mkdir(REMOTE_DIR)
except IOError:
    pass

print('==> 上传 data-docker (含 build/) ...')
sftp_upload(sftp, LOCAL, REMOTE_DIR)
sftp.close()

print('==> 把 GAME_HOST_IP 改成飞牛 IP <<LAN_IP>> ...')
run(ssh, "sed -i 's/<<LAN_IP>>/<<LAN_IP>>/g' %s/docker-compose.yml" % REMOTE_DIR)

print('==> docker compose build (拉 centos:7 基础镜像 + COPY, 可能几分钟) ...')
run(ssh, 'cd %s && docker compose build' % REMOTE_DIR, timeout=1800)

print('==> docker compose up -d ...')
run(ssh, 'cd %s && docker compose up -d' % REMOTE_DIR, timeout=600)

print('==> 容器状态 ...')
run(ssh, "docker ps --format 'table {{.Names}}\\t{{.Status}}\\t{{.Ports}}'", timeout=60)

print('==> 游戏服日志(尾20行) ...')
run(ssh, 'docker logs --tail 20 cqsj_game 2>&1', timeout=60)

print('==> GM站HTTP探测 ...')
run(ssh, "curl -s -m5 -o /dev/null -w 'gm_http=%{http_code}\\n' http://127.0.0.1:1515/gm/gm.php", timeout=30)

ssh.close()
print('DEPLOY_DONE')
