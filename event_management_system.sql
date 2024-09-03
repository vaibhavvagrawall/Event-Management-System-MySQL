-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: event_management_system
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `event_id` int NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `event_date` date NOT NULL,
  `event_time` time NOT NULL,
  `venue` varchar(255) DEFAULT NULL,
  `budget` decimal(10,2) DEFAULT NULL,
  `type_of_event` varchar(100) NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Annual Conference','2024-10-15','09:00:00','Taj Palace',500000.00,'Conference'),(2,'Company Holiday Party','2024-12-20','18:00:00','Leela Hotel',300000.00,'Party'),(3,'Product Launch','2024-11-05','14:00:00','ITC Grand',400000.00,'Product Launch'),(4,'Charity Gala','2024-11-25','19:00:00','Hyatt Regency',600000.00,'Gala'),(5,'Networking Event','2024-10-30','17:00:00','Radisson Blu',200000.00,'Networking');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `expense_id` int NOT NULL,
  `event_id` int DEFAULT NULL,
  `expense_type` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `date_incurred` date DEFAULT NULL,
  PRIMARY KEY (`expense_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (1,1,'Venue Rental',200000.00,'2024-09-01'),(2,1,'Catering',150000.00,'2024-09-15'),(3,2,'Decorations',80000.00,'2024-11-01'),(4,3,'Sound Equipment',100000.00,'2024-10-20'),(5,4,'Photographer',120000.00,'2024-10-25');
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guests`
--

DROP TABLE IF EXISTS `guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guests` (
  `guest_id` int NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`guest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guests`
--

LOCK TABLES `guests` WRITE;
/*!40000 ALTER TABLE `guests` DISABLE KEYS */;
INSERT INTO `guests` VALUES (1,'Rajesh','Kumar','rajesh.kumar@example.com','9876543210'),(2,'Aarti','Sharma','aarti.sharma@example.com','9876543211'),(3,'Ravi','Singh','ravi.singh@example.com','9876543212'),(4,'Neha','Gupta','neha.gupta@example.com','9876543213'),(5,'Arjun','Patel','arjun.patel@example.com','9876543214');
/*!40000 ALTER TABLE `guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rsvps`
--

DROP TABLE IF EXISTS `rsvps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rsvps` (
  `rsvp_id` int NOT NULL,
  `event_id` int DEFAULT NULL,
  `guest_id` int DEFAULT NULL,
  `response` enum('Accepted','Declined','Pending') NOT NULL,
  PRIMARY KEY (`rsvp_id`),
  KEY `event_id` (`event_id`),
  KEY `guest_id` (`guest_id`),
  CONSTRAINT `rsvps_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  CONSTRAINT `rsvps_ibfk_2` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`guest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rsvps`
--

LOCK TABLES `rsvps` WRITE;
/*!40000 ALTER TABLE `rsvps` DISABLE KEYS */;
INSERT INTO `rsvps` VALUES (1,1,1,'Accepted'),(2,1,2,'Accepted'),(3,2,3,'Declined'),(4,3,4,'Pending'),(5,4,5,'Accepted');
/*!40000 ALTER TABLE `rsvps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seating_arrangements`
--

DROP TABLE IF EXISTS `seating_arrangements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seating_arrangements` (
  `seating_id` int NOT NULL,
  `event_id` int DEFAULT NULL,
  `guest_id` int DEFAULT NULL,
  `table_number` int DEFAULT NULL,
  `seat_number` int DEFAULT NULL,
  PRIMARY KEY (`seating_id`),
  KEY `event_id` (`event_id`),
  KEY `guest_id` (`guest_id`),
  CONSTRAINT `seating_arrangements_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  CONSTRAINT `seating_arrangements_ibfk_2` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`guest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seating_arrangements`
--

LOCK TABLES `seating_arrangements` WRITE;
/*!40000 ALTER TABLE `seating_arrangements` DISABLE KEYS */;
INSERT INTO `seating_arrangements` VALUES (1,1,1,1,1),(2,1,2,1,2),(3,3,4,2,1),(4,4,5,3,1),(5,5,3,4,1);
/*!40000 ALTER TABLE `seating_arrangements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_contracts`
--

DROP TABLE IF EXISTS `vendor_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_contracts` (
  `contract_id` int NOT NULL,
  `event_id` int DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  `contract_date` date NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`contract_id`),
  KEY `event_id` (`event_id`),
  KEY `vendor_id` (`vendor_id`),
  CONSTRAINT `vendor_contracts_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  CONSTRAINT `vendor_contracts_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_contracts`
--

LOCK TABLES `vendor_contracts` WRITE;
/*!40000 ALTER TABLE `vendor_contracts` DISABLE KEYS */;
INSERT INTO `vendor_contracts` VALUES (1,1,1,'2024-10-01',250000.00),(2,1,2,'2024-10-01',150000.00),(3,2,3,'2024-12-01',120000.00),(4,3,4,'2024-11-01',180000.00),(5,4,5,'2024-11-10',200000.00);
/*!40000 ALTER TABLE `vendor_contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `vendor_id` int NOT NULL,
  `vendor_name` varchar(255) NOT NULL,
  `contact_name` varchar(100) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `service_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES (1,'CaterIndia','Anil Kumar','anil.kumar@caterindia.com','9876543220','Catering'),(2,'PhotoExperts','Sita Patel','sita.patel@photoexperts.com','9876543221','Photography'),(3,'EventDecorators','Amit Mehta','amit.mehta@eventdecorators.com','9876543222','Decorations'),(4,'SoundMasters','Kavita Sharma','kavita.sharma@soundmasters.com','9876543223','Sound'),(5,'TechEvents','Rajiv Reddy','rajiv.reddy@techevents.com','9876543224','AV Equipment');
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-04  0:39:37
