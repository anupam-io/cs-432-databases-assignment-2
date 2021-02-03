-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: X
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `Addresses`
--

DROP TABLE IF EXISTS `Addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Addresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `description` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Addresses`
--

LOCK TABLES `Addresses` WRITE;
/*!40000 ALTER TABLE `Addresses` DISABLE KEYS */;
INSERT INTO `Addresses` VALUES (1,1,'Gandhinagar 1, Gujarat'),(2,1,'Gandhinagar 2, Gujarat'),(3,1,'Gandhinagar 3, Gujarat'),(4,1,'Gandhinagar 4, Gujarat'),(5,1,'Gandhinagar 5, Gujarat'),(6,1,'Gandhinagar 6, Gujarat'),(7,1,'Gandhinagar 7, Gujarat'),(8,1,'Gandhinagar 8, Gujarat'),(9,1,'Gandhinagar 9, Gujarat'),(21,1,'Gandhinagar Gujarat'),(22,1,'Jamnagar Gujarat'),(23,1,'Ahmedabad');
/*!40000 ALTER TABLE `Addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cart`
--

DROP TABLE IF EXISTS `Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cart` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `Cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`),
  CONSTRAINT `Cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart`
--

LOCK TABLES `Cart` WRITE;
/*!40000 ALTER TABLE `Cart` DISABLE KEYS */;
INSERT INTO `Cart` VALUES (1,1,2,10),(2,1,2,10),(3,1,2,10),(4,1,2,10),(5,1,2,10),(6,1,2,10),(7,1,2,10),(8,1,2,10),(9,1,2,10),(10,1,2,1);
/*!40000 ALTER TABLE `Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned DEFAULT NULL,
  `purchase_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`purchase_id`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `Purchase` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,4),(5,2,9);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `subtype` varchar(50) DEFAULT NULL,
  `retailer_id` int unsigned NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `manufacture_date` date DEFAULT NULL,
  `added_time` datetime NOT NULL,
  `price` int DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `author` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `retailer_id` (`retailer_id`),
  CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`retailer_id`) REFERENCES `Retailers` (`id`),
  CONSTRAINT `Products_chk_1` CHECK ((`type` in (_utf8mb4'Novels',_utf8mb4'Electronics',_utf8mb4'Clothes')))
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES (1,'Book1','Novels',NULL,1,'best book','2020-01-01','2021-02-03 18:36:21',220,NULL,NULL),(2,'Book2','Novels',NULL,1,'best book','2020-01-01','2021-02-03 18:36:21',220,NULL,NULL),(3,'Book3','Novels',NULL,1,'best book','2020-01-01','2021-02-03 18:36:21',200,NULL,NULL),(4,'Book4mi','Novels',NULL,1,'best book','2020-01-01','2021-02-03 18:36:21',200,NULL,NULL),(5,'Book5','Novels',NULL,1,'best book','2020-01-01','2021-02-03 18:36:21',200,NULL,NULL),(6,'Cloth1','Clothes',NULL,2,'shiny cloth','2020-02-09','2021-02-03 18:36:21',700,NULL,NULL),(7,'Cloth2','Clothes',NULL,2,'shiny cloth','2020-02-09','2021-02-03 18:36:21',700,NULL,NULL),(8,'Cloth3','Clothes',NULL,2,'shiny cloth','2020-02-09','2021-02-03 18:36:21',700,NULL,NULL),(9,'Cloth4mi','Clothes',NULL,2,'shiny cloth','2020-02-09','2021-02-03 18:36:21',700,NULL,NULL),(10,'Cloth5','Clothes',NULL,2,'shiny cloth','2020-02-09','2007-01-01 06:15:05',700,NULL,NULL),(11,'Book1','Novels',NULL,3,'best book','2020-01-01','2007-01-01 06:15:05',200,NULL,NULL),(12,'Book2','Novels',NULL,3,'best book','2020-01-01','2007-01-01 06:15:05',200,NULL,NULL),(13,'Book3','Novels',NULL,3,'best book','2020-01-01','2007-01-01 06:15:05',200,NULL,NULL),(14,'Book4','Novels',NULL,3,'best book','2020-01-01','2007-01-01 06:15:05',200,NULL,NULL),(15,'Book5','Novels',NULL,3,'best book','2020-01-01','2007-01-01 06:15:05',200,NULL,NULL),(16,'nextGenLeptop1','Electronics',NULL,4,'made for lazy gamers','2020-02-09','2007-01-01 06:15:05',7000,NULL,NULL),(17,'nextGenLeptop2','Electronics',NULL,4,'made for lazy gamers','2020-02-09','2007-01-01 06:15:05',7000,NULL,NULL),(18,'nextGenLeptop3','Electronics',NULL,4,'made for lazy gamers','2020-02-09','2007-01-01 06:15:05',12000,NULL,NULL),(19,'nextGenLeptop4','Electronics',NULL,5,'made for lazy gamers','2020-02-09','2007-01-01 06:15:05',15000,NULL,NULL),(20,'-dark-product-','Electronics',NULL,5,'made for lazy gamers','2020-02-09','2007-01-01 06:15:05',23000,NULL,NULL),(21,'Deep inside Mysql Part 1','Novels',NULL,4,'for school students','2020-02-09','2021-02-03 18:36:21',7000,NULL,'Dan Brown'),(22,'Deep inside Mysql Part 2','Novels',NULL,4,'for school students','2020-02-09','2021-02-03 18:36:21',7000,NULL,'Dan Brown'),(23,'Deep inside Mysql Part 3','Novels',NULL,4,'for school students','2020-02-09','2021-02-03 18:36:21',7000,NULL,'Dan Brown'),(24,'Dell Super 009','Electronics','Laptop',1,'old laptop','2020-01-01','2021-02-03 18:36:21',50000,NULL,NULL),(25,'HP Bro 669','Electronics','Laptop',2,'light laptop','2020-01-01','2021-02-03 18:36:21',60000,NULL,NULL),(26,'Google XX 0','Electronics','Laptop',3,'beta version','2020-01-01','2021-02-03 18:36:21',70000,NULL,NULL);
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Purchase`
--

DROP TABLE IF EXISTS `Purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Purchase` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL,
  `total_price` int unsigned NOT NULL,
  `date_of_purchase` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `Purchase_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Purchase_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Purchase`
--

LOCK TABLES `Purchase` WRITE;
/*!40000 ALTER TABLE `Purchase` DISABLE KEYS */;
INSERT INTO `Purchase` VALUES (1,1,4,5,100000,'2020-01-01'),(2,1,9,5,1000,'2020-01-01'),(3,1,1,5,1000,'2020-01-01'),(4,4,1,5,1000,'2020-01-01'),(5,5,1,5,1000,'2020-01-01'),(6,1,1,5,1000,'2020-01-01'),(7,NULL,1,5,100000,'2020-01-01'),(8,3,1,5,1000,'2020-01-01'),(9,4,1,5,1000,'2020-01-01'),(10,5,1,5,1000,'2020-01-01'),(11,1,2,10,1000,'2020-01-01'),(12,NULL,2,10,1000,'2020-01-01'),(13,3,2,10,1000,'2020-01-01'),(14,4,2,10,1000,'2020-01-01'),(15,5,2,10,1000,'2000-01-01'),(16,1,2,10,1000,'2000-01-01'),(17,NULL,2,10,1000,'2000-01-01'),(18,3,2,10,1000,'2000-01-01'),(19,4,2,10,1000,'2000-01-01'),(20,5,2,10,1000,'2000-01-01'),(21,7,2,10,1000,'2000-01-01'),(22,7,20,10,1000,'2000-01-01'),(23,7,20,10,1000,'2000-01-01'),(24,7,1,10,1000,'2000-01-01'),(25,7,1,10,1000,'2000-01-01'),(26,7,20,10,1000,'2000-01-01'),(27,7,20,10,1000,'2000-01-01'),(28,7,1,10,1000,'2000-01-01'),(29,7,1,10,1000,'2000-01-01'),(30,7,20,10,1000,'2000-01-01'),(31,7,20,10,1000,'2000-01-01'),(32,7,1,10,1000,'2000-01-01'),(33,7,1,10,1000,'2000-01-01'),(34,8,2,10,1000,'2000-01-01'),(35,8,20,10,1000,'2000-01-01'),(36,8,20,10,1000,'2000-01-01'),(37,8,1,10,1000,'2000-01-01'),(38,8,1,10,1000,'2000-01-01'),(39,8,20,10,1000,'2000-01-01'),(40,8,20,10,1000,'2000-01-01'),(41,8,1,10,1000,'2000-01-01'),(42,8,1,10,1000,'2000-01-01'),(43,8,20,10,1000,'2000-01-01'),(44,8,20,10,1000,'2000-01-01'),(45,7,1,10,1000,'2000-01-01'),(46,7,1,10,1000,'2000-01-01'),(47,20,1,10,1000,'2000-01-01'),(48,20,1,10,1000,'2000-01-01'),(49,20,1,10,1000,'2000-01-01');
/*!40000 ALTER TABLE `Purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Retailers`
--

DROP TABLE IF EXISTS `Retailers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Retailers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `city_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Retailers`
--

LOCK TABLES `Retailers` WRITE;
/*!40000 ALTER TABLE `Retailers` DISABLE KEYS */;
INSERT INTO `Retailers` VALUES (1,'person1@gmail.com','Shop A','New Delhi'),(2,'person2@gmail.com','Shop B','New Delhi'),(3,'person3@gmail.com','Shop C','New Delhi'),(4,'person4@gmail.com','Shop D','New Delhi'),(5,'person5@gmail.com','Shop E','New Delhi'),(6,'person6@gmail.com','Shop F','New Delhi'),(7,'person7@gmail.com','Shop G','New Delhi'),(8,'person8@gmail.com','Shop H','New Delhi'),(9,'person9@gmail.com','Shop I','New Delhi'),(10,'person10@gmail.com','Shop J','New Delhi'),(11,'1person@gmail.com','Shop 1','Ahmedabad'),(12,'2person@gmail.com','Shop 2','Ahmedabad'),(13,'3person@gmail.com','Shop 3','Ahmedabad'),(14,'4person@gmail.com','Shop 4','Ahmedabad'),(15,'5person@gmail.com','Shop 5','Ahmedabad'),(16,'6person@gmail.com','Shop 6','Ahmedabad'),(17,'7person@gmail.com','Shop 7','Ahmedabad'),(18,'8person@gmail.com','Shop 8','Ahmedabad'),(19,'9person@gmail.com','Shop 9','Ahmedabad'),(20,'10person@gmail.com','Shop 10','Ahmedabad');
/*!40000 ALTER TABLE `Retailers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reviews`
--

DROP TABLE IF EXISTS `Reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `description` varchar(500) NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `Reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviews`
--

LOCK TABLES `Reviews` WRITE;
/*!40000 ALTER TABLE `Reviews` DISABLE KEYS */;
INSERT INTO `Reviews` VALUES (1,1,'quite well',1),(2,1,'quite well',2),(3,1,'quite well',3),(4,1,'quite well',4),(5,1,'quite well',5),(6,1,'quite well',6),(7,1,'quite well',7),(8,1,'quite well',8),(9,1,'quite well',9),(10,1,'quite well',10),(11,NULL,'not that good',1),(12,NULL,'not that good',2),(13,NULL,'not that good',3),(14,NULL,'not that good',4),(15,NULL,'not that good',5),(16,NULL,'not that good',6),(17,NULL,'not that good',7),(18,NULL,'not that good',8),(19,NULL,'not that good',9),(20,NULL,'not that good',10);
/*!40000 ALTER TABLE `Reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Searches`
--

DROP TABLE IF EXISTS `Searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Searches` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `term` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Searches_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Searches`
--

LOCK TABLES `Searches` WRITE;
/*!40000 ALTER TABLE `Searches` DISABLE KEYS */;
INSERT INTO `Searches` VALUES (1,1,'ook'),(2,1,'ext'),(3,1,'ook'),(4,1,'ext'),(5,1,'ook'),(6,1,'ext'),(7,1,'ook'),(8,1,'ext'),(9,1,'ook'),(10,1,'ext'),(11,1,'ook'),(12,1,'ext'),(13,1,'ook'),(14,1,'ext'),(15,1,'ook'),(16,1,'ext'),(17,1,'ook'),(31,1,'ook'),(32,1,'ext'),(33,1,'lep');
/*!40000 ALTER TABLE `Searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `signup_time` datetime DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'John Doe','myemail1@gmail.com','1234','2007-01-01 06:15:05','9191919191','Madrid'),(3,'John Doe','myemail3@gmail.com','1234','2007-03-01 06:15:05','9191919191','Ahmedabad'),(4,'John Doe','myemail4@gmail.com','1234','2007-04-01 06:15:05','9191919191','Ahmedabad'),(5,'John Doe','myemail5@gmail.com','1234','2007-05-01 06:15:05','9191919191','Ahmedabad'),(6,'John Doe','myemail6@gmail.com','1234','2007-06-01 06:15:05','9191919191','Ahmedabad'),(7,'John Doe','myemail7@gmail.com','1234','2021-01-01 06:15:05','9191919191','Ahmedabad'),(8,'John Doe','myemail8@gmail.com','1234','2021-01-01 06:15:05','9191919191','Ahmedabad'),(9,'John Doe','myemail9@gmail.com','1234','2021-01-01 06:15:05','9191919191','Ahmedabad'),(10,'John Doe','myemail10@gmail.com','1234','2021-01-01 06:15:05','9191919191','Ahmedabad'),(11,'Jane Doe','myemail01@gmail.com','1234','2021-01-01 06:15:05','9191919191','Madrid'),(12,'Jane Doe','myemail02@gmail.com','1234','2021-01-01 06:15:05','9191919191','Madrid'),(13,'Jane Doe','myemail03@gmail.com','1234','2021-01-01 06:15:05','9191919191','Madrid'),(14,'Jane Doe','myemail04@gmail.com','1234','2021-01-01 06:15:05','9191919191','Madrid'),(15,'Jane Doe','myemail05@gmail.com','1234','2021-01-01 06:15:05','9191919191','Madrid'),(16,'Jane Doe','myemail06@gmail.com','1234','2021-01-01 06:15:05','9191919191','Madrid'),(17,'Jane Doe','myemail07@gmail.com','1234','2021-01-01 06:15:05','9191919191','Madrid'),(18,'Jane Doe','myemail08@gmail.com','1234','2021-01-01 06:15:05','9191919191','Madrid'),(19,'Jane Doe','myemail09@gmail.com','1234','2021-01-01 06:15:05','9191919191','Madrid'),(20,'Jane Doe','myemail010@gmail.com','1234','2021-01-01 06:15:05','9191919191','Madrid');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Views`
--

DROP TABLE IF EXISTS `Views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Views` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `view_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `Views_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `Products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Views`
--

LOCK TABLES `Views` WRITE;
/*!40000 ALTER TABLE `Views` DISABLE KEYS */;
INSERT INTO `Views` VALUES (1,1,'2021-02-01'),(2,1,'2021-02-01'),(3,1,'2021-02-01'),(4,1,'2021-02-01'),(5,1,'2021-02-01'),(6,1,'2021-02-01'),(7,1,'2021-02-01'),(8,1,'2021-02-01'),(9,1,'2021-02-01'),(10,1,'2021-02-01'),(11,2,'2021-02-01'),(12,2,'2021-02-01'),(13,2,'2021-02-01'),(14,2,'2021-02-01'),(15,2,'2021-02-01'),(16,2,'2021-02-01'),(17,2,'2021-02-01'),(18,2,'2021-02-01'),(19,2,'2021-02-01'),(20,2,'2021-02-01'),(21,2,'2021-02-01');
/*!40000 ALTER TABLE `Views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holi_Deals`
--

DROP TABLE IF EXISTS `holi_Deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holi_Deals` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `subtype` varchar(50) DEFAULT NULL,
  `retailer_id` int unsigned NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `manufacture_date` date DEFAULT NULL,
  `added_time` datetime NOT NULL,
  `price` int DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `author` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holi_Deals`
--

LOCK TABLES `holi_Deals` WRITE;
/*!40000 ALTER TABLE `holi_Deals` DISABLE KEYS */;
INSERT INTO `holi_Deals` VALUES (1,'Book1','Novels',NULL,1,'best book','2020-01-01','2021-02-03 18:36:21',220,15,NULL),(2,'Book2','Novels',NULL,1,'best book','2020-01-01','2021-02-03 18:36:21',220,15,NULL),(3,'Book3','Novels',NULL,1,'best book','2020-01-01','2021-02-03 18:36:21',200,15,NULL),(4,'Book4mi','Novels',NULL,1,'best book','2020-01-01','2021-02-03 18:36:21',200,15,NULL),(5,'Book5','Novels',NULL,1,'best book','2020-01-01','2021-02-03 18:36:21',200,15,NULL),(6,'Cloth1','Clothes',NULL,2,'shiny cloth','2020-02-09','2021-02-03 18:36:21',700,15,NULL),(7,'Cloth2','Clothes',NULL,2,'shiny cloth','2020-02-09','2021-02-03 18:36:21',700,15,NULL),(8,'Cloth3','Clothes',NULL,2,'shiny cloth','2020-02-09','2021-02-03 18:36:21',700,15,NULL),(9,'Cloth4mi','Clothes',NULL,2,'shiny cloth','2020-02-09','2021-02-03 18:36:21',700,15,NULL),(21,'Deep inside Mysql Part 1','Novels',NULL,4,'for school students','2020-02-09','2021-02-03 18:36:21',7000,15,'Dan Brown'),(22,'Deep inside Mysql Part 2','Novels',NULL,4,'for school students','2020-02-09','2021-02-03 18:36:21',7000,15,'Dan Brown'),(23,'Deep inside Mysql Part 3','Novels',NULL,4,'for school students','2020-02-09','2021-02-03 18:36:21',7000,15,'Dan Brown'),(24,'Dell Super 009','Electronics','Laptop',1,'old laptop','2020-01-01','2021-02-03 18:36:21',50000,15,NULL),(25,'HP Bro 669','Electronics','Laptop',2,'light laptop','2020-01-01','2021-02-03 18:36:21',60000,15,NULL),(26,'Google XX 0','Electronics','Laptop',3,'beta version','2020-01-01','2021-02-03 18:36:21',70000,15,NULL);
/*!40000 ALTER TABLE `holi_Deals` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-03 18:36:51
