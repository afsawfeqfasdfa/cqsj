--logger_cfg.lua

--1-99999 为logger服务器ID
local logger_servers = 
{
	[700] = {configId = 1},
	--800后为预发布服务器
	[800] = {configId = 1},
	[801] = {configId = 2},
	--900为本地私服，901为内网
	[900] = {configId = 1},
	[901] = {configId = 1},
	[902] = {configId = 3},
}

--加载数据库配置
function load_logger_config(logger_server_id)
	local server_info = logger_servers[logger_server_id]
	if server_info then
		return server_info.configId
	end
	return 1
end

