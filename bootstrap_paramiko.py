#!/usr/bin/env python3
# 用 paramiko(密码) 从源机拉取 web 运行时 / GM代码 / 游戏服 / 数据库 到本地 build/
# 解决 bash ssh 无密码通道导致 bootstrap.sh 失败的问题
import paramiko, tarfile, os

HOST, PORT, USER, SSHPW = '<<LAN_IP>>', 22, 'root', '<<LEGACY_SSH_PASSWORD>>'
MYSQL_PW = '<<DB_OR_GM_PASSWORD>>'

HERE = os.path.dirname(os.path.abspath(__file__))
BUILD = os.path.join(HERE, 'build')
os.makedirs(os.path.join(BUILD, 'web', 'wwwroot_game'), exist_ok=True)
os.makedirs(os.path.join(BUILD, 'game'), exist_ok=True)
os.makedirs(os.path.join(BUILD, 'db', 'init'), exist_ok=True)

def new_name(name, strip):
    parts = name.split('/')
    while parts and parts[0] in ('', '.'):
        parts = parts[1:]
    if strip > 0:
        parts = parts[strip:]
    return '/'.join(parts)

def extract_stream(stdout, dest, strip=0):
    os.makedirs(dest, exist_ok=True)
    tf = tarfile.open(fileobj=stdout, mode='r|gz')
    for m in tf:
        m.name = new_name(m.name, strip)
        if not m.name:
            continue
        tf.extract(m, dest)
    tf.close()

print("==> connecting source host ...")
ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(HOST, PORT, USER, SSHPW, timeout=12)

try:
    print("==> [1/3] web runtime (php/56 + nginx)")
    _, o, _ = ssh.exec_command("tar czf - -C /www/server php/56 nginx")
    extract_stream(o, os.path.join(BUILD, 'web'), strip=0)

    print("==> [2/3] GM code (/www/wwwroot/game)")
    _, o, _ = ssh.exec_command("tar czf - -C /www/wwwroot game")
    extract_stream(o, os.path.join(BUILD, 'web', 'wwwroot_game'), strip=1)

    print("==> [3a/3] game server (/data/sbin)")
    _, o, _ = ssh.exec_command("tar czf - -C / data/sbin")
    extract_stream(o, os.path.join(BUILD, 'game'), strip=1)

    print("==> [3b/3] mysqldump (longwen + longwen_name)")
    _, o, e = ssh.exec_command(
        "mysqldump -uroot -p%s --databases longwen longwen_name --default-character-set=utf8" % MYSQL_PW)
    data = o.read().decode('utf-8', 'ignore')
    with open(os.path.join(BUILD, 'db', 'init', '01-longwen.sql'), 'w', encoding='utf-8') as f:
        f.write(data)
finally:
    ssh.close()

print("DONE build/ 生成完毕")
