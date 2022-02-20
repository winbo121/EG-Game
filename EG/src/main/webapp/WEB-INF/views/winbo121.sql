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
  `cotegory` varchar(45) NOT NULL,
  `cnt` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`board_num`),
  KEY `id_idx` (`user_id`),
  KEY `category_cd_idx` (`cotegory`),
  CONSTRAINT `code_cd` FOREIGN KEY (`cotegory`) REFERENCES `category_code` (`code_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
  `code_cd_id` varchar(5) NOT NULL,
  PRIMARY KEY (`code_cd`),
  KEY `w223` (`code_cd_id`),
  CONSTRAINT `w223` FOREIGN KEY (`code_cd_id`) REFERENCES `cmm_code` (`cmm_code_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_code`
--

LOCK TABLES `category_code` WRITE;
/*!40000 ALTER TABLE `category_code` DISABLE KEYS */;
INSERT INTO `category_code` VALUES ('B0001','자기소개','G1'),('B0002','자유게시판','G1'),('B0003','질문게시판','G1'),('B0004','아이디정보/ 보안','G2'),('B0005','게임문의','G2'),('B0006','오류 및 복구','G2'),('B0007','카카오톡로그인','G3'),('B0008','일반로그인','G3');
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
  `file` varchar(1000) NOT NULL,
  `cotegory` varchar(45) NOT NULL,
  `cnt` varchar(45) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(45) NOT NULL,
  `process` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`board_num`),
  KEY `id_idx` (`user_id`),
  KEY `cate_idx` (`cotegory`),
  CONSTRAINT `cate` FOREIGN KEY (`cotegory`) REFERENCES `category_code` (`code_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id4` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `center_board`
--

LOCK TABLES `center_board` WRITE;
/*!40000 ALTER TABLE `center_board` DISABLE KEYS */;
INSERT INTO `center_board` VALUES (1,'fwafwa','fwaf','winbo121','8c7063d3-c5ca-42d1-b8b1-cf592af53dfeglobal properties 개발용.txt','B0005','10','2021-09-27 17:51:04','winbo121@nate.com','N'),(2,'999','8888','winbo121','e1beaba1-2bfd-49c7-a989-db86d455ef0e시큐릿 SRT.txt','B0005','4','2021-09-27 17:53:55','winbo121@hanmail.net','N'),(3,'fwa2424','2424','winbo121','84f2847e-3519-4bce-b671-d510d4a26dbdUpdate.exe','B0005','6','2021-09-28 09:31:24','winbo121@naver.com','N'),(4,'test','ffwaf','winbo121','a1d531be-b853-4560-ba41-6b3349a837b6SquirrelSetup.log','B0005','4','2021-09-28 10:04:29','winbo121@naver.com','N'),(5,'ppp','pp','winbo121','3f51fb21-471e-4fe5-ad3c-e7310f281a39Update.VisualElementsManifest.xml','B0005','2','2021-09-28 10:09:34','winbo121@naver.com','N'),(6,'ppp','pp','winbo121','59e157e9-11d5-4430-8a79-16e0aaddab58Update.exe','B0005','2','2021-09-28 10:09:43','winbo121@naver.com','N'),(7,'테스트 굳쉿맨','9988','winbo121','98788c63-cdea-425e-888a-a5ab1e901cedUpdate.VisualElementsManifest.xml','B0004','11','2021-09-28 10:11:34','winbo121@naver.com','Y'),(8,'2424','2424','winbo121','d5b2f66c-0003-49ba-bf9d-ffa8753f31d5Update.VisualElementsManifest.xml','B0005','1','2021-09-28 10:14:41','winbo121@naver.com','N'),(9,'24','424','winbo121','61cd6501-aab5-4652-80c2-c000affaf75fUpdate.VisualElementsManifest.xml','B0005','1','2021-09-28 10:16:21','winbo121@naver.com','N'),(10,'hobo','22242','winbo121','1cd53196-15c4-413a-b5f6-2f7ee20e39e0Update.exe','B0005','4','2021-09-28 10:17:30','winbo121@naver.com','N'),(11,'998222222','222','winbo121','865e5cc4-b749-46c6-bbf7-713c84c8561dUpdate.VisualElementsManifest.xml','B0006','5','2021-09-28 10:18:10','winbo121@naver.com','N'),(12,'666','666','winbo121','9640b16b-45a9-43de-8b5f-53000ed698baUpdate.VisualElementsManifest.xml','B0005','4','2021-09-28 10:20:14','winbo121@naver.com','Y'),(13,'5252','1234','winbo121','36f66dc2-b761-4282-a3c8-a059a1314c9bUpdate.exe','B0005','6','2021-09-28 10:23:49','winbo121@naver.com','N'),(14,'!!!','ㄱㄱㅈㅁ','winbo121','81ef82c2-8ebb-46a4-8652-a811deba124cUpdate.VisualElementsManifest.xml','B0004','5','2021-09-28 10:24:18','winbo121@naver.com','N'),(15,'555787','4848','winbo121','7f0bec63-773c-4124-8def-ee13a8ba2ac0app.ico','B0005','2','2021-09-28 16:05:27','winbo121@naver.com','N'),(16,'테테테스트','테테테스트','winbo121','317d5d89-11f3-4ebb-9f16-9ebe49fa7921setup.json','B0005','9','2021-09-29 09:58:36','winbo121@naver.com','N'),(17,'fwa','fwa','winbo121','0c342337-ec2e-4e17-afe7-3654e7f8f190SquirrelSetup.log','B0004','4','2021-09-29 17:58:42','winbo121@naver.com','N'),(18,'fff','ff','winbo121','4776a6c0-2803-44ec-a813-c6e58d17e7c8Update.VisualElementsManifest.xml','B0004','5','2021-09-29 17:59:20','winbo121@naver.com','N'),(19,'gta','gat','winbo121','89a12a58-dcfe-46e2-a6fb-79544bc3a3ecSquirrelSetup.log','B0004','10','2021-09-29 17:59:41','winbo121@naver.com','N'),(20,'99*33','99*33','winbo121','e7e5005d-ea44-458a-9c6f-c9583ddeab2f나스.txt','B0005','11','2021-09-30 14:17:28','winbo121@naver.com','N'),(22,'Eee','Eee','winbo121','634230a6-6ca3-4755-9084-048036f8b9b616338505821382513663597836709305.jpg','B0004','36','2021-10-10 16:23:19','Gta@naver.com','N'),(23,'퉁퉁퉁','저더어아아','winbo121','c108f2da-8db4-4597-833d-676f0171ee16Screenshot_20211011-040337_(1).png','B0005','10','2021-10-12 01:55:04','winbo121@선택하세요','N'),(24,'저라저라','ㄹㅈ머ㅏㅏ러','winbo121','','B0005','10','2021-10-17 17:00:43','winbo121@nate.com','N');
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
-- Table structure for table `cmm_code`
--

DROP TABLE IF EXISTS `cmm_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmm_code` (
  `cmm_code_id` varchar(5) NOT NULL,
  `cmm_code_nm` varchar(45) NOT NULL,
  PRIMARY KEY (`cmm_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmm_code`
--

LOCK TABLES `cmm_code` WRITE;
/*!40000 ALTER TABLE `cmm_code` DISABLE KEYS */;
INSERT INTO `cmm_code` VALUES ('G1','자유게시판'),('G2','고객센터'),('G3','로그인');
/*!40000 ALTER TABLE `cmm_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_upload`
--

DROP TABLE IF EXISTS `file_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_upload` (
  `file_id` varchar(50) NOT NULL,
  `code_cd_id` varchar(5) NOT NULL,
  `fiie_code` varchar(1000) NOT NULL,
  `fiie_name` varchar(1000) NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `ww15` (`code_cd_id`),
  CONSTRAINT `ww15` FOREIGN KEY (`code_cd_id`) REFERENCES `cmm_code` (`cmm_code_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_upload`
--

LOCK TABLES `file_upload` WRITE;
/*!40000 ALTER TABLE `file_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_upload` ENABLE KEYS */;
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
INSERT INTO `goods` VALUES (67,'123');
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_message`
--

LOCK TABLES `s_message` WRITE;
/*!40000 ALTER TABLE `s_message` DISABLE KEYS */;
INSERT INTO `s_message` VALUES (62,'eun','제주 1100고지',0,0,'2020-03-13 15:06:28','3DBD9D5E-6F4A-4F0E-A7CD-CF5BA58B36EE.jpeg'),(63,'eun','제주 고기국수',0,0,'2020-03-13 15:07:11','C4C8A58D-AD9C-4618-9985-9DA8FEFB2C97.jpeg'),(64,'eun','파주 출판도시',0,0,'2020-03-13 15:08:41','84C29CCF-5FFC-4545-B7C9-53CB9D03EFF3.jpeg'),(65,'eun','속초 칠성조선소',0,0,'2020-03-13 15:09:31','325A3E30-847B-4D44-9E8E-32E20E739D36.jpeg'),(66,'eun','충남 예산 노을',0,0,'2020-03-13 15:10:49','636EECA0-1D7D-4C0A-A1C6-F1C5A7BF9E43.jpeg'),(67,'eun','제주 새별오름',0,0,'2020-03-13 15:12:07','5325D096-B728-4CEC-8609-D9B474606225.jpeg'),(68,'123','ㅋㅋㅋ',0,0,'2021-10-05 02:54:37','1619519733888.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_reply`
--

LOCK TABLES `s_reply` WRITE;
/*!40000 ALTER TABLE `s_reply` DISABLE KEYS */;
INSERT INTO `s_reply` VALUES (52,64,'123','2020-07-06 10:26:02','ZZ'),(53,67,'123','2021-09-30 16:17:43','로ㅓ어어'),(56,62,'123','2021-12-03 22:07:11','ㅋㅋㅋㅋ');
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
  `file` varchar(1000) NOT NULL,
  `cotegory` varchar(45) NOT NULL,
  `cnt` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`board_num`),
  KEY `user_id123_idx` (`user_id`),
  KEY `cte123_idx` (`cotegory`),
  CONSTRAINT `cte123` FOREIGN KEY (`cotegory`) REFERENCES `category_code` (`code_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id123` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_board`
--

LOCK TABLES `user_board` WRITE;
/*!40000 ALTER TABLE `user_board` DISABLE KEYS */;
INSERT INTO `user_board` VALUES (8,'테스트 제목3','테스트 내용3','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(10,'테스트 제목5','테스트 내용5','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(11,'테스트 제목6','테스트 내용6','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(12,'테스트 제목7','테스트 내용7','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(13,'테스트 제목8','테스트 내용8','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(14,'테스트 제목9','테스트 내용9','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(15,'테스트 제목10','테스트 내용10','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(17,'테스트 제목12','테스트 내용12','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(18,'테스트 제목13','테스트 내용13','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(19,'테스트 제목14','테스트 내용14','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(20,'테스트 제목15','테스트 내용15','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(21,'테스트 제목16','테스트 내용16','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(22,'테스트 제목17','테스트 내용17','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(23,'테스트 제목18','테스트 내용18','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(24,'테스트 제목19','테스트 내용19','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(25,'테스트 제목20','테스트 내용20','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(26,'테스트 제목21','테스트 내용21','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(28,'테스트 제목23','테스트 내용23','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(29,'테스트 제목24','테스트 내용24','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(31,'테스트 제목26','테스트 내용26','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(32,'테스트 제목27','테스트 내용27','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(33,'테스트 제목28','테스트 내용28','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(34,'테스트 제목29','테스트 내용29','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(35,'테스트 제목30','테스트 내용30','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(36,'테스트 제목31','테스트 내용31','winbo121','file','B0001',56,'2021-09-06 13:37:43'),(38,'테스트 제목33','테스트 내용33','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(39,'테스트 제목34','테스트 내용34','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(40,'테스트 제목35','테스트 내용35','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(41,'테스트 제목36','테스트 내용36','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(42,'테스트 제목37','테스트 내용37','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(43,'테스트 제목38','테스트 내용38','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(44,'테스트 제목39','테스트 내용39','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(45,'테스트 제목40','테스트 내용40','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(46,'테스트 제목41','테스트 내용41','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(48,'테스트 제목43','테스트 내용43','winbo121','0520fdf4-7622-43f9-9a4c-5fd9ef859dcbinstall.txt','B0001',55,'2021-09-06 13:37:43'),(49,'테스트 제목44','테스트 내용44','winbo121','file','B0001',57,'2021-09-06 13:37:43'),(50,'테스트 제목45','테스트 내용45','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(51,'테스트 제목46','테스트 내용46','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(52,'테스트 제목47','테스트 내용47','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(54,'테스트 제목49','테스트 내용49','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(55,'테스트 제목50','테스트 내용50','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(56,'테스트 제목51','테스트 내용51','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(57,'테스트 제목52','테스트 내용52','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(58,'테스트 제목53','테스트 내용53','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(59,'테스트 제목54','테스트 내용54','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(60,'테스트 제목55','테스트 내용55','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(61,'테스트 제목56','테스트 내용56','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(62,'테스트 제목57','테스트 내용57','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(63,'테스트 제목58','테스트 내용58','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(64,'테스트 제목59','테스트 내용59','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(66,'테스트 제목61','테스트 내용61','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(67,'테스트 제목62','테스트 내용62','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(68,'테스트 제목63','테스트 내용63','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(69,'테스트 제목64','테스트 내용64','winbo121','file','B0001',56,'2021-09-06 13:37:43'),(70,'테스트 제목65','테스트 내용65','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(73,'테스트 제목68','테스트 내용68','winbo121','file','B0001',56,'2021-09-06 13:37:43'),(74,'테스트 제목69','테스트 내용69','winbo121','234bf5c5-7554-4cd0-9f1c-4b2ff9eeb93c나스.txt','B0001',55,'2021-09-06 13:37:43'),(75,'테스트 제목70','테스트 내용70','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(76,'테스트 제목71','테스트 내용71','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(78,'테스트 제목73','테스트 내용73','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(79,'테스트 제목74','테스트 내용74','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(80,'테스트 제목75','테스트 내용75','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(81,'테스트 제목76','테스트 내용76','winbo121','00bad68f-a7f4-48f1-9b33-fb4563d9674fglobal properties 운영용.txt','B0001',55,'2021-09-06 13:37:43'),(82,'테스트 제목77','테스트 내용77','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(83,'테스트 제목78','테스트 내용78','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(84,'테스트 제목79','테스트 내용79','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(85,'테스트 제목80','테스트 내용80','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(86,'테스트 제목81','테스트 내용81','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(88,'테스트 제목83','테스트 내용83','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(89,'테스트 제목84','테스트 내용84','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(90,'테스트 제목85','테스트 내용85','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(91,'테스트 제목86','테스트 내용86','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(92,'테스트 제목87','테스트 내용87','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(93,'테스트 제목88','테스트 내용88','winbo121','file','B0001',56,'2021-09-06 13:37:43'),(94,'테스트 제목89','테스트 내용89','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(97,'테스트 제목92','테스트 내용92','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(98,'테스트 제목93','테스트 내용93','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(99,'테스트 제목94','테스트 내용94','winbo121','file','B0001',56,'2021-09-06 13:37:43'),(100,'테스트 제목95','테스트 내용95','winbo121','file','B0001',56,'2021-09-06 13:37:43'),(103,'테스트 제목98','테스트 내용98','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(105,'테스트 제목100','테스트 내용100','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(113,'테스트 굳쉿맨','45634123','winbo121','','B0002',0,'2021-09-07 15:57:18'),(115,'6666','FWAGWA','winbo121','','B0002',0,'2021-09-09 10:28:18'),(116,'굳굳굳 테스트 굳','ㄹㅈㅁㄻㄹ','winbo121','ed9365a3-bdf4-4505-ab00-7198f75578dccss.txt','B0002',3,'2021-09-09 14:10:45'),(117,'T888','464564','winbo121','','B0003',5,'2021-09-09 15:00:39'),(124,'test2233','FWAF','winbo121','b8fa40db-b4da-4596-8543-00baf2898e76SquirrelSetup.log','B0002',3,'2021-09-10 11:38:35'),(128,'4444','894222','winbo121','1a189e97-cda9-4cbd-a8e3-e26767d5bb17KakaoTalk_20210913_104426852.png','B0003',22,'2021-09-10 13:47:33'),(133,'ㅇㅇㄱㄱ111','ㅓ어어ㅓㅇ','winbo121','63edf247-8f8e-42ec-b7c9-7bce130a7a6f1633760500594.png','B0002',27,'2021-10-11 02:56:15');
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
INSERT INTO `user_info` VALUES ('winbo121','123456','winbo121@naver.com','test','2021-09-02 16:38:36');
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
INSERT INTO `userinfo` VALUES ('winii@naver.com','6974'),('wi131231i@naver.com','69749'),('test2@naver.com','332143'),('탕탕탕@naver.com','11233');
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

-- Dump completed on 2022-02-21  0:20:23
