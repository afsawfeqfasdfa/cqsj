--listen_cfg.lua

--服务器配置
listen_config = 
{
	[1] = {center_addr = "203.195.223.12", center_port = 20007},	--内测测试服务器
}

--开服时间
server_start_date = "2016-10-07 10:00:00"

--加载配置
function load_listen_config(buff, configid)
	local luabuf = tolua.cast(buff, "LuaMsgBuffer")
	if luabuf then
		luabuf:pushString(listen_config[configid].center_addr)
		luabuf:pushInt(listen_config[configid].center_port)
	end
end
