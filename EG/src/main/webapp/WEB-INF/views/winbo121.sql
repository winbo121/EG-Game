-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: winbo121
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
INSERT INTO `category_code` VALUES ('B0001','자기소개'),('B0002','자유게시판'),('B0003','질문게시판');
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
  `email` varchar(45) NOT NULL,
  `process` char(1) NOT NULL DEFAULT 'N',
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
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_board`
--

LOCK TABLES `user_board` WRITE;
/*!40000 ALTER TABLE `user_board` DISABLE KEYS */;
INSERT INTO `user_board` VALUES (8,'테스트 제목3','테스트 내용3','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(9,'테스트 제목4','테스트 내용4','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(10,'테스트 제목5','테스트 내용5','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(11,'테스트 제목6','테스트 내용6','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(12,'테스트 제목7','테스트 내용7','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(13,'테스트 제목8','테스트 내용8','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(14,'테스트 제목9','테스트 내용9','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(15,'테스트 제목10','테스트 내용10','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(16,'테스트 제목11','테스트 내용11','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(17,'테스트 제목12','테스트 내용12','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(18,'테스트 제목13','테스트 내용13','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(19,'테스트 제목14','테스트 내용14','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(20,'테스트 제목15','테스트 내용15','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(21,'테스트 제목16','테스트 내용16','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(22,'테스트 제목17','테스트 내용17','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(23,'테스트 제목18','테스트 내용18','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(24,'테스트 제목19','테스트 내용19','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(25,'테스트 제목20','테스트 내용20','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(26,'테스트 제목21','테스트 내용21','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(27,'테스트 제목22','테스트 내용22','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(28,'테스트 제목23','테스트 내용23','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(29,'테스트 제목24','테스트 내용24','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(30,'테스트 제목25','테스트 내용25','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(31,'테스트 제목26','테스트 내용26','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(32,'테스트 제목27','테스트 내용27','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(33,'테스트 제목28','테스트 내용28','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(34,'테스트 제목29','테스트 내용29','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(35,'테스트 제목30','테스트 내용30','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(36,'테스트 제목31','테스트 내용31','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(37,'테스트 제목32','테스트 내용32','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(38,'테스트 제목33','테스트 내용33','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(39,'테스트 제목34','테스트 내용34','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(40,'테스트 제목35','테스트 내용35','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(41,'테스트 제목36','테스트 내용36','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(42,'테스트 제목37','테스트 내용37','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(43,'테스트 제목38','테스트 내용38','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(44,'테스트 제목39','테스트 내용39','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(45,'테스트 제목40','테스트 내용40','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(46,'테스트 제목41','테스트 내용41','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(47,'테스트 제목42','테스트 내용42','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(48,'테스트 제목43','테스트 내용43','winbo121','0520fdf4-7622-43f9-9a4c-5fd9ef859dcbinstall.txt','B0001',55,'2021-09-06 13:37:43'),(49,'테스트 제목44','테스트 내용44','winbo121','file','B0001',57,'2021-09-06 13:37:43'),(50,'테스트 제목45','테스트 내용45','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(51,'테스트 제목46','테스트 내용46','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(52,'테스트 제목47','테스트 내용47','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(53,'테스트 제목48','테스트 내용48','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(54,'테스트 제목49','테스트 내용49','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(55,'테스트 제목50','테스트 내용50','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(56,'테스트 제목51','테스트 내용51','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(57,'테스트 제목52','테스트 내용52','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(58,'테스트 제목53','테스트 내용53','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(59,'테스트 제목54','테스트 내용54','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(60,'테스트 제목55','테스트 내용55','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(61,'테스트 제목56','테스트 내용56','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(62,'테스트 제목57','테스트 내용57','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(63,'테스트 제목58','테스트 내용58','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(64,'테스트 제목59','테스트 내용59','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(65,'테스트 제목60','테스트 내용60','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(66,'테스트 제목61','테스트 내용61','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(67,'테스트 제목62','테스트 내용62','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(68,'테스트 제목63','테스트 내용63','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(69,'테스트 제목64','테스트 내용64','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(70,'테스트 제목65','테스트 내용65','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(71,'테스트 제목66','테스트 내용66','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(72,'테스트 제목67','테스트 내용67','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(73,'테스트 제목68','테스트 내용68','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(74,'테스트 제목69','테스트 내용69','winbo121','234bf5c5-7554-4cd0-9f1c-4b2ff9eeb93c나스.txt','B0001',55,'2021-09-06 13:37:43'),(75,'테스트 제목70','테스트 내용70','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(76,'테스트 제목71','테스트 내용71','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(77,'테스트 제목72','테스트 내용72','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(78,'테스트 제목73','테스트 내용73','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(79,'테스트 제목74','테스트 내용74','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(80,'테스트 제목75','테스트 내용75','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(81,'테스트 제목76','테스트 내용76','winbo121','00bad68f-a7f4-48f1-9b33-fb4563d9674fglobal properties 운영용.txt','B0001',55,'2021-09-06 13:37:43'),(82,'테스트 제목77','테스트 내용77','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(83,'테스트 제목78','테스트 내용78','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(84,'테스트 제목79','테스트 내용79','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(85,'테스트 제목80','테스트 내용80','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(86,'테스트 제목81','테스트 내용81','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(87,'테스트 제목82','테스트 내용82','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(88,'테스트 제목83','테스트 내용83','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(89,'테스트 제목84','테스트 내용84','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(90,'테스트 제목85','테스트 내용85','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(91,'테스트 제목86','테스트 내용86','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(92,'테스트 제목87','테스트 내용87','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(93,'테스트 제목88','테스트 내용88','winbo121','file','B0001',56,'2021-09-06 13:37:43'),(94,'테스트 제목89','테스트 내용89','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(95,'테스트 제목90','테스트 내용90','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(96,'테스트 제목91','테스트 내용91','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(97,'테스트 제목92','테스트 내용92','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(98,'테스트 제목93','테스트 내용93','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(99,'테스트 제목94','테스트 내용94','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(100,'테스트 제목95','테스트 내용95','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(101,'테스트 제목96','테스트 내용96','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(102,'테스트 제목97','테스트 내용97','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(103,'테스트 제목98','테스트 내용98','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(105,'테스트 제목100','테스트 내용100','winbo121','file','B0001',55,'2021-09-06 13:37:43'),(113,'테스트 굳쉿맨','45634123','winbo121','','B0002',0,'2021-09-07 15:57:18'),(114,'test','456456','winbo121','','B0002',0,'2021-09-07 15:58:30'),(115,'6666','FWAGWA','winbo121','','B0002',0,'2021-09-09 10:28:18'),(116,'굳굳굳 테스트 굳','ㄹㅈㅁㄻㄹ','winbo121','','B0002',0,'2021-09-09 14:10:45'),(117,'T888','464564','winbo121','','B0003',1,'2021-09-09 15:00:39'),(119,'test3306','44843545','winbo121','','B0003',3,'2021-09-09 15:35:53'),(120,'998','48546','winbo121','','B0003',2,'2021-09-09 15:37:03'),(121,'998','4153','winbo121','','B0002',0,'2021-09-09 15:38:47'),(123,'fffwwwkkk','9998','winbo121','0f2d8f44-4317-4e6c-b6ce-504f2d6f2915excel.xls','B0002',3,'2021-09-10 10:31:58'),(124,'test2233','FWAF','winbo121','','B0002',0,'2021-09-10 11:38:35'),(125,'test99878','4846','winbo121','','B0002',1,'2021-09-10 13:40:57'),(126,'88877','fw','winbo121','35fa2210-3248-40af-8fa3-e678af816282install.txt','B0003',4,'2021-09-10 13:42:21'),(128,'4444','894222','winbo121','1a189e97-cda9-4cbd-a8e3-e26767d5bb17KakaoTalk_20210913_104426852.png','B0003',13,'2021-09-10 13:47:33');
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

-- Dump completed on 2021-09-27 14:38:30
