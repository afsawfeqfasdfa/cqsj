--dbx_cfg.lua
-- 大区对应关系 1.QQIOS, 2:QQ安卓, 3:微信IOS, 4:微信安卓
--1-99999 为dbx服务器ID
local dbx_servers = 
{
	--1-799为正式服务器组
--	[1] = {name = "dbx_105W", loginAddr = '127.0.0.1', loginPort = 3000, config = 1, qq_ios = "../resource/config/qqios.conf", qq_android = "../resource/config/qqandroid.conf", winxin_ios = "../resource/config/winxinios.conf", winxin_android = "../resource/config/winxinandroid.conf"},
	--700为版署服务器
	[700] = {name = "dir_217W", loginAddr = '127.0.0.1', loginPort = 3100, config = 1, qq_ios = "../resource/config/qqios.conf", qq_android = "../resource/config/qqandroid.conf", winxin_ios = "../resource/config/winxinios.conf", winxin_android = "../resource/config/winxinandroid.conf"},
	--800后为预发布服务器
	[800] = {name = "dir_12W", loginAddr = '127.0.0.1', loginPort = 3100, config = 1, qq_ios = "../resource/config/qqios.conf", qq_android = "../resource/config/qqandroid.conf", winxin_ios = "../resource/config/winxinios.conf", winxin_android = "../resource/config/winxinandroid.conf"},
	[801] = {name = "dir_105W", loginAddr = '127.0.0.1', loginPort = 3100, config = 1, qq_ios = "../resource/config/qqios.conf", qq_android = "../resource/config/qqandroid.conf", winxin_ios = "../resource/config/winxinios.conf", winxin_android = "../resource/config/winxinandroid.conf"},
	--900为本地私服，901为内网
	[900] = {name = "dir_local", loginAddr = '127.0.0.1', loginPort = 3100, config = 1, qq_ios = "../resource/config/qqios.conf", qq_android = "../resource/config/qqandroid.conf", winxin_ios = "../resource/config/winxinios.conf", winxin_android = "../resource/config/winxinandroid.conf"},
	[901] = {name = "dir_10", loginAddr = '127.0.0.1', loginPort = 3100, config = 1, qq_ios = "../resource/config/qqios.conf", qq_android = "../resource/config/qqandroid.conf", winxin_ios = "../resource/config/winxinios.conf", winxin_android = "../resource/config/winxinandroid.conf"},
	[902] = {name = "dir_32", loginAddr = '127.0.0.1', loginPort = 3100, config = 1, qq_ios = "../resource/config/qqios.conf", qq_android = "../resource/config/qqandroid.conf", winxin_ios = "../resource/config/winxinios.conf", winxin_android = "../resource/config/winxinandroid.conf"},
}

--加载数据库配置
function load_dir_config(buff, db_server_id)	
	local luabuf = tolua.cast(buff, "LuaMsgBuffer")
	if luabuf then
		local server_info = dbx_servers[db_server_id]
		luabuf:pushInt(server_info and server_info.config or 1)
		luabuf:pushInt(server_info and server_info.loginPort or 3100)
		luabuf:pushString(server_info and server_info.loginAddr or "127.0.0.1")
		luabuf:pushString(server_info and server_info.qq_ios or "127.0.0.1")
		luabuf:pushString(server_info and server_info.qq_android or "127.0.0.1")
		luabuf:pushString(server_info and server_info.winxin_ios or "127.0.0.1")
		luabuf:pushString(server_info and server_info.winxin_android or "127.0.0.1")
	end
end

