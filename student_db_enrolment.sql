-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: student_db
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `enrolment`
--

DROP TABLE IF EXISTS `enrolment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrolment` (
  `enrolment_id` int NOT NULL AUTO_INCREMENT,
  `reg_no` varchar(20) DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `enrolment_date` date DEFAULT NULL,
  `semester` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`enrolment_id`),
  UNIQUE KEY `reg_no` (`reg_no`,`course_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `enrolment_ibfk_1` FOREIGN KEY (`reg_no`) REFERENCES `student` (`reg_no`) ON DELETE CASCADE,
  CONSTRAINT `enrolment_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolment`
--

LOCK TABLES `enrolment` WRITE;
/*!40000 ALTER TABLE `enrolment` DISABLE KEYS */;
INSERT INTO `enrolment` VALUES (1,'REG001',1,'2022-09-01','Fall'),(2,'REG002',2,'2021-09-01','Fall'),(3,'REG003',3,'2023-02-01','Spring'),(4,'REG004',4,'2022-02-01','Spring'),(5,'REG005',5,'2021-09-01','Fall'),(6,'REG006',6,'2022-09-01','Fall'),(7,'REG007',7,'2023-02-01','Spring'),(8,'REG008',8,'2021-02-01','Spring'),(9,'REG009',9,'2022-09-01','Fall'),(10,'REG010',10,'2023-02-01','Spring');
/*!40000 ALTER TABLE `enrolment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-27 11:29:04
