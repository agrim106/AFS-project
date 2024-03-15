CREATE DATABASE  IF NOT EXISTS `twitter` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `twitter`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: twitter
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment_likes`
--

DROP TABLE IF EXISTS `comment_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_likes` (
  `tlid` int NOT NULL AUTO_INCREMENT,
  `tid` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`tlid`),
  KEY `tid` (`tid`),
  KEY `uid` (`uid`),
  CONSTRAINT `comment_likes_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `tweet` (`tid`),
  CONSTRAINT `comment_likes_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followers` (
  `fid` int NOT NULL AUTO_INCREMENT,
  `follow_uid` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `uid` (`uid`),
  KEY `follow_uid` (`follow_uid`),
  CONSTRAINT `followers_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `followers_ibfk_2` FOREIGN KEY (`follow_uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_post_profile`
--

DROP TABLE IF EXISTS `report_post_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_post_profile` (
  `rppid` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `prof_post_id` int DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`rppid`),
  KEY `uid` (`uid`),
  KEY `prof_post_id` (`prof_post_id`),
  CONSTRAINT `report_post_profile_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `report_post_profile_ibfk_2` FOREIGN KEY (`prof_post_id`) REFERENCES `tweet` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `tagsid` int NOT NULL AUTO_INCREMENT,
  `tagsname` varchar(100) DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`tagsid`),
  KEY `uid` (`uid`),
  CONSTRAINT `tags_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweet`
--

DROP TABLE IF EXISTS `tweet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweet` (
  `tid` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `content` text,
  `datetime` datetime DEFAULT NULL,
  `softdelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `uid` (`uid`),
  CONSTRAINT `tweet_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweet_comment`
--

DROP TABLE IF EXISTS `tweet_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweet_comment` (
  `tcid` int NOT NULL AUTO_INCREMENT,
  `tid` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `softdelete` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`tcid`),
  KEY `tid` (`tid`),
  KEY `uid` (`uid`),
  CONSTRAINT `tweet_comment_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `tweet` (`tid`),
  CONSTRAINT `tweet_comment_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweet_img_video`
--

DROP TABLE IF EXISTS `tweet_img_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweet_img_video` (
  `tivid` int NOT NULL AUTO_INCREMENT,
  `tid` int DEFAULT NULL,
  `img_vdo_name` varchar(200) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tivid`),
  KEY `tid` (`tid`),
  CONSTRAINT `tweet_img_video_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `tweet` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweet_likes`
--

DROP TABLE IF EXISTS `tweet_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweet_likes` (
  `tlid` int NOT NULL AUTO_INCREMENT,
  `tid` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`tlid`),
  KEY `tid` (`tid`),
  KEY `uid` (`uid`),
  CONSTRAINT `tweet_likes_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `tweet` (`tid`),
  CONSTRAINT `tweet_likes_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(30) DEFAULT NULL,
  `mname` varchar(30) DEFAULT NULL,
  `lname` varchar(30) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `dor` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` bigint DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profilepic` varchar(200) DEFAULT NULL,
  `headerimage` varchar(200) DEFAULT NULL,
  `about` varchar(200) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `softdelete` tinyint(1) DEFAULT '0',
  `username` varchar(100) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-10 13:58:59
