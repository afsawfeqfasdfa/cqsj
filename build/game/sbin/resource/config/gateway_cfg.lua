--gateway_cfg.lua
--1-99999为gateway服务器ID
local gateway_servers =
{
--800后为预发布服务器
[800] = {name = "gateway_800", connectAddr = '<<GAME_PUBLIC_IP>>:32124', loginAddr = '<<LAN_IP>>', loginPort = 20020,
sessionAddr = '127.0.0.1', sessionPort = 2300, worldPort= 2200},
[801] = {name = "gateway_801", connectAddr = '<<GAME_DOMAIN>>:20030', loginAddr = '<<LAN_IP>>', loginPort = 20030,
sessionAddr = '127.0.0.1', sessionPort = 2310, worldPort= 2210},
[802] = {name = "gateway_802", connectAddr = '<<GAME_DOMAIN>>:20040', loginAddr = '<<LAN_IP>>', loginPort = 20040,
sessionAddr = '127.0.0.1', sessionPort = 2320, worldPort= 2220},
[803] = {name = "gateway_803", connectAddr = '<<GAME_DOMAIN>>:20050', loginAddr = '<<LAN_IP>>', loginPort = 20050,
sessionAddr = '127.0.0.1', sessionPort = 2330, worldPort= 2230},
}
--加载gateway配置
function load_gateway_config(buff, gateway_server_id)
local luabuf = tolua.cast(buff, "LuaMsgBuffer")
if luabuf then
local server_info = gateway_servers[gateway_server_id]
luabuf:pushInt(server_info and server_info.worldPort or 2200)
luabuf:pushInt(server_info and server_info.loginPort or 20020)
luabuf:pushInt(server_info and server_info.sessionPort or 2300)
luabuf:pushString(server_info and server_info.loginAddr or "127.0.0.1")
luabuf:pushString(server_info and server_info.connectAddr or "127.0.0.1:20020")
luabuf:pushString(server_info and server_info.sessionAddr or "127.0.0.1")
luabuf:pushShort(#RAND_NAMES)
for i, info in pairs(RAND_NAMES) do
luabuf:pushShort(info.f_id)
luabuf:pushString(info.f_value)
end
end
end
