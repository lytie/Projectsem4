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
  `Email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FullName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `Email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FullName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateOfBirth` datetime DEFAULT NULL,
  `RoleId` int DEFAULT NULL,
  PRIMARY KEY (`accountId`),
  KEY `FK_accountemployee_role` (`RoleId`),
  CONSTRAINT `FK_accountemployee_role` FOREIGN KEY (`RoleId`) REFERENCES `role` (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountemployee`
--

LOCK TABLES `accountemployee` WRITE;
/*!40000 ALTER TABLE `accountemployee` DISABLE KEYS */;
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
  `url` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ConvenientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convenient`
--

LOCK TABLES `convenient` WRITE;
/*!40000 ALTER TABLE `convenient` DISABLE KEYS */;
/*!40000 ALTER TABLE `convenient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entertainment`
--

DROP TABLE IF EXISTS `entertainment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entertainment` (
  `EntertainmentId` int NOT NULL AUTO_INCREMENT,
  `EntertainmentName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TicketPrice` float DEFAULT NULL,
  `EntertainmentDescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EntertainmentUrl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`EntertainmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entertainment`
--

LOCK TABLES `entertainment` WRITE;
/*!40000 ALTER TABLE `entertainment` DISABLE KEYS */;
/*!40000 ALTER TABLE `entertainment` ENABLE KEYS */;
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
  `QrCodeId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
-- Table structure for table `fndtype`
--

DROP TABLE IF EXISTS `fndtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fndtype` (
  `TypeId` int NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`TypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fndtype`
--

LOCK TABLES `fndtype` WRITE;
/*!40000 ALTER TABLE `fndtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `fndtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodanddrink`
--

DROP TABLE IF EXISTS `foodanddrink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foodanddrink` (
  `FoodAndDrinkId` int NOT NULL AUTO_INCREMENT,
  `TypeId` int DEFAULT NULL,
  `FoodAndDrinkName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FoodAndDrinkPrice` float DEFAULT NULL,
  `FoodAndDrinkDescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FoodAndDrinkurl` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`FoodAndDrinkId`),
  KEY `FK_foodanddrink_fndtype` (`TypeId`),
  CONSTRAINT `FK_foodanddrink_fndtype` FOREIGN KEY (`TypeId`) REFERENCES `fndtype` (`TypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodanddrink`
--

LOCK TABLES `foodanddrink` WRITE;
/*!40000 ALTER TABLE `foodanddrink` DISABLE KEYS */;
/*!40000 ALTER TABLE `foodanddrink` ENABLE KEYS */;
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
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `LocationId` int NOT NULL AUTO_INCREMENT,
  `LocationName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LocationUrl` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrcode`
--

DROP TABLE IF EXISTS `qrcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrcode` (
  `QrCodeId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CustomerName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EmailSendedTo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `CheckInDate` datetime DEFAULT NULL,
  `CheckOutDate` datetime DEFAULT NULL,
  `RoomId` int DEFAULT NULL,
  `AdultsNum` int DEFAULT NULL,
  `ChildrenNum` int DEFAULT NULL,
  `Deposits` float DEFAULT NULL,
  `ReceiptId` int DEFAULT NULL,
  `Url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
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
  `url` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `OrdererName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ReceiptComponentId`),
  KEY `FK_receiptcomponent_receipt` (`ReceiptId`),
  CONSTRAINT `FK_receiptcomponent_receipt` FOREIGN KEY (`ReceiptId`) REFERENCES `receipt` (`ReceiptId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receiptcomponent`
--

LOCK TABLES `receiptcomponent` WRITE;
/*!40000 ALTER TABLE `receiptcomponent` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
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
  `Description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AdultOpacity` int DEFAULT NULL,
  `ChildrenOpacity` int DEFAULT NULL,
  PRIMARY KEY (`RoomId`),
  KEY `FK_room_location` (`LocationId`),
  KEY `FK_room_roomtype` (`RoomTypeId`),
  CONSTRAINT `FK_room_location` FOREIGN KEY (`LocationId`) REFERENCES `location` (`LocationId`),
  CONSTRAINT `FK_room_roomtype` FOREIGN KEY (`RoomTypeId`) REFERENCES `roomtype` (`RoomTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
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
  KEY `FK_roomconvenient_convenient` (`ConvenientId`),
  KEY `FK_roomconvenient_room` (`RoomId`),
  CONSTRAINT `FK_roomconvenient_convenient` FOREIGN KEY (`ConvenientId`) REFERENCES `convenient` (`ConvenientId`),
  CONSTRAINT `FK_roomconvenient_room` FOREIGN KEY (`RoomId`) REFERENCES `room` (`RoomId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomconvenient`
--

LOCK TABLES `roomconvenient` WRITE;
/*!40000 ALTER TABLE `roomconvenient` DISABLE KEYS */;
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
  `Url` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`RoomImageId`),
  KEY `FK_roomimage_room` (`RoomId`),
  CONSTRAINT `FK_roomimage_room` FOREIGN KEY (`RoomId`) REFERENCES `room` (`RoomId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomimage`
--

LOCK TABLES `roomimage` WRITE;
/*!40000 ALTER TABLE `roomimage` DISABLE KEYS */;
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
  `BedOptions` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `RoomSize` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`RoomTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomtype`
--

LOCK TABLES `roomtype` WRITE;
/*!40000 ALTER TABLE `roomtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `roomtype` ENABLE KEYS */;
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
 1 AS `url`*/;
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
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `roombooking` AS select `a`.`RoomTypeName` AS `RoomTypeName`,`a`.`BedOptions` AS `BedOptions`,`a`.`RoomSize` AS `RoomSize`,`a`.`url` AS `url`,`b`.`RoomId` AS `RoomId`,`b`.`Price` AS `Price` from (`roomtype` `a` join `room` `b` on((`a`.`RoomTypeId` = `b`.`RoomTypeId`))) */;
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
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_convenientroom` AS select `a`.`RoomId` AS `RoomId`,`c`.`ConvenientName` AS `ConvenientName`,`c`.`url` AS `url` from ((`roomconvenient` `a` join `room` `b` on((`a`.`RoomId` = `b`.`RoomId`))) join `convenient` `c` on((`a`.`ConvenientId` = `c`.`ConvenientId`))) */;
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

-- Dump completed on 2020-07-13 15:34:24
