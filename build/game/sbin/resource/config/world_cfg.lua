--world_cfg.lua

--tlog相关配置[一般各个区都是统一的]
--手q的游戏APPID
game_appid_q = "1105148805"

--微信的游戏APPID
game_appid_wx = "wxebd64e021cb2a6d2"

--guest的游戏APPID
game_appid_guest = "G_1105148805"

--gamesrv的游戏APPID
gamesrv_appid = "wxebd64e021cb2a6d2"

--tlog服务器ip
tlogServerAddr = "<<LAN_IP>>:6670"

--需要自行配置游戏服务器本地ip worldLocalIp
--1-99999 为游戏服务器ID
local world_servers = 
{
	--1-799为内测服务器组
--	[1] = {name = "第一区", sessionAddr = '127.0.0.1:2500', dbAddr = '127.0.0.1:3000', worldLocalIp = '127.0.0.1'},
	--700为版署服务器
	[700] = {name = "版署送审", sessionAddr = '127.0.0.1:2500', dbAddr = '127.0.0.1:3000', worldLocalIp = '127.0.0.1'},
	--800后为预发布服务器
	[800] = {name = "world_800", sessionAddr = '127.0.0.1:2500', dbAddr = '127.0.0.1:3000', worldLocalIp = '127.0.0.1'},
	[801] = {name = "world_801", sessionAddr = '127.0.0.1:2510', dbAddr = '127.0.0.1:3000', worldLocalIp = '127.0.0.1'},
	[802] = {name = "world_802", sessionAddr = '127.0.0.1:2520', dbAddr = '127.0.0.1:3000', worldLocalIp = '127.0.0.1'},
	[802] = {name = "world_802", sessionAddr = '127.0.0.1:2520', dbAddr = '127.0.0.1:3000', worldLocalIp = '127.0.0.1'},
	[803] = {name = "world_803", sessionAddr = '127.0.0.1:2530', dbAddr = '127.0.0.1:3000', worldLocalIp = '127.0.0.1'},

	[803] = {name = "world_803", sessionAddr = '127.0.0.1:2530', dbAddr = '127.0.0.1:3000', worldLocalIp = '127.0.0.1'},

	--900为本地私服，901为内网
	[900] = {name = "自己私服", sessionAddr = '127.0.0.1:2500', dbAddr = '127.0.0.1:3000', worldLocalIp = '<<LAN_IP>>'},
	[901] = {name = "10内网", sessionAddr = '119.29.35.50:2500', dbAddr = '119.29.35.50:3000', worldLocalIp = '127.0.0.1'},
	[902] = {name = "48内网", sessionAddr = '127.0.0.1:2500', dbAddr = '127.0.0.1:3000', worldLocalIp = '127.0.0.1'},
}

--加载session配置
function load_world_config(world_server_id)
	local server_info = world_servers[world_server_id]
	if server_info then
		return server_info.sessionAddr, server_info.dbAddr, server_info.worldLocalIp, game_appid_q, game_appid_wx, game_appid_guest, gamesrv_appid, tlogServerAddr
	end
	--return '127.0.0.1:2500', '127.0.0.1:3000', "WorldFrame"
	return '127.0.0.1:2500', '127.0.0.1:3000', '127.0.0.1', game_appid_q, game_appid_wx, game_appid_guest, gamesrv_appid, tlogServerAddr
end

