-- MySQL dump 10.13  Distrib 5.6.50, for Linux (x86_64)
--
-- Host: localhost    Database: longwen
-- ------------------------------------------------------
-- Server version	5.6.50-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `longwen`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `longwen` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;

USE `longwen`;

--
-- Table structure for table `GM`
--

DROP TABLE IF EXISTS `GM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GM` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc` varchar(60) DEFAULT NULL,
  `pass` varchar(60) DEFAULT NULL,
  `type` tinyint(4) DEFAULT '0',
  `Skey` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `gm` (`acc`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GM`
--

LOCK TABLES `GM` WRITE;
/*!40000 ALTER TABLE `GM` DISABLE KEYS */;
INSERT INTO `GM` VALUES (1,'<<GM_ACCOUNT_PASSWORD>>','<<GM_ACCOUNT_PASSWORD>>',3,'');
/*!40000 ALTER TABLE `GM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GM_LOG`
--

DROP TABLE IF EXISTS `GM_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GM_LOG` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `a1` varchar(120) DEFAULT NULL,
  `a2` varchar(255) DEFAULT NULL,
  `a3` int(11) DEFAULT '0',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `a4` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GM_LOG`
--

LOCK TABLES `GM_LOG` WRITE;
/*!40000 ALTER TABLE `GM_LOG` DISABLE KEYS */;
INSERT INTO `GM_LOG` VALUES (1,'å‘é€é‚®ä»¶','111ï½œèŽ·å¾—ï½œå…ƒå®',1,'2026-08-27 06:31:55',''),(2,'å‘é€é‚®ä»¶','111ï½œèŽ·å¾—ï½œå…ƒå®',999999,'2026-08-27 06:31:55',''),(3,'å‘é€é‚®ä»¶','111ï½œèŽ·å¾—ï½œå…ƒå®',999999,'2026-08-27 06:31:55',''),(4,'å‘é€é‚®ä»¶','111ï½œèŽ·å¾—ï½œå…ƒå®',999999,'2026-08-27 06:31:55',''),(5,'å‘é€é‚®ä»¶','111ï½œèŽ·å¾—ï½œå…ƒå®',999999,'2026-08-27 06:31:55',''),(6,'å‘é€é‚®ä»¶','111ï½œèŽ·å¾—ï½œå…ƒå®',999999,'2026-08-27 06:31:55',''),(7,'å‘é€é‚®ä»¶','111ï½œèŽ·å¾—ï½œå…ƒå®',999999,'2026-08-27 06:31:55',''),(8,'å¹³å°é‚®ä»¶','ç½—é¸¿å…‰ï½œç‰©å“ï½œ81109',1,'2026-08-27 11:24:47',''),(9,'å¹³å°é‚®ä»¶','ç½—é¸¿å…‰ï½œç‰©å“ï½œ81109',1,'2026-08-27 11:24:50',''),(10,'å¹³å°é‚®ä»¶','ç½—é¸¿å…‰ï½œç‰©å“ï½œ81109',1,'2026-08-27 11:24:57',''),(11,'å¹³å°é‚®ä»¶','ç½—é¸¿å…‰ï½œç‰©å“ï½œ222222',1,'2026-08-27 11:41:42',''),(12,'å¹³å°é‚®ä»¶','ç½—é¸¿å…‰ï½œç‰©å“ï½œ222222',666666,'2026-08-27 11:42:58',''),(13,'å¹³å°é‚®ä»¶','ç½—é¸¿å…‰ï½œç‰©å“ï½œ222222',666666,'2026-08-27 11:43:06',''),(14,'å¹³å°é‚®ä»¶','ç½—é¸¿å…‰ï½œç‰©å“ï½œ222222',666666,'2026-08-27 11:43:11',''),(15,'å¹³å°é‚®ä»¶','ç½—é¸¿å…‰ï½œç‰©å“ï½œ222222',666666,'2026-08-27 11:43:17',''),(16,'å¹³å°é‚®ä»¶','11ï½œç‰©å“ï½œ222222',999999,'2026-08-27 11:47:01',''),(17,'å¹³å°é‚®ä»¶','ç½—é¸¿å…‰ï½œç‰©å“ï½œ222222',666666,'2026-08-27 12:12:59',''),(18,'ä¿®æ”¹ç­‰çº§','ç½—é¸¿å…‰',100,'2026-08-27 12:14:00','');
/*!40000 ALTER TABLE `GM_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Logrecord`
--

DROP TABLE IF EXISTS `Logrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Logrecord` (
  `Account` varchar(100) COLLATE latin1_bin NOT NULL,
  `Address` varchar(100) COLLATE latin1_bin NOT NULL,
  `FromTime` varchar(100) COLLATE latin1_bin NOT NULL,
  `number` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Logrecord`
--

LOCK TABLES `Logrecord` WRITE;
/*!40000 ALTER TABLE `Logrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `Logrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlayerDropItem`
--

DROP TABLE IF EXISTS `PlayerDropItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlayerDropItem` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(2048) NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlayerDropItem`
--

LOCK TABLES `PlayerDropItem` WRITE;
/*!40000 ALTER TABLE `PlayerDropItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `PlayerDropItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlayerMaze`
--

DROP TABLE IF EXISTS `PlayerMaze`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlayerMaze` (
  `RoleID` varchar(32) NOT NULL DEFAULT '',
  `Data` varchar(1024) NOT NULL DEFAULT '',
  `CurState` varchar(1024) NOT NULL DEFAULT '',
  `CurPath` varchar(1024) NOT NULL DEFAULT '',
  `LastIndex` int(11) NOT NULL DEFAULT '-1',
  `MazeType` int(11) NOT NULL DEFAULT '0',
  `DailyPrizeTime` bigint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RoleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlayerMaze`
--

LOCK TABLES `PlayerMaze` WRITE;
/*!40000 ALTER TABLE `PlayerMaze` DISABLE KEYS */;
/*!40000 ALTER TABLE `PlayerMaze` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Player_Pay`
--

DROP TABLE IF EXISTS `Player_Pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Player_Pay` (
  `roleID` varchar(100) COLLATE latin1_bin NOT NULL,
  `Amount` bigint(20) NOT NULL,
  `Time` varchar(100) COLLATE latin1_bin NOT NULL,
  `TIME_DATA` varchar(1000) COLLATE latin1_bin NOT NULL,
  `Name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Skeys` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Player_Pay`
--

LOCK TABLES `Player_Pay` WRITE;
/*!40000 ALTER TABLE `Player_Pay` DISABLE KEYS */;
INSERT INTO `Player_Pay` VALUES ('901188589596976960',5999995,'2026-8-27','26-08-27 02:31:55','','',0);
/*!40000 ALTER TABLE `Player_Pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `achieve`
--

DROP TABLE IF EXISTS `achieve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achieve` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(2048) DEFAULT '',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achieve`
--

LOCK TABLES `achieve` WRITE;
/*!40000 ALTER TABLE `achieve` DISABLE KEYS */;
INSERT INTO `achieve` VALUES ('901188589596976960','þ	‰‘µ¿Ôþ	 ú´¿Ôþ	Ÿø´¿Ôþ	þ°¯¿Ôþ	žõ´¿Ôþ	€û¯¿Ôþ	ˆã¯¿Ôþ	ï´¿Ôþ	›ê´¿Ôþ	—Û´¿Ôþ	™å´¿Ôþ	œì´¿Ôþ	œ	°¿Ôþ	šè´¿Ôþ	þ¶¯¿Ôþ	˜â´¿Ô'),('901188594146753856','þ	—‹·ÀÔþ	þù¶ÀÔþ	þ„·ÀÔ'),('901188594688604672','þ	þûåÀÔ'),('901188595807958464','þ	þÓëÀÔþ	þÍëÀÔ'),('901188596520725056','þ	þïýÀÔþ	þåýÀÔ'),('902314494066965824','þ	þ³·ÀÔþ	þ¬·ÀÔ'),('903440392448123712','þ	þø‰ÀÔþ	þó‰ÀÔ'),('904566292934308032','þ	´¹ŸÀÔþ	þ•›ÀÔþ	€‹œÀÔþ	‰•žÀÔþ	’±žÀÔþ		¶œÀÔþ	þ¦›ÀÔþ	ˆÒ›ÀÔþ	œ	¶œÀÔ'),('904566293838443712','þ	þ¶ÀÔþ	ˆÚ¶ÀÔþ	þ“¶ÀÔ'),('904566293894541824','þ	ˆãîÀÔþ	‹ãîÀÔþ	þ¸ÀÔþ	ŠãîÀÔþ	þâ·ÀÔþ	‰ãîÀÔþ	ŒãîÀÔ');
/*!40000 ALTER TABLE `achieve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `achieveevent`
--

DROP TABLE IF EXISTS `achieveevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achieveevent` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(2048) DEFAULT '""',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achieveevent`
--

LOCK TABLES `achieveevent` WRITE;
/*!40000 ALTER TABLE `achieveevent` DISABLE KEYS */;
INSERT INTO `achieveevent` VALUES ('901188589596976960','þ´þ¹þ¸$þ)þŠãYþ’þ	þªº’þÍ'),('901188594146753856','þ’þ´þ˜þ¸þ€$þª¦þˆÈ!'),('901188594688604672','þ´þˆ þþþ'),('901188595807958464','þ’þ´þ¸þ€$þª¦þˆþ'),('901188596520725056','þ’þ´þ¸þ€#þªúþˆ“!'),('902314494066965824','þ’þ´þ€#þªúþˆé '),('902314496335822016','þˆ´þþ'),('902314496418390400','þˆ´þþ'),('903440392448123712','þ’þ´þ¸þ€#þªúþˆþ!'),('903440393981672768','þˆ´þþ'),('904566292934308032','þµþ¹þ¸Vþ+þŠ‘hþ“þÍþž	þªŽˆþÂþÅ'),('904566293838443712','þ’þ´þ¸þ€&þ‰Ø;þªÒ'),('904566293894541824','þ’þ´þªŽþ¸þ€#þˆÍ!þýŠ');
/*!40000 ALTER TABLE `achieveevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activecode`
--

DROP TABLE IF EXISTS `activecode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activecode` (
  `code` varchar(64) NOT NULL,
  `status` int(4) DEFAULT '0',
  `openid` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activecode`
--

LOCK TABLES `activecode` WRITE;
/*!40000 ALTER TABLE `activecode` DISABLE KEYS */;
/*!40000 ALTER TABLE `activecode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `modelID` int(4) NOT NULL COMMENT '??ID',
  `activityID` int(4) NOT NULL COMMENT '??ID',
  `datas` varchar(2048) NOT NULL,
  PRIMARY KEY (`roleID`,`modelID`,`activityID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES ('901188589596976960',3,4,'\Z;{status={[10]=0,[50]=1,[40]=0,[70]=1,[20]=0,[60]=1,[30]=0}}'),('901188589596976960',4,2,'\Z	þþ\Z !þ#$%&þ()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[þ]^_`aþþþþþþþþþþþüþþþþþþþþþþþþþþþþþþþýþþþþþþþþþþ)þãYþþþþþþ	þþþþþþþþþþþþþþþþþþþ\Zþþþþþþþþþþþþþþþþþþþþþþ'),('901188594146753856',3,4,'\Z;{status={[10]=0,[50]=1,[40]=1,[70]=1,[20]=0,[60]=1,[30]=0}}'),('901188594146753856',4,2,'\Z	þþ\Z !þ#$%&þ()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[þ]^_`aþþþþþþþþþþþüþþþþþþþþþþþþþþþþþþþýþþþþþþþþþþ$þÈ!þþþþþþ	þþþþþþþþþþþþþþþþþþþ\Zþþþþþþþþþþþþþþþþþþþþþþ'),('901188594688604672',3,4,'\Z;{status={[10]=0,[50]=1,[40]=1,[70]=1,[20]=0,[60]=1,[30]=1}}'),('901188594688604672',4,2,'\Z	þþ\Z !þ#$%&þ()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[þ]^_`aþþþþþþþþþþþüþþþþþþþþþþþþþþþþþþþýþþþþþþþþþþþ þþþþþþþ	þþþþþþþþþþþþþþþþþþþ\Zþþþþþþþþþþþþþþþþþþþþþþ'),('901188595807958464',3,4,'\Z;{status={[10]=0,[50]=1,[40]=1,[70]=1,[20]=0,[60]=1,[30]=0}}'),('901188595807958464',4,2,'\Z	þþ\Z !þ#$%&þ()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[þ]^_`aþþþþþþþþþþþüþþþþþþþþþþþþþþþþþþþýþþþþþþþþþþ$þþþþþþþþ	þþþþþþþþþþþþþþþþþþþ\Zþþþþþþþþþþþþþþþþþþþþþþ'),('901188596520725056',3,4,'\Z;{status={[10]=0,[50]=1,[40]=1,[70]=1,[20]=0,[60]=1,[30]=0}}'),('901188596520725056',4,2,'\Z‘	þþ\Z !þ#$%&þ()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[þ]^_`aþþþþþþþþþþþüþþþþþþþþþþþþþþþþþþþýþþþþþþþþþþ#þ“!þþþþþþ	þþþþþþþþþþþþþþþþþþþ\Zþþþþþþþþþþþþþþþþþþþþþþ'),('902314494066965824',3,4,'\Z;{status={[10]=0,[50]=1,[40]=1,[70]=1,[20]=0,[60]=1,[30]=0}}'),('902314494066965824',4,2,'\Z‘	þþ\Z !þ#$%&þ()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[þ]^_`aþþþþþþþþþþþüþþþþþþþþþþþþþþþþþþþýþþþþþþþþþþ#þé þþþþþþ	þþþþþþþþþþþþþþþþþþþ\Zþþþþþþþþþþþþþþþþþþþþþþ'),('902314496335822016',4,2,'\ZŠ	þþ\Z !þ#$%&þ()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[þ]^_`aþþþþþþþþþþþüþþþþþþþþþþþþþþþþþþþýþþþþþþþþþþþþþþþþþ	þþþþþþþþþþþþþþþþþþþ\Zþþþþþþþþþþþþþþþþþþþþþþ'),('902314496418390400',4,2,'\ZŠ	þþ\Z !þ#$%&þ()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[þ]^_`aþþþþþþþþþþþüþþþþþþþþþþþþþþþþþþþýþþþþþþþþþþþþþþþþþ	þþþþþþþþþþþþþþþþþþþ\Zþþþþþþþþþþþþþþþþþþþþþþ'),('903440392448123712',3,4,'\Z;{status={[10]=0,[50]=1,[40]=1,[70]=1,[20]=0,[60]=1,[30]=0}}'),('903440392448123712',4,2,'\Z‘	þþ\Z !þ#$%&þ()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[þ]^_`aþþþþþþþþþþþüþþþþþþþþþþþþþþþþþþþýþþþþþþþþþþ#þþ!þþþþþþ	þþþþþþþþþþþþþþþþþþþ\Zþþþþþþþþþþþþþþþþþþþþþþ'),('903440393981672768',4,2,'\ZŠ	þþ\Z !þ#$%&þ()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[þ]^_`aþþþþþþþþþþþüþþþþþþþþþþþþþþþþþþþýþþþþþþþþþþþþþþþþþ	þþþþþþþþþþþþþþþþþþþ\Zþþþþþþþþþþþþþþþþþþþþþþ'),('904566292934308032',3,4,'\Z;{status={[10]=0,[50]=1,[40]=0,[70]=1,[20]=0,[60]=1,[30]=0}}'),('904566292934308032',4,2,'\Z÷	þþ\Z !þ#$%&þ()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[þ]^_`aþþþþþþþþþþþüþþþþþþþþþþþþþþþþþþþýþþþþþþþþþþ+þ‘hþþþþþþ	þþþþþþþþþþþþþþþþþþþ\Zþþþþþþþþþþþþþþþþþþþþþþ'),('904566293838443712',3,4,'\Z;{status={[10]=0,[50]=1,[40]=1,[70]=1,[20]=0,[60]=1,[30]=0}}'),('904566293838443712',4,2,'\Z‹	þþ\Z !þ#$%&þ()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[þ]^_`aþþþþþþþþþþþüþþþþþþþþþþþþþþþþþþþýþþþþþþþþþþ&þØ;þþþþþþ	þþþþþþþþþþþþþþþþþþþ\Zþþþþþþþþþþþþþþþþþþþþþþ'),('904566293894541824',3,4,'\Z;{status={[10]=0,[50]=1,[40]=1,[70]=1,[20]=0,[60]=1,[30]=0}}'),('904566293894541824',4,2,'\Z„	þþ\Z !þ#$%&þ()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[þ]^_`aþþþþþþþþþþþüþþþþþþþþþþþþþþþþþþþýþþþþþþþþþþ#þýŠþþþþþþ	þþþþþþþþþþþþþþþþþþþ\Zþþþþþþþþþþþþþþþþþþþþþþ');
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_list`
--

DROP TABLE IF EXISTS `activity_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_list` (
  `activityID` varchar(64) NOT NULL DEFAULT '' COMMENT '??ID',
  `gameActivityID` int(4) NOT NULL COMMENT '??ID',
  `datas` varchar(8192) NOT NULL,
  PRIMARY KEY (`activityID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_list`
--

LOCK TABLES `activity_list` WRITE;
/*!40000 ALTER TABLE `activity_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_normal`
--

DROP TABLE IF EXISTS `activity_normal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_normal` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_normal`
--

LOCK TABLES `activity_normal` WRITE;
/*!40000 ALTER TABLE `activity_normal` DISABLE KEYS */;
INSERT INTO `activity_normal` VALUES ('901188589596976960','ÛÏÔ	* Ø¯¿Ô8Ø¯¿Ô* ¶¯¿Ô8¶¯¿Ô* °¯¿Ô8°¯¿Ô\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Ze\Zh\Zg\Zf$þFþþ2'),('901188594146753856','ÛÏÔ	* —·ÀÔ8—·ÀÔ* „·ÀÔ8„·ÀÔ* ù¶ÀÔ8ù¶ÀÔ\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Ze\Zh\Zg\ZfþFþþ2'),('901188594688604672','ÛÏÔ	*ûåÀÔ8ûåÀÔ*ûåÀÔ8ûåÀÔ* ûåÀÔ8ûåÀÔ\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Ze\Zh\Zg\ZfþFþþ2'),('901188595807958464','ÛÏÔ	* ÀîÀÔ8ÀîÀÔ* ÓëÀÔ8ÓëÀÔ* ÍëÀÔ8ÍëÀÔ\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Ze\Zh\Zg\ZfþFþþ2'),('901188596520725056','ÛÏÔ	*ïýÀÔ8ïýÀÔ* ïýÀÔ8ïýÀÔ* åýÀÔ8åýÀÔ\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Ze\Zh\Zg\ZfþFþþ2'),('902314494066965824','ÛÏÔ	*³·ÀÔ8³·ÀÔ* ³·ÀÔ8³·ÀÔ* ¬·ÀÔ8¬·ÀÔ\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Ze\Zh\Zg\ZfþFþþ2'),('903440392448123712','ÛÏÔ	*ø‰ÀÔ8ø‰ÀÔ* ø‰ÀÔ8ø‰ÀÔ* ó‰ÀÔ8ó‰ÀÔ\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Ze\Zh\Zg\ZfþFþþ2'),('904566292934308032','ÛÏÔ	* À›ÀÔ8À›ÀÔ* ¦›ÀÔ8¦›ÀÔ* •›ÀÔ8•›ÀÔ\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Ze\Zh\Zg\Zf4þFþþ2'),('904566293838443712','ÛÏÔ	* §¶ÀÔ8§¶ÀÔ* “¶ÀÔ8“¶ÀÔ* ¶ÀÔ8¶ÀÔ\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Ze\Zh\Zg\ZfþFþþ2'),('904566293894541824','ÛÏÔ	*¸ÀÔ8¸ÀÔ* ¸ÀÔ8ùïÀÔ* â·ÀÔ8ùïÀÔ\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Ze\Zh\Zg\ZfþFþþ2');
/*!40000 ALTER TABLE `activity_normal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adore`
--

DROP TABLE IF EXISTS `adore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adore` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) NOT NULL DEFAULT '""',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adore`
--

LOCK TABLES `adore` WRITE;
/*!40000 ALTER TABLE `adore` DISABLE KEYS */;
INSERT INTO `adore` VALUES ('901188589596976960','þ({remainTime=0,remainIngotTime=0,stamp=0}'),('901188594146753856','þ({remainTime=0,remainIngotTime=0,stamp=0}'),('901188594688604672','þ({remainTime=0,remainIngotTime=0,stamp=0}'),('901188595807958464','þ({remainTime=0,remainIngotTime=0,stamp=0}'),('901188596520725056','þ({remainTime=0,remainIngotTime=0,stamp=0}'),('902314494066965824','þ({remainTime=0,remainIngotTime=0,stamp=0}'),('902314496335822016','þ({remainTime=0,remainIngotTime=0,stamp=0}'),('902314496418390400','þ({remainTime=0,remainIngotTime=0,stamp=0}'),('903440392448123712','þ({remainTime=0,remainIngotTime=0,stamp=0}'),('903440393981672768','þ({remainTime=0,remainIngotTime=0,stamp=0}'),('904566292934308032','þ({remainTime=0,remainIngotTime=0,stamp=0}'),('904566293838443712','þ({remainTime=0,remainIngotTime=0,stamp=0}'),('904566293894541824','þ({remainTime=0,remainIngotTime=0,stamp=0}');
/*!40000 ALTER TABLE `adore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bossinfo`
--

DROP TABLE IF EXISTS `bossinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bossinfo` (
  `ModelId` int(11) NOT NULL DEFAULT '0',
  `MapId` int(11) NOT NULL DEFAULT '0',
  `Event` int(11) NOT NULL DEFAULT '0',
  `EvtTime` datetime DEFAULT NULL,
  `EvtValue1` int(11) DEFAULT NULL,
  PRIMARY KEY (`ModelId`,`MapId`,`Event`) USING BTREE,
  KEY `MapId` (`MapId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bossinfo`
--

LOCK TABLES `bossinfo` WRITE;
/*!40000 ALTER TABLE `bossinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `bossinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buff`
--

DROP TABLE IF EXISTS `buff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buff` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) NOT NULL DEFAULT '',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buff`
--

LOCK TABLES `buff` WRITE;
/*!40000 ALTER TABLE `buff` DISABLE KEYS */;
INSERT INTO `buff` VALUES ('901188589596976960',''),('901188594146753856',''),('901188594688604672',''),('901188595807958464',''),('901188596520725056','þþcg ¹œ'),('902314494066965824','þþcg ¹œ'),('902314496335822016','þ”dñ5'),('902314496418390400','þ”dŒ8'),('903440392448123712','þþcg ¹œ'),('903440393981672768','þ”d˜8'),('904566292934308032',''),('904566293838443712',''),('904566293894541824','');
/*!40000 ALTER TABLE `buff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common`
--

DROP TABLE IF EXISTS `common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common`
--

LOCK TABLES `common` WRITE;
/*!40000 ALTER TABLE `common` DISABLE KEYS */;
INSERT INTO `common` VALUES ('901188589596976960','@8ÛÏÔ	ç’ÿz'),('901188594146753856','@8ÛÏÔ	’ÿz'),('901188594688604672','@8ÛÏÔ	’ÿz'),('901188595807958464','@8ÛÏÔ	’z'),('901188596520725056','@8ÛÏÔ	’z'),('902314494066965824','@8ÛÏÔ	’z'),('902314496335822016','@8ÛÏÔ	’ÿz'),('902314496418390400','@8ÛÏÔ	’ÿz'),('903440392448123712','@8ÛÏÔ	’z'),('903440393981672768','@8ÛÏÔ	’ÿz'),('904566292934308032','@8ÛÏÔ	ç’z'),('904566293838443712','@8ÛÏÔ	’ÿz'),('904566293894541824','@8ÛÏÔ	ç’ÿz');
/*!40000 ALTER TABLE `common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commondata`
--

DROP TABLE IF EXISTS `commondata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commondata` (
  `worldID` int(11) NOT NULL,
  `dataID` int(11) NOT NULL,
  `dataValue` varchar(2048) NOT NULL,
  PRIMARY KEY (`worldID`,`dataID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commondata`
--

LOCK TABLES `commondata` WRITE;
/*!40000 ALTER TABLE `commondata` DISABLE KEYS */;
INSERT INTO `commondata` VALUES (800,16,'{[6052]=2,[515]=2,[6053]=2,[85158]=2,[6003]=2,[6005]=2,[54162]=2,[6007]=2,[516]=2,[6001]=2,[18310]=2,[6002]=2,[6004]=2,[6051]=2,[6006]=2,[6008]=2}'),(800,21,'{blackTick=20260827,black={{[1]={{price=30000,prob=8888,itemID=9906,limit=10,num=10,isBind=1,spe=0,roleLimit=1,sellnum=10},{price=30000,prob=8888,itemID=9935,limit=10,num=10,isBind=1,spe=0,roleLimit=1,sellnum=10},{price=30000,prob=8888,itemID=9972,limit=10,num=10,isBind=1,spe=0,roleLimit=1,sellnum=10},{price=30000,prob=8888,itemID=9971,limit=10,num=10,isBind=1,spe=0,roleLimit=1,sellnum=10},{price=30000,prob=8888,itemID=9934,limit=10,num=10,isBind=1,spe=0,roleLimit=1,sellnum=10},{price=100,prob=500,itemID=1402,limit=2000,num=2000,isBind=1,spe=0,roleLimit=200,sellnum=2000},{price=100,prob=500,itemID=1679,limit=1000,num=1000,isBind=1,spe=0,roleLimit=50,sellnum=1000},{price=100,prob=500,itemID=1680,limit=1000,num=1000,isBind=1,spe=0,roleLimit=50,sellnum=1000}},lmax=999}},blackRH=12}'),(801,16,'{[6052]=2,[515]=2,[6053]=2,[85158]=2,[6003]=2,[6005]=2,[54162]=2,[6007]=2,[516]=2,[6001]=2,[18310]=2,[6002]=2,[6004]=2,[6051]=2,[6006]=2,[6008]=2}'),(801,21,'{blackTick=20260827,black={{[1]={{price=30000,prob=8888,itemID=9972,limit=10,num=10,isBind=1,spe=0,roleLimit=1,sellnum=10},{price=99999,prob=500,itemID=1017,limit=500,num=500,isBind=1,spe=0,roleLimit=10,sellnum=500},{price=30000,prob=8888,itemID=9934,limit=10,num=10,isBind=1,spe=0,roleLimit=1,sellnum=10},{price=30000,prob=8888,itemID=9971,limit=10,num=10,isBind=1,spe=0,roleLimit=1,sellnum=10},{price=30000,prob=8888,itemID=9935,limit=10,num=10,isBind=1,spe=0,roleLimit=1,sellnum=10},{price=30000,prob=8888,itemID=9906,limit=10,num=10,isBind=1,spe=0,roleLimit=1,sellnum=10},{price=100,prob=500,itemID=1403,limit=1000,num=1000,isBind=1,spe=0,roleLimit=300,sellnum=1000},{price=100,prob=500,itemID=1402,limit=2000,num=2000,isBind=1,spe=0,roleLimit=200,sellnum=2000}},lmax=999}},blackRH=12}'),(802,16,'{[6052]=2,[515]=2,[6053]=2,[85158]=2,[6003]=2,[6005]=2,[54162]=2,[6007]=2,[516]=2,[6001]=2,[18310]=2,[6002]=2,[6004]=2,[6051]=2,[6006]=2,[6008]=2}'),(802,21,'{blackTick=20260827,black={{[1]={{price=30000,prob=8888,itemID=9972,limit=10,num=10,isBind=1,spe=0,roleLimit=1,sellnum=10},{price=99999,prob=500,itemID=1017,limit=500,num=500,isBind=1,spe=0,roleLimit=10,sellnum=500},{price=30000,prob=8888,itemID=9934,limit=10,num=10,isBind=1,spe=0,roleLimit=1,sellnum=10},{price=30000,prob=8888,itemID=9971,limit=10,num=10,isBind=1,spe=0,roleLimit=1,sellnum=10},{price=30000,prob=8888,itemID=9935,limit=10,num=10,isBind=1,spe=0,roleLimit=1,sellnum=10},{price=30000,prob=8888,itemID=9906,limit=10,num=10,isBind=1,spe=0,roleLimit=1,sellnum=10},{price=100,prob=500,itemID=1403,limit=1000,num=1000,isBind=1,spe=0,roleLimit=300,sellnum=1000},{price=100,prob=500,itemID=1402,limit=2000,num=2000,isBind=1,spe=0,roleLimit=200,sellnum=2000}},lmax=999}},blackRH=12}'),(803,16,'{[6052]=2,[515]=2,[6053]=2,[85158]=2,[6003]=2,[6005]=2,[54162]=2,[6007]=2,[516]=2,[6001]=2,[18310]=2,[6002]=2,[6004]=2,[6051]=2,[6006]=2,[6008]=2}'),(803,21,'{blackTick=20260827,black={{[1]={{price=30000,prob=8888,itemID=9906,limit=10,num=10,isBind=1,spe=0,roleLimit=1,sellnum=10},{price=30000,prob=8888,itemID=9971,limit=10,num=10,isBind=1,spe=0,roleLimit=1,sellnum=10},{price=30000,prob=8888,itemID=9934,limit=10,num=10,isBind=1,spe=0,roleLimit=1,sellnum=10},{price=30000,prob=8888,itemID=9935,limit=10,num=10,isBind=1,spe=0,roleLimit=1,sellnum=10},{price=30000,prob=8888,itemID=9972,limit=10,num=10,isBind=1,spe=0,roleLimit=1,sellnum=10},{price=100,prob=500,itemID=1402,limit=2000,num=2000,isBind=1,spe=0,roleLimit=200,sellnum=2000},{price=100,prob=500,itemID=1403,limit=1000,num=1000,isBind=1,spe=0,roleLimit=300,sellnum=1000},{price=100,prob=500,itemID=1679,limit=1000,num=1000,isBind=1,spe=0,roleLimit=50,sellnum=1000}},lmax=999}},blackRH=12}');
/*!40000 ALTER TABLE `commondata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competition`
--

DROP TABLE IF EXISTS `competition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competition` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '"0"',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competition`
--

LOCK TABLES `competition` WRITE;
/*!40000 ALTER TABLE `competition` DISABLE KEYS */;
INSERT INTO `competition` VALUES ('901188589596976960','*{}'),('901188594146753856','*{}'),('901188594688604672','*{}'),('901188595807958464','*{}'),('901188596520725056','*{}'),('902314494066965824','*{}'),('902314496335822016','*{}'),('902314496418390400','*{}'),('903440392448123712','*{}'),('903440393981672768','*{}'),('904566292934308032','*{}'),('904566293838443712','*{}'),('904566293894541824','*{}');
/*!40000 ALTER TABLE `competition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copyreward`
--

DROP TABLE IF EXISTS `copyreward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `copyreward` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `idx` int(10) NOT NULL DEFAULT '0',
  `datas` varchar(1024) NOT NULL DEFAULT '""',
  PRIMARY KEY (`roleID`,`idx`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copyreward`
--

LOCK TABLES `copyreward` WRITE;
/*!40000 ALTER TABLE `copyreward` DISABLE KEYS */;
/*!40000 ALTER TABLE `copyreward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copystarprize`
--

DROP TABLE IF EXISTS `copystarprize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `copystarprize` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `type` int(4) NOT NULL,
  `datas` varchar(1024) NOT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copystarprize`
--

LOCK TABLES `copystarprize` WRITE;
/*!40000 ALTER TABLE `copystarprize` DISABLE KEYS */;
/*!40000 ALTER TABLE `copystarprize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digmine`
--

DROP TABLE IF EXISTS `digmine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `digmine` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) DEFAULT NULL COMMENT '????',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digmine`
--

LOCK TABLES `digmine` WRITE;
/*!40000 ALTER TABLE `digmine` DISABLE KEYS */;
INSERT INTO `digmine` VALUES ('901188589596976960',' §¯¿Ôª‘ÀÔ'),('901188594146753856',' ó¶ÀÔÛúÀÔ'),('901188594688604672',' …ÇÀÔžèÀÔ'),('901188595807958464',' ¹èÀÔÇîÀÔ'),('901188596520725056',' ÓýÀÔ÷ýÀÔ'),('902314494066965824',' ¦·ÀÔ¹·ÀÔ'),('902314496335822016',' õúÀÔ¤ýÀÔ'),('902314496418390400',' ¯ýÀÔÃýÀÔ'),('903440392448123712',' ê‰ÀÔ€ŠÀÔ'),('903440393981672768',' Ã·ÀÔË·ÀÔ'),('904566292934308032',' ›ÀÔ´µÀÔ'),('904566293838443712',' …¶ÀÔ·ÙÀÔ'),('904566293894541824',' Ú·ÀÔîúÀÔ');
/*!40000 ALTER TABLE `digmine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `droplimit`
--

DROP TABLE IF EXISTS `droplimit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `droplimit` (
  `itemID` int(11) NOT NULL,
  `dropCnt` int(11) NOT NULL DEFAULT '0',
  `dropPeriod` int(11) DEFAULT NULL,
  `timeTick` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `droplimit`
--

LOCK TABLES `droplimit` WRITE;
/*!40000 ALTER TABLE `droplimit` DISABLE KEYS */;
/*!40000 ALTER TABLE `droplimit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `emailIndex` varchar(64) NOT NULL DEFAULT '0',
  `datas` varchar(1024) NOT NULL,
  PRIMARY KEY (`roleID`,`emailIndex`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envoyinfo`
--

DROP TABLE IF EXISTS `envoyinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `envoyinfo` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) NOT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envoyinfo`
--

LOCK TABLES `envoyinfo` WRITE;
/*!40000 ALTER TABLE `envoyinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `envoyinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchangelog`
--

DROP TABLE IF EXISTS `exchangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exchangelog` (
  `exchange_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_id` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `role_name` varchar(64) NOT NULL COMMENT '角色名称',
  `item_id` int(11) NOT NULL DEFAULT '0' COMMENT '物品ID',
  `num` int(11) DEFAULT '0' COMMENT '数量',
  `remain` int(11) DEFAULT NULL COMMENT '剩余',
  `type` int(4) NOT NULL DEFAULT '0' COMMENT '类型：1 入账 2 出账',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`exchange_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT COMMENT='积分兑换表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchangelog`
--

LOCK TABLES `exchangelog` WRITE;
/*!40000 ALTER TABLE `exchangelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `exchangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faction`
--

DROP TABLE IF EXISTS `faction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faction` (
  `factionID` int(11) NOT NULL,
  `world` int(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `leaderID` varchar(32) NOT NULL DEFAULT '',
  `leaderName` varchar(100) NOT NULL,
  `bannerLvl` int(11) DEFAULT '1',
  `xp` int(11) DEFAULT '1',
  `money` int(11) DEFAULT '0',
  `level` int(11) DEFAULT '1',
  `autoJoin` int(11) DEFAULT '0',
  `createTime` int(11) NOT NULL,
  `assLeaderNum` int(11) DEFAULT '0',
  `allMemberCnt` int(11) DEFAULT '1',
  `comment` varchar(1024) DEFAULT NULL,
  `ability` int(11) DEFAULT '0',
  `statueNum` int(11) DEFAULT '0',
  `statueTime` int(11) DEFAULT NULL,
  `apply` varchar(2048) DEFAULT NULL,
  `commandid` varchar(32) DEFAULT '0' COMMENT '???ID',
  `timeTick` int(11) NOT NULL DEFAULT '0',
  `openId` varchar(32) NOT NULL DEFAULT '""',
  PRIMARY KEY (`factionID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faction`
--

LOCK TABLES `faction` WRITE;
/*!40000 ALTER TABLE `faction` DISABLE KEYS */;
/*!40000 ALTER TABLE `faction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factioncontrird`
--

DROP TABLE IF EXISTS `factioncontrird`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factioncontrird` (
  `FactionID` int(11) NOT NULL DEFAULT '0',
  `RoleID` varchar(32) NOT NULL DEFAULT '',
  `RoleName` varchar(50) DEFAULT NULL,
  `ContriTime` int(11) DEFAULT NULL,
  `ContriNum` int(11) DEFAULT NULL,
  `FacMoneyBefore` int(11) DEFAULT NULL,
  `FacMoneyAfter` int(11) DEFAULT NULL,
  PRIMARY KEY (`FactionID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factioncontrird`
--

LOCK TABLES `factioncontrird` WRITE;
/*!40000 ALTER TABLE `factioncontrird` DISABLE KEYS */;
/*!40000 ALTER TABLE `factioncontrird` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factioncopy`
--

DROP TABLE IF EXISTS `factioncopy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factioncopy` (
  `factionID` int(11) NOT NULL,
  `datas` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`factionID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factioncopy`
--

LOCK TABLES `factioncopy` WRITE;
/*!40000 ALTER TABLE `factioncopy` DISABLE KEYS */;
/*!40000 ALTER TABLE `factioncopy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factionname`
--

DROP TABLE IF EXISTS `factionname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factionname` (
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user` varchar(32) NOT NULL DEFAULT '0',
  `server` int(11) NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factionname`
--

LOCK TABLES `factionname` WRITE;
/*!40000 ALTER TABLE `factionname` DISABLE KEYS */;
/*!40000 ALTER TABLE `factionname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factionsocial`
--

DROP TABLE IF EXISTS `factionsocial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factionsocial` (
  `SocialID` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `WorldID` int(11) NOT NULL,
  `AFactionID` int(11) NOT NULL,
  `BFactionID` int(11) NOT NULL,
  `State` int(11) NOT NULL DEFAULT '0',
  `OpRoleID` varchar(32) NOT NULL DEFAULT '',
  `OpFactionID` int(11) NOT NULL DEFAULT '0',
  `OpTime` bigint(11) NOT NULL DEFAULT '0',
  `AFactionOpTime` bigint(11) NOT NULL DEFAULT '0',
  `BFactionOpTime` bigint(11) NOT NULL DEFAULT '0',
  `Reserved` varchar(1024) NOT NULL DEFAULT '',
  `UpdateTime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`SocialID`) USING BTREE,
  KEY `WorldID` (`WorldID`) USING BTREE,
  KEY `AFactionID` (`AFactionID`) USING BTREE,
  KEY `BFactionID` (`BFactionID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factionsocial`
--

LOCK TABLES `factionsocial` WRITE;
/*!40000 ALTER TABLE `factionsocial` DISABLE KEYS */;
/*!40000 ALTER TABLE `factionsocial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factiontask`
--

DROP TABLE IF EXISTS `factiontask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factiontask` (
  `factionID` int(11) NOT NULL,
  `datas` varchar(2048) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`factionID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factiontask`
--

LOCK TABLES `factiontask` WRITE;
/*!40000 ALTER TABLE `factiontask` DISABLE KEYS */;
/*!40000 ALTER TABLE `factiontask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fightteam`
--

DROP TABLE IF EXISTS `fightteam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fightteam` (
  `fightID` int(11) NOT NULL,
  `world` int(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `leaderID` varchar(32) NOT NULL DEFAULT '',
  `leaderName` varchar(100) NOT NULL,
  `winNum` int(11) DEFAULT '1',
  `loseNum` int(11) DEFAULT '1',
  PRIMARY KEY (`fightID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fightteam`
--

LOCK TABLES `fightteam` WRITE;
/*!40000 ALTER TABLE `fightteam` DISABLE KEYS */;
/*!40000 ALTER TABLE `fightteam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fightteam3v3`
--

DROP TABLE IF EXISTS `fightteam3v3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fightteam3v3` (
  `world` int(11) NOT NULL,
  `data` varchar(4098) DEFAULT '',
  PRIMARY KEY (`world`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fightteam3v3`
--

LOCK TABLES `fightteam3v3` WRITE;
/*!40000 ALTER TABLE `fightteam3v3` DISABLE KEYS */;
/*!40000 ALTER TABLE `fightteam3v3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fightteammem`
--

DROP TABLE IF EXISTS `fightteammem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fightteammem` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `fightID` int(10) NOT NULL DEFAULT '0',
  `datas` varchar(1024) NOT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fightteammem`
--

LOCK TABLES `fightteammem` WRITE;
/*!40000 ALTER TABLE `fightteammem` DISABLE KEYS */;
/*!40000 ALTER TABLE `fightteammem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fightteamname`
--

DROP TABLE IF EXISTS `fightteamname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fightteamname` (
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user` varchar(32) NOT NULL DEFAULT '0',
  `server` int(11) NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fightteamname`
--

LOCK TABLES `fightteamname` WRITE;
/*!40000 ALTER TABLE `fightteamname` DISABLE KEYS */;
/*!40000 ALTER TABLE `fightteamname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gameset`
--

DROP TABLE IF EXISTS `gameset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameset` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) NOT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gameset`
--

LOCK TABLES `gameset` WRITE;
/*!40000 ALTER TABLE `gameset` DISABLE KEYS */;
INSERT INTO `gameset` VALUES ('901188589596976960','Ÿ'),('901188594146753856','Ÿ'),('901188594688604672','Ÿ'),('901188595807958464','Ÿ'),('901188596520725056','Ÿ'),('902314494066965824','Ÿ'),('902314496335822016','Ÿ'),('902314496418390400','Ÿ'),('903440392448123712','Ÿ'),('903440393981672768','Ÿ'),('904566292934308032','Ÿ'),('904566293838443712','Ÿ'),('904566293894541824','Ÿ');
/*!40000 ALTER TABLE `gameset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghost`
--

DROP TABLE IF EXISTS `ghost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ghost` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleID` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `UserID` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `From_IP` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `From_ADD` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `From_AT` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `UPTIME_NUM` bigint(20) NOT NULL,
  `UPTIME_TIME` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Results` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `From_AT_UP` varchar(1000) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghost`
--

LOCK TABLES `ghost` WRITE;
/*!40000 ALTER TABLE `ghost` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giveflower`
--

DROP TABLE IF EXISTS `giveflower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giveflower` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) NOT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giveflower`
--

LOCK TABLES `giveflower` WRITE;
/*!40000 ALTER TABLE `giveflower` DISABLE KEYS */;
INSERT INTO `giveflower` VALUES ('901188589596976960','{t=26744,allGlamour=0,r={},g={0,0,0,0}}'),('901188594146753856','{t=20260827,allGlamour=0,r={},g={0,0,0,0}}'),('901188594688604672','{t=49587,allGlamour=0,r={},g={0,0,0,0}}'),('901188595807958464','{t=62265,allGlamour=0,r={},g={0,0,0,0}}'),('901188596520725056','{t=6709,allGlamour=0,r={},g={0,0,0,0}}'),('902314494066965824','{t=73118,allGlamour=0,r={},g={0,0,0,0}}'),('902314496335822016','{t=57253,allGlamour=0,r={},g={0,0,0,0}}'),('902314496418390400','{t=8187,allGlamour=0,r={},g={0,0,0,0}}'),('903440392448123712','{t=34452,allGlamour=0,r={},g={0,0,0,0}}'),('903440393981672768','{t=73118,allGlamour=0,r={},g={0,0,0,0}}'),('904566292934308032','{t=45236,allGlamour=0,r={},g={0,0,0,0}}'),('904566293894541824','{t=20260827,allGlamour=0,r={},g={0,0,0,0}}');
/*!40000 ALTER TABLE `giveflower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `givefloweroffline`
--

DROP TABLE IF EXISTS `givefloweroffline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `givefloweroffline` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) NOT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `givefloweroffline`
--

LOCK TABLES `givefloweroffline` WRITE;
/*!40000 ALTER TABLE `givefloweroffline` DISABLE KEYS */;
/*!40000 ALTER TABLE `givefloweroffline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `givewine`
--

DROP TABLE IF EXISTS `givewine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `givewine` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) NOT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `givewine`
--

LOCK TABLES `givewine` WRITE;
/*!40000 ALTER TABLE `givewine` DISABLE KEYS */;
INSERT INTO `givewine` VALUES ('901188589596976960','{d={20260827,0,0,0,0,0,0}}'),('901188594146753856','{d={20260827,0,0,0,0,0,0}}'),('901188594688604672','{d={20260827,0,0,0,0,0,0}}'),('901188595807958464','{d={20260827,0,0,0,0,0,0}}'),('901188596520725056','{d={20260827,0,0,0,0,0,0}}'),('902314494066965824','{d={20260827,0,0,0,0,0,0}}'),('902314496335822016','{d={20260827,0,0,0,0,0,0}}'),('902314496418390400','{d={20260827,0,0,0,0,0,0}}'),('903440392448123712','{d={20260827,0,0,0,0,0,0}}'),('903440393981672768','{d={20260827,0,0,0,0,0,0}}'),('904566292934308032','{d={20260827,0,0,0,0,0,0}}'),('904566293838443712','{d={20260827,0,0,0,0,0,0}}'),('904566293894541824','{d={20260827,0,0,0,0,0,0}}');
/*!40000 ALTER TABLE `givewine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalemail`
--

DROP TABLE IF EXISTS `globalemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalemail` (
  `emailID` varchar(64) NOT NULL,
  `worldID` int(11) NOT NULL,
  `startTime` int(11) NOT NULL,
  `endTime` int(11) NOT NULL,
  `minLevel` int(11) NOT NULL,
  `maxLevel` int(11) NOT NULL,
  `school` int(5) NOT NULL,
  `datas` varchar(1024) NOT NULL,
  PRIMARY KEY (`emailID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalemail`
--

LOCK TABLES `globalemail` WRITE;
/*!40000 ALTER TABLE `globalemail` DISABLE KEYS */;
/*!40000 ALTER TABLE `globalemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `groupIndex` int(10) NOT NULL,
  `datas` varchar(2048) NOT NULL DEFAULT '"0"',
  PRIMARY KEY (`roleID`,`groupIndex`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES ('901188589596976960',100,'dþ\ZPZ00C0BA953407830Cþà¹˜È‚ÃÈšþ šþRR@Rþ\ZR\ZRR\Z=Z0000B7953407830CÓÞ¹˜0RöRRERR\ZQZ00C0BE953407830CÓÞ¹˜€€€þ þþþþRRRRERR\Z=Z0040BB953407830CÓ“¹˜`R’RRRRþ\ZBZ0000BC953407830Cï’¹˜0RþþRþRþRþRR<\Z8Z0040BE953407830C³Â¸˜0RÈRðRR\ZFZ00C0B8953407830C³Â¸˜ø€€À šþR	R!RRR»\Z@Z0080BD953407830C‡õ·˜ø­íR	R	RßRRt\Z;Z0080B9953407830C	‡õ·˜ø­íR§R¤RRþ\ZFZ0040BA953407830Cþ‡õ·˜€ „É šþRR!R	R!Rß\Z$Z00801A953407830CéÛz˜0çÊ‘‹\Z*Z0000A1953407830CŠ›(˜þþþþ ²ÀÄÉ\Z.Z0200A1953407830CþçÇœ(˜è˜ÙÈšþ šþ'),('901188589596976960',101,'eþ\Z)Z01400C953407830Cí¹œ(˜À¤‚Á šþ\ZZ0300A1953407830Cc·œ(\ZþZ00001C953407830CÊ(˜ ŒëÆ šþ\Z/Z0400A1953407830Cc—(˜°îà™¹êÌ¡ °†¡(\Z1Z00400C953407830Cñé(˜²èÈÑ®ÄôÒ  Ò¹ƒ'),('901188589596976960',102,'fþ'),('901188589596976960',103,'gþ'),('901188589596976960',104,'hþ'),('901188589596976960',105,'iþ'),('901188589596976960',106,'jþ'),('901188589596976960',107,'kþ'),('901188589596976960',108,'lþ'),('901188589596976960',109,'mþ'),('901188589596976960',110,'nþ'),('901188589596976960',111,'oþ'),('901188589596976960',112,'pþ'),('901188589596976960',113,'qþ'),('901188589596976960',114,'rþ'),('901188589596976960',115,'sþ'),('901188589596976960',116,'tþ'),('901188589596976960',117,'uþ'),('901188589596976960',118,'vþ'),('901188589596976960',119,'wþ'),('901188589596976960',200,'Èþ'),('901188589596976960',201,'Éþ'),('901188589596976960',202,'Êþ'),('901188589596976960',203,'Ëþ'),('901188589596976960',204,'Ìþ'),('901188589596976960',205,'Íþ'),('901188589596976960',206,'Îþ'),('901188589596976960',207,'Ïþ'),('901188589596976960',208,'Ðþ'),('901188589596976960',209,'Ñþ'),('901188589596976960',210,'Òþ'),('901188589596976960',211,'Óþ'),('901188589596976960',212,'Ôþ'),('901188589596976960',213,'Õþ'),('901188589596976960',214,'Öþ'),('901188589596976960',215,'×þ'),('901188589596976960',216,'Øþ'),('901188589596976960',217,'Ùþ'),('901188589596976960',218,'Úþ'),('901188589596976960',219,'Ûþ'),('901188589596976960',300,'¬\ZHZ00C018953407830CèÏ³˜±âÄáüâÄ‰ °øÍÁRRRþR(\Z>Z00C00D953407830CøÒ³˜±âÄáüâÄ‰ °øÍ©RÀR°'),('901188589596976960',301,'­\Z/Z00001F953407830CÇ¸˜±âÄáüâÄ‰ °øÑ'),('901188594146753856',100,'dd\Z1Z0080FEA53407830Cøé(˜üâÈ™¸àÀ ´êØá\Z2Z0180FEA53407830C÷¹œ(˜¯Ÿš¿	”´°° ¥Ï·õ\Z1Z008000A63407830CŠ›(˜ßè¥ë°à°‰ åúœ‘\ZZ018000A63407830C	¯	(\Z!Z028000A63407830CçÇœ(˜\Z&Z038000A63407830Cc·œ(˜‰Ð·þ\ZþZ048000A63407830Cc—(˜Ðïœ ·þ\Z:Z000003A63407830C‡õ·RßRR*R	R	\Z$Z000006A63407830C	û(˜`µì€@'),('901188594146753856',300,'¬\ZDZ004001A63407830CÈè±˜þþþþ·þ ·þRRRR'),('901188594688604672',100,'dd\Z-Z0000DFAB3407830Cøé(˜Ø±«Â·þ ·þ\Z2Z0100DFAB3407830Cø¹œ(˜µìð“±äÌ¡ ¸øÁá'),('901188595807958464',100,'dd\Z1Z008093AC3407830C÷é(˜°à°‰±àÀ ßä•»\Z2Z018093AC3407830C÷¹œ(˜ôäÕ«éÜ‘ë ýØìË\ZþZ0040F0AC3407830Cû(˜þóÅ ·þ'),('901188595807958464',300,'¬\ZCZ000095AC3407830CØ¶²˜áÎ•“çš…ó ºôÐâRRR˜'),('901188596520725056',100,'dd\Z(Z0080D9AE3407830Cøé(˜àÃöÌ ·þ\Z1Z0180D9AE3407830C÷¹œ(˜æ¹¢¬ªË·ô Ã¢('),('901188596520725056',300,'¬\ZHZ0000DCAE3407830CøÒ³˜´êØáüâÈ™ °øÍ©R	R	RR'),('902314494066965824',100,'dd\Z1Z00400BA63407870C÷é(˜üâÈ™¸àÄ ´êØá\ZZ01400BA63407870C÷¹œ('),('902314494066965824',300,'¬\ZHZ00000DA63407870CøÒ³˜´êØáüâÈ™ °øÍ©RRR	R	'),('903440392448123712',100,'dd\Z-Z00005DA03407830C÷é(˜èÎ½àþºþ ºþ\Z.Z01005DA03407830C÷¹œ(˜Øò½àþ»þ ºþ'),('903440392448123712',300,'¬\ZHZ00405EA03407830CøÒ³˜±âÄáüâÄ‰ °øÍ©RRARR'),('904566292934308032',100,'dd\Z1Z008085A234078F0Cïé(˜®ÄôÒõÂ¹ñ ³òÌÑ\Z2Z018085A234078F0Cô¹œ(˜áæ­›¢Ú´¡ åäÙã\ZþZ004090A234078F0Cû(˜à˜ÚÀ ‚þ\ZþZ00C09AA234078F0CÊ(˜`±b\ZZ008010A334078F0CÃœ‚þ\Z*Z018010A334078F0C¥N˜àª½À‚þ ‚þ\Z0Z004011A334078F0CÕµú˜±âð£±âÄ‰ ³øÁá\Z#Z00C011A334078F0CÉµú˜0‚þ\Z&Z004098A234078F0Cþù©{˜ð„‰Á ‚þ'),('904566292934308032',300,'¬\ZHZ004092A234078F0CÈ³²˜°ð´‘°äØé ·ÀÄÁRþRRþR\Z:Z00C089A234078F0CØ¶²˜ÈŠÎÀ‚þ ‚þRðRð\ZDZ0140BEA534078F0C¼·²˜ø»­Ìƒþ ‚þRRRþR\Z?Z0040BEA534078F0C¼·²˜Ð£­Ì ‚þRþRcRR!\ZEZ0180ECA234078F0C¬´²˜ÈíœÂƒþ ‚þRþRRþR¡\ZHZ0080ECA234078F0C¬´²˜±âÄáüâÄ‰ °øÑ‘RR!RRP'),('904566292934308032',301,'­\Z!Z0000A3A234078F0CÅ¸˜`±b\Z/Z0000D5A234078F0CÕ†˜±âÄáüâÄ‰ °øÑ‰\Z/Z0040E3A234078F0CåÔ˜±âÄáüâÄ‰ °øÑ‰'),('904566293838443712',100,'dd\Z1Z0080E3A534078F0C÷é(˜¢ºé±áÜ¸ñ ·ô€É\ZZ0180E3A534078F0C÷¹œ(\Z0Z0000EAA534078F0Cû(˜áÎ•“çš…ó ºôÐâ'),('904566293838443712',300,'¬\ZHZ00C0EBA534078F0CØ³˜´êØáüâÈ™ °øÍÁRRRR\Z:Z0000E5A534078F0Cè„³˜þþþþ ‚þRØRR'),('904566293894541824',100,'dd\Z1Z00C018A634078F0C÷é(˜üâÈ™¸àÌ ´êØá\Z.Z01C018A634078F0Cõ¹œ(˜¸¬ÍÍ‚þ ‚þ\Z0Z00C007AD34078F0Cû(˜´êØáüâÈ™ °øÅ\Z#Z00000FAD34078F0CÊ(˜`‚þ'),('904566293894541824',300,'¬\ZFZ00000AAD34078F0C¸å±˜ðÈ…£‚þ åôèéRRFRþR(\ZCZ004024A634078F0CÈè±˜´êØáüâÈ™ °øÍ©R°R	R	\Z$Z00C00BAD34078F0CéÛz˜0òŒ¥“'),('904566293894541824',301,'­\Z+Z008015AD34078F0CÄ¸˜ÀÇ©‚þ ‚þ');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemlimit`
--

DROP TABLE IF EXISTS `itemlimit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemlimit` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemlimit`
--

LOCK TABLES `itemlimit` WRITE;
/*!40000 ALTER TABLE `itemlimit` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemlimit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `litterfun`
--

DROP TABLE IF EXISTS `litterfun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `litterfun` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) NOT NULL DEFAULT '""',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `litterfun`
--

LOCK TABLES `litterfun` WRITE;
/*!40000 ALTER TABLE `litterfun` DISABLE KEYS */;
/*!40000 ALTER TABLE `litterfun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lockplayer`
--

DROP TABLE IF EXISTS `lockplayer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lockplayer` (
  `RoleID` varchar(32) NOT NULL DEFAULT '',
  `LockDate` int(11) NOT NULL DEFAULT '0',
  `LockReason` varchar(128) NOT NULL DEFAULT '""',
  PRIMARY KEY (`RoleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lockplayer`
--

LOCK TABLES `lockplayer` WRITE;
/*!40000 ALTER TABLE `lockplayer` DISABLE KEYS */;
/*!40000 ALTER TABLE `lockplayer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lockuser`
--

DROP TABLE IF EXISTS `lockuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lockuser` (
  `OpenID` varchar(64) NOT NULL,
  `LockDate` int(11) NOT NULL DEFAULT '0',
  `LockReason` varchar(128) NOT NULL DEFAULT '""',
  PRIMARY KEY (`OpenID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lockuser`
--

LOCK TABLES `lockuser` WRITE;
/*!40000 ALTER TABLE `lockuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `lockuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manorwar`
--

DROP TABLE IF EXISTS `manorwar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manorwar` (
  `manorID` int(10) NOT NULL COMMENT '????ID',
  `serverID` int(10) NOT NULL DEFAULT '0' COMMENT '?ID',
  `occupyTime` int(10) DEFAULT '0' COMMENT '????',
  `factionID` int(10) DEFAULT '0' COMMENT '????ID',
  `preOpenTime` int(10) DEFAULT '0' COMMENT '???????',
  `totalOpenCnt` int(10) DEFAULT '0' COMMENT '???????',
  `official` varchar(50) DEFAULT '''{}''' COMMENT '??ID',
  `facName` varchar(30) DEFAULT '""' COMMENT '????',
  PRIMARY KEY (`manorID`,`serverID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manorwar`
--

LOCK TABLES `manorwar` WRITE;
/*!40000 ALTER TABLE `manorwar` DISABLE KEYS */;
INSERT INTO `manorwar` VALUES (2,800,0,0,1787828401,1,'{0,0,0}',''),(2,801,0,0,1787828400,1,'{0,0,0}',''),(2,802,0,0,1787828401,1,'{0,0,0}',''),(2,803,0,0,1787828402,1,'{0,0,0}',''),(3,800,0,0,1787828401,1,'{0,0,0}',''),(3,801,0,0,1787828400,1,'{0,0,0}',''),(3,802,0,0,1787828401,1,'{0,0,0}',''),(3,803,0,0,1787828402,1,'{0,0,0}',''),(4,800,0,0,1787828401,1,'{0,0,0}',''),(4,801,0,0,1787828400,1,'{0,0,0}',''),(4,802,0,0,1787828401,1,'{0,0,0}',''),(4,803,0,0,1787828402,1,'{0,0,0}',''),(5,800,0,0,1787828401,1,'{0,0,0}',''),(5,801,0,0,1787828400,1,'{0,0,0}',''),(5,802,0,0,1787828401,1,'{0,0,0}',''),(5,803,0,0,1787828402,1,'{0,0,0}',''),(6,800,0,0,1787828401,1,'{0,0,0}',''),(6,801,0,0,1787828400,1,'{0,0,0}',''),(6,802,0,0,1787828401,1,'{0,0,0}',''),(6,803,0,0,1787828402,1,'{0,0,0}',''),(7,800,0,0,1787828401,1,'{0,0,0}',''),(7,801,0,0,1787828400,1,'{0,0,0}',''),(7,802,0,0,1787828401,1,'{0,0,0}',''),(7,803,0,0,1787828402,1,'{0,0,0}',''),(8,800,0,0,1787828401,1,'{0,0,0}',''),(8,801,0,0,1787828400,1,'{0,0,0}',''),(8,802,0,0,1787828401,1,'{0,0,0}',''),(8,803,0,0,1787828402,1,'{0,0,0}','');
/*!40000 ALTER TABLE `manorwar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marriageinfo`
--

DROP TABLE IF EXISTS `marriageinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marriageinfo` (
  `marriageID` varchar(16) NOT NULL,
  `datas` varchar(2048) NOT NULL,
  PRIMARY KEY (`marriageID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marriageinfo`
--

LOCK TABLES `marriageinfo` WRITE;
/*!40000 ALTER TABLE `marriageinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `marriageinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_apprentice`
--

DROP TABLE IF EXISTS `master_apprentice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_apprentice` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(2048) DEFAULT '""',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_apprentice`
--

LOCK TABLES `master_apprentice` WRITE;
/*!40000 ALTER TABLE `master_apprentice` DISABLE KEYS */;
/*!40000 ALTER TABLE `master_apprentice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_apprentice2`
--

DROP TABLE IF EXISTS `master_apprentice2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_apprentice2` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(2048) DEFAULT '""',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_apprentice2`
--

LOCK TABLES `master_apprentice2` WRITE;
/*!40000 ALTER TABLE `master_apprentice2` DISABLE KEYS */;
INSERT INTO `master_apprentice2` VALUES ('901188589596976960',' ãYR{}b{}Z{})j{}8°î¿Ôþ111'),('901188594146753856',' È!R{}b{}Z{}$j{}8›·ÀÔþ	é‚±ä¿®è°¨'),('901188594688604672','  þR{}b{}Z{}j{}8žèÀÔþ11'),('901188595807958464',' þR{}b{}Z{}$j{}8ÇîÀÔþæ³•å¸ˆ'),('901188596520725056',' “!R{}b{}Z{}#j{}8÷ýÀÔþ	é‚±å³»ç†™'),('902314494066965824',' é R{}b{}Z{}#j{}8¹·ÀÔþå¸å¾’ä¹éŸ³'),('903440392448123712',' þ!R{}b{}Z{}#j{}8€ŠÀÔþ222'),('904566292934308032',' ‘hR{}b{}Z{}+j{}8´µÀÔþ4'),('904566293838443712',' Ø;R{}b{}Z{}&j{}8æ¶ÀÔþ	å´å­¦æž—'),('904566293894541824',' ýŠR{}b{}Z{}#j{}8ÝïÀÔþ	ç½—é¸¿å…‰');
/*!40000 ALTER TABLE `master_apprentice2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mount`
--

DROP TABLE IF EXISTS `mount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mount` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(20000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '"0"',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mount`
--

LOCK TABLES `mount` WRITE;
/*!40000 ALTER TABLE `mount` DISABLE KEYS */;
/*!40000 ALTER TABLE `mount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mountglobaldata`
--

DROP TABLE IF EXISTS `mountglobaldata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mountglobaldata` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(20000) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mountglobaldata`
--

LOCK TABLES `mountglobaldata` WRITE;
/*!40000 ALTER TABLE `mountglobaldata` DISABLE KEYS */;
/*!40000 ALTER TABLE `mountglobaldata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mysteryshop`
--

DROP TABLE IF EXISTS `mysteryshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mysteryshop` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) NOT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mysteryshop`
--

LOCK TABLES `mysteryshop` WRITE;
/*!40000 ALTER TABLE `mysteryshop` DISABLE KEYS */;
INSERT INTO `mysteryshop` VALUES ('901188589596976960','{limit={black={}},s={myst={lmax=999,[4]={{price=10000,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,roleLimit=-1,itemID=1223},{price=60000,prob=600,isBind=2,limit=-1,num=6,sellnum=6,spe=0,roleLimit=-1,itemID=1306},{price=100000,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,roleLimit=-1,itemID=888888},{price=50000,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,roleLimit=-1,itemID=1679},{price=50000,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,roleLimit=-1,itemID=10478},{price=50000,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,roleLimit=-1,itemID=1680},{price=30000,prob=1000,isBind=2,limit=-1,num=5,sellnum=5,spe=0,roleLimit=-1,itemID=2016},{price=10000,prob=100,isBind=2,limit=-1,num=6,sellnum=6,spe=0,roleLimit=-1,itemID=1034}}}},tick=20260827,refreshH=12,open=1}'),('901188594146753856','{limit={black={}},s={myst={lmax=999,[4]={{price=50000,prob=1000,sellnum=10,limit=-1,num=10,itemID=1680,spe=0,roleLimit=-1,isBind=2},{price=10000,prob=1000,sellnum=10,limit=-1,num=10,itemID=1223,spe=0,roleLimit=-1,isBind=2},{price=50000,prob=1000,sellnum=10,limit=-1,num=10,itemID=1681,spe=0,roleLimit=-1,isBind=2},{price=50000,prob=1000,sellnum=10,limit=-1,num=10,itemID=10478,spe=0,roleLimit=-1,isBind=2},{price=30000,prob=1000,sellnum=5,limit=-1,num=5,itemID=2016,spe=0,roleLimit=-1,isBind=2},{price=100000,prob=1000,sellnum=10,limit=-1,num=10,itemID=888888,spe=0,roleLimit=-1,isBind=2},{price=50000,prob=1000,sellnum=10,limit=-1,num=10,itemID=1679,spe=0,roleLimit=-1,isBind=2},{price=60000,prob=100,sellnum=99,limit=-1,num=99,itemID=20036,spe=0,roleLimit=-1,isBind=2}}}},tick=20260827,refreshH=12,open=1}'),('901188594688604672','{limit={black={}},s={myst={lmax=999,[4]={{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=50000,itemID=1680},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=10000,itemID=1223},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=50000,itemID=1681},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=50000,itemID=10478},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=5,sellnum=5,spe=0,price=30000,itemID=2016},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=100000,itemID=888888},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=50000,itemID=1679},{roleLimit=-1,prob=100,isBind=2,limit=-1,num=99,sellnum=99,spe=0,price=60000,itemID=20036}}}},tick=20260827,refreshH=12,open=1}'),('901188595807958464','{limit={black={}},s={myst={lmax=999,[4]={{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=50000,itemID=1680},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=10000,itemID=1223},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=50000,itemID=1681},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=50000,itemID=10478},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=5,sellnum=5,spe=0,price=30000,itemID=2016},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=100000,itemID=888888},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=50000,itemID=1679},{roleLimit=-1,prob=100,isBind=2,limit=-1,num=99,sellnum=99,spe=0,price=60000,itemID=20036}}}},tick=20260827,refreshH=12,open=1}'),('901188596520725056','{limit={black={}},s={myst={lmax=999,[4]={{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=50000,itemID=1680},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=10000,itemID=1223},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=50000,itemID=1681},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=50000,itemID=10478},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=5,sellnum=5,spe=0,price=30000,itemID=2016},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=100000,itemID=888888},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=50000,itemID=1679},{roleLimit=-1,prob=100,isBind=2,limit=-1,num=99,sellnum=99,spe=0,price=60000,itemID=20036}}}},tick=20260827,refreshH=12,open=1}'),('902314494066965824','{limit={black={}},s={myst={lmax=999,[4]={{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=50000,itemID=10478},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=5,sellnum=5,spe=0,price=30000,itemID=2016},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=5,sellnum=5,spe=0,price=20000,itemID=2356},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=50000,itemID=1681},{roleLimit=-1,prob=150,isBind=2,limit=-1,num=3,sellnum=3,spe=0,price=30000,itemID=1417},{roleLimit=-1,prob=600,isBind=2,limit=-1,num=6,sellnum=6,spe=0,price=60000,itemID=1306},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=10000,itemID=1223},{roleLimit=-1,prob=100,isBind=2,limit=-1,num=6,sellnum=6,spe=0,price=10000,itemID=1034}}}},tick=20260827,refreshH=12,open=1}'),('903440392448123712','{limit={black={}},s={myst={lmax=999,[4]={{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=100000,itemID=888888},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=50000,itemID=1680},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=5,sellnum=5,spe=0,price=20000,itemID=2356},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=50000,itemID=10478},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=50000,itemID=1681},{roleLimit=-1,prob=600,isBind=2,limit=-1,num=6,sellnum=6,spe=0,price=60000,itemID=1306},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=10000,itemID=1223},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=50000,itemID=1679}}}},tick=20260827,refreshH=12,open=1}'),('904566292934308032','{limit={black={}},s={myst={lmax=999,[4]={{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=100000,itemID=888888},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=50000,itemID=1680},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=5,sellnum=5,spe=0,price=20000,itemID=2356},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=10000,itemID=1223},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=50000,itemID=10478},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=50000,itemID=1679},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=5,sellnum=5,spe=0,price=30000,itemID=2016},{roleLimit=-1,prob=1000,isBind=2,limit=-1,num=10,sellnum=10,spe=0,price=50000,itemID=1681}}}},tick=20260827,refreshH=12,open=1}'),('904566293838443712','{limit={black={}},s={myst={lmax=999,[4]={{price=100000,prob=1000,sellnum=10,limit=-1,num=10,itemID=888888,spe=0,roleLimit=-1,isBind=2},{price=50000,prob=1000,sellnum=10,limit=-1,num=10,itemID=1680,spe=0,roleLimit=-1,isBind=2},{price=20000,prob=1000,sellnum=5,limit=-1,num=5,itemID=2356,spe=0,roleLimit=-1,isBind=2},{price=10000,prob=1000,sellnum=10,limit=-1,num=10,itemID=1223,spe=0,roleLimit=-1,isBind=2},{price=50000,prob=1000,sellnum=10,limit=-1,num=10,itemID=10478,spe=0,roleLimit=-1,isBind=2},{price=50000,prob=1000,sellnum=10,limit=-1,num=10,itemID=1679,spe=0,roleLimit=-1,isBind=2},{price=30000,prob=1000,sellnum=5,limit=-1,num=5,itemID=2016,spe=0,roleLimit=-1,isBind=2},{price=50000,prob=1000,sellnum=10,limit=-1,num=10,itemID=1681,spe=0,roleLimit=-1,isBind=2}}}},tick=20260827,refreshH=12,open=1}'),('904566293894541824','{limit={black={}},s={myst={lmax=999,[4]={{price=100000,prob=1000,itemID=888888,limit=-1,num=10,isBind=2,spe=0,roleLimit=-1,sellnum=10},{price=50000,prob=1000,itemID=1680,limit=-1,num=10,isBind=2,spe=0,roleLimit=-1,sellnum=10},{price=20000,prob=1000,itemID=2356,limit=-1,num=5,isBind=2,spe=0,roleLimit=-1,sellnum=5},{price=10000,prob=1000,itemID=1223,limit=-1,num=10,isBind=2,spe=0,roleLimit=-1,sellnum=10},{price=50000,prob=1000,itemID=10478,limit=-1,num=10,isBind=2,spe=0,roleLimit=-1,sellnum=10},{price=50000,prob=1000,itemID=1679,limit=-1,num=10,isBind=2,spe=0,roleLimit=-1,sellnum=10},{price=30000,prob=1000,itemID=2016,limit=-1,num=5,isBind=2,spe=0,roleLimit=-1,sellnum=5},{price=50000,prob=1000,itemID=1681,limit=-1,num=10,isBind=2,spe=0,roleLimit=-1,sellnum=10}}}},tick=20260827,refreshH=12,open=1}');
/*!40000 ALTER TABLE `mysteryshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p3v3info`
--

DROP TABLE IF EXISTS `p3v3info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p3v3info` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) NOT NULL DEFAULT '',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p3v3info`
--

LOCK TABLES `p3v3info` WRITE;
/*!40000 ALTER TABLE `p3v3info` DISABLE KEYS */;
INSERT INTO `p3v3info` VALUES ('901188589596976960',' ÛÏÔ	'),('901188594146753856',' ÛÏÔ	**Ž*Œ*Š**‹*‰*ˆ*	‡'),('901188594688604672',' ÛÏÔ	'),('901188595807958464',' ÛÏÔ	*ö*ò*õ*÷*ø*ó*ô*ñ*	ð*þï'),('901188596520725056',' ÛÏÔ	'),('902314494066965824',' ÛÏÔ	'),('903440392448123712',' ÛÏÔ	'),('904566292934308032',' ÛÏÔ	*ö*ò*õ*÷*ø*ó*ô*ñ*	ð*þï'),('904566293838443712',' ÛÏÔ	*à*á*â*ß*Ü*Ú*Ù*Ø*	Ý*þÞ*Û*×'),('904566293894541824',' ÛÏÔ	**Ž*Œ*Š**‹*‰*ˆ*	‡');
/*!40000 ALTER TABLE `p3v3info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passivity_relation`
--

DROP TABLE IF EXISTS `passivity_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passivity_relation` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `targetRoleID` varchar(32) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`roleID`,`type`,`targetRoleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passivity_relation`
--

LOCK TABLES `passivity_relation` WRITE;
/*!40000 ALTER TABLE `passivity_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `passivity_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paylog`
--

DROP TABLE IF EXISTS `paylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paylog` (
  `pay_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_id` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `order_id` varchar(20) NOT NULL DEFAULT '' COMMENT '订单号',
  `title` varchar(120) DEFAULT NULL COMMENT '标题',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `num` int(11) DEFAULT '0' COMMENT '数量',
  `get_first_pay` int(11) DEFAULT NULL COMMENT '首充奖励领取',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`pay_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT COMMENT='首充奖励是否领取：1已领取  0未领取';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paylog`
--

LOCK TABLES `paylog` WRITE;
/*!40000 ALTER TABLE `paylog` DISABLE KEYS */;
/*!40000 ALTER TABLE `paylog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `RoleID` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `UserID` varchar(64) COLLATE utf8_bin NOT NULL,
  `WorldID` int(11) NOT NULL,
  `WorldName` varchar(30) COLLATE utf8_bin DEFAULT '',
  `Name` varchar(50) COLLATE utf8_bin NOT NULL,
  `School` int(10) unsigned NOT NULL DEFAULT '0',
  `Sex` smallint(2) NOT NULL DEFAULT '0',
  `Level` int(10) unsigned DEFAULT '0',
  `Status` int(10) unsigned DEFAULT '0',
  `Exp` int(11) DEFAULT '0',
  `Ingot` int(11) DEFAULT '0',
  `Cash` int(11) DEFAULT '0',
  `IngotAll` int(11) DEFAULT '0',
  `Battle` int(11) DEFAULT '0',
  `AllEquipLvl` int(11) DEFAULT '0',
  `MedalLevel` int(11) DEFAULT '0',
  `PkValue` int(11) DEFAULT '0',
  `EmailTick` int(11) DEFAULT '0',
  `LastLogin` int(11) DEFAULT '0',
  `CreateDate` datetime DEFAULT '0000-00-00 00:00:00',
  `SpeakTick` int(11) DEFAULT '0' COMMENT '????',
  `Money` int(11) DEFAULT '0',
  `LoginCnt` int(11) DEFAULT NULL,
  `OnlineTime` int(11) DEFAULT '0',
  `Glamour` int(11) DEFAULT NULL,
  `Vital` int(11) DEFAULT NULL,
  `MapID` int(11) DEFAULT NULL,
  `MapPos` int(11) DEFAULT NULL,
  `Faction` int(11) DEFAULT NULL,
  `Meritorious` int(11) DEFAULT NULL,
  `SoulScore` int(11) DEFAULT '0',
  `CurHP` int(11) DEFAULT NULL,
  `CurMP` int(11) DEFAULT NULL,
  `isdelete` int(1) DEFAULT '0',
  `DeleteTime` datetime DEFAULT '0000-00-00 00:00:00',
  `Contribute` int(11) DEFAULT '0' COMMENT '??',
  `TitleID` int(11) DEFAULT '0' COMMENT '??ID',
  `WingID` int(11) NOT NULL,
  `FootID` int(11) NOT NULL,
  `HufuID` int(11) NOT NULL,
  `XuanBID` int(11) NOT NULL,
  `XingTs` int(11) NOT NULL,
  `FaBaoID` int(11) NOT NULL,
  `DunPID` int(11) NOT NULL,
  `ZhanQID` int(11) NOT NULL,
  `Integral` int(11) DEFAULT '0' COMMENT '????',
  `PvpRank` int(11) DEFAULT '0' COMMENT '??????',
  `SilentReason` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `TotalGainIngot` int(11) DEFAULT NULL,
  `TotalCosIngot` int(11) DEFAULT NULL,
  `MonsterKillNum` int(11) DEFAULT NULL,
  `SwornBrosID` int(11) NOT NULL DEFAULT '0',
  `LeaveSwornTime` int(11) NOT NULL DEFAULT '0',
  `FightTeamID` int(11) DEFAULT NULL,
  `MarriageID` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `Ridesh` int(11) NOT NULL,
  `Rideshexp` int(11) NOT NULL,
  `Attack` int(11) NOT NULL,
  PRIMARY KEY (`RoleID`) USING BTREE,
  KEY `UserID` (`UserID`) USING BTREE,
  KEY `Name` (`Name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES ('901188589596976960','111111',800,'1åŒº','111',4,1,41,4,377640,5996895,0,0,11491,0,0,0,1787824298,1787824291,'2026-08-27 14:22:28',0,35130,5,0,0,180,3100,88068,0,NULL,0,15771,341,0,'0000-00-00 00:00:00',0,0,0,0,0,1004,0,0,0,0,0,0,NULL,0,0,0,0,0,0,'',0,0,17),('901188594146753856','<<DB_OR_GM_PASSWORD>>',800,'<1åŒº>çŽ„æ­¦','é‚±ä¿®è°¨',1,1,36,2,306800,0,0,0,4296,0,0,0,1787837787,1787838205,'2026-08-27 19:11:44',0,550,3,0,0,0,1100,9111,0,NULL,0,7511,281,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,'',0,0,89),('901188594688604672','<<DB_OR_GM_PASSWORD>>',800,'<1åŒº>çŽ„æ­¦','11',4,1,28,2,356800,999999,0,0,1312,0,0,0,1787835312,1787834693,'2026-08-27 19:46:11',0,0,3,0,0,0,1100,22079,0,NULL,0,1821,204,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,'',0,0,0),('901188595807958464','111111',800,'<1åŒº>çŽ„æ­¦','æ³•å¸ˆ',2,1,36,4,306800,0,0,0,4381,0,0,0,1787836231,1787835445,'2026-08-27 20:57:21',0,550,1,0,0,0,1100,10105,0,NULL,0,3941,560,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,2,0,0,0,'',0,0,89),('901188596520725056','<<DB_OR_GM_PASSWORD>>',800,'<1åŒº>çŽ„æ­¦','é‚±å³»ç†™',4,1,35,4,181800,0,0,0,4243,0,0,0,1787838199,1787838162,'2026-08-27 21:42:40',0,250,1,0,0,0,1100,15081,0,NULL,0,3111,270,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,1,0,0,0,'',0,0,0),('902314494066965824','<<DB_OR_GM_PASSWORD>>',801,'<2åŒº>æœ±é›€','å¸å¾’ä¹éŸ³',4,1,35,4,181800,0,0,0,4201,0,0,0,1787829177,1787829157,'2026-08-27 19:12:35',0,250,1,0,0,0,1100,27081,0,NULL,0,3102,270,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,'',0,0,0),('902314496335822016','<<DB_OR_GM_PASSWORD>>',801,'<2åŒº>æœ±é›€','é›·ä¿®æ–‡',4,1,1,4,0,0,0,0,308,0,0,0,1787838116,1787837812,'2026-08-27 21:36:50',0,0,1,0,0,0,1100,21107,0,NULL,0,401,51,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,'',0,0,0),('902314496418390400','<<DB_OR_GM_PASSWORD>>',801,'<2åŒº>æœ±é›€','æ²ˆæ­£æ–‡',4,1,1,4,0,0,0,0,308,0,0,0,1787838147,1787838127,'2026-08-27 21:42:05',0,0,1,0,0,0,1100,29107,0,NULL,0,401,51,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,'',0,0,0),('903440392448123712','111111',802,'æœªå¼€åŒº','222',4,1,35,4,181800,0,0,0,4351,0,0,0,1787823360,1787823337,'2026-08-27 17:35:35',0,250,1,0,0,0,1100,12085,0,NULL,0,3317,270,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,2,0,0,0,'',0,0,0),('903440393981672768','<<DB_OR_GM_PASSWORD>>',802,'<3åŒº>é’é¾™','ç«¯æœ¨å…ƒåŒ–',2,1,1,4,0,0,0,0,308,0,0,0,1787829195,1787829187,'2026-08-27 19:13:05',0,0,1,0,0,0,1100,25107,0,NULL,0,201,101,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,'',0,0,16),('904566292934308032','111111',803,'<4åŒº>ç™½è™Ž','4',2,1,43,4,662360,0,0,0,13329,0,0,0,1787828916,1787825548,'2026-08-27 18:12:25',0,33806,1,0,0,210,3100,139109,0,NULL,0,9481,726,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,86,0,0,0,'',0,0,1416),('904566293894541824','<<DB_OR_GM_PASSWORD>>',803,'<4åŒº>ç™½è™Ž','ç½—é¸¿å…‰',1,1,100,2,2281800,3333331,0,0,34173,0,0,0,1787837713,1787837302,'2026-08-27 19:13:28',0,1550,6,0,0,0,1100,47131,0,NULL,0,74051,2001,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,'',0,0,1319);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_relation`
--

DROP TABLE IF EXISTS `player_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_relation` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(2048) NOT NULL DEFAULT '""',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_relation`
--

LOCK TABLES `player_relation` WRITE;
/*!40000 ALTER TABLE `player_relation` DISABLE KEYS */;
INSERT INTO `player_relation` VALUES ('901188589596976960','901188589596976960\Z111²1åŒº80@)HÞP˜X`(hpˆ¯·xï€¹˜›{ Õ ›{(Õ¨¨†°À„=¸ãYød èÏ³¨øÒ³ØìÒÚÀ¬\ZHZ00C018953407830CèÏ³˜±âÄáüâÄ‰ °øÍÁRRRþR(\Z>Z00C00D953407830CøÒ³˜±âÄáüâÄ‰ °øÍ©RÀR°\Z/Z00001F953407830CÇ¸˜±âÄáüâÄ‰ °øÑ'),('901188594146753856','901188594146753856\Z	é‚±ä¿®è°¨²<1åŒº>çŽ„æ­¦80@$H8PYˆBCxƒ€Â˜×: ™ ×:(™¨ðÜ°€µ¸È!ød¨Èè±ÒÚK¬\ZDZ004001A63407830CÈè±˜þþþþ·þ ·þRRRR'),('901188594688604672','901188594688604672\Z11²<1åŒº>çŽ„æ­¦80@H(PAˆ$$x€$˜ Ì (Ì¨Àã°€µ¸ þødÒÚ¬'),('901188595807958464','901188595807958464\Zæ³•å¸ˆ²<1åŒº>çŽ„æ­¦80@$X8`Yˆ22x}€»˜å ° å(°¨ðÜ°€µ¸þød¨Ø¶²ÒÚJ¬\ZCZ000095AC3407830CØ¶²˜áÎ•“çš…ó ºôÐâRRR˜'),('901188596520725056','901188596520725056\Z	é‚±å³»ç†™²<1åŒº>çŽ„æ­¦80@#H6PVˆ99x„€Ñ˜ƒ8 Ž §(Ž¨¨Œ°€µ¸“!ød¨øÒ³ÒÚO¬\ZHZ0000DCAE3407830CøÒ³˜´êØáüâÈ™ °øÍ©R	R	RR'),('902314494066965824','902314494066965824\Zå¸å¾’ä¹éŸ³²<2åŒº>æœ±é›€80@#H6PVˆ00x€Ë˜ƒ8 Ž ž(Ž¨¨Œ°€µ¸é ød¨øÒ³ÒÚO¬\ZHZ00000DA63407870CøÒ³˜´êØáüâÈ™ °øÍ©RRR	R	'),('902314496335822016','902314496335822016\Z	é›·ä¿®æ–‡²<2åŒº>æœ±é›€80@HþPˆ		x€	˜‘ 3 ‘(3°N¸´ødÒÚ¬'),('902314496418390400','902314496418390400\Z	æ²ˆæ­£æ–‡²<2åŒº>æœ±é›€80@HþPˆ		x€	˜‘ 3 ‘(3°N¸´ødÒÚ¬'),('903440392448123712','903440392448123712\Z222²	æœªå¼€åŒº80@#H6PVˆ;;x‚€ó˜ƒ8 Ž õ(Ž¨¨Œ°€µ¸þ!ød¨øÒ³ÒÚO¬\ZHZ00405EA03407830CøÒ³˜±âÄáüâÄ‰ °øÍ©RRARR'),('903440393981672768','903440393981672768\Zç«¯æœ¨å…ƒåŒ–²<3åŒº>é’é¾™80@Xþ`ˆ		x€	˜É e É(e°N¸´ødÒÚ¬'),('904566292934308032','904566292934308032\Z4²<4åŒº>ç™½è™Ž80@+HPqX¨`ˆh)pMˆòóx°€õ˜‰J Þ ‰J(Ö¨Ø¶(°À„=¸‘hød È³²¨Ø¶²ÒÚ¨¬\ZHZ004092A234078F0CÈ³²˜°ð´‘°äØé ·ÀÄÁRþRRþR\Z:Z00C089A234078F0CØ¶²˜ÈŠÎÀ‚þ ‚þRðRð\ZDZ0140BEA534078F0C¼·²˜ø»­Ìƒþ ‚þRRRþR\Z?Z0040BEA534078F0C¼·²˜Ð£­Ì ‚þRþRcRR!\ZEZ0180ECA234078F0C¬´²˜ÈíœÂƒþ ‚þRþRRþR¡\ZHZ0080ECA234078F0C¬´²˜±âÄáüâÄ‰ °øÑ‘RR!RRP\Z!Z0000A3A234078F0CÅ¸˜`±b\Z/Z0000D5A234078F0CÕ†˜±âÄáüâÄ‰ °øÑ‰\Z/Z0040E3A234078F0CåÔ˜±âÄáüâÄ‰ °øÑ‰'),('904566293838443712','904566293838443712\Z	å´å­¦æž—²<4åŒº>ç™½è™Ž80@&HPhÖpÎˆ66x€¿˜Ï, Ç Ï,(Ç¨¸ø°€µ¸Ø;ød Ø³¨è„³ÒÚ‹¬\ZHZ00C0EBA534078F0CØ³˜´êØáüâÈ™ °øÍÁRRRR\Z:Z0000E5A534078F0Cè„³˜þþþþ ‚þRØRR'),('904566293894541824','904566293894541824\Z	ç½—é¸¿å…‰²<4åŒº>ç™½è™Ž80@dH‹P§þhpFˆÁÁx²€º˜ÃÂ Ñ ÃÂ(Ñ¨È¢‹°€Â×/¸ýŠÈød ¸å±¨Èè±ÒÚå¬\ZFZ00000AAD34078F0C¸å±˜ðÈ…£‚þ åôèéRRFRþR(\ZCZ004024A634078F0CÈè±˜´êØáüâÈ™ °øÍ©R°R	R	\Z$Z00C00BAD34078F0CéÛz˜0òŒ¥“\Z+Z008015AD34078F0CÄ¸˜ÀÇ©‚þ ‚þ');
/*!40000 ALTER TABLE `player_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerdropitem`
--

DROP TABLE IF EXISTS `playerdropitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerdropitem` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(2048) NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerdropitem`
--

LOCK TABLES `playerdropitem` WRITE;
/*!40000 ALTER TABLE `playerdropitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerdropitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playermaze`
--

DROP TABLE IF EXISTS `playermaze`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playermaze` (
  `RoleID` varchar(32) NOT NULL DEFAULT '',
  `Data` varchar(1024) NOT NULL DEFAULT '',
  `CurState` varchar(1024) NOT NULL DEFAULT '',
  `CurPath` varchar(1024) NOT NULL DEFAULT '',
  `LastIndex` int(11) NOT NULL DEFAULT '-1',
  `MazeType` int(11) NOT NULL DEFAULT '0',
  `DailyPrizeTime` bigint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RoleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playermaze`
--

LOCK TABLES `playermaze` WRITE;
/*!40000 ALTER TABLE `playermaze` DISABLE KEYS */;
/*!40000 ALTER TABLE `playermaze` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qqvipinfo`
--

DROP TABLE IF EXISTS `qqvipinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qqvipinfo` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) NOT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qqvipinfo`
--

LOCK TABLES `qqvipinfo` WRITE;
/*!40000 ALTER TABLE `qqvipinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `qqvipinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rank`
--

DROP TABLE IF EXISTS `rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rank` (
  `RoleID` varchar(32) NOT NULL DEFAULT '',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '??',
  `battle` int(11) NOT NULL DEFAULT '0' COMMENT '??',
  `achieve` int(11) NOT NULL DEFAULT '0' COMMENT '???',
  `timeTick1` int(11) NOT NULL DEFAULT '0',
  `timeTick4` int(11) NOT NULL DEFAULT '0',
  `timeTick9` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RoleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rank`
--

LOCK TABLES `rank` WRITE;
/*!40000 ALTER TABLE `rank` DISABLE KEYS */;
INSERT INTO `rank` VALUES ('901188589596976960','111',0,0,0,0,0),('901188594146753856','é‚±ä¿®è°¨',0,0,0,0,0),('901188594688604672','11',0,0,0,0,0),('901188595807958464','æ³•å¸ˆ',0,0,0,0,0),('901188596520725056','é‚±å³»ç†™',0,0,0,0,0),('902314494066965824','å¸å¾’ä¹éŸ³',0,0,0,0,0),('902314496335822016','é›·ä¿®æ–‡',0,0,0,0,0),('902314496418390400','æ²ˆæ­£æ–‡',0,0,0,0,0),('903440392448123712','222',0,0,0,0,0),('903440393981672768','ç«¯æœ¨å…ƒåŒ–',0,0,0,0,0),('904566292934308032','4',0,0,0,0,0),('904566293838443712','å´å­¦æž—',0,0,0,0,0),('904566293894541824','ç½—é¸¿å…‰',0,0,0,0,0);
/*!40000 ALTER TABLE `rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation`
--

DROP TABLE IF EXISTS `relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relation` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `targetRoleID` varchar(32) NOT NULL,
  `type` int(11) NOT NULL,
  `param1` int(11) NOT NULL,
  `param2` int(11) NOT NULL,
  PRIMARY KEY (`roleID`,`targetRoleID`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation`
--

LOCK TABLES `relation` WRITE;
/*!40000 ALTER TABLE `relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation_flowerrd`
--

DROP TABLE IF EXISTS `relation_flowerrd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relation_flowerrd` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(2048) NOT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_flowerrd`
--

LOCK TABLES `relation_flowerrd` WRITE;
/*!40000 ALTER TABLE `relation_flowerrd` DISABLE KEYS */;
/*!40000 ALTER TABLE `relation_flowerrd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rewardtask`
--

DROP TABLE IF EXISTS `rewardtask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rewardtask` (
  `TaskGUID` int(11) NOT NULL,
  `OwnerGUID` varchar(32) NOT NULL DEFAULT '',
  `OwnerName` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `CreateDate` datetime DEFAULT '0000-00-00 00:00:00',
  `ExpireDate` datetime DEFAULT '0000-00-00 00:00:00',
  `Status` int(10) DEFAULT '0',
  `TaskRank` int(11) DEFAULT '0',
  `TaskID` int(11) DEFAULT '0',
  `ReceiveNum` int(11) DEFAULT NULL,
  `ReceiveTime` int(11) unsigned DEFAULT '0',
  `ReceiveStatus` int(10) DEFAULT '0',
  PRIMARY KEY (`TaskGUID`) USING BTREE,
  KEY `OwnerGUID` (`OwnerGUID`) USING BTREE,
  KEY `TaskRank` (`TaskRank`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rewardtask`
--

LOCK TABLES `rewardtask` WRITE;
/*!40000 ALTER TABLE `rewardtask` DISABLE KEYS */;
INSERT INTO `rewardtask` VALUES (1,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,1,20031,0,0,0),(2,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,1,30030,0,0,0),(3,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,1,40023,0,0,0),(4,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,1,40013,0,0,0),(5,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,1,20028,0,0,0),(6,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,1,30028,0,0,0),(7,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,1,30007,0,0,0),(8,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,1,30000,0,0,0),(9,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,1,20005,0,0,0),(10,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,1,20032,0,0,0),(11,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,1,30025,0,0,0),(12,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,1,40006,0,0,0),(13,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,1,40028,0,0,0),(14,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,1,30009,0,0,0),(15,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,1,40016,0,0,0),(16,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,1,20009,0,0,0),(17,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,1,20039,0,0,0),(18,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,1,20001,0,0,0),(19,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,1,40010,0,0,0),(20,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,1,30010,0,0,0),(21,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,2,21011,0,0,0),(22,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,2,21008,0,0,0),(23,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,2,41009,0,0,0),(24,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,2,31020,0,0,0),(25,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,2,21031,0,0,0),(26,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,2,21000,0,0,0),(27,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,2,41004,0,0,0),(28,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,2,31005,0,0,0),(29,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,2,41026,0,0,0),(30,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,2,21035,0,0,0),(31,'0','ç³»ç»Ÿ','2026-08-27 14:00:00','2026-08-27 14:30:00',0,3,42012,0,0,0),(32,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,1,20012,0,0,0),(33,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,1,30024,0,0,0),(34,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,1,20014,0,0,0),(35,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,1,20036,0,0,0),(36,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,1,20004,0,0,0),(37,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,1,20028,0,0,0),(38,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,1,20021,0,0,0),(39,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,1,40021,0,0,0),(40,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,1,20032,0,0,0),(41,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,1,30022,0,0,0),(42,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,1,20010,0,0,0),(43,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,1,20024,0,0,0),(44,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,1,20022,0,0,0),(45,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,1,30032,0,0,0),(46,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,1,20004,0,0,0),(47,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,1,30032,0,0,0),(48,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,1,20011,0,0,0),(49,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,1,20020,0,0,0),(50,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,1,20015,0,0,0),(51,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,1,40018,0,0,0),(52,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,2,41001,0,0,0),(53,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,2,21028,0,0,0),(54,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,2,21041,0,0,0),(55,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,2,41023,0,0,0),(56,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,2,21037,0,0,0),(57,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,2,21039,0,0,0),(58,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,2,31017,0,0,0),(59,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,2,41019,0,0,0),(60,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,2,21007,0,0,0),(61,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,2,21005,0,0,0),(62,'0','ç³»ç»Ÿ','2026-08-27 16:00:00','2026-08-27 16:30:00',0,3,32012,0,0,0),(63,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,1,30016,0,0,0),(64,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,1,40025,0,0,0),(65,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,1,20002,0,0,0),(66,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,1,30008,0,0,0),(67,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,1,30015,0,0,0),(68,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,1,20032,0,0,0),(69,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,1,30026,0,0,0),(70,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,1,20019,0,0,0),(71,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,1,20005,0,0,0),(72,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,1,20038,0,0,0),(73,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,1,30010,0,0,0),(74,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,1,30022,0,0,0),(75,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,1,30014,0,0,0),(76,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,1,20009,0,0,0),(77,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,1,20000,0,0,0),(78,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,1,20019,0,0,0),(79,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,1,20028,0,0,0),(80,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,1,30018,0,0,0),(81,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,1,40033,0,0,0),(82,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,1,20007,0,0,0),(83,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,2,21019,0,0,0),(84,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,2,31018,0,0,0),(85,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,2,31020,0,0,0),(86,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,2,41000,0,0,0),(87,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,2,31008,0,0,0),(88,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,2,31015,0,0,0),(89,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,2,41033,0,0,0),(90,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,2,21014,0,0,0),(91,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,2,21041,0,0,0),(92,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,2,31025,0,0,0),(93,'0','ç³»ç»Ÿ','2026-08-27 18:00:00','2026-08-27 18:30:00',0,3,42010,0,0,0),(94,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,1,30020,0,0,0),(95,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,1,40018,0,0,0),(96,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,1,30022,0,0,0),(97,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,1,30018,0,0,0),(98,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,1,40016,0,0,0),(99,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,1,20029,0,0,0),(100,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,1,30029,0,0,0),(101,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,1,40032,0,0,0),(102,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,1,30023,0,0,0),(103,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,1,20024,0,0,0),(104,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,1,20027,0,0,0),(105,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,1,30020,0,0,0),(106,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,1,20032,0,0,0),(107,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,1,40027,0,0,0),(108,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,1,20000,0,0,0),(109,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,1,20020,0,0,0),(110,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,1,40023,0,0,0),(111,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,1,40019,0,0,0),(112,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,1,20027,0,0,0),(113,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,1,20037,0,0,0),(114,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,2,31024,0,0,0),(115,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,2,21041,0,0,0),(116,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,2,21043,0,0,0),(117,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,2,31000,0,0,0),(118,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,2,21008,0,0,0),(119,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,2,31000,0,0,0),(120,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,2,41004,0,0,0),(121,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,2,31013,0,0,0),(122,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,2,31010,0,0,0),(123,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,2,31020,0,0,0),(124,'0','ç³»ç»Ÿ','2026-08-27 20:00:00','2026-08-27 20:30:00',0,3,22010,0,0,0);
/*!40000 ALTER TABLE `rewardtask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ride`
--

DROP TABLE IF EXISTS `ride`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ride` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) NOT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ride`
--

LOCK TABLES `ride` WRITE;
/*!40000 ALTER TABLE `ride` DISABLE KEYS */;
/*!40000 ALTER TABLE `ride` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolechat`
--

DROP TABLE IF EXISTS `rolechat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolechat` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) NOT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolechat`
--

LOCK TABLES `rolechat` WRITE;
/*!40000 ALTER TABLE `rolechat` DISABLE KEYS */;
INSERT INTO `rolechat` VALUES ('901188589596976960','{p={þþ,þþ,þþ,þþ,þþ,þþ}}'),('901188594146753856','{p={þþ,þþ,þþ,þþ,þþ,þþ}}'),('901188594688604672','{p={þþ,þþ,þþ,þþ,þþ,þþ}}'),('901188595807958464','{p={þþ,þþ,þþ,þþ,þþ,þþ}}'),('901188596520725056','{p={þþ,þþ,þþ,þþ,þþ,þþ}}'),('902314494066965824','{p={þþ,þþ,þþ,þþ,þþ,þþ}}'),('902314496335822016','{p={þþ,þþ,þþ,þþ,þþ,þþ}}'),('902314496418390400','{p={þþ,þþ,þþ,þþ,þþ,þþ}}'),('903440392448123712','{p={þþ,þþ,þþ,þþ,þþ,þþ}}'),('903440393981672768','{p={þþ,þþ,þþ,þþ,þþ,þþ}}'),('904566293838443712','{}'),('904566293894541824','{p={þþ,þþ,þþ,þþ,þþ,þþ}}');
/*!40000 ALTER TABLE `rolechat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolecopy`
--

DROP TABLE IF EXISTS `rolecopy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolecopy` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolecopy`
--

LOCK TABLES `rolecopy` WRITE;
/*!40000 ALTER TABLE `rolecopy` DISABLE KEYS */;
/*!40000 ALTER TABLE `rolecopy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolecopystar`
--

DROP TABLE IF EXISTS `rolecopystar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolecopystar` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolecopystar`
--

LOCK TABLES `rolecopystar` WRITE;
/*!40000 ALTER TABLE `rolecopystar` DISABLE KEYS */;
/*!40000 ALTER TABLE `rolecopystar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolecopytime`
--

DROP TABLE IF EXISTS `rolecopytime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolecopytime` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `idx` int(10) NOT NULL DEFAULT '0',
  `datas` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`roleID`,`idx`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolecopytime`
--

LOCK TABLES `rolecopytime` WRITE;
/*!40000 ALTER TABLE `rolecopytime` DISABLE KEYS */;
INSERT INTO `rolecopytime` VALUES ('901188589596976960',1,'0&0&0&0'),('901188589596976960',3,'3&1&0&20260827&2&0&20260827&3&0&20260827');
/*!40000 ALTER TABLE `rolecopytime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolefaction`
--

DROP TABLE IF EXISTS `rolefaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolefaction` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `factionID` int(10) NOT NULL DEFAULT '0',
  `datas` varchar(1024) NOT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolefaction`
--

LOCK TABLES `rolefaction` WRITE;
/*!40000 ALTER TABLE `rolefaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `rolefaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolesingleinsts`
--

DROP TABLE IF EXISTS `rolesingleinsts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolesingleinsts` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `data` varchar(1024) DEFAULT NULL,
  `eliteInstTime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolesingleinsts`
--

LOCK TABLES `rolesingleinsts` WRITE;
/*!40000 ALTER TABLE `rolesingleinsts` DISABLE KEYS */;
/*!40000 ALTER TABLE `rolesingleinsts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secondpassword`
--

DROP TABLE IF EXISTS `secondpassword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secondpassword` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) NOT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secondpassword`
--

LOCK TABLES `secondpassword` WRITE;
/*!40000 ALTER TABLE `secondpassword` DISABLE KEYS */;
/*!40000 ALTER TABLE `secondpassword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sharetaskcount`
--

DROP TABLE IF EXISTS `sharetaskcount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sharetaskcount` (
  `roleid` varchar(32) NOT NULL DEFAULT '',
  `taskcount` int(10) DEFAULT NULL,
  `tasktype` int(2) NOT NULL,
  PRIMARY KEY (`roleid`,`tasktype`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sharetaskcount`
--

LOCK TABLES `sharetaskcount` WRITE;
/*!40000 ALTER TABLE `sharetaskcount` DISABLE KEYS */;
/*!40000 ALTER TABLE `sharetaskcount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shawar`
--

DROP TABLE IF EXISTS `shawar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shawar` (
  `serverID` int(10) NOT NULL DEFAULT '0' COMMENT '?ID',
  `datas` varchar(2048) DEFAULT '0' COMMENT '????ID',
  PRIMARY KEY (`serverID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shawar`
--

LOCK TABLES `shawar` WRITE;
/*!40000 ALTER TABLE `shawar` DISABLE KEYS */;
/*!40000 ALTER TABLE `shawar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skfoot`
--

DROP TABLE IF EXISTS `skfoot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skfoot` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) DEFAULT '""',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skfoot`
--

LOCK TABLES `skfoot` WRITE;
/*!40000 ALTER TABLE `skfoot` DISABLE KEYS */;
/*!40000 ALTER TABLE `skfoot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '"0"',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES ('901188589596976960','þþ  (ª‘ÀÔþ¡ (ª‘ÀÔþ¢ (ª‘ÀÔþþ¤ (ª‘ÀÔþ¨ (ª‘ÀÔþþ® (ª‘ÀÔ ¨¤¢¡®'),('901188594146753856','þþè (ÛúÀÔè'),('901188594688604672','þþ  (žèÀÔ '),('901188595807958464','þþÑ (ÇîÀÔÑ'),('901188596520725056','þþ  (÷ýÀÔ '),('902314494066965824','þþ  (¹·ÀÔ '),('902314496335822016','þþ  (¤ýÀÔ '),('902314496418390400','þþ  (ÃýÀÔ '),('903440392448123712','þþ  (€ŠÀÔ '),('903440393981672768','þþÑ (Ë·ÀÔÑ'),('904566292934308032','þþÑ (´µÀÔþÒ (´µÀÔþÓ (´µÀÔþþÔ (´µÀÔþþÕ (´µÀÔþþ× (´µÀÔþØ (´µÀÔÑ×ØÕÔÓÒ'),('904566293838443712','þþé (·ÙÀÔé'),('904566293894541824','þþè (îúÀÔè');
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skjinm`
--

DROP TABLE IF EXISTS `skjinm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skjinm` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) DEFAULT '""',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skjinm`
--

LOCK TABLES `skjinm` WRITE;
/*!40000 ALTER TABLE `skjinm` DISABLE KEYS */;
/*!40000 ALTER TABLE `skjinm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skwing`
--

DROP TABLE IF EXISTS `skwing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skwing` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) DEFAULT '""',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skwing`
--

LOCK TABLES `skwing` WRITE;
/*!40000 ALTER TABLE `skwing` DISABLE KEYS */;
/*!40000 ALTER TABLE `skwing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skxuanb`
--

DROP TABLE IF EXISTS `skxuanb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skxuanb` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) DEFAULT '""',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skxuanb`
--

LOCK TABLES `skxuanb` WRITE;
/*!40000 ALTER TABLE `skxuanb` DISABLE KEYS */;
INSERT INTO `skxuanb` VALUES ('901188589596976960','*ì');
/*!40000 ALTER TABLE `skxuanb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stall`
--

DROP TABLE IF EXISTS `stall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stall` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(2048) DEFAULT NULL,
  `stallId` int(11) DEFAULT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stall`
--

LOCK TABLES `stall` WRITE;
/*!40000 ALTER TABLE `stall` DISABLE KEYS */;
/*!40000 ALTER TABLE `stall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `swornbros`
--

DROP TABLE IF EXISTS `swornbros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swornbros` (
  `id` int(11) NOT NULL DEFAULT '0',
  `leader` varchar(32) NOT NULL DEFAULT '',
  `createTime` int(11) NOT NULL DEFAULT '0',
  `skillPoints` int(11) NOT NULL DEFAULT '0',
  `relation` int(11) NOT NULL DEFAULT '0',
  `maxRelationLvl` int(11) NOT NULL DEFAULT '0',
  `lastUpdate` int(11) NOT NULL DEFAULT '0',
  `dailyIncRelation` int(11) NOT NULL DEFAULT '0',
  `members` varchar(1024) NOT NULL,
  `skills` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `swornbros`
--

LOCK TABLES `swornbros` WRITE;
/*!40000 ALTER TABLE `swornbros` DISABLE KEYS */;
/*!40000 ALTER TABLE `swornbros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targetreward`
--

DROP TABLE IF EXISTS `targetreward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `targetreward` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targetreward`
--

LOCK TABLES `targetreward` WRITE;
/*!40000 ALTER TABLE `targetreward` DISABLE KEYS */;
/*!40000 ALTER TABLE `targetreward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) NOT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES ('901188589596976960',' ÛÏÔ	Ònullº{}BnullÜÏÔ	àÛÏÔ	ªnull‚{}—N\Z{}²¼Ž\Z{0}'),('901188594146753856',' ÛÏÔ	Ònullº{}BnullÜÏÔ	àÛÏÔ	ªnull‚{}“N\Znull'),('901188594688604672',' ÛÏÔ	Ònullº{}BnullÜÏÔ	àÛÏÔ	ªnull‚{}‘N\Z{}'),('901188595807958464',' ÛÏÔ	Ònullº{}BnullÜÏÔ	àÛÏÔ	ªnull‚{}“N\Z{1}'),('901188596520725056',' ÛÏÔ	Ònullº{}BnullÜÏÔ	àÛÏÔ	ªnull‚{}’N\Z{1}'),('902314494066965824',' ÛÏÔ	Ònullº{}BnullÜÏÔ	àÛÏÔ	ªnull‚{}’N\Z{0}'),('902314496335822016',' ÛÏÔ	Ònullº{}BnullÜÏÔ	àÛÏÔ	ªnull‚{}N\Z{}'),('902314496418390400',' ÛÏÔ	Ònullº{}BnullÜÏÔ	àÛÏÔ	ªnull‚{}N\Z{}'),('903440392448123712',' ÛÏÔ	Ònullº{}BnullÜÏÔ	àÛÏÔ	ªnull‚{}’N\Z{2}'),('903440393981672768',' ÛÏÔ	Ònullº{}BnullÜÏÔ	àÛÏÔ	ªnull‚{}N\Z{}'),('904566292934308032',' ÛÏÔ	Ònullº{}BnullÜÏÔ	àÛÏÔ	ªnull‚{}§N\Znull²»Ž\Z{1}'),('904566293838443712',' ÛÏÔ	Ònullº{}BnullÜÏÔ	àÛÏÔ	ªnull‚{}”N\Z{0}'),('904566293894541824',' ÛÏÔ	Ònullº{}BnullÜÏÔ	àÛÏÔ	ªnull‚{}–N\Z{1}');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task2`
--

DROP TABLE IF EXISTS `task2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task2` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) NOT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task2`
--

LOCK TABLES `task2` WRITE;
/*!40000 ALTER TABLE `task2` DISABLE KEYS */;
INSERT INTO `task2` VALUES ('901188589596976960','¹ŽºŽ»Ž'),('904566292934308032','¹ŽºŽ');
/*!40000 ALTER TABLE `task2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cqsj_onlinecnt`
--

DROP TABLE IF EXISTS `tb_cqsj_onlinecnt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cqsj_onlinecnt` (
  `gameappid` varchar(1000) COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cqsj_onlinecnt`
--

LOCK TABLES `tb_cqsj_onlinecnt` WRITE;
/*!40000 ALTER TABLE `tb_cqsj_onlinecnt` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cqsj_onlinecnt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `title`
--

DROP TABLE IF EXISTS `title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `title` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) DEFAULT '""',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `title`
--

LOCK TABLES `title` WRITE;
/*!40000 ALTER TABLE `title` DISABLE KEYS */;
/*!40000 ALTER TABLE `title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `towerdata`
--

DROP TABLE IF EXISTS `towerdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `towerdata` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `towerdata`
--

LOCK TABLES `towerdata` WRITE;
/*!40000 ALTER TABLE `towerdata` DISABLE KEYS */;
INSERT INTO `towerdata` VALUES ('901188589596976960','1&20260827&0&0&1');
/*!40000 ALTER TABLE `towerdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade`
--

DROP TABLE IF EXISTS `trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade`
--

LOCK TABLES `trade` WRITE;
/*!40000 ALTER TABLE `trade` DISABLE KEYS */;
INSERT INTO `trade` VALUES ('901188589596976960','ÛÏÔ	'),('901188594146753856','ÛÏÔ	'),('901188594688604672','ÛÏÔ	'),('901188595807958464','ÛÏÔ	'),('901188596520725056','ÛÏÔ	'),('902314494066965824','ÛÏÔ	'),('902314496335822016','ÛÏÔ	'),('902314496418390400','ÛÏÔ	'),('903440392448123712','ÛÏÔ	'),('903440393981672768','ÛÏÔ	'),('904566292934308032','ÛÏÔ	'),('904566293838443712','ÛÏÔ	'),('904566293894541824','ÛÏÔ	');
/*!40000 ALTER TABLE `trade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treasureinfo`
--

DROP TABLE IF EXISTS `treasureinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treasureinfo` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) NOT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treasureinfo`
--

LOCK TABLES `treasureinfo` WRITE;
/*!40000 ALTER TABLE `treasureinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `treasureinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Username` varchar(64) DEFAULT NULL,
  `UserID` varchar(64) NOT NULL DEFAULT '0',
  `WorldID` int(11) NOT NULL,
  `CreateDate_obj` datetime DEFAULT '0000-00-00 00:00:00',
  `LockDate` int(11) DEFAULT '0',
  `DeleteDate` date DEFAULT NULL,
  `SessionID` int(11) DEFAULT '0',
  `PwdHash` varchar(64) NOT NULL DEFAULT '0',
  `From_IP` varchar(1000) DEFAULT NULL,
  `From_ADD` varchar(1000) DEFAULT NULL,
  `From_TIME` datetime DEFAULT NULL,
  `Reg_IP` varchar(1000) DEFAULT NULL,
  `Reg_ADD` varchar(1000) DEFAULT NULL,
  `Calle_Y` bigint(20) NOT NULL,
  `Calle_F` int(11) NOT NULL,
  `Calle_T` bigint(20) NOT NULL,
  `State` bigint(20) NOT NULL,
  `Skey` varchar(1000) NOT NULL,
  PRIMARY KEY (`UserID`) USING BTREE,
  KEY `Username` (`Username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('111111','111111',800,'2026-08-27 01:59:49',0,NULL,0,'111111','<<LAN_IP>>','','2026-08-27 08:56:56','<<LAN_IP>>','NET',46,1,0,1,'zhcs'),('<<DB_OR_GM_PASSWORD>>','<<DB_OR_GM_PASSWORD>>',800,'2026-08-27 06:55:48',0,NULL,0,'111111','<<LAN_IP>>','','2026-08-27 09:42:32','<<LAN_IP>>','NET',23,1,0,1,'zhcs'),('qqqqqq','qqqqqq',800,'2026-08-27 07:06:28',0,NULL,0,'111111',NULL,NULL,NULL,'<<LAN_IP>>','NET',0,1,0,1,'admin123');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whitelist`
--

DROP TABLE IF EXISTS `whitelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whitelist` (
  `OpenID` varchar(64) NOT NULL,
  `Status` int(11) DEFAULT '0',
  PRIMARY KEY (`OpenID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whitelist`
--

LOCK TABLES `whitelist` WRITE;
/*!40000 ALTER TABLE `whitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `whitelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wing`
--

DROP TABLE IF EXISTS `wing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wing` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `wingID` int(11) NOT NULL,
  `wingSkill` varchar(1024) NOT NULL DEFAULT '""',
  `pomoteTime` int(11) NOT NULL,
  `wingLevel` int(11) NOT NULL,
  `wingStar` int(11) NOT NULL,
  `successTime` int(11) NOT NULL,
  `fightAbility` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `wingHuah` varchar(1024) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wing`
--

LOCK TABLES `wing` WRITE;
/*!40000 ALTER TABLE `wing` DISABLE KEYS */;
/*!40000 ALTER TABLE `wing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xunbao`
--

DROP TABLE IF EXISTS `xunbao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xunbao` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(1024) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xunbao`
--

LOCK TABLES `xunbao` WRITE;
/*!40000 ALTER TABLE `xunbao` DISABLE KEYS */;
/*!40000 ALTER TABLE `xunbao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yuanbaotrade`
--

DROP TABLE IF EXISTS `yuanbaotrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yuanbaotrade` (
  `Billno` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Type` int(11) NOT NULL,
  `RoleID` varchar(32) NOT NULL DEFAULT '',
  `RoleName` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `OpenID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Money` int(11) NOT NULL,
  `Reason` int(11) NOT NULL,
  `TokenId` varchar(256) DEFAULT '',
  `State` int(11) NOT NULL DEFAULT '0',
  `Time` bigint(11) NOT NULL DEFAULT '0',
  `RecvID` varchar(32) DEFAULT '0',
  `ExchangeFee` int(11) DEFAULT '0',
  `RecvOpenID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `RecvPlatID` int(11) DEFAULT '0',
  `RecvGameAppid` varchar(32) DEFAULT '',
  `RecvLevel` int(11) DEFAULT '0',
  `RecvMoney` int(11) DEFAULT '0',
  `UpdateTime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`Billno`,`Type`) USING BTREE,
  KEY `RoleName` (`RoleName`) USING BTREE,
  KEY `OpenID` (`OpenID`) USING BTREE,
  KEY `RoleID` (`RoleID`,`Type`) USING BTREE,
  KEY `Time` (`Time`) USING BTREE,
  KEY `State` (`State`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yuanbaotrade`
--

LOCK TABLES `yuanbaotrade` WRITE;
/*!40000 ALTER TABLE `yuanbaotrade` DISABLE KEYS */;
/*!40000 ALTER TABLE `yuanbaotrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `longwen_name`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `longwen_name` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;

USE `longwen_name`;

--
-- Table structure for table `factionname`
--

DROP TABLE IF EXISTS `factionname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factionname` (
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user` varchar(32) NOT NULL DEFAULT '0',
  `server` int(11) NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factionname`
--

LOCK TABLES `factionname` WRITE;
/*!40000 ALTER TABLE `factionname` DISABLE KEYS */;
/*!40000 ALTER TABLE `factionname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fightteamname`
--

DROP TABLE IF EXISTS `fightteamname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fightteamname` (
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user` varchar(32) NOT NULL DEFAULT '0',
  `server` int(11) NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fightteamname`
--

LOCK TABLES `fightteamname` WRITE;
/*!40000 ALTER TABLE `fightteamname` DISABLE KEYS */;
/*!40000 ALTER TABLE `fightteamname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `username001`
--

DROP TABLE IF EXISTS `username001`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `username001` (
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user` varchar(32) NOT NULL DEFAULT '0',
  `server` int(11) NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `username001`
--

LOCK TABLES `username001` WRITE;
/*!40000 ALTER TABLE `username001` DISABLE KEYS */;
INSERT INTO `username001` VALUES ('222','111111',2008000,1787823335),('å´å­¦æž—','<<DB_OR_GM_PASSWORD>>',2008030,1787828994);
/*!40000 ALTER TABLE `username001` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `username002`
--

DROP TABLE IF EXISTS `username002`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `username002` (
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user` varchar(32) NOT NULL DEFAULT '0',
  `server` int(11) NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `username002`
--

LOCK TABLES `username002` WRITE;
/*!40000 ALTER TABLE `username002` DISABLE KEYS */;
/*!40000 ALTER TABLE `username002` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `username003`
--

DROP TABLE IF EXISTS `username003`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `username003` (
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user` varchar(32) NOT NULL DEFAULT '0',
  `server` int(11) NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `username003`
--

LOCK TABLES `username003` WRITE;
/*!40000 ALTER TABLE `username003` DISABLE KEYS */;
INSERT INTO `username003` VALUES ('4','111111',2008030,1787825545);
/*!40000 ALTER TABLE `username003` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `username004`
--

DROP TABLE IF EXISTS `username004`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `username004` (
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user` varchar(32) NOT NULL DEFAULT '0',
  `server` int(11) NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `username004`
--

LOCK TABLES `username004` WRITE;
/*!40000 ALTER TABLE `username004` DISABLE KEYS */;
INSERT INTO `username004` VALUES ('ç«¯æœ¨å…ƒåŒ–','<<DB_OR_GM_PASSWORD>>',2008020,1787829185),('é‚±å³»ç†™','<<DB_OR_GM_PASSWORD>>',2008000,1787838160);
/*!40000 ALTER TABLE `username004` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `username005`
--

DROP TABLE IF EXISTS `username005`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `username005` (
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user` varchar(32) NOT NULL DEFAULT '0',
  `server` int(11) NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `username005`
--

LOCK TABLES `username005` WRITE;
/*!40000 ALTER TABLE `username005` DISABLE KEYS */;
/*!40000 ALTER TABLE `username005` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `username006`
--

DROP TABLE IF EXISTS `username006`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `username006` (
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user` varchar(32) NOT NULL DEFAULT '0',
  `server` int(11) NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `username006`
--

LOCK TABLES `username006` WRITE;
/*!40000 ALTER TABLE `username006` DISABLE KEYS */;
INSERT INTO `username006` VALUES ('æ²ˆæ­£æ–‡','<<DB_OR_GM_PASSWORD>>',2008010,1787838125);
/*!40000 ALTER TABLE `username006` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `username007`
--

DROP TABLE IF EXISTS `username007`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `username007` (
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user` varchar(32) NOT NULL DEFAULT '0',
  `server` int(11) NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `username007`
--

LOCK TABLES `username007` WRITE;
/*!40000 ALTER TABLE `username007` DISABLE KEYS */;
/*!40000 ALTER TABLE `username007` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `username008`
--

DROP TABLE IF EXISTS `username008`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `username008` (
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user` varchar(32) NOT NULL DEFAULT '0',
  `server` int(11) NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `username008`
--

LOCK TABLES `username008` WRITE;
/*!40000 ALTER TABLE `username008` DISABLE KEYS */;
INSERT INTO `username008` VALUES ('111','111111',2008000,1787811748),('æ³•å¸ˆ','111111',2008000,1787835441);
/*!40000 ALTER TABLE `username008` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `username009`
--

DROP TABLE IF EXISTS `username009`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `username009` (
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user` varchar(32) NOT NULL DEFAULT '0',
  `server` int(11) NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `username009`
--

LOCK TABLES `username009` WRITE;
/*!40000 ALTER TABLE `username009` DISABLE KEYS */;
INSERT INTO `username009` VALUES ('11','<<DB_OR_GM_PASSWORD>>',2008000,1787831171),('ç½—é¸¿å…‰','<<DB_OR_GM_PASSWORD>>',2008030,1787829208);
/*!40000 ALTER TABLE `username009` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `username010`
--

DROP TABLE IF EXISTS `username010`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `username010` (
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user` varchar(32) NOT NULL DEFAULT '0',
  `server` int(11) NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `username010`
--

LOCK TABLES `username010` WRITE;
/*!40000 ALTER TABLE `username010` DISABLE KEYS */;
INSERT INTO `username010` VALUES ('å¸å¾’ä¹éŸ³','<<DB_OR_GM_PASSWORD>>',2008010,1787829155),('é‚±ä¿®è°¨','<<DB_OR_GM_PASSWORD>>',2008000,1787829104),('é›·ä¿®æ–‡','<<DB_OR_GM_PASSWORD>>',2008010,1787837810);
/*!40000 ALTER TABLE `username010` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-28 10:10:50
