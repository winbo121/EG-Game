-- MySQL dump 10.15  Distrib 10.0.21-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: winbo121
-- ------------------------------------------------------
-- Server version	10.1.13-MariaDB

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
-- Table structure for table `admin_board`
--

DROP TABLE IF EXISTS `admin_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_board` (
  `board_num` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `contents` varchar(45) NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `file` varchar(45) NOT NULL,
  `category` varchar(45) NOT NULL,
  `cnt` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`board_num`),
  KEY `id_idx` (`user_id`),
  KEY `category_cd_idx` (`category`),
  CONSTRAINT `code_cd` FOREIGN KEY (`category`) REFERENCES `category_code` (`code_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_board`
--

LOCK TABLES `admin_board` WRITE;
/*!40000 ALTER TABLE `admin_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_board_reply`
--

DROP TABLE IF EXISTS `admin_board_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_board_reply` (
  `reply_num` int(11) NOT NULL AUTO_INCREMENT,
  `reply_content` varchar(45) NOT NULL,
  `board_num` int(11) NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reply_num`),
  KEY `board_num_idx` (`board_num`),
  KEY `id_idx` (`user_id`),
  CONSTRAINT `board_id` FOREIGN KEY (`board_num`) REFERENCES `admin_board` (`board_num`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_board_reply`
--

LOCK TABLES `admin_board_reply` WRITE;
/*!40000 ALTER TABLE `admin_board_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_board_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `mem_name` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `content` varchar(45) DEFAULT NULL,
  `replycount` int(11) DEFAULT '0',
  `regdate` varchar(45) DEFAULT NULL,
  `count` int(11) DEFAULT '0',
  `filename` varchar(45) DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'123','4684','4564',0,'354',0,'fwaf',5),(2,'123','4684','4564',0,'354',0,'fwaf',5);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_code`
--

DROP TABLE IF EXISTS `category_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_code` (
  `code_cd` varchar(20) NOT NULL,
  `code_name` varchar(45) NOT NULL,
  PRIMARY KEY (`code_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_code`
--

LOCK TABLES `category_code` WRITE;
/*!40000 ALTER TABLE `category_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `center_board`
--

DROP TABLE IF EXISTS `center_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `center_board` (
  `board_num` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `contents` varchar(45) NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `file` varchar(45) NOT NULL,
  `cotegory` varchar(45) NOT NULL,
  `cnt` varchar(45) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`board_num`),
  KEY `id_idx` (`user_id`),
  KEY `cate_idx` (`cotegory`),
  CONSTRAINT `cate` FOREIGN KEY (`cotegory`) REFERENCES `category_code` (`code_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id4` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `center_board`
--

LOCK TABLES `center_board` WRITE;
/*!40000 ALTER TABLE `center_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `center_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `center_board_reply`
--

DROP TABLE IF EXISTS `center_board_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `center_board_reply` (
  `reply_num` int(11) NOT NULL AUTO_INCREMENT,
  `reply_content` varchar(45) NOT NULL,
  `board_num` int(11) NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reply_num`),
  KEY `id_idx` (`user_id`),
  KEY `board_id12_idx` (`board_num`),
  CONSTRAINT `board_id12` FOREIGN KEY (`board_num`) REFERENCES `center_board` (`board_num`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idx12` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `center_board_reply`
--

LOCK TABLES `center_board_reply` WRITE;
/*!40000 ALTER TABLE `center_board_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `center_board_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games_info`
--

DROP TABLE IF EXISTS `games_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games_info` (
  `game_code` varchar(20) NOT NULL,
  `game_name` varchar(45) NOT NULL,
  PRIMARY KEY (`game_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games_info`
--

LOCK TABLES `games_info` WRITE;
/*!40000 ALTER TABLE `games_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `games_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games_score`
--

DROP TABLE IF EXISTS `games_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games_score` (
  `score_num` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  `game_code` varchar(45) NOT NULL,
  `create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`score_num`),
  KEY `user_123_idx` (`user_id`),
  KEY `score_idx` (`game_code`),
  CONSTRAINT `score` FOREIGN KEY (`game_code`) REFERENCES `games_info` (`game_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_123` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games_score`
--

LOCK TABLES `games_score` WRITE;
/*!40000 ALTER TABLE `games_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `games_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `mid` int(11) NOT NULL,
  `uid` varchar(45) NOT NULL,
  PRIMARY KEY (`mid`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gta`
--

DROP TABLE IF EXISTS `gta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gta` (
  `name` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gta`
--

LOCK TABLES `gta` WRITE;
/*!40000 ALTER TABLE `gta` DISABLE KEYS */;
INSERT INTO `gta` VALUES ('1','1'),('787978','45345');
/*!40000 ALTER TABLE `gta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_member`
--

DROP TABLE IF EXISTS `s_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_member` (
  `uid` varchar(10) NOT NULL,
  `passwd` varchar(12) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_member`
--

LOCK TABLES `s_member` WRITE;
/*!40000 ALTER TABLE `s_member` DISABLE KEYS */;
INSERT INTO `s_member` VALUES ('1029421735','kakao','eun'),('1029423360','kakao','???'),('1082870562','kakao','123'),('1306044914','kakao','133'),('1673886514','kakao','???');
/*!40000 ALTER TABLE `s_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_message`
--

DROP TABLE IF EXISTS `s_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_message` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) NOT NULL,
  `msg` varchar(45) NOT NULL,
  `favcount` int(11) DEFAULT '0',
  `replycount` int(11) DEFAULT '0',
  `date` datetime NOT NULL,
  `img` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_message`
--

LOCK TABLES `s_message` WRITE;
/*!40000 ALTER TABLE `s_message` DISABLE KEYS */;
INSERT INTO `s_message` VALUES (62,'eun','제주 1100고지',0,0,'2020-03-13 15:06:28','3DBD9D5E-6F4A-4F0E-A7CD-CF5BA58B36EE.jpeg'),(63,'eun','제주 고기국수',0,0,'2020-03-13 15:07:11','C4C8A58D-AD9C-4618-9985-9DA8FEFB2C97.jpeg'),(64,'eun','파주 출판도시',0,0,'2020-03-13 15:08:41','84C29CCF-5FFC-4545-B7C9-53CB9D03EFF3.jpeg'),(65,'eun','속초 칠성조선소',0,0,'2020-03-13 15:09:31','325A3E30-847B-4D44-9E8E-32E20E739D36.jpeg'),(66,'eun','충남 예산 노을',0,0,'2020-03-13 15:10:49','636EECA0-1D7D-4C0A-A1C6-F1C5A7BF9E43.jpeg'),(67,'eun','제주 새별오름',0,0,'2020-03-13 15:12:07','5325D096-B728-4CEC-8609-D9B474606225.jpeg');
/*!40000 ALTER TABLE `s_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_reply`
--

DROP TABLE IF EXISTS `s_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_reply` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL,
  `uid` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `rmsg` varchar(50) NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_reply`
--

LOCK TABLES `s_reply` WRITE;
/*!40000 ALTER TABLE `s_reply` DISABLE KEYS */;
INSERT INTO `s_reply` VALUES (52,64,'123','2020-07-06 10:26:02','ZZ');
/*!40000 ALTER TABLE `s_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_board`
--

DROP TABLE IF EXISTS `tbl_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_board` (
  `bno` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `content` varchar(45) NOT NULL,
  `writer` varchar(45) NOT NULL,
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `viewcnt` int(11) DEFAULT '0',
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_board`
--

LOCK TABLES `tbl_board` WRITE;
/*!40000 ALTER TABLE `tbl_board` DISABLE KEYS */;
INSERT INTO `tbl_board` VALUES (1,'123','99','555','2020-04-03 11:30:08',0);
/*!40000 ALTER TABLE `tbl_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_board`
--

DROP TABLE IF EXISTS `user_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_board` (
  `board_num` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `contents` varchar(45) NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `file` varchar(45) NOT NULL,
  `cotegory` varchar(45) NOT NULL,
  `cnt` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`board_num`),
  KEY `user_id123_idx` (`user_id`),
  KEY `cte123_idx` (`cotegory`),
  CONSTRAINT `cte123` FOREIGN KEY (`cotegory`) REFERENCES `category_code` (`code_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id123` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_board`
--

LOCK TABLES `user_board` WRITE;
/*!40000 ALTER TABLE `user_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_board_reply`
--

DROP TABLE IF EXISTS `user_board_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_board_reply` (
  `reply_num` int(11) NOT NULL AUTO_INCREMENT,
  `reply_content` varchar(45) NOT NULL,
  `board_num` int(11) NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reply_num`),
  KEY `user123_idx` (`board_num`),
  KEY `inf_idx` (`user_id`),
  CONSTRAINT `inf` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user123` FOREIGN KEY (`board_num`) REFERENCES `user_board` (`board_num`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_board_reply`
--

LOCK TABLES `user_board_reply` WRITE;
/*!40000 ALTER TABLE `user_board_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_board_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `id` varchar(20) NOT NULL,
  `pw` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `img` varchar(45) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES ('test2@naver.com','1442242'),('test23333@naver.com','45634555'),('test243@naver.com','12344222');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_info`
--

DROP TABLE IF EXISTS `visit_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_info` (
  `visit_num` int(11) NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`visit_num`),
  KEY `user1235_idx` (`user_id`),
  CONSTRAINT `user1235` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_info`
--

LOCK TABLES `visit_info` WRITE;
/*!40000 ALTER TABLE `visit_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-02 15:01:01
