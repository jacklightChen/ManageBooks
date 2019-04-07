-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
-- Temporary table structure for view `arrive_reminder`
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `borrow_detail`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `reservation_detail`
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
-- Temporary table structure for view `return_reminder`
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
-- Dumping routines for database 'library'
--
/*!50003 DROP PROCEDURE IF EXISTS `borrow_from_res` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrow_from_res`(IN res_id INT, IN op INT)
BEGIN
declare bid int;
    declare uid int;
    declare num int;
    select count(*) into num from reservation where reservation_id=res_id;
    if num > 0 then
select book_id, user_id into bid, uid from reservation where reservation_id=res_id;
insert into borrow(book_id, user_id, btime, deadline, operator) values (bid, uid, now(), date_add(now(), interval 60 day), op); 
DELETE from reservation where book_id=bid;
UPDATE book SET state=2 where book_id=bid;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `do_sec_kill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `do_sec_kill`(IN bn VARCHAR(30), IN uid INT, OUT st INT)
BEGIN
declare num int;
    declare bid int;
    select count(*) into num from book where ISBN=bn and state=0;
if num > 0 then
insert into reservation(user_id, book_id, deadline) values(uid, bid, date_add(now(), interval 10 day));
update book set state=1 where book_id=bid;
set st = 1;
else
set st=0;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `make_reservation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `make_reservation`(IN bn VARCHAR(30), IN uid INT, OUT st INT)
BEGIN
declare num int;
    declare ispop int;
    select count(*) into num from book where ISBN=bn and (state=0 or (state=2 and book_id not in (select reservation.book_id from reservation))) order by state;
select is_popular into ispop from booklist where booklist.ISBN=bn;
    if ispop > 0 then
set st=-1;
else
if num > 0 then
begin
declare bid int;
declare stat int;
select state, book_id into stat, bid from book where ISBN=bn  and (state=0 or (state=2 and book_id not in (select reservation.book_id from reservation))) order by state limit 0, 1;
if stat > 0 then
begin
insert into reservation(user_id, book_id) values(uid, bid);
set st = 2;
end;

else
begin
insert into reservation(user_id, book_id, deadline) values(uid, bid, date_add(now(), interval 10 day));
begin
update book set state=1 where book_id=bid;
end;
set st = 1;
end;
end if;
end;
else
set st=0;
end if;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_book`(IN ISBN  VARCHAR(30), IN bname VARCHAR(45), IN publisher VARCHAR(45), IN writer VARCHAR(45),
                          IN ptime DATE, IN num INT, IN operator INT, IN location VARCHAR(45), IN state INT)
BEGIN
insert into booklist(ISBN,bname, publisher, writer, ptime, number, operator)values (ISBN, bname, publisher, writer, ptime, num, operator);
BEGIN
DECLARE i int;
SET i=0;
while i<num DO
insert into book(ISBN,location,state,operator) values(ISBN,location,state,operator);
SET i=i+1;
end while;
END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `return_book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `return_book`(IN bor_id INT)
BEGIN
declare num int;
    declare bid int;
declare n int;
    declare resid int;
    select count(*) into n from borrow where borrow_id=bor_id and rtime is null;
    if n > 0 then
select book_id into bid from borrow where borrow_id=bor_id;
select count(*) into num from reservation where book_id=bid;
if num > 0 then
update borrow set rtime=now() where borrow_id=bor_id;
update book set state=1 where book_id=bid;
            update reservation set deadline=now() where book_id=bid;
            select reservation_id into resid from reservation where book_id=bid;
            insert into reservation_arrived (reservation_id) values (resid);
else
update borrow set rtime=now() where borrow_id=bor_id;
update book set state=0 where book_id=bid;
end if;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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

-- Dump completed on 2019-04-07 19:06:34
