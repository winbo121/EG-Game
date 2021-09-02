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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
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

-- Dump completed on 2021-09-02 16:44:51
