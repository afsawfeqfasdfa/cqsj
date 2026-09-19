--session_cfg.lua
--1-99999 为session服务器ID
local session_servers =
{
--800后为预发布服务器
[800] = {name = "session_800", loginAddr = '<<LAN_IP>>', loginPort = 20013, dbAddr = '127.0.0.1', dbPort = 3000, gatePort = 2300, worldPort= 2500,
nameAddr = "127.0.0.1", namePort = 3220,
url = "http://oms.szkuniu.com/api/check.php",gameiD = 'lw_ucloud', appKey = '<<MSDK_APPKEY>>', },
[801] = {name = "session_801", loginAddr = '<<LAN_IP>>', loginPort = 20023, dbAddr = '127.0.0.1', dbPort = 3000, gatePort = 2310, worldPort= 2510,
nameAddr = "127.0.0.1", namePort = 3220,
url = "http://oms.szkuniu.com/api/check.php",gameiD = 'lw_ucloud', appKey = '<<MSDK_APPKEY>>', },
[802] = {name = "session_802", loginAddr = '<<LAN_IP>>', loginPort = 20033, dbAddr = '127.0.0.1', dbPort = 3000, gatePort = 2320, worldPort= 2520,
nameAddr = "127.0.0.1", namePort = 3220,
url = "http://oms.szkuniu.com/api/check.php",gameiD = 'lw_ucloud', appKey = '<<MSDK_APPKEY>>', },
[803] = {name = "session_803", loginAddr = '<<LAN_IP>>', loginPort = 20043, dbAddr = '127.0.0.1', dbPort = 3000, gatePort = 2330, worldPort= 2530,
nameAddr = "127.0.0.1", namePort = 3220,
url = "http://oms.szkuniu.com/api/check.php",gameiD = 'lw_ucloud', appKey = '<<MSDK_APPKEY>>', },
}
local name_servers =
{
[1] = {addr = "127.0.0.1", port = 3210,},
[2] = {addr = "127.0.0.1", port = 3220,},
}
function load_name_config(buff)
buff:pushInt(#name_servers)
for _, v in pairs(name_servers) do
buff:pushString(v.addr)
buff:pushInt(v.port)
end
end
--加载session配置
function load_session_config(buff, session_server_id)
local luabuf = tolua.cast(buff, "LuaMsgBuffer")
if luabuf then
local server_info = session_servers[session_server_id]
luabuf:pushInt(server_info and server_info.dbPort or 3000)
luabuf:pushInt(server_info and server_info.gatePort or 2300)
luabuf:pushInt(server_info and server_info.worldPort or 2500)
luabuf:pushInt(server_info and server_info.loginPort or 20013)
luabuf:pushString(server_info and server_info.dbAddr or "127.0.0.1")
luabuf:pushString(server_info and server_info.loginAddr or "127.0.0.1")
load_name_config(luabuf)
end
end
