-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: voting
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.12.04.1

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
-- Table structure for table `candidate`
--

DROP TABLE IF EXISTS `candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `description` varchar(4000) COLLATE utf8_persian_ci DEFAULT NULL,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate`
--

LOCK TABLES `candidate` WRITE;
/*!40000 ALTER TABLE `candidate` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `election`
--

DROP TABLE IF EXISTS `election`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `election` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `electingNumber` int(10) DEFAULT NULL,
  `name` varchar(500) COLLATE utf8_persian_ci DEFAULT NULL,
  `description` varchar(4000) COLLATE utf8_persian_ci DEFAULT NULL,
  `startTime` timestamp NULL DEFAULT NULL,
  `endTime` timestamp NULL DEFAULT NULL,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `election`
--

LOCK TABLES `election` WRITE;
/*!40000 ALTER TABLE `election` DISABLE KEYS */;
/*!40000 ALTER TABLE `election` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmppasschange`
--

DROP TABLE IF EXISTS `tmppasschange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmppasschange` (
  `userID` int(10) NOT NULL,
  `electionID` int(10) NOT NULL,
  `candidateID` int(10) NOT NULL,
  `vote` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`userID`,`electionID`,`candidateID`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmppasschange`
--

LOCK TABLES `tmppasschange` WRITE;
/*!40000 ALTER TABLE `tmppasschange` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmppasschange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `username` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `roll` enum('admin','user') COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`ID`, `name`, `username`, `password`, `roll`) VALUES (1,'admin','admin','761f749e2a021829f7dfe2dede3eb283','admin');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdata`
--

DROP TABLE IF EXISTS `userdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userdata` (
  `userID` int(11) NOT NULL,
  `type` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `data` varchar(2000) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `unique` (`userID`,`type`),
  KEY `fk_userdata_1` (`userID`),
  CONSTRAINT `fk_userdata_1` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdata`
--

LOCK TABLES `userdata` WRITE;
/*!40000 ALTER TABLE `userdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `userdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uservote`
--

DROP TABLE IF EXISTS `uservote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uservote` (
  `userID` int(11) NOT NULL,
  `electionID` int(11) NOT NULL,
  `vote` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`userID`,`electionID`),
  KEY `fk_uservote_1` (`userID`),
  KEY `fk_uservote_2` (`electionID`),
  CONSTRAINT `fk_uservote_1` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_uservote_2` FOREIGN KEY (`electionID`) REFERENCES `election` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uservote`
--

LOCK TABLES `uservote` WRITE;
/*!40000 ALTER TABLE `uservote` DISABLE KEYS */;
/*!40000 ALTER TABLE `uservote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote` (
  `electionID` int(10) NOT NULL,
  `candidateID` int(10) NOT NULL,
  `vote` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`electionID`,`candidateID`),
  KEY `fk_vote_1` (`electionID`),
  KEY `fk_vote_2` (`candidateID`),
  CONSTRAINT `fk_vote_1` FOREIGN KEY (`electionID`) REFERENCES `election` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vote_2` FOREIGN KEY (`candidateID`) REFERENCES `candidate` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'voting'
--
/*!50003 DROP FUNCTION IF EXISTS `updatepass` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `updatepass`(
      userID int(10),  
      oldpass VARCHAR(45),
      newpass VARCHAR(45)
) RETURNS tinyint(1)
    READS SQL DATA
BEGIN
  DECLARE no_more_rows BOOLEAN;
  DECLARE oldvote VARCHAR(45);
  DECLARE votes_cur CURSOR FOR
    SELECT
        `vote`
    FROM `uservote`
    WHERE `userID` = userID;

  if @@error_count!=0 or @@warning_count!=0 then
    return false;
  end if;
  
  set @check=(select `ID` from `user` where `ID`=userID and `password`=md5(concat(`username`,oldpass)));  
  if @@error_count!=0 or @@warning_count!=0  or @check <=0 then
    return false;
  end if;
  insert into `tmppasschange` (select userID,`electionID`,`candidateID`,md5(concat(`electionID`,`candidateID`,oldpass)) from vote);
  if @@error_count!=0 or @@warning_count!=0 then
    return false;
  end if;
  set @votescount=(SELECT
        count(`vote`)
    FROM `uservote`
    WHERE `userID` = userID);
  
  if @votescount>0 then  
      the_loop: LOOP
        FETCH  votes_cur    INTO   oldvote;
        IF no_more_rows THEN
            CLOSE votes_cur;
            LEAVE the_loop;
        END IF;

        set @newvote = (select md5(concat(`electionID`,`candidateID`,newpass)) from tmppasschange where `vote` = oldvote);
        update `uservote` set `vote` = @newvote where `vote`=oldvote;
        
        if @@error_count!=0 or @@warning_count!=0 then
          return false;
        end if;
      END LOOP the_loop;  
  end if;
  
  delete from `tmppasschange` where `userID` = userID;
  if @@error_count!=0 or @@warning_count!=0 then
    return false;
  end if;

  update user set `password` = md5(concat(`username`,newpass)) where `ID` =userID;
  if @@error_count!=0 or @@warning_count!=0 then
    return false;
  end if;
   
  return true; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-23 18:32:26
