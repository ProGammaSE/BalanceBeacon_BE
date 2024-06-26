-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: balancebeacon
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `achievements`
--

DROP TABLE IF EXISTS `achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievements` (
  `archievement_id` int NOT NULL,
  `archievement_name` varchar(50) NOT NULL,
  `archievement_description` varchar(250) DEFAULT NULL,
  `archievement_status` tinyint(1) NOT NULL,
  `archievement_created_date` date NOT NULL,
  PRIMARY KEY (`archievement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievements`
--

LOCK TABLES `achievements` WRITE;
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
/*!40000 ALTER TABLE `achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas` (
  `area_id` int NOT NULL AUTO_INCREMENT,
  `area_description` varchar(50) DEFAULT NULL,
  `area_created_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (3,'Love. Family. Kids','2024-03-30 20:40:26');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_areas`
--

DROP TABLE IF EXISTS `assessment_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessment_areas` (
  `assessment_area` int NOT NULL,
  `user_id` int NOT NULL,
  `assessment_id` int NOT NULL,
  `assess_area_percentage` int DEFAULT NULL,
  `assess_area_created_date` date NOT NULL,
  `assess_area_updated_date` date NOT NULL,
  PRIMARY KEY (`assessment_area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_areas`
--

LOCK TABLES `assessment_areas` WRITE;
/*!40000 ALTER TABLE `assessment_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessments`
--

DROP TABLE IF EXISTS `assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessments` (
  `assessment_id` int NOT NULL,
  `user_id` int NOT NULL,
  `assessment_created_date` date NOT NULL,
  PRIMARY KEY (`assessment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessments`
--

LOCK TABLES `assessments` WRITE;
/*!40000 ALTER TABLE `assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach_bookings`
--

DROP TABLE IF EXISTS `coach_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach_bookings` (
  `booking_id` int NOT NULL,
  `user_id` int NOT NULL,
  `coach_id` int NOT NULL,
  `booking_status` tinyint(1) DEFAULT NULL,
  `booking_created_date` date DEFAULT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach_bookings`
--

LOCK TABLES `coach_bookings` WRITE;
/*!40000 ALTER TABLE `coach_bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `coach_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coachers`
--

DROP TABLE IF EXISTS `coachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coachers` (
  `coach_id` int NOT NULL,
  `area_id` int NOT NULL,
  `coach_name` varchar(100) NOT NULL,
  `coach_gender` int NOT NULL,
  `coach_fee` varchar(10) DEFAULT NULL,
  `coach_created_date` date DEFAULT NULL,
  PRIMARY KEY (`coach_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coachers`
--

LOCK TABLES `coachers` WRITE;
/*!40000 ALTER TABLE `coachers` DISABLE KEYS */;
/*!40000 ALTER TABLE `coachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedbacks` (
  `feedback_id` int NOT NULL,
  `user_id` int NOT NULL,
  `feedback_rate` int DEFAULT NULL,
  `feedback_created_date` date DEFAULT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goals`
--

DROP TABLE IF EXISTS `goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goals` (
  `goal_id` int NOT NULL,
  `user_id` int NOT NULL,
  `assessment_id` int NOT NULL,
  `area_id` int NOT NULL,
  `tip_id` int NOT NULL,
  `goal_days` int NOT NULL,
  `goal_status` tinyint(1) NOT NULL,
  `goal_created_date` date NOT NULL,
  PRIMARY KEY (`goal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goals`
--

LOCK TABLES `goals` WRITE;
/*!40000 ALTER TABLE `goals` DISABLE KEYS */;
/*!40000 ALTER TABLE `goals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tips`
--

DROP TABLE IF EXISTS `tips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tips` (
  `tip_id` int NOT NULL,
  `area_id` int NOT NULL,
  `tip_description` varchar(250) DEFAULT NULL,
  `tip_created_date` date NOT NULL,
  PRIMARY KEY (`tip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tips`
--

LOCK TABLES `tips` WRITE;
/*!40000 ALTER TABLE `tips` DISABLE KEYS */;
/*!40000 ALTER TABLE `tips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_achievements`
--

DROP TABLE IF EXISTS `user_achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_achievements` (
  `user_archievement_id` int NOT NULL,
  `user_id` int NOT NULL,
  `archievment_id` int NOT NULL,
  `user_archieve_status` tinyint(1) NOT NULL,
  `user_archieve_created_date` date NOT NULL,
  PRIMARY KEY (`user_archievement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_achievements`
--

LOCK TABLES `user_achievements` WRITE;
/*!40000 ALTER TABLE `user_achievements` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tips`
--

DROP TABLE IF EXISTS `user_tips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_tips` (
  `user_tip_id` int NOT NULL,
  `user_id` int NOT NULL,
  `tip_id` int NOT NULL,
  `tip_description` varchar(250) DEFAULT NULL,
  `tip_created_date` date NOT NULL,
  PRIMARY KEY (`user_tip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tips`
--

LOCK TABLES `user_tips` WRITE;
/*!40000 ALTER TABLE `user_tips` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(80) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `user_gender` int NOT NULL,
  `user_age` int NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_status` tinyint NOT NULL,
  `user_created_date` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'Gayathri','test@gmail.com','0765842111',0,29,'12345',1,'2024-03-29 22:51:49'),(5,'Jayana','jayana@gmail.com','0765842111',0,29,'asdf',1,'2024-03-29 22:51:49'),(6,'Lahiru','lahiru@gmail.com','0765842111',0,29,'asdf',1,'2024-03-30 20:11:48'),(7,'John','john@gamil.com','0367459612',1,24,'asdf',1,'2024-04-01 21:00:56'),(8,'mobille','mobile@gmail.com','0112576935',1,30,'0123456789',1,'2024-04-01 21:06:04'),(9,'mobille','mobile2@gmail.com','0112576935',1,30,'0123456789',1,'2024-04-01 21:07:12');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-01 21:30:22
