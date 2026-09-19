-- 游戏服配置(DBConfig.xml / LogConfig.xml / NameDBConfig.xml)里引用了以下库。
-- longwen / longwen_name 由 01-longwen.sql 提供;这里补齐其余被引用但源机上可能不存在的库。
CREATE DATABASE IF NOT EXISTS logger    DEFAULT CHARACTER SET utf8;
CREATE DATABASE IF NOT EXISTS longwen1  DEFAULT CHARACTER SET utf8;
