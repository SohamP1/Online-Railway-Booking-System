CREATE DATABASE  IF NOT EXISTS `orbsystem` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `orbsystem`;
-- MySQL dump 10.13  Distrib 8.0.40, for macos14 (arm64)
--
-- Host: localhost    Database: orbsystem
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `Controls`
--

DROP TABLE IF EXISTS `Controls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Controls` (
  `manager_ssn` int NOT NULL,
  `transit_line_name` varchar(50) NOT NULL,
  `reservation_number` int NOT NULL,
  `customer_username` varchar(50) NOT NULL,
  PRIMARY KEY (`manager_ssn`,`transit_line_name`,`reservation_number`,`customer_username`),
  KEY `transit_line_name` (`transit_line_name`),
  KEY `reservation_number` (`reservation_number`),
  KEY `customer_username` (`customer_username`),
  CONSTRAINT `controls_ibfk_1` FOREIGN KEY (`transit_line_name`) REFERENCES `Train_schedule` (`transit_line_name`) ON DELETE CASCADE,
  CONSTRAINT `controls_ibfk_2` FOREIGN KEY (`manager_ssn`) REFERENCES `Manager` (`ssn`) ON DELETE CASCADE,
  CONSTRAINT `controls_ibfk_3` FOREIGN KEY (`reservation_number`) REFERENCES `Reservation` (`reservation_number`) ON DELETE CASCADE,
  CONSTRAINT `controls_ibfk_4` FOREIGN KEY (`customer_username`) REFERENCES `Customer` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Controls`
--

LOCK TABLES `Controls` WRITE;
/*!40000 ALTER TABLE `Controls` DISABLE KEYS */;
/*!40000 ALTER TABLE `Controls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('jane_customer','cust123','jane@example.com','Jane','Doe'),('john_customer','cust123','john@example.com','John','Smith'),('sara_customer','cust123','sara@example.com','Sara','Johnson');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_representatives`
--

DROP TABLE IF EXISTS `Customer_representatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer_representatives` (
  `ssn` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`ssn`),
  UNIQUE KEY `username` (`username`),
  CONSTRAINT `customer_representatives_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `Employee` (`ssn`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_representatives`
--

LOCK TABLES `Customer_representatives` WRITE;
/*!40000 ALTER TABLE `Customer_representatives` DISABLE KEYS */;
INSERT INTO `Customer_representatives` VALUES (2001,'david_rep','rep123'),(2002,'ella_rep','rep123'),(2003,'frank_rep','rep123');
/*!40000 ALTER TABLE `Customer_representatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `ssn` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`ssn`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1001,'Alice','Smith','alice_manager','manager123'),(1002,'Bob','Brown','bob_manager','manager123'),(1003,'Carol','Davis','carol_manager','manager123'),(2001,'David','Evans','david_rep','rep123'),(2002,'Ella','Foster','ella_rep','rep123'),(2003,'Frank','Green','frank_rep','rep123');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manager`
--

DROP TABLE IF EXISTS `Manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Manager` (
  `ssn` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`ssn`),
  UNIQUE KEY `username` (`username`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `Employee` (`ssn`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manager`
--

LOCK TABLES `Manager` WRITE;
/*!40000 ALTER TABLE `Manager` DISABLE KEYS */;
INSERT INTO `Manager` VALUES (1001,'alice_manager','manager123'),(1002,'bob_manager','manager123'),(1003,'carol_manager','manager123');
/*!40000 ALTER TABLE `Manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manages`
--

DROP TABLE IF EXISTS `Manages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Manages` (
  `customer_rep_ssn` int NOT NULL,
  `transit_line_name` varchar(50) NOT NULL,
  `reservation_number` int NOT NULL,
  `customer_username` varchar(50) NOT NULL,
  PRIMARY KEY (`customer_rep_ssn`,`transit_line_name`,`customer_username`,`reservation_number`),
  KEY `transit_line_name` (`transit_line_name`),
  KEY `reservation_number` (`reservation_number`),
  KEY `customer_username` (`customer_username`),
  CONSTRAINT `manages_ibfk_1` FOREIGN KEY (`transit_line_name`) REFERENCES `Train_schedule` (`transit_line_name`) ON DELETE CASCADE,
  CONSTRAINT `manages_ibfk_2` FOREIGN KEY (`customer_rep_ssn`) REFERENCES `Customer_representatives` (`ssn`) ON DELETE CASCADE,
  CONSTRAINT `manages_ibfk_3` FOREIGN KEY (`reservation_number`) REFERENCES `Reservation` (`reservation_number`) ON DELETE CASCADE,
  CONSTRAINT `manages_ibfk_4` FOREIGN KEY (`customer_username`) REFERENCES `Customer` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manages`
--

LOCK TABLES `Manages` WRITE;
/*!40000 ALTER TABLE `Manages` DISABLE KEYS */;
/*!40000 ALTER TABLE `Manages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservation` (
  `reservation_number` int NOT NULL,
  `transit_line_name` varchar(50) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `total_fare` float DEFAULT NULL,
  `origin_station` varchar(50) DEFAULT NULL,
  `destination_station` varchar(50) DEFAULT NULL,
  `departure_date` date DEFAULT NULL,
  `passenger` varchar(50) DEFAULT NULL,
  `reservation_date` date DEFAULT NULL,
  PRIMARY KEY (`reservation_number`),
  KEY `transit_line_name` (`transit_line_name`),
  KEY `username` (`username`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`transit_line_name`) REFERENCES `Train_schedule` (`transit_line_name`) ON DELETE CASCADE,
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`username`) REFERENCES `Customer` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservation`
--

LOCK TABLES `Reservation` WRITE;
/*!40000 ALTER TABLE `Reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Station`
--

DROP TABLE IF EXISTS `Station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Station` (
  `station_id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Station`
--

LOCK TABLES `Station` WRITE;
/*!40000 ALTER TABLE `Station` DISABLE KEYS */;
/*!40000 ALTER TABLE `Station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supervise`
--

DROP TABLE IF EXISTS `Supervise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supervise` (
  `manager_ssn` int NOT NULL,
  `customer_rep_ssn` int NOT NULL,
  PRIMARY KEY (`manager_ssn`,`customer_rep_ssn`),
  KEY `customer_rep_ssn` (`customer_rep_ssn`),
  CONSTRAINT `supervise_ibfk_1` FOREIGN KEY (`manager_ssn`) REFERENCES `Manager` (`ssn`) ON DELETE CASCADE,
  CONSTRAINT `supervise_ibfk_2` FOREIGN KEY (`customer_rep_ssn`) REFERENCES `Customer_representatives` (`ssn`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supervise`
--

LOCK TABLES `Supervise` WRITE;
/*!40000 ALTER TABLE `Supervise` DISABLE KEYS */;
/*!40000 ALTER TABLE `Supervise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Train`
--

DROP TABLE IF EXISTS `Train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Train` (
  `trainid` int NOT NULL,
  PRIMARY KEY (`trainid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Train`
--

LOCK TABLES `Train` WRITE;
/*!40000 ALTER TABLE `Train` DISABLE KEYS */;
/*!40000 ALTER TABLE `Train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Train_schedule`
--

DROP TABLE IF EXISTS `Train_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Train_schedule` (
  `transit_line_name` varchar(50) NOT NULL,
  `trainid` int NOT NULL,
  `station_id` int NOT NULL,
  `travel_time` int DEFAULT NULL,
  `fare` float DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `origin_station` varchar(50) DEFAULT NULL,
  `destination_station` varchar(50) DEFAULT NULL,
  `stops` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`transit_line_name`),
  KEY `trainid` (`trainid`),
  KEY `station_id` (`station_id`),
  CONSTRAINT `train_schedule_ibfk_1` FOREIGN KEY (`trainid`) REFERENCES `Train` (`trainid`) ON DELETE CASCADE,
  CONSTRAINT `train_schedule_ibfk_2` FOREIGN KEY (`station_id`) REFERENCES `Station` (`station_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Train_schedule`
--

LOCK TABLES `Train_schedule` WRITE;
/*!40000 ALTER TABLE `Train_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `Train_schedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-14  0:01:17
