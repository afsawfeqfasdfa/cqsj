--center_cfg.lua

--中心服务器配置
center_config = 
{
	[1] = {addr = "<<LAN_IP>>",	port = 20007, game_name = "cqsj",
		game_id = 1009, url = "http://center.cqsj.sdo.com:8080/api.php", app_secret = "<<CENTER_SECRET_1>>"},			--传世中心服务器
	[2] = {addr = "<<LAN_IP>>",	port = 20007, game_name = "lw_ucloud", 
		game_id = 1002, url = "http://gameapi.szkuniu.com:80/api.php", app_secret = "<<CENTER_SECRET_2>>"},			--内部中心服务器
}

--中心服务器数据库配置
mysql_config = 
{	
	[1] = {name = "backtool", user = "root", password = "<<GAME_DB_PASSWORD>>", host = "127.0.0.1", port = 3306},			--传世	
	[2] = {name = "backtool", user = "root", password = "<<GAME_DB_PASSWORD>>", host = "127.0.0.1", port = 3306},			--内部
}

--加载配置
function load_center_config(buff, configid)
	local luabuf = tolua.cast(buff, "LuaMsgBuffer")
	if luabuf then
		luabuf:pushString(center_config[configid].addr)
		luabuf:pushInt(center_config[configid].port)
	end
end
