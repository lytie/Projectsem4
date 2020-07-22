-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: prj4db
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `accountcustomer`
--

DROP TABLE IF EXISTS `accountcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountcustomer` (
  `AccountCustomerId` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `FullName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AccountCustomerId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountcustomer`
--

LOCK TABLES `accountcustomer` WRITE;
/*!40000 ALTER TABLE `accountcustomer` DISABLE KEYS */;
INSERT INTO `accountcustomer` VALUES (1,'abc@gmail.com','123456','Trịnh Thiêm Bảo','03940435',NULL);
/*!40000 ALTER TABLE `accountcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accountemployee`
--

DROP TABLE IF EXISTS `accountemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountemployee` (
  `accountId` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `FullName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateOfBirth` datetime DEFAULT NULL,
  `RoleId` int DEFAULT NULL,
  PRIMARY KEY (`accountId`),
  KEY `FK_accountemployee_role` (`RoleId`),
  CONSTRAINT `FK_accountemployee_role` FOREIGN KEY (`RoleId`) REFERENCES `role` (`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountemployee`
--

LOCK TABLES `accountemployee` WRITE;
/*!40000 ALTER TABLE `accountemployee` DISABLE KEYS */;
INSERT INTO `accountemployee` VALUES (1,'bao@gmail.com','123456','Trịnh Thiêm Bảo','0940223412','2000-10-10 00:00:00',1),(2,'thai@gmail.com','123456','Nguyễn Quốc Thái','0903441287','2000-12-06 00:00:00',1);
/*!40000 ALTER TABLE `accountemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convenient`
--

DROP TABLE IF EXISTS `convenient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convenient` (
  `ConvenientId` int NOT NULL AUTO_INCREMENT,
  `ConvenientName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ConvenientId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convenient`
--

LOCK TABLES `convenient` WRITE;
/*!40000 ALTER TABLE `convenient` DISABLE KEYS */;
INSERT INTO `convenient` VALUES (1,'Air Conditioned','Air_Conditioned.png'),(2,'Balcony','Balcony.png'),(3,'bathtub','bathtub.png'),(4,'phone','phone.png'),(5,'Shower','Shower.png'),(6,'Sitting Area','Sitting_Area.png'),(7,'Toilet','Toilet.png'),(8,'TV','TV.png'),(9,'wifi','wifi.png');
/*!40000 ALTER TABLE `convenient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `FeedBackId` int NOT NULL AUTO_INCREMENT,
  `FeedBackMessage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QrCodeId` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`FeedBackId`),
  KEY `FK_feedback_qrcode` (`QrCodeId`),
  CONSTRAINT `FK_feedback_qrcode` FOREIGN KEY (`QrCodeId`) REFERENCES `qrcode` (`QrCodeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `history`
--

DROP TABLE IF EXISTS `history`;
/*!50001 DROP VIEW IF EXISTS `history`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `history` AS SELECT 
 1 AS `url`,
 1 AS `RoomTypeName`,
 1 AS `LocationName`,
 1 AS `CheckInDate`,
 1 AS `CheckOutDate`,
 1 AS `Subtotal`,
 1 AS `Tax`,
 1 AS `Deposits`,
 1 AS `Total`,
 1 AS `ReceiptId`,
 1 AS `AccountCustomerId`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `img_hero`
--

DROP TABLE IF EXISTS `img_hero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `img_hero` (
  `id_hero` int NOT NULL AUTO_INCREMENT,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `text_Title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `text_short` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `choose` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id_hero`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `img_hero`
--

LOCK TABLES `img_hero` WRITE;
/*!40000 ALTER TABLE `img_hero` DISABLE KEYS */;
INSERT INTO `img_hero` VALUES (1,'h1_hero.jpg','top Resort in the city','Haven de luxe',_binary ''),(2,'h2_hero.jpg','top Resort in the city','Haven de luxe',_binary ''),(3,'h3_hero.jpeg','top Resort in the city','Haven de luxe',_binary '');
/*!40000 ALTER TABLE `img_hero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `LocationId` int NOT NULL AUTO_INCREMENT,
  `LocationName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LocationUrl` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`LocationId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Đà Nẵng','Da_Nang.jpg'),(2,'Hội An','Hoi_An.jpg'),(3,'Phú Quốc','Phu_Quoc.jpg'),(4,'Mũi Né','Mui_Ne.jpg'),(5,'Đà Lạt','Da_Lat.jpg');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrcode`
--

DROP TABLE IF EXISTS `qrcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrcode` (
  `QrCodeId` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `CustomerName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EmailSendedTo` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `CheckInDate` datetime DEFAULT NULL,
  `CheckOutDate` datetime DEFAULT NULL,
  `RoomId` int DEFAULT NULL,
  `AdultsNum` int DEFAULT NULL,
  `ChildrenNum` int DEFAULT NULL,
  `Deposits` float DEFAULT NULL,
  `ReceiptId` int DEFAULT NULL,
  `Url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `AccountCustomerId` int DEFAULT NULL,
  `Status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`QrCodeId`),
  KEY `FK_qrcode_receipt` (`ReceiptId`),
  KEY `FK_qrcode_room` (`RoomId`),
  CONSTRAINT `FK_qrcode_receipt` FOREIGN KEY (`ReceiptId`) REFERENCES `receipt` (`ReceiptId`),
  CONSTRAINT `FK_qrcode_room` FOREIGN KEY (`RoomId`) REFERENCES `room` (`RoomId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrcode`
--

LOCK TABLES `qrcode` WRITE;
/*!40000 ALTER TABLE `qrcode` DISABLE KEYS */;
INSERT INTO `qrcode` VALUES ('34DSFWE45DFGER3we3F','MayBe','sd@gmail.com','2020-07-13 00:00:00','2020-07-15 00:00:00','2020-07-17 00:00:00',2,1,1,NULL,2,NULL,NULL,NULL),('38FN8490FNU82RRwWcF','Bảo Trịnh Thiêm','abc@gmail.com','2020-07-13 00:00:00','2020-07-15 00:00:00','2020-07-17 00:00:00',1,2,0,4,1,NULL,NULL,_binary ''),('DSF34dsfDVK435UdsfWEF','Balabala','bala@ex.com','2020-07-20 00:00:00','2020-07-22 00:00:00','2020-07-25 00:00:00',2,2,NULL,NULL,3,NULL,NULL,NULL);
/*!40000 ALTER TABLE `qrcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt` (
  `ReceiptId` int NOT NULL AUTO_INCREMENT,
  `PayDate` datetime DEFAULT NULL,
  `Subtotal` float DEFAULT NULL,
  `Tax` float DEFAULT NULL,
  `Total` float DEFAULT NULL,
  `PayStatus` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ReceiptId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
INSERT INTO `receipt` VALUES (1,NULL,540,54,590,_binary '\0'),(2,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receiptcomponent`
--

DROP TABLE IF EXISTS `receiptcomponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receiptcomponent` (
  `ReceiptComponentId` int NOT NULL AUTO_INCREMENT,
  `ReceiptId` int DEFAULT NULL,
  `ComponentName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Subtotal` float DEFAULT NULL,
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `OrdererName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ReceiptComponentId`),
  KEY `FK_receiptcomponent_receipt` (`ReceiptId`),
  CONSTRAINT `FK_receiptcomponent_receipt` FOREIGN KEY (`ReceiptId`) REFERENCES `receipt` (`ReceiptId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receiptcomponent`
--

LOCK TABLES `receiptcomponent` WRITE;
/*!40000 ALTER TABLE `receiptcomponent` DISABLE KEYS */;
INSERT INTO `receiptcomponent` VALUES (1,1,'Room-Bungalow',40,1,40,'Typeroom_Bungalow.jpg','2020-07-15 00:00:00','Bảo Trịnh Thiêm'),(2,1,'Wine Castle',200,2,400,'experience3.jpg','2020-07-16 00:00:00','Bảo Trịnh Thiêm'),(3,1,'Costolette di agnello',100,1,100,'our-menu-02.jpg','2020-07-16 00:00:00','Bảo Trịnh Thiêm');
/*!40000 ALTER TABLE `receiptcomponent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `RoleId` int NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin'),(2,'reception'),(3,'ticket collector');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `RoomId` int NOT NULL AUTO_INCREMENT,
  `LocationId` int DEFAULT NULL,
  `RoomTypeId` int DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Status` bit(1) DEFAULT NULL,
  `Description` varchar(2550) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BedOption` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Size` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `View` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  PRIMARY KEY (`RoomId`),
  KEY `FK_room_location` (`LocationId`),
  KEY `FK_room_roomtype` (`RoomTypeId`),
  CONSTRAINT `FK_room_location` FOREIGN KEY (`LocationId`) REFERENCES `location` (`LocationId`),
  CONSTRAINT `FK_room_roomtype` FOREIGN KEY (`RoomTypeId`) REFERENCES `roomtype` (`RoomTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,3,1,40,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.','1 Single','32','Ocean',4),(2,1,1,50,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.','1 Single','32','Garden',4),(3,3,1,45,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.','1 Single','32','Beachfront',4),(4,1,1,55,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.','1 Single','32','Garden',4),(5,1,2,34,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.','1 Single','32','City',4),(6,4,2,43,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.','1 Single','32','Ocean',4),(7,4,2,43,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.','1 twin','32','Ocean',5),(8,3,2,43,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.','1 Single','35','Ocean',4),(9,3,2,35,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.','1 twin','40','Ocean',5),(10,4,2,45,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.',' 1 Single King','42','Ocean',5),(11,1,2,45,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.','1 Single','56','City',4),(12,5,2,46,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.',' 1 Single King','38','Garden',5),(13,5,2,43,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.',' 1 Single King','42','Garden',5),(14,5,3,41,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.',' 1 Single King','50','Garden',5),(15,5,4,40,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.',' 1 Single King','40','Mountains',5),(16,1,4,51,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.','1 twin','41','Garden',5),(17,3,4,53,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.','1 Single','43','Ocean',4),(18,4,5,54,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.','1 Single','100','Ocean',4),(19,5,5,43,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.',' 1 Single King','70','Garden',5),(20,5,5,43,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.','1 Single','65','Garden',4),(21,1,6,44,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.','1 twin King','42','City',6),(22,2,6,49,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.',' 1 Single King & 1 Single & 1 twin','100','Garden',11),(23,2,6,48,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.','1 Single & 1 twin','40','Garden',8),(24,2,6,48,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.','1 Single','43','Garden',4),(25,2,6,48,_binary '\0','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.','1 twin','43','Garden',4);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `roombooking`
--

DROP TABLE IF EXISTS `roombooking`;
/*!50001 DROP VIEW IF EXISTS `roombooking`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `roombooking` AS SELECT 
 1 AS `RoomTypeName`,
 1 AS `BedOptions`,
 1 AS `RoomSize`,
 1 AS `View`,
 1 AS `url`,
 1 AS `RoomId`,
 1 AS `Price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `roomconvenient`
--

DROP TABLE IF EXISTS `roomconvenient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomconvenient` (
  `RoomId` int DEFAULT NULL,
  `ConvenientId` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `FK_roomconvenient_convenient` (`ConvenientId`),
  KEY `FK_roomconvenient_room` (`RoomId`),
  CONSTRAINT `FK_roomconvenient_convenient` FOREIGN KEY (`ConvenientId`) REFERENCES `convenient` (`ConvenientId`),
  CONSTRAINT `FK_roomconvenient_room` FOREIGN KEY (`RoomId`) REFERENCES `room` (`RoomId`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomconvenient`
--

LOCK TABLES `roomconvenient` WRITE;
/*!40000 ALTER TABLE `roomconvenient` DISABLE KEYS */;
INSERT INTO `roomconvenient` VALUES (1,1,1),(1,2,2),(1,3,3),(1,4,4),(1,5,5),(1,6,6),(1,7,7),(1,8,8),(1,9,9),(3,1,10),(3,2,11),(3,3,12),(3,4,13),(3,5,14),(3,6,15),(3,7,16),(3,8,17),(3,9,18),(4,1,19),(4,2,20),(4,3,21),(4,4,22),(4,5,23),(4,6,24),(4,7,25),(4,8,26),(4,9,27),(2,1,28),(2,2,29),(2,3,30),(2,4,31),(2,5,32),(2,6,33),(2,7,34),(2,8,35),(2,9,36),(5,1,37),(5,2,38),(5,3,39),(5,4,40),(5,5,41),(5,6,42),(5,7,43),(5,8,44),(5,9,45),(6,1,46),(6,2,47),(6,3,48),(6,4,49),(6,5,50),(6,6,51),(6,7,52),(6,8,53),(6,9,54),(7,1,55),(7,2,56),(7,3,57),(7,4,58),(7,5,59),(7,6,60),(7,7,61),(7,8,62),(7,9,63),(8,1,64),(8,2,65),(8,3,66),(8,4,67),(8,5,68),(8,6,69),(8,7,70),(8,8,71),(8,9,72),(9,1,73),(9,2,74),(9,3,75),(9,4,76),(9,5,77),(9,6,78),(9,7,79),(9,8,80),(9,9,81),(10,1,82),(10,2,83),(10,3,84),(10,4,85),(10,5,86),(10,6,87),(10,7,88),(10,8,89),(10,9,90),(11,1,91),(11,2,92),(11,3,93),(11,4,94),(11,5,95),(11,6,96),(11,7,97),(11,8,98),(11,9,99),(12,1,100),(12,2,101),(12,3,102),(12,4,103),(12,5,104),(12,6,105),(12,7,106),(12,8,107),(12,9,108),(13,1,109),(13,2,110),(13,3,111),(13,4,112),(13,5,113),(13,6,114),(13,7,115),(13,8,116),(13,9,117),(14,1,118),(14,2,119),(14,3,120),(14,4,121),(14,5,122),(14,6,123),(14,7,124),(14,8,125),(14,9,126),(15,1,127),(15,2,128),(15,3,129),(15,4,130),(15,5,131),(15,6,132),(15,7,133),(15,8,134),(15,9,135),(16,1,136),(16,2,137),(16,3,138),(16,4,139),(16,5,140),(16,6,141),(16,7,142),(16,8,143),(16,9,144),(17,1,145),(17,2,146),(17,3,147),(17,4,148),(17,5,149),(17,6,150),(17,7,151),(17,8,152),(17,9,153),(18,1,154),(18,2,155),(18,3,156),(18,4,157),(18,5,158),(18,6,159),(18,7,160),(18,8,161),(18,9,162),(19,1,163),(19,2,164),(19,3,165),(19,4,166),(19,5,167),(19,6,168),(19,7,169),(19,8,170),(19,9,171),(20,1,172),(20,2,173),(20,3,174),(20,4,175),(20,5,176),(20,6,177),(20,7,178),(20,8,179),(20,9,180),(21,1,181),(21,2,182),(21,3,183),(21,4,184),(21,5,185),(21,6,186),(21,7,187),(21,8,188),(21,9,189),(22,1,190),(22,2,191),(22,3,192),(22,4,193),(22,5,194),(22,6,195),(22,7,196),(22,8,197),(22,9,198),(23,1,199),(23,2,200),(23,3,201),(23,4,202),(23,5,203),(23,6,204),(23,7,205),(23,8,206),(23,9,207),(24,1,208),(24,2,209),(24,3,210),(24,4,211),(24,5,212),(24,6,213),(24,7,214),(24,8,215),(24,9,216),(25,1,217),(25,2,218),(25,3,219),(25,4,220),(25,5,221),(25,6,222),(25,7,223),(25,8,224),(25,9,225);
/*!40000 ALTER TABLE `roomconvenient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomimage`
--

DROP TABLE IF EXISTS `roomimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomimage` (
  `RoomImageId` int NOT NULL AUTO_INCREMENT,
  `RoomId` int DEFAULT NULL,
  `Url` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`RoomImageId`),
  KEY `FK_roomimage_room` (`RoomId`),
  CONSTRAINT `FK_roomimage_room` FOREIGN KEY (`RoomId`) REFERENCES `room` (`RoomId`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomimage`
--

LOCK TABLES `roomimage` WRITE;
/*!40000 ALTER TABLE `roomimage` DISABLE KEYS */;
INSERT INTO `roomimage` VALUES (1,1,'Bungalow_room1_a.jpg'),(2,1,'Bungalow_room1_c.jpg'),(3,1,'Bungalow_room1_d.jpg'),(4,2,'Bungalow_room2_a.jpg'),(5,2,'Bungalow_room2_b.jpg'),(6,2,'Bungalow_room2_c.jpg'),(7,2,'Bungalow_room2_d.jpg'),(8,3,'Bungalow_room3.jpg'),(9,3,'Bungalow_room3_a.jpg'),(10,3,'Bungalow_room3_b.jpg'),(11,3,'Bungalow_room3_c.jpg'),(12,4,'Bungalow_room4.jpg'),(13,4,'Bungalow_room4_b.jpg'),(14,4,'Bungalow_room4_a.jpg'),(15,5,'Deluxe_room1_a.jpg'),(16,5,'Deluxe_room1_b.jpg'),(17,5,'Deluxe_room1_c.jpg'),(18,6,'Deluxe_room2_a.jpg'),(19,6,'Deluxe_room2_b.jpg'),(20,6,'Deluxe_room2_c.jpg'),(21,7,'Deluxe_room3_a.jpg'),(22,7,'Deluxe_room3_b.jpg'),(23,7,'Deluxe_room3_c.jpg'),(24,7,'Deluxe_room3_d.jpg'),(25,8,'Deluxe_room4_a.jpg'),(26,8,'Deluxe_room4_b.jpg'),(27,8,'Deluxe_room4_c.jpg'),(28,9,'Deluxe_room5_a.jpg'),(29,9,'Deluxe_room5_b.jpg'),(30,10,'Deluxe_room6_a.jpg'),(31,10,'Deluxe_room6_b.jpg'),(32,11,'Deluxe_room7_a.jpg'),(33,11,'Deluxe_room7_b.jpg'),(34,11,'Deluxe_room7_c.jpg'),(35,11,'Deluxe_room7_d.jpg'),(36,11,'Deluxe_room7_e.jpg'),(37,12,'Deluxe_room8_a.jpg'),(38,12,'Deluxe_room8_b.jpg'),(39,13,'Deluxe_room9_a.jpg'),(40,13,'Deluxe_room9_b.jpg'),(41,13,'Deluxe_room9_c.jpg'),(42,14,'King_room1_a.jpg'),(43,14,'King_room1_b.jpg'),(44,14,'King_room1_c.jpg'),(45,14,'King_room1_d.jpg'),(46,15,'Premier_room2_a.jpg'),(47,15,'Premier_room2_b.jpg'),(48,16,'Premier_room3_a.jpg'),(49,16,'Premier_room3_b.jpg'),(50,17,'Premier_room7_a.jpg'),(51,17,'Premier_room7_b.jpg'),(52,17,'Premier_room7_c.jpg'),(53,17,'Premier_room7_d.jpg'),(54,17,'Premier_room7_e.jpg'),(55,17,'Premier_room7_f.jpg'),(56,18,'Suite_room1_a.jpg'),(57,18,'Suite_room1_b.jpg'),(58,18,'Suite_room1_c.jpg'),(59,18,'Suite_room1_d.jpg'),(60,18,'Suite_room1_e.jpg'),(61,19,'Suite_room2_a.jpg'),(62,19,'Suite_room2_b.jpg'),(63,19,'Suite_room2_c.jpg'),(64,19,'Suite_room2_d.jpg'),(65,20,'Suite_room3_a.jpg'),(66,20,'Suite_room3_b.jpg'),(67,20,'Suite_room3_c.jpg'),(68,20,'Suite_room3_d.jpg'),(69,20,'Suite_room3_e.jpg'),(70,21,'Superior_room1_a.jpg'),(71,21,'Superior_room1_b.jpg'),(72,21,'Superior_room1_c.jpg'),(73,21,'Superior_room1_d.jpg'),(74,21,'Superior_room1_e.jpg'),(75,22,'Villa_PhoCo_room1_a.jpg'),(76,22,'Villa_PhoCo_room1_b.jpg'),(77,22,'Villa_PhoCo_room1_c.jpg'),(78,22,'Villa_PhoCo_room1_d.jpg'),(79,23,'Villa_PhoCo_room2_A.jpg'),(80,23,'Villa_PhoCo_room2_b.jpg'),(81,23,'Villa_PhoCo_room2_c.jpg'),(82,24,'Villa_PhoCo_room3_a.jpg'),(83,24,'Villa_PhoCo_room3_b.jpg'),(84,25,'Villa_PhoCo_room4_a.jpg'),(85,25,'Villa_PhoCo_room4_b.jpg');
/*!40000 ALTER TABLE `roomimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomtype`
--

DROP TABLE IF EXISTS `roomtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomtype` (
  `RoomTypeId` int NOT NULL AUTO_INCREMENT,
  `RoomTypeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`RoomTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomtype`
--

LOCK TABLES `roomtype` WRITE;
/*!40000 ALTER TABLE `roomtype` DISABLE KEYS */;
INSERT INTO `roomtype` VALUES (1,'Bungalow','This type of single-storey house originated from India, officially appeared from the 17th century. This type of house is relatively small, separate but fully furnished, highly mobile','Typeroom_Bungalow.jpg'),(2,'Deluxe','The DLX rooms are usually designed with large area, high floor, have a nice view and are equipped with high-class equipment and facilities to provide comfort and comfort for guests staying here.\n','Typeroom_Deluxe.jpg'),(3,'King','Room type is luxurious and most advanced. They often appear in luxury hotels and resorts. Owning modern equipment, the most advanced services \"god\", King room is extremely expensive.','Typeroom_King.jpg'),(4,'Premier','Is one of the high-class room types flexibly modified based on the conditions, standards and quality according to the standard evaluation of Deluxe rooms or suites.','Typeroom_Premier.jpg'),(5,'Suite','Suite rooms in the hotel are often designed, located on the top floor, are the room with the largest area, fully equipped with amenities, furniture, high-end items and special services.','Typeroom_Suite.jpg'),(6,'Superior','Superior Room (SUP) is a basic room type in a hotel or resort. With a view and quite comfortable space, SUP has an average price, suitable for many customers.','Typeroom_Superior.jpg');
/*!40000 ALTER TABLE `roomtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `ServiceId` int NOT NULL AUTO_INCREMENT,
  `SerivceTypeId` int DEFAULT NULL,
  `ServiceName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ServicePrice` float DEFAULT NULL,
  `ServiceDescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Serviceurl` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ServiceId`),
  KEY `FK_foodanddrink_fndtype` (`SerivceTypeId`),
  CONSTRAINT `fk_service_servicetype` FOREIGN KEY (`SerivceTypeId`) REFERENCES `servicetype` (`ServiceTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,1,'Costolette di agnello',100,'lorem i sum','our-menu-02.jpg'),(2,1,' Miele di pollo alla griglia',80,'lorem i sum','our-menu-04.jpg'),(3,2,'Macallan Fine & Rare Scotch Whisky',500,'lorem i sum','our-menu-05.jpg'),(4,1,'Strawberry Cheese Cake',40,'lorem i sum','our-menu-19.jpg'),(5,3,'Water Park',1000,'lorem i sum','experience5.jpg'),(6,3,'Spa',500,'lorem i sum','experience2.jpg'),(7,3,'Wine Castle',200,'lorem i sum','experience3.jpg'),(8,3,'Safari Zone',1000,'lorem i sum','experience4.jpg');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicetype`
--

DROP TABLE IF EXISTS `servicetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicetype` (
  `ServiceTypeId` int NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ServiceTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicetype`
--

LOCK TABLES `servicetype` WRITE;
/*!40000 ALTER TABLE `servicetype` DISABLE KEYS */;
INSERT INTO `servicetype` VALUES (1,'Food'),(2,'Drink'),(3,'Ticket');
/*!40000 ALTER TABLE `servicetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `TicketId` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Quantity` int DEFAULT NULL,
  `TicketName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TicketUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`TicketId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_convenientroom`
--

DROP TABLE IF EXISTS `v_convenientroom`;
/*!50001 DROP VIEW IF EXISTS `v_convenientroom`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_convenientroom` AS SELECT 
 1 AS `RoomId`,
 1 AS `ConvenientName`,
 1 AS `url`,
 1 AS `id`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `history`
--

/*!50001 DROP VIEW IF EXISTS `history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `history` AS select `c`.`url` AS `url`,`c`.`RoomTypeName` AS `RoomTypeName`,`d`.`LocationName` AS `LocationName`,`a`.`CheckInDate` AS `CheckInDate`,`a`.`CheckOutDate` AS `CheckOutDate`,`e`.`Subtotal` AS `Subtotal`,`e`.`Tax` AS `Tax`,`a`.`Deposits` AS `Deposits`,`e`.`Total` AS `Total`,`a`.`ReceiptId` AS `ReceiptId`,`a`.`AccountCustomerId` AS `AccountCustomerId` from ((((`qrcode` `a` join `room` `b` on((`a`.`RoomId` = `b`.`RoomId`))) join `roomtype` `c` on((`b`.`RoomTypeId` = `c`.`RoomTypeId`))) join `location` `d` on((`b`.`LocationId` = `d`.`LocationId`))) join `receipt` `e` on((`a`.`ReceiptId` = `e`.`ReceiptId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `roombooking`
--

/*!50001 DROP VIEW IF EXISTS `roombooking`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `roombooking` AS select `a`.`RoomTypeName` AS `RoomTypeName`,`b`.`BedOption` AS `BedOptions`,`b`.`Size` AS `RoomSize`,`b`.`View` AS `View`,`a`.`url` AS `url`,`b`.`RoomId` AS `RoomId`,`b`.`Price` AS `Price` from (`roomtype` `a` join `room` `b` on((`a`.`RoomTypeId` = `b`.`RoomTypeId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_convenientroom`
--

/*!50001 DROP VIEW IF EXISTS `v_convenientroom`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_convenientroom` AS select `a`.`RoomId` AS `RoomId`,`c`.`ConvenientName` AS `ConvenientName`,`c`.`url` AS `url`,`a`.`id` AS `id` from ((`roomconvenient` `a` join `room` `b` on((`a`.`RoomId` = `b`.`RoomId`))) join `convenient` `c` on((`a`.`ConvenientId` = `c`.`ConvenientId`))) */;
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

-- Dump completed on 2020-07-22 15:14:00
