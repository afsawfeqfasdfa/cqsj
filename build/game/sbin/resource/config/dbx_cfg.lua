--dbx_cfg.lua

--1-99999 为dbx服务器ID
local dbx_servers = 
{
	--1-799为正式服务器组
--	[1] = {name = "dbx_105W", loginAddr = '127.0.0.1', loginPort = 3000, config = 2},
	--700为版署服务器
	[700] = {name = "dbx_217W", loginAddr = '127.0.0.1', loginPort = 3000, config = 2},
	--800后为预发布服务器
	[800] = {name = "dbx_12W", loginAddr = '127.0.0.1', loginPort = 3000, config = 2},
	[801] = {name = "dbx_105W", loginAddr = '127.0.0.1', loginPort = 3000, config = 2},	[802] = {name = "dbx_802", loginAddr = '127.0.0.1', loginPort = 3000, config = 2},	[802] = {name = "dbx_802", loginAddr = '127.0.0.1', loginPort = 3000, config = 2},
	[803] = {name = "dbx_803", loginAddr = '127.0.0.1', loginPort = 3000, config = 2},

	[803] = {name = "dbx_803", loginAddr = '127.0.0.1', loginPort = 3000, config = 2},

	--900为本地私服，901为内网
	[900] = {name = "dbx_local", loginAddr = '127.0.0.1', loginPort = 3000, config = 2},
	[901] = {name = "dbx_10", loginAddr = '127.0.0.1', loginPort = 3000, config = 3},
	[902] = {name = "dbx_32", loginAddr = '127.0.0.1', loginPort = 3000, config = 5},
}

--加载数据库配置
function load_dbx_config(buff, db_server_id)	
	local luabuf = tolua.cast(buff, "LuaMsgBuffer")
	if luabuf then
		local server_info = dbx_servers[db_server_id]
		luabuf:pushInt(server_info and server_info.config or 2)
		luabuf:pushInt(server_info and server_info.loginPort or 3000)
		luabuf:pushString(server_info and server_info.loginAddr or "127.0.0.1")
	end
end

