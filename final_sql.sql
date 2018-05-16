CREATE DATABASE  IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `library`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 115.159.112.233    Database: library
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Temporary view structure for view `arrive_reminder`
--

DROP TABLE IF EXISTS `arrive_reminder`;
/*!50001 DROP VIEW IF EXISTS `arrive_reminder`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `arrive_reminder` AS SELECT 
 1 AS `user_name`,
 1 AS `bname`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(11) NOT NULL,
  `operator` int(11) NOT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `BID_UNIQUE` (`book_id`),
  KEY `op2_idx` (`operator`),
  KEY `bo_idx` (`ISBN`),
  CONSTRAINT `bo` FOREIGN KEY (`ISBN`) REFERENCES `booklist` (`ISBN`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `op2` FOREIGN KEY (`operator`) REFERENCES `manager` (`manager_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (94,'9787115417305','图书流通室',0,6),(95,'9787115417305','图书阅览室',4,6),(96,'9787105201202','图书流通室',0,6),(97,'9787111421900','图书流通室',0,6),(98,'9787112021202','图书流通室',0,6),(99,'9787115449573','图书流通室',0,7),(100,'9787121254437','图书流通室',0,5),(101,'9787121254437','图书阅览室',4,6),(102,'9787166666666','图书流通室',0,6),(103,'9787188888888','图书流通室',0,6),(104,'9787188888888','图书阅览室',4,5),(105,'9787100000000','图书阅览室',4,5),(106,'9787199999999','图书流通室',0,6),(107,'9787199999999','图书流通室',0,6),(108,'9787199999999','图书流通室',0,6),(112,'9787199999999','图书流通室',0,6),(113,'9787199999999','图书流通室',0,6),(114,'9787199999999','图书流通室',0,6),(115,'1231231231231','图书流通室',0,6),(116,'1231231231231','图书流通室',0,6),(117,'1231231231231','图书流通室',0,6),(118,'1231231231231','图书流通室',0,6),(119,'1231231231231','图书流通室',0,6),(133,'9787132312312','杂居',0,5),(134,'9787132312312','杂居',0,5),(135,'9787132312312','杂居',0,5),(136,'9787132312312','杂居',0,5),(137,'9787132312312','杂居',0,5),(148,'1234567890123','图书流通室',0,5),(149,'1234567890123','图书流通室',0,5);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booklist`
--

DROP TABLE IF EXISTS `booklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booklist` (
  `ISBN` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `bname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `publisher` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `writer` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ptime` date DEFAULT NULL,
  `number` int(11) NOT NULL DEFAULT '0',
  `operator` int(11) NOT NULL,
  PRIMARY KEY (`ISBN`),
  UNIQUE KEY `ISBN_UNIQUE` (`ISBN`),
  KEY `op_idx` (`operator`),
  CONSTRAINT `op` FOREIGN KEY (`operator`) REFERENCES `manager` (`manager_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booklist`
--

LOCK TABLES `booklist` WRITE;
/*!40000 ALTER TABLE `booklist` DISABLE KEYS */;
INSERT INTO `booklist` VALUES ('1231231231231','陈之豪教你把妹','路边社','陈续缘','2018-05-14',5,6),('1234567890123','他改变了大摩-钱晨传','QC出版社','钱晨','2018-05-14',2,5),('9787100000000','Qian\'s C Compiler——The speed of the art','南8-507','钱晨','2018-05-11',1,6),('9787105201202','优秀的人，从来不会没有女朋友','南8-507','钱晨','2018-05-11',1,6),('9787111421900','深入理解Java虚拟机','机械工业出版社','周志明','2013-06-01',1,7),('9787112021202','成为人生赢家之路','南8-507','钱晨','2018-05-11',1,6),('9787115417305','spring实战','人民邮电出版社','Craig Walls, 张卫滨','2016-04-01',2,6),('9787115449573','Docker开发指南','人民邮电出版社','Adrian Mouat','2017-04-01',1,5),('9787121254437','集体智慧编程','电子工业出版社','Toby Segaran','2015-03-01',2,5),('9787132312312','陈之豪和他的101个女朋友',NULL,'奇人轶事','2018-05-14',5,5),('9787166666666','名师钱老板带你飞——QCDB从0到1','南8-507','钱晨','2018-05-11',1,6),('9787188888888','钱老板教你如何正确划水','南8-507','钱晨','2018-05-11',2,6),('9787199999999','钱晨传','南8-507','钱晨','2018-05-13',6,6);
/*!40000 ALTER TABLE `booklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrow`
--

DROP TABLE IF EXISTS `borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrow` (
  `borrow_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `btime` datetime NOT NULL,
  `deadline` datetime NOT NULL,
  `rtime` datetime DEFAULT NULL,
  `operator` int(11) DEFAULT NULL,
  PRIMARY KEY (`borrow_id`),
  UNIQUE KEY `BWID_UNIQUE` (`borrow_id`),
  KEY `boo_idx` (`book_id`),
  KEY `re_idx` (`user_id`),
  KEY `op3_idx` (`operator`),
  CONSTRAINT `boo` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `op3` FOREIGN KEY (`operator`) REFERENCES `manager` (`manager_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `re` FOREIGN KEY (`user_id`) REFERENCES `reader` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow`
--

LOCK TABLES `borrow` WRITE;
/*!40000 ALTER TABLE `borrow` DISABLE KEYS */;
INSERT INTO `borrow` VALUES (73,114,26,'2018-05-13 00:00:00','2018-05-15 00:00:00','2018-05-14 14:35:57',6),(74,108,26,'2018-05-13 23:54:21','2018-07-12 23:54:21','2018-05-14 14:36:08',6),(77,96,26,'2018-05-14 14:37:39','2018-07-13 14:37:39','2018-05-14 14:40:33',6),(78,114,26,'2018-05-14 15:01:04','2018-07-13 15:01:04','2018-05-14 15:01:23',6),(80,96,27,'2018-05-14 15:08:59','2018-07-13 15:08:59','2018-05-14 15:09:34',6),(81,96,27,'2018-05-14 15:13:26','2018-07-13 15:13:26','2018-05-14 15:13:29',6),(82,96,27,'2018-05-14 15:13:40','2018-07-13 15:13:40','2018-05-14 15:14:08',6),(83,96,26,'2018-05-14 15:14:31','2018-07-13 15:14:31','2018-05-14 15:14:36',6);
/*!40000 ALTER TABLE `borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `borrow_detail`
--

DROP TABLE IF EXISTS `borrow_detail`;
/*!50001 DROP VIEW IF EXISTS `borrow_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `borrow_detail` AS SELECT 
 1 AS `borrow_id`,
 1 AS `btime`,
 1 AS `rtime`,
 1 AS `deadline`,
 1 AS `book_id`,
 1 AS `bname`,
 1 AS `user_id`,
 1 AS `user_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `idlogs` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleteflag` int(11) NOT NULL DEFAULT '1',
  `operation` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timeofoperation` datetime NOT NULL,
  `operator` int(11) NOT NULL,
  `memo` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idlogs`),
  KEY `op4_idx` (`operator`),
  CONSTRAINT `op4` FOREIGN KEY (`operator`) REFERENCES `manager` (`manager_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `manager_id` int(11) NOT NULL AUTO_INCREMENT,
  `pass_wd` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `mname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`manager_id`),
  UNIQUE KEY `MID_UNIQUE` (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (5,'123456','admin_czh'),(6,'123456','admin_czc'),(7,'123456','admin_qc');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reader`
--

DROP TABLE IF EXISTS `reader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reader` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `pass_wd` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `rname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `RID_UNIQUE` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reader`
--

LOCK TABLES `reader` WRITE;
/*!40000 ALTER TABLE `reader` DISABLE KEYS */;
INSERT INTO `reader` VALUES (26,'czc_reader','123456','陈至成','13800138000','1966557473@qq.com'),(27,'czh_reader','123456','czh','00000000000','1966557473@qq.com');
/*!40000 ALTER TABLE `reader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `deadline` datetime DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  UNIQUE KEY `REID_UNIQUE` (`reservation_id`),
  UNIQUE KEY `BID_UNIQUE` (`book_id`),
  KEY `re2_idx` (`user_id`),
  KEY `book_idx` (`book_id`),
  CONSTRAINT `book` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `re2` FOREIGN KEY (`user_id`) REFERENCES `reader` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_arrived`
--

DROP TABLE IF EXISTS `reservation_arrived`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_arrived` (
  `reservation_arrived_id` int(11) NOT NULL AUTO_INCREMENT,
  `reservation_id` int(11) NOT NULL,
  PRIMARY KEY (`reservation_arrived_id`),
  KEY `res_id_fk_idx` (`reservation_id`),
  CONSTRAINT `res_id_fk` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_arrived`
--

LOCK TABLES `reservation_arrived` WRITE;
/*!40000 ALTER TABLE `reservation_arrived` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_arrived` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `reservation_detail`
--

DROP TABLE IF EXISTS `reservation_detail`;
/*!50001 DROP VIEW IF EXISTS `reservation_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `reservation_detail` AS SELECT 
 1 AS `user_id`,
 1 AS `user_name`,
 1 AS `reservation_id`,
 1 AS `book_id`,
 1 AS `bname`,
 1 AS `deadline`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `return_reminder`
--

DROP TABLE IF EXISTS `return_reminder`;
/*!50001 DROP VIEW IF EXISTS `return_reminder`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `return_reminder` AS SELECT 
 1 AS `user_name`,
 1 AS `btime`,
 1 AS `bname`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `arrive_reminder`
--

/*!50001 DROP VIEW IF EXISTS `arrive_reminder`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `arrive_reminder` AS select `reader`.`user_name` AS `user_name`,`booklist`.`bname` AS `bname`,`reader`.`email` AS `email` from ((((`reservation_arrived` join `reservation`) join `reader`) join `book`) join `booklist`) where ((`reservation_arrived`.`reservation_id` = `reservation`.`reservation_id`) and (`reservation`.`user_id` = `reader`.`user_id`) and (`reservation`.`book_id` = `book`.`book_id`) and (`book`.`ISBN` = `booklist`.`ISBN`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `borrow_detail`
--

/*!50001 DROP VIEW IF EXISTS `borrow_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `borrow_detail` AS select `borrow`.`borrow_id` AS `borrow_id`,`borrow`.`btime` AS `btime`,`borrow`.`rtime` AS `rtime`,`borrow`.`deadline` AS `deadline`,`borrow`.`book_id` AS `book_id`,`booklist`.`bname` AS `bname`,`borrow`.`user_id` AS `user_id`,`reader`.`user_name` AS `user_name` from (((`borrow` join `book`) join `booklist`) join `reader`) where ((`borrow`.`book_id` = `book`.`book_id`) and (`booklist`.`ISBN` = `book`.`ISBN`) and (`borrow`.`user_id` = `reader`.`user_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reservation_detail`
--

/*!50001 DROP VIEW IF EXISTS `reservation_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `reservation_detail` AS select `reader`.`user_id` AS `user_id`,`reader`.`user_name` AS `user_name`,`reservation`.`reservation_id` AS `reservation_id`,`book`.`book_id` AS `book_id`,`booklist`.`bname` AS `bname`,`reservation`.`deadline` AS `deadline` from (((`booklist` join `book`) join `reader`) join `reservation`) where ((`reservation`.`user_id` = `reader`.`user_id`) and (`reservation`.`book_id` = `book`.`book_id`) and (`book`.`ISBN` = `booklist`.`ISBN`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `return_reminder`
--

/*!50001 DROP VIEW IF EXISTS `return_reminder`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `return_reminder` AS select `reader`.`user_name` AS `user_name`,`borrow`.`btime` AS `btime`,`booklist`.`bname` AS `bname`,`reader`.`email` AS `email` from (((`borrow` join `reader`) join `book`) join `booklist`) where ((`reader`.`user_id` = `borrow`.`user_id`) and (`borrow`.`book_id` = `book`.`book_id`) and (`book`.`ISBN` = `booklist`.`ISBN`) and isnull(`borrow`.`rtime`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-16 22:14:16
