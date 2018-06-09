-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: flyaround
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.17.10.1

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
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nbFreeSeats` smallint(6) NOT NULL,
  `seatPrice` double NOT NULL,
  `takeOffTime` datetime NOT NULL,
  `publicationDate` datetime NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `wasDone` tinyint(1) NOT NULL,
  `departure_id` int(11) NOT NULL,
  `arrival_id` int(11) NOT NULL,
  `plane_id` int(11) NOT NULL,
  `pilot_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C257E60E7704ED06` (`departure_id`),
  KEY `IDX_C257E60E62789708` (`arrival_id`),
  KEY `IDX_C257E60EF53666A8` (`plane_id`),
  KEY `IDX_C257E60ECE55439B` (`pilot_id`),
  CONSTRAINT `FK_C257E60E62789708` FOREIGN KEY (`arrival_id`) REFERENCES `site` (`id`),
  CONSTRAINT `FK_C257E60E7704ED06` FOREIGN KEY (`departure_id`) REFERENCES `site` (`id`),
  CONSTRAINT `FK_C257E60ECE55439B` FOREIGN KEY (`pilot_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_C257E60EF53666A8` FOREIGN KEY (`plane_id`) REFERENCES `plane_model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1,250,75,'2018-05-26 14:15:00','2018-05-22 17:45:00','Paris to Nice',0,1,3,1,3);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plane_model`
--

DROP TABLE IF EXISTS `plane_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plane_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `manufacturer` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cruiseSpeed` smallint(6) NOT NULL,
  `isAvailable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plane_model`
--

LOCK TABLES `plane_model` WRITE;
/*!40000 ALTER TABLE `plane_model` DISABLE KEYS */;
INSERT INTO `plane_model` VALUES (1,'A320','Airbus',828,1);
/*!40000 ALTER TABLE `plane_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nbReservedSeats` smallint(6) NOT NULL,
  `publicationDate` datetime NOT NULL,
  `wasDone` tinyint(1) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_42C849554502E565` (`passenger_id`),
  KEY `IDX_42C8495591F478C5` (`flight_id`),
  CONSTRAINT `FK_42C849554502E565` FOREIGN KEY (`passenger_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_42C8495591F478C5` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `publicationDate` datetime NOT NULL,
  `note` smallint(6) NOT NULL,
  `user_rated_id` int(11) NOT NULL,
  `review_author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_794381C6AA3E2149` (`user_rated_id`),
  KEY `IDX_794381C66184681A` (`review_author_id`),
  CONSTRAINT `FK_794381C66184681A` FOREIGN KEY (`review_author_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_794381C6AA3E2149` FOREIGN KEY (`user_rated_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `icao` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `city` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (1,'Charles de Gaulle International Airport','LFPG',49.0127983093,2.54999995232,'Paris'),(2,'Paris-Orly Airport','LFPO',48.7233333,2.3794444,'Paris'),(3,'Nice-Côte d\'Azur Airport','LFMN',43.6584014893,7.215869903560001,'Nice');
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNumber` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `birthDate` date NOT NULL,
  `creationDate` datetime DEFAULT NULL,
  `note` smallint(6) DEFAULT NULL,
  `isACertifiedPilot` tinyint(1) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D64992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_8D93D649A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_8D93D649C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'Amandine','Claude','0320032003','1990-06-16',NULL,NULL,0,'dine16','dine16','amandine.claude6@gmail.com','amandine.claude6@gmail.com',1,NULL,'$2y$13$B5KKBeZk8m7.lha8VCAXPOMH6/zJ.74idkV9UgbRcjOu0tAZPoEfe','2018-05-26 19:23:04',NULL,NULL,'a:0:{}'),(4,'Amandine','Claude','0320032003','1990-06-16',NULL,NULL,0,'Amandine','amandine','test@gmail.com','test@gmail.com',1,NULL,'$2y$13$CjcggwGW9iHdJ0kDUoYrAO/GpRc163YN1QoDg//QWxyTfK/.L2E9S','2018-05-26 18:29:28',NULL,NULL,'a:0:{}');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-28  9:20:15
