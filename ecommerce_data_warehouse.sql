-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ecommerce_datawarehouse
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `dim_customer`
--

DROP TABLE IF EXISTS `dim_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_customer` (
  `cus_key` int NOT NULL AUTO_INCREMENT,
  `cus_id` int DEFAULT NULL,
  `cus_name` varchar(50) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_current` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cus_key`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_customer`
--

LOCK TABLES `dim_customer` WRITE;
/*!40000 ALTER TABLE `dim_customer` DISABLE KEYS */;
INSERT INTO `dim_customer` VALUES (1,101,'Rahul','Pune','2026-01-01','2026-05-31',0),(2,102,'Amit','Mumbai','2026-01-01',NULL,1),(3,103,'Priya','Delhi','2026-01-01',NULL,1),(4,104,'Neha','Bangalore','2026-01-01',NULL,1),(5,105,'Rohit','Hyderabad','2026-01-01',NULL,1),(6,101,'Rahul','Mumbai','2026-06-01',NULL,1);
/*!40000 ALTER TABLE `dim_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_product`
--

DROP TABLE IF EXISTS `dim_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_product` (
  `product_key` int NOT NULL AUTO_INCREMENT,
  `product_id` varchar(20) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`product_key`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_product`
--

LOCK TABLES `dim_product` WRITE;
/*!40000 ALTER TABLE `dim_product` DISABLE KEYS */;
INSERT INTO `dim_product` VALUES (1,'P101','Laptop','Electronics',55000.00),(2,'P102','Mobile','Electronics',25000.00),(3,'P103','Keyboard','Accessories',1500.00),(4,'P104','Mouse','Accessories',800.00),(5,'P105','Monitor','Electronics',12000.00);
/*!40000 ALTER TABLE `dim_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_region`
--

DROP TABLE IF EXISTS `dim_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_region` (
  `region_key` int NOT NULL AUTO_INCREMENT,
  `region_id` varchar(20) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`region_key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_region`
--

LOCK TABLES `dim_region` WRITE;
/*!40000 ALTER TABLE `dim_region` DISABLE KEYS */;
INSERT INTO `dim_region` VALUES (1,'R101','Pune','Maharashtra','India'),(2,'R102','Mumbai','Maharashtra','India'),(3,'R103','Delhi','Delhi','India'),(4,'R104','Bangalore','Karnataka','India'),(5,'R105','Hyderabad','Telangana','India'),(6,'R101','Pune','Maharashtra','India'),(7,'R102','Mumbai','Maharashtra','India'),(8,'R103','Delhi','Delhi','India'),(9,'R104','Bangalore','Karnataka','India'),(10,'R105','Hyderabad','Telangana','India');
/*!40000 ALTER TABLE `dim_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_time`
--

DROP TABLE IF EXISTS `dim_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_time` (
  `time_key` int NOT NULL AUTO_INCREMENT,
  `full_date` date DEFAULT NULL,
  `day` int DEFAULT NULL,
  `month` int DEFAULT NULL,
  `month_name` varchar(20) DEFAULT NULL,
  `quarter` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`time_key`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_time`
--

LOCK TABLES `dim_time` WRITE;
/*!40000 ALTER TABLE `dim_time` DISABLE KEYS */;
INSERT INTO `dim_time` VALUES (1,'2026-01-15',15,1,'January',1,2026),(2,'2026-02-20',20,2,'February',1,2026),(3,'2026-03-10',10,3,'March',1,2026),(4,'2026-04-05',5,4,'April',2,2026),(5,'2026-05-25',25,5,'May',2,2026);
/*!40000 ALTER TABLE `dim_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_sales`
--

DROP TABLE IF EXISTS `fact_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_sales` (
  `sales_key` int NOT NULL AUTO_INCREMENT,
  `cus_key` int DEFAULT NULL,
  `product_key` int DEFAULT NULL,
  `region_key` int DEFAULT NULL,
  `time_key` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`sales_key`),
  KEY `cus_key` (`cus_key`),
  KEY `product_key` (`product_key`),
  KEY `region_key` (`region_key`),
  KEY `time_key` (`time_key`),
  CONSTRAINT `fact_sales_ibfk_1` FOREIGN KEY (`cus_key`) REFERENCES `dim_customer` (`cus_key`),
  CONSTRAINT `fact_sales_ibfk_2` FOREIGN KEY (`product_key`) REFERENCES `dim_product` (`product_key`),
  CONSTRAINT `fact_sales_ibfk_3` FOREIGN KEY (`region_key`) REFERENCES `dim_region` (`region_key`),
  CONSTRAINT `fact_sales_ibfk_4` FOREIGN KEY (`time_key`) REFERENCES `dim_time` (`time_key`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_sales`
--

LOCK TABLES `fact_sales` WRITE;
/*!40000 ALTER TABLE `fact_sales` DISABLE KEYS */;
INSERT INTO `fact_sales` VALUES (1,1,1,1,1,1,55000.00),(2,2,2,2,2,2,50000.00),(3,3,3,3,3,3,4500.00),(4,4,4,4,4,2,1600.00),(5,5,5,5,5,1,12000.00);
/*!40000 ALTER TABLE `fact_sales` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-13  6:01:25
