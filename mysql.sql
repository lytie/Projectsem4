CREATE DATABASE  IF NOT EXISTS `prj4db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `prj4db`;
-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: prj4db
-- ------------------------------------------------------
-- Server version	5.7.26

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
  `AccountCustomerId` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FullName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` bit(1) DEFAULT b'0',
  `CreateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`AccountCustomerId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountcustomer`
--

LOCK TABLES `accountcustomer` WRITE;
/*!40000 ALTER TABLE `accountcustomer` DISABLE KEYS */;
INSERT INTO `accountcustomer` VALUES (16,'Oliver@gmail.com','73l8gRjwLftklgfdXT+MdiMEjJwGPVMsyVxe16iYpk8=','Oliver ','0345674353','9L9nJqkQ8VgIKAzSFrvP8L0q',_binary '','2020-08-06 18:16:01'),(17,'Jake@gmail.com','73l8gRjwLftklgfdXT+MdiMEjJwGPVMsyVxe16iYpk8=','Jake','0354678954','2UxdgpeayOgMG7JFVAtwV3aN',_binary '','2020-08-06 18:16:33'),(18,'Noah@gmail.com','73l8gRjwLftklgfdXT+MdiMEjJwGPVMsyVxe16iYpk8=','Noah','034598216543','v37vhn36Xt6HxJbEF9twevYc',_binary '','2020-08-06 18:17:07'),(19,'James@gmail.com','73l8gRjwLftklgfdXT+MdiMEjJwGPVMsyVxe16iYpk8=','James','09344523453','cEtkdsnhPYqMyKHWrVgC8mjf',_binary '','2020-08-06 18:17:41'),(20,'Jack@io.vn','73l8gRjwLftklgfdXT+MdiMEjJwGPVMsyVxe16iYpk8=','Jack','0934563467','p1WWWblSoAqGb2IoWb1ySNUJ',_binary '','2020-08-06 18:18:18'),(21,'Connor@io.us','73l8gRjwLftklgfdXT+MdiMEjJwGPVMsyVxe16iYpk8=','Connor','0934546723','7i5Co0JYwbTE6gDtXtM8qOvR',_binary '','2020-08-06 18:18:46'),(22,'Liam@io.us','73l8gRjwLftklgfdXT+MdiMEjJwGPVMsyVxe16iYpk8=','Liam','0954236754','ySG44WONjbp84pS11fczIdeo',_binary '','2020-08-06 18:19:14'),(23,'John@io.us','73l8gRjwLftklgfdXT+MdiMEjJwGPVMsyVxe16iYpk8=','John','0923545634','P3uhNXdWx6o9mbBbLRIE7Bcz',_binary '','2020-08-06 18:19:46'),(24,'Harry@io.us','73l8gRjwLftklgfdXT+MdiMEjJwGPVMsyVxe16iYpk8=','Harry','0943543245','GQ6LbP2EE1d3IjCiejZHMtNu',_binary '','2020-08-06 18:20:15'),(25,'Callum@gmail.com','73l8gRjwLftklgfdXT+MdiMEjJwGPVMsyVxe16iYpk8=','Callum','0934567623','vS1en43mGY1g6CQeao841a0A',_binary '','2020-08-06 18:20:47'),(26,'Mason@io.us','73l8gRjwLftklgfdXT+MdiMEjJwGPVMsyVxe16iYpk8=','Mason','0943545634','20fVqwI6rqzeTuCamk5bJMxL',_binary '','2020-08-06 18:21:18'),(27,'yyyoyoooo1123@gmail.com','73l8gRjwLftklgfdXT+MdiMEjJwGPVMsyVxe16iYpk8=','YoYo','0345248935','noXmhfVifcl7l45rPSFBEFKV',_binary '','2020-08-06 18:21:54');
/*!40000 ALTER TABLE `accountcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accountemployee`
--

DROP TABLE IF EXISTS `accountemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountemployee` (
  `accountId` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FullName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateOfBirth` datetime DEFAULT NULL,
  `RoleId` int(11) DEFAULT NULL,
  `Status` bit(1) DEFAULT b'0',
  `Token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`accountId`),
  UNIQUE KEY `index3` (`Email`),
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
  `ConvenientId` int(11) NOT NULL AUTO_INCREMENT,
  `ConvenientName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `FeedBackId` int(11) NOT NULL AUTO_INCREMENT,
  `FeedBackMessage` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `QrCodeId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FeedBackTime` datetime DEFAULT NULL,
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
  `id_hero` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `text_Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `text_short` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
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
  `LocationId` int(11) NOT NULL AUTO_INCREMENT,
  `LocationName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `LocationUrl` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Introduce` varchar(2005) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`LocationId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Da Nang','Da_Nang.jpg','Da Nang is a coastal city with a 60-km long shoreline. With smooth and sandy beaches running across the coast, Da Nang beach is voted by Forbes (U.S.) to be 1 of 6 most beautiful beaches in the world. Emerge yourself in the sapphire water, play with the waves or just sunbathe on the fine beach and you will get to relax and unwind after a hard working day. What’s more, a selection of beach games are available on your demand: canoing, parasailing, jet-skiing, banana boats, scuba-diving, …Not only is the city famous for its beaches, Da Nang’s charm also lays in its geographical position: leaning against the majestic Truong Son mountains (or the Annamite Range), as well as having Son Tra Peninsula embracing the sea. ','03-05 Xuan Tam Street, Thuan Phuoc, Hai Chau, Đa Nang , Viet Nam'),(2,'Hoi An','Hoi_An.jpg','This reputation of Hoi An comes from many factors. However, the three most special things may be architecture, food and tailor. Hoi an’s architecture is a harmonious blend of Vietnamese, Chinese and Japanese design. It is a density of manypagodas, temples and ancient houses that bear its very unique mark, which makes it very special and unlike any other places in Vietnam. Some sites in Hoi antown which reflects the history of the period tourists shouldn’t miss are Japanese Covered Bridge, Phuc Kien Assembly Hall, Ong pagoda, Tan Ky old house, Phung Hung ancient house,….Hoi An Viet Nam is considered a living museum of architecture and urban lifestyle','Lac Long Quan Street, Cam An, Hoi An, Quang Nam, Vietnam'),(3,'Phu Quoc','Phu_Quoc.jpg','Phu Quoc Island is mainly composed of sedimentary rocks from the Mesozoic and Cenozoic age, including heterogeneous conglomerate composition, layering thick, quartz pebbles, silica, limestone, riolit and felsit. Pristine beaches here are seemingly captivating to those fond of unspoilted beauties. The one listed in the “World Hidden Beaches” is “Long Beach”, which is most beautiful from October to March. The beach honorably ranks higher in the list to many other world famous beaches, such as Wildcat Beach in California, the USA, Pink Beach in Barbuda, or Cayo Costa State, south Florida and so forth. The fresh sea breezes and stunning sandy beaches touching crystal clear blue waters make Phu Quoc beach a true paradise.','Cau so 12, Ap, Cay Sao, Phu Quoc,  Kien Giang, Vietnam'),(4,'Phan Thiet','Mui_Ne.jpg','Mui Ne is a tropical beach with wonderfully warm weather, which is ideal for swimming.With strong sea breezes, Mui Ne is most famous for kite and wind surfing. Days from November to March have clear skies with perfectly strong winds from 11 am until late evening. The rock-free water makes it relatively safe for the kite surfers. Obviously, lots of beautiful spots in Mui Ne attract domestic as well as international tourists, such as Ca Na Beach, which takes a 2-hour drive from Mui Ne and provides probably the best coral reefs and diving opportunity in Vietnam, Fairy Springs (Suoi Tien) – a stream where people can sightsee the local wildlife (birds, crabs, fish, frogs, many exotic flowers, etc.), Phan Thiet Water Tower, designed by Prince Suphanouvong of Laos – also the symbol of Binh Thuan province, Takou Mountain – 1-hour drive from Mui Ne Beach, which has not only beautiful tropical rainforest, but also an old pagoda on top of the mountain.The most must-see one is the Sand Dunes (Doi Cat), where the dunes turn from white to gold (red dunes can be found further south in Mui Ne Village).','24 Nguyen Dinh Chieu Street,Mui Ne, Binh Thuan, Viet Nam'),(5,'Da Lat','Da_Lat.jpg','Da Lat is the City of Flowers and honeymooners with lovely French villas, the fresh air, the beautiful waterfalls and gorges lakes sits in a lush and green valley of postcard beauty.Visit crazy, interesting and historical buildings. Take a ride on the historical train. Meditate in one of the pagoda’s or churches. Have a look on what is sold on the market. Enjoy the view from the cable car. Admire the handicraft of embroidering. Visit the beautiful lakes surrounding Dalat. Go and see one of the many waterfalls. Climb the mountains and enjoy the view over the valleys. Have a look on a flower farm, coffee plantation or silk factory. Or visit a minority village.','7 and 8, Ho Tuyen Lam Tourist Area, Ward 3, Da Lat City, Lam Dong , Vietnam');
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
  `CustomerName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `EmailSendedTo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `CheckInDate` datetime DEFAULT NULL,
  `CheckOutDate` datetime DEFAULT NULL,
  `RoomId` int(11) DEFAULT NULL,
  `AdultsNum` int(11) DEFAULT NULL,
  `ChildrenNum` int(11) DEFAULT NULL,
  `Deposits` float DEFAULT NULL,
  `ReceiptId` int(11) DEFAULT NULL,
  `Url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AccountCustomerId` int(11) DEFAULT NULL,
  `Status` bit(1) DEFAULT b'0',
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
INSERT INTO `qrcode` VALUES ('0BiNpy4uQbkT4IJrxV39bVpguBPIemaWzqPtFan5','Oliver ','Oliver@gmail.com','2020-07-06 19:13:40','2020-07-12 00:00:00','2020-07-14 00:00:00',3,1,1,9,83,'yBI4CIoRRs.png',16,_binary '\0'),('0VYZsBwKHWW1FlnuTTv1YyJmIyqhgjvsewjDOBOU','yoyo','yyyoyoooo1123@gmail.com','2020-08-01 19:12:44','2020-08-03 00:00:00','2020-08-05 00:00:00',2,1,1,5,81,'nji91ngY5f.png',NULL,_binary '\0'),('1sz8npKUBJrhJosrdXVzhmH7mxE9wr00rjGZtJ1S','Oliver ','Oliver@gmail.com','2020-06-06 19:12:38','2020-06-09 00:00:00','2020-06-10 00:00:00',22,1,1,4.9,79,'qUclQO2i25.png',16,_binary '\0'),('1u34KSoSNlfdqmMHf0HivCqs6uilWdCTdROmBjcV','Oliver ','Oliver@gmail.com','2020-08-06 19:09:15','2020-08-12 00:00:00','2020-08-14 00:00:00',3,1,1,9,60,'ME4BLVIiHP.png',27,_binary '\0'),('1xKwKRZ01HbpXkqxJk9T3clD8jLgoPy3KJ1ds3ZK','Oliver ','Oliver@gmail.com','2020-05-06 19:17:48','2020-05-09 00:00:00','2020-05-10 00:00:00',22,1,1,4.9,101,'eS7IGHYPSP.png',16,_binary '\0'),('2y2prqSz5acdwqBEk5y1fHJdy9rpVIHv4g9uZkwF','Connor','yyyoyoooo1123@gmail.com','2020-08-03 19:08:17','2020-08-07 00:00:00','2020-08-08 00:00:00',10,1,1,10,54,'fr6hFTlvU2.png',NULL,_binary '\0'),('4MkDmYRQCAiGaFQdN28KHa2crTuWaa8mBJj6sIZk','YoYo','yyyoyoooo1123@gmail.com','2020-05-06 19:17:31','2020-05-06 00:00:00','2020-05-07 00:00:00',4,1,1,5.5,98,'AxhNtlgcZP.png',27,_binary '\0'),('5jsEet8P0Nzl4WFii1RmKx2cKergFCjkffzFjf8X','Noah','Noah@gmail.com','2020-05-06 18:50:09','2020-05-14 00:00:00','2020-05-16 00:00:00',12,1,1,9.2,40,'XGLNNAsJwa.png',16,_binary '\0'),('6jZAodiDBrnesh384bwGpwqNCeYO9VYMA6YlE8QN','YoYo','yyyoyoooo1123@gmail.com','2020-08-06 19:17:42','2020-08-06 00:00:00','2020-08-07 00:00:00',4,1,1,5.5,100,'pqEzka9Q4g.png',27,_binary '\0'),('70HRgeT4YwoQKR0Z71fNLwxPT94iejfFPxyacinJ','tie ly','tiely3011@gmail.com','2020-08-06 18:46:52','2020-08-12 00:00:00','2020-08-14 00:00:00',2,1,1,10,39,'q5TZD4gJPY.png',NULL,_binary '\0'),('77VrO2KyLK5lh1sCwLUWCCjsdc3ULTIUta7jX1D0','Jake','Jake@gmail.com','2020-08-06 18:41:35','2020-08-09 00:00:00','2020-08-11 00:00:00',3,1,1,9,32,'GEAWBUkzeG.png',17,_binary '\0'),('7TRXtxnopK8dhTm4Yo9fyHT0wNopFkvECfUuUFy1','John','John@io.us','2020-08-06 19:12:33','2020-08-09 00:00:00','2020-08-10 00:00:00',21,1,1,5,78,'NAYvGpJe9w.png',23,_binary '\0'),('8Ce7ToP30xISQ7WpqQd22HVcLpI2CLBpnOtNixvu','Callum','Callum@gmail.com','2020-08-06 19:17:55','2020-08-12 00:00:00','2020-08-14 00:00:00',1,1,1,8,103,'2mri5UbUjs.png',27,_binary '\0'),('8Ko5hzlbvABIAuZOlGbZVrLfRv4vXPT5Syxz7BM4','Connor','Oliver@gmail.com','2020-06-06 19:19:59','2020-06-15 00:00:00','2020-06-16 00:00:00',13,1,1,10,110,'eZkVkDzN91.png',NULL,_binary '\0'),('9eX1rlP3xdmFX0dy78dgiEkOg2VBAgrKvGj8YCwS','John','John@io.us','2020-08-06 18:42:58','2020-08-10 00:00:00','2020-08-12 00:00:00',10,1,1,9,35,'9VJsWxQ0R6.png',23,_binary '\0'),('9WfT0ytRon4MRZSTyhhwXyyYp7y19hEnvn90vOjn','Oliver ','Oliver@gmail.com','2020-08-06 19:20:46','2020-08-12 00:00:00','2020-08-14 00:00:00',20,1,1,9,115,'R3tJ9Nnl9t.png',27,_binary '\0'),('ABe843Bb4LNm7cc3qoc7NW05qLqzpibfzU13BUhJ','Noah','Noah@gmail.com','2020-08-06 19:13:59','2020-08-15 00:00:00','2020-08-17 00:00:00',1,1,1,8,88,'Cz0fwo3kPI.png',27,_binary '\0'),('aeHaKZW329T8226BP1hjQBv50A51uidDPyZiL8JH','Jake','Jake@gmail.com','2020-08-06 19:09:06','2020-08-14 00:00:00','2020-08-16 00:00:00',12,1,1,9.2,57,'lxBDiMm9Ge.png',17,_binary '\0'),('au3xH8npQnMSOk8Stlw2Ji9RpRFhq7bIj7gAtqyO','Noah','Noah@gmail.com','2020-02-06 19:12:22','2020-02-14 00:00:00','2020-02-16 00:00:00',14,1,1,9.2,75,'Iai4Xoi3kp.png',16,_binary '\0'),('aZE8kKQd7OFexDKZe440sgb3GVsou2XN1ib2cJev','John','John@io.us','2020-07-06 19:09:03','2020-07-12 00:00:00','2020-07-14 00:00:00',1,1,1,8,56,'EoQeb1TLWX.png',23,_binary '\0'),('bT1gG3X09Lowa0eR305Jsk7jIl87cMzNNVFkZCXi','Connor','yyyoyoooo1123@gmail.com','2020-08-14 19:20:46','2020-08-17 00:00:00','2020-08-20 00:00:00',2,1,1,10,115,'DOI7GBSdnJ.png',NULL,_binary '\0'),('c7yESVRBXQbiJpU2tkNnpRq8tyzjOkFivawI6txq','Jack','Jack@io.vn','2020-08-13 19:10:57','2020-08-15 00:00:00','2020-08-17 00:00:00',3,1,1,9,69,'FrGJg44mHY.png',20,_binary '\0'),('cgP5lCDNwuFuxfrUfWS0AtRcmDeW0GrKtJSpLdJ4','Callum','Callum@gmail.com','2020-08-16 18:51:46','2020-08-20 00:00:00','2020-08-22 00:00:00',12,1,1,9.2,48,'gDfEt0llLV.png',27,_binary '\0'),('cqjh7kc8lQbcocfn20s2lT8egNH61SqvXP4n2siD','Harry','Harry@io.us','2020-07-06 19:16:00','2020-07-09 00:00:00','2020-07-10 00:00:00',22,1,1,4.9,97,'j9FhwgIoL1.png',24,_binary '\0'),('cuvBx0efpXEh52Toxd3cekMAPccydl0C7Dsx2Vlm','Oliver ','Oliver@gmail.com','2020-05-06 19:13:52','2020-05-14 00:00:00','2020-05-16 00:00:00',8,1,1,9.2,86,'d0nlbEU0Gt.png',16,_binary '\0'),('CvWUUi0HnwX6iDJseIR5geAPnNADUDN9reQYKNy4','Noah','Noah@gmail.com','2020-08-20 18:50:29','2020-08-22 00:00:00','2020-08-24 00:00:00',2,1,1,10,44,'7QgfyXhKoS.png',NULL,_binary '\0'),('dbMAG6gb9op9dMYVQ55EvEvw49LDWEmR0yFMxFVR','John','John@io.us','2020-08-06 18:42:26','2020-08-12 00:00:00','2020-08-14 00:00:00',21,1,1,9,34,'mO0DopUCYq.png',23,_binary '\0'),('DPupuMNHWmRpFFjDUKZdHjNIx5DusnDFzHTOAMgj','Jack','Jack@io.vn','2020-08-20 18:51:55','2020-08-22 00:00:00','2020-08-24 00:00:00',3,1,1,9,51,'HorITlBtfZ.png',20,_binary '\0'),('DR4396n0VyPgySTs6yOnhDMqJ4dwFTboejXEq7Tu','Harry','Harry@io.us','2020-08-06 19:11:07','2020-08-08 00:00:00','2020-08-09 00:00:00',4,1,1,5.5,72,'93aioWyyFw.png',24,_binary '\0'),('dRxKs7Ad9H2Iokdrts2gT1qcTDqIE1oQKOsjliaO','yoyo','yyyoyoooo1123@gmail.com','2020-08-25 19:13:35','2020-09-01 00:00:00','2020-09-03 00:00:00',2,1,1,10,82,'p5bWvWhb5j.png',NULL,_binary '\0'),('E9A6JoOkyuJXtrxeiPRVKJ75yhVwQppqRc4C8gKc','Jake','Jake@gmail.com','2020-08-06 18:51:49','2020-08-08 00:00:00','2020-08-11 00:00:00',12,1,1,13.8,49,'xA7CBZrZ4D.png',17,_binary '\0'),('e9sYeycv1Cw8gJPGXpvT5FX7eJ9oeYAEhAcZsfFy','Oliver ','Oliver@gmail.com','2020-08-26 18:28:41','2020-08-27 00:00:00','2020-08-29 00:00:00',10,1,1,5,23,'qb5VssGulI.png',NULL,_binary '\0'),('EbYE6RpFAH5oLNGwaqbwduY7Frf9AdLrUvcrDgJZ','Callum','Callum@gmail.com','2020-08-06 19:20:12','2020-08-12 00:00:00','2020-08-14 00:00:00',14,1,1,9,113,'iPh6y38RTf.png',27,_binary '\0'),('fdt9iL1d0BLb370eRNyv7Iu8T64tdYD9PnXd642P','YoYo','yyyoyoooo1123@gmail.com','2020-07-06 19:12:09','2020-07-10 00:00:00','2020-07-12 00:00:00',3,1,1,9,73,'UxzaXhmYFQ.png',27,_binary '\0'),('gcYpSi94gis89HvrD475LrHtkW4lEoZw5RqEhGz0','Liam','Liam@io.us','2020-08-06 18:34:10','2020-08-09 00:00:00','2020-08-10 00:00:00',22,1,1,4.9,25,'nzWn7LM7VS.png',22,_binary '\0'),('GjQpgD88ABiby33gPwfZ7DOQudsXBbv07aBcaEO8','Noah','Noah@gmail.com','2020-05-16 19:25:04','2020-05-18 00:00:00','2020-05-21 00:00:00',12,1,1,13.8,127,'80pu7AcSTE.png',16,_binary '\0'),('GrsusqYKbQgJhE3hlfbeGdzM4ynIMUaDekHBoiWx','Jack','Jack@io.vn','2020-08-06 19:21:22','2020-08-08 00:00:00','2020-08-11 00:00:00',8,1,1,13.8,117,'EhjP4DQmXD.png',20,_binary '\0'),('H8SMDWAlB2nwx5FWtLq8nhSgEEpn5FsCD0ZBskZi','John','John@io.us','2020-08-20 18:41:30','2020-08-25 00:00:00','2020-08-28 00:00:00',12,1,1,13.8,31,'dTPzTOV6N2.png',23,_binary '\0'),('hCGqWp0b2dv3eAlT9CktLulO9fZJH5HW7UJuqbdo','Harry','Harry@io.us','2020-08-06 19:09:12','2020-08-09 00:00:00','2020-08-12 00:00:00',21,1,1,9,59,'ZPJddvT4xa.png',24,_binary '\0'),('HnkeFF90nNTSGKl9apnwuPmdPN8cqzYxs5WmtDnI','Jake','Jake@gmail.com','2020-08-06 19:12:40','2020-08-10 00:00:00','2020-08-11 00:00:00',4,1,1,5.5,80,'zxBWUGYnv3.png',17,_binary '\0'),('hsCpeDh5wdu1njj6C4Ldg7dZUL83iLleyB1HL3Ga','Harry','Harry@io.us','2020-08-06 19:13:56','2020-08-11 00:00:00','2020-08-14 00:00:00',6,1,1,12.9,87,'HacQqRsZfA.png',24,_binary '\0'),('i2lUrdZ0iRuz4fkxJPFG12Nl6Ttmo1LtYgkMIBjW','Connor','yyyoyoooo1123@gmail.com','2020-07-06 19:14:46','2020-07-12 00:00:00','2020-07-14 00:00:00',2,1,1,10,90,'wLXZbYi9An.png',NULL,_binary '\0'),('iEqXPz26jlQooRqiMj3KX8hpmdvckE3VHtg2Bahe','Mason','Mason@io.us','2020-08-06 18:44:42','2020-08-08 00:00:00','2020-08-11 00:00:00',14,1,1,13.8,37,'6s1bG62rIV.png',26,_binary '\0'),('IjEglRpGnIlV4M84blqecHl80qkjqnGIfUor6p1o','Oliver ','Oliver@gmail.com','2020-08-06 18:38:22','2020-08-11 00:00:00','2020-08-14 00:00:00',7,1,1,12.9,28,'Ewmc3Z3IV9.png',27,_binary '\0'),('J07KONTupagKARNmCeTkbmuhLdyjND1ez6o63JGU','Connor','Noah@gmail.com','2020-07-08 18:43:54','2020-07-10 00:00:00','2020-07-12 00:00:00',15,1,1,13.8,36,'jZQMCKUuVl.png',16,_binary '\0'),('J47igNPVaoAVi8vYnDAllavUjAk0qqRCup0mO8dM','Liam','Liam@io.us','2020-08-27 18:41:23','2020-08-30 00:00:00','2020-09-01 00:00:00',12,1,1,9.2,30,'xIVDoqkWwq.png',22,_binary '\0'),('jgLcGPH2wTotsGMPMYgIh6vEBjkB1PVGBsprMpFV','Callum','Callum@gmail.com','2020-07-06 19:18:49','2020-07-07 00:00:00','2020-07-09 00:00:00',3,1,1,9,107,'sOGfZKuTBv.png',27,_binary '\0'),('jqvtokZAkyzxlAzKIvtrJlmK52dKEIo12TJN3NAj','Harry','Harry@io.us','2020-07-06 19:17:36','2020-07-06 00:00:00','2020-07-07 00:00:00',5,1,1,5,99,'GGt8XoEp73.png',NULL,_binary '\0'),('JVXevAB986wKoIMnZcHz7ahfRRTXSPxgTW224gPd','Jake','Jake@gmail.com','2020-07-10 19:09:20','2020-07-15 00:00:00','2020-07-17 00:00:00',15,1,1,10,61,'khQrADKdkv.png',NULL,_binary '\0'),('KOB5LGI2ItNbfTZEPRQAu61KdfxDY5GLT1PMKdy8','Mason','Mason@io.us','2020-06-06 19:12:29','2020-06-12 00:00:00','2020-06-14 00:00:00',20,1,1,8,77,'zqwqaqRC75.png',26,_binary '\0'),('kSv8igg9MDUloG3lpRNtI8qNZIzFr5g96pETX2g5','Liam','Liam@io.us','2020-08-16 18:40:46','2020-08-17 00:00:00','2020-08-20 00:00:00',6,1,1,12.9,29,'psx7rsVQBO.png',22,_binary '\0'),('Kve4oP03DCcmAuzfsarYI9DEsDRYUupuzViKuihz','Noah','Noah@gmail.com','2020-05-06 19:14:49','2020-05-12 00:00:00','2020-05-14 00:00:00',21,1,1,8,91,'pdRNWBfe24.png',16,_binary '\0'),('kXMPOQmZmsYht1jG6KRav4VxTsKaSRkkZiBpts9E','YoYo','yyyoyoooo1123@gmail.com','2020-07-06 19:10:37','2020-07-09 00:00:00','2020-07-10 00:00:00',2,1,1,5,64,'x1LTfskv1d.png',27,_binary '\0'),('LaBBjtJSjQclhMiHU4bQUG7ksOB7rta8WL8cgwu9','John','John@io.us','2020-08-16 18:52:02','2020-08-19 00:00:00','2020-08-20 00:00:00',22,1,1,4.9,53,'eZAqokrK9W.png',23,_binary '\0'),('LMpjfjGv6sPwJC1xQpdtIC23YAOnNdaKgyRdLFmh','Jake','Jake@gmail.com','2020-08-06 18:51:53','2020-08-10 00:00:00','2020-08-12 00:00:00',11,1,1,9,50,'4GWHbtTq5g.png',17,_binary '\0'),('M5z4g348VA64hbXfPYp47qrC9JrpBBUV9JKB2NKu','Callum','Callum@gmail.com','2020-08-06 19:19:02','2020-08-12 00:00:00','2020-08-14 00:00:00',15,1,1,9,109,'KSn3GStOxH.png',27,_binary '\0'),('macrHGc9oOYPyhC4sZQkKMBVFbdoP9jVxGms1met','Harry','Harry@io.us','2020-04-06 18:36:27','2020-04-12 00:00:00','2020-04-14 00:00:00',1,1,1,8,27,'2tMbU64tJr.png',24,_binary '\0'),('OF5RFzL0WUiI3ejHvnJJbDCRO2D6wo7QlAQWfr9q','John','John@io.us','2020-08-06 19:23:36','2020-08-15 00:00:00','2020-08-17 00:00:00',14,1,1,9.2,122,'nGccC4vSTD.png',23,_binary '\0'),('op7IXODrhJwAmxvi4C2nyVbVF2LcOFj36zPl0MC6','Oliver ','Oliver@gmail.com','2020-08-06 19:12:26','2020-08-07 00:00:00','2020-08-09 00:00:00',7,1,1,12.9,76,'kofYbOSMmz.png',16,_binary '\0'),('p5c3eJ0kBDDe8yKTb5rkCCeb7O3d5MpDYJLRIMfY','YoYo','yyyoyoooo1123@gmail.com','2020-07-16 19:15:51','2020-07-21 00:00:00','2020-07-24 00:00:00',1,1,1,8,95,'HIxDknK82a.png',27,_binary '\0'),('p5e7buV03y29POGbKamHF63JiwTBCQyaCedAeC7K','Jake','Jake@gmail.com','2020-08-19 18:50:25','2020-08-21 00:00:00','2020-08-24 00:00:00',6,1,1,12.9,43,'YXHYIPimFg.png',17,_binary '\0'),('pcMiOcJ5uNibnr5fZWEhCpQbnAD0PjGJIsmozBlg','Jack','Jack@io.vn','2020-07-06 19:23:04','2020-07-14 00:00:00','2020-07-16 00:00:00',12,1,1,9.2,120,'DnLAjG1OXy.png',20,_binary '\0'),('q7MBwReDVyZP9Vh0FjbY0q59BSJhzH97RxvalCGj','Mason','Mason@io.us','2020-08-06 19:12:18','2020-08-08 00:00:00','2020-08-11 00:00:00',14,1,1,13.8,74,'40vYQniNqs.png',26,_binary '\0'),('QHqaN1guAw53zKt540EsliRR3HmFkhQuo3rsB7Vs','Connor','Oliver@gmail.com','2020-07-15 18:50:33','2020-07-20 00:00:00','2020-07-20 00:00:00',5,1,1,5,45,'1qcfhOJTR9.png',16,_binary '\0'),('QW1OAnvARc3odIytkWAMHVaulrXp6CPpb42l69Vp','Harry','Harry@io.us','2020-06-06 19:18:55','2020-06-12 00:00:00','2020-06-14 00:00:00',21,1,1,10,108,'aBk8QgcYWO.png',NULL,_binary '\0'),('rB2v6ILkjsTEhUa4SQE8MNNUcWcTRoczkpzLyOOL','Liam','Liam@io.us','2020-08-16 19:21:26','2020-08-18 00:00:00','2020-08-20 00:00:00',9,1,1,9.2,118,'JZfTR1k7en.png',22,_binary '\0'),('RFuqDUNSQte6Zy7UlTcQzJHqJYjE8uBDclpp2ncE','YoYo','yyyoyoooo1123@gmail.com','2020-08-06 19:25:08','2020-08-14 00:00:00','2020-08-16 00:00:00',8,1,1,9.2,128,'QisBLW2Obu.png',27,_binary '\0'),('RHPPFMfoOTcZYcx1Si44EZEEj9EDFOdHP8mMKEBu','Noah','Noah@gmail.com','2020-07-06 19:23:23','2020-07-11 00:00:00','2020-07-14 00:00:00',7,1,1,12.9,121,'idnA7xIDir.png',16,_binary '\0'),('RrEewz6S1zw6m8kehz85opKOhVFAi0UrBZfQUp2L','Jake','Jake@gmail.com','2020-08-06 19:24:53','2020-08-08 00:00:00','2020-08-11 00:00:00',9,1,1,13.8,125,'Adg2PKNG9U.png',17,_binary '\0'),('saL50RiQyb9ZCvIphu1NbXG2xBffzNvnrjSXEl3V','Callum','Callum@gmail.com','2020-08-25 19:18:11','2020-08-27 00:00:00','2020-08-30 00:00:00',6,1,1,12.9,104,'6a6m95qW0M.png',27,_binary '\0'),('sGDRBih5GCI1ANMae2xyb6zRdmbK7shEhIlh92jH','Mason','Mason@io.us','2020-08-06 18:50:17','2020-08-09 00:00:00','2020-08-11 00:00:00',20,1,1,9,41,'Rj41p0CUi3.png',26,_binary '\0'),('SH8qpJpvWPgWJ50t1PSFZiJvznhVHVvGq8ohPd70','Oliver ','Oliver@gmail.com','2020-06-06 19:17:52','2020-06-09 00:00:00','2020-06-10 00:00:00',10,1,1,5,102,'79bAHTMkOK.png',16,_binary '\0'),('SH9qBDXnqmCZjW5LIIV02TD2oWjVIBICzMuowdD0','Noah','Noah@gmail.com','2020-06-06 19:11:04','2020-06-06 00:00:00','2020-06-07 00:00:00',20,1,1,5,71,'Sm4teENSfr.png',NULL,_binary '\0'),('SND734hBHXFKILVNIZfDAWDER7kKP6iMbIWpXDi1','Connor','yyyoyoooo1123@gmail.com','2020-06-10 19:15:53','2020-06-12 00:00:00','2020-06-14 00:00:00',5,1,1,5,96,'ZmgmeSpN4u.png',27,_binary '\0'),('SNTGuetFsepJs1nsWzj4kcruz3Wrme3xECSkwg4T','Harry','Harry@io.us','2020-08-05 19:10:38','2020-08-18 00:00:00','2020-08-20 00:00:00',1,1,1,8,65,'PKY8PXFhd8.png',24,_binary '\0'),('sNzWv69HrT2kGELQ9JZ4Ykn4Ja5FXrzGpk9H8YIp','John','John@io.us','2020-08-06 19:18:15','2020-08-13 00:00:00','2020-08-14 00:00:00',11,1,1,9,105,'K17w97KX1A.png',23,_binary '\0'),('SwCI2zy0Vw0jvhLLVyD633Oq1Q7zOur89Ul9s2CN','Jack','Jack@io.vn','2020-08-06 18:32:56','2020-08-12 00:00:00','2020-08-13 00:00:00',4,1,1,5.5,24,'Y09jTvEhWJ.png',20,_binary '\0'),('TaAJbAOzOQo7HGptB4PndpMnvademt5YE2kOacyv','Oliver ','Oliver@gmail.com','2020-06-14 19:20:11','2020-06-16 00:00:00','2020-06-18 00:00:00',2,1,1,10,112,'BtqqTjsTIh.png',NULL,_binary '\0'),('tpYXf86uCqH9CAJrGlxucqfUxShpG6Hdg3ii1MhB','Jake','Jake@gmail.com','2020-08-06 19:25:00','2020-08-14 00:00:00','2020-08-16 00:00:00',16,1,1,9.2,126,'O8YMZCoVSx.png',17,_binary '\0'),('u0qz0riepMeCFepGnY0bKqyLyDhY7VmAKhQGp5IP','Liam','Liam@io.us','2020-08-11 19:10:44','2020-08-15 00:00:00','2020-08-17 00:00:00',21,1,1,12.9,66,'LPOWAJg9F9.png',22,_binary '\0'),('UbM3NghBkshbjcEQgZfjT7yRMvQChat2hilXJG1L','Noah','Noah@gmail.com','2020-07-10 19:21:19','2020-07-14 00:00:00','2020-07-16 00:00:00',3,1,1,9,116,'mkbtsMGEw3.png',16,_binary '\0'),('ukzneXfM7DLoQIl4l8CkMxhN440mFYVgeeIqqXmB','Harry','Harry@io.us','2020-07-06 19:10:53','2020-07-08 00:00:00','2020-07-11 00:00:00',9,1,1,13.8,68,'I6A03R2GUG.png',24,_binary '\0'),('ulXPuQLWX3f48Cs8Bzx737uSezX1Hnp9JfleQ1ue','YoYo','yyyoyoooo1123@gmail.com','2020-07-16 19:15:31','2020-07-18 00:00:00','2020-07-20 00:00:00',3,1,1,9,92,'yTwANZ9v83.png',27,_binary '\0'),('uYGhwYpJKGxsWAmmgnHmUMOwvtH9zFfSXdnUKR1o','Jack','Jack@io.vn','2020-06-20 18:51:58','2020-06-22 00:00:00','2020-06-24 00:00:00',2,1,1,10,52,'omiScMLFOe.png',NULL,_binary '\0'),('vdBcCwbsAZam7oQTUSi0G7Mm4APh74DO2RGJca8O','Jake','Jake@gmail.com','2020-07-06 19:10:47','2020-07-14 00:00:00','2020-07-16 00:00:00',9,1,1,9.2,67,'WbNweVN2e2.png',17,_binary '\0'),('VEiaTWAVuivtfWDmKWclqDBQqn4gGuP13Yjvj1uW','Jack','Jack@io.vn','2020-06-24 18:46:35','2020-06-28 00:00:00','2020-06-30 00:00:00',5,1,1,10,38,'ejkgGuOZBY.png',NULL,_binary '\0'),('VfxiO6UIYZFuA17vjc1rWZ9MSt0GFiohzniqRZKA','Noah','Noah@gmail.com','2020-07-06 19:13:49','2020-07-08 00:00:00','2020-07-11 00:00:00',12,1,1,13.8,85,'VJVmdEQEI3.png',16,_binary '\0'),('VlRKmhPtlbkGb4rmvk5VZBDRSV8PMzTNNuQTNVMc','Mason','Mason@io.us','2020-05-06 19:09:32','2020-05-07 00:00:00','2020-05-08 00:00:00',13,1,1,5,63,'XMxajsRzeB.png',NULL,_binary '\0'),('VVelTVhzIayE5UyCIjtsmfSIQ1UVlvYZc6Jbh3qh','Harry','Harry@io.us','2020-08-06 19:23:42','2020-08-08 00:00:00','2020-08-11 00:00:00',8,1,1,13.8,123,'lt7KifZuV7.png',24,_binary '\0'),('vVRsp4dYOyvZjVqA6fsA9GXLzz2MCpurVwH23alz','YoYo','yyyoyoooo1123@gmail.com','2020-06-06 19:09:08','2020-06-08 00:00:00','2020-06-11 00:00:00',12,1,1,13.8,58,'swDvHcHbkd.png',27,_binary '\0'),('vzXsH3iInpIl6njRkZEFySql12MbVpsTPH0oQdwS','John','John@io.us','2020-05-06 18:35:09','2020-05-09 00:00:00','2020-05-10 00:00:00',15,1,1,5,26,'1YdTSLsl8V.png',23,_binary '\0'),('vZz9B5chdPhdiJfBSOdYF8JGd5N7krYniMhB4Rtd','Oliver ','Oliver@gmail.com','2020-08-06 19:18:47','2020-08-09 00:00:00','2020-08-11 00:00:00',15,1,1,9,106,'IGraZiHoBt.png',16,_binary '\0'),('wwG6QIwqhzv1QI9gkayyr2Ad63cHpKhuU6lOwkoT','Jake','Jake@gmail.com','2020-08-27 19:08:55','2020-08-31 00:00:00','2020-09-02 00:00:00',6,1,1,12.9,55,'vs7WGu8kwI.png',17,_binary '\0'),('XINOUtbq8ievrhiNpyrGRa4ES4J4b6yCDN9nMlnJ','Callum','Callum@gmail.com','2020-07-06 18:51:37','2020-07-11 00:00:00','2020-07-14 00:00:00',6,1,1,12.9,46,'oDfY2er5Bq.png',27,_binary '\0'),('xr4TXHiBCdqOifj86jPDFP5wrZDPgS7ta7d2e1nF','Mason','Mason@io.us','2020-07-06 18:41:38','2020-07-12 00:00:00','2020-07-14 00:00:00',11,1,1,9,33,'zEa8PrW1fs.png',26,_binary '\0'),('xTZ2njn2Q2CvemVyaSWgjR4cgT1oMXc53iP0QdK6','Jack','Jack@io.vn','2020-05-06 19:11:00','2020-05-12 00:00:00','2020-05-14 00:00:00',2,1,1,10,70,'sHTpmnIdrI.png',NULL,_binary '\0'),('Y4Mrjvu2nRTcUhbDU1i0fIKwgJCkJf8MMkufCTr7','Harry','Harry@io.us','2020-06-06 19:14:43','2020-06-12 00:00:00','2020-06-14 00:00:00',3,1,1,9,89,'6btqtxgGyV.png',24,_binary '\0'),('Y8Ed8L6JtSeF90ZdQbAqt40gDXTwJU04BxRXhNee','Liam','Liam@io.us','2020-08-04 19:24:22','2020-08-10 00:00:00','2020-08-13 00:00:00',1,1,1,8,124,'9shkEo1ouK.png',22,_binary '\0'),('yKOGQkQ0hdE5HAiNuhJ1AEpgAnyRvH8AkJoEzw70','Oliver ','Oliver@gmail.com','2020-05-05 19:09:29','2020-05-05 00:00:00','2020-05-05 00:00:00',2,1,1,5,62,'d95oc3KNvc.png',NULL,_binary '\0'),('YloXaos2ok0SESENpBchZ1ox36S4qXTQBCuLDtOo','Jake','Jake@gmail.com','2020-06-06 19:21:49','2020-06-10 00:00:00','2020-06-12 00:00:00',12,1,1,13.8,119,'3kHlo9CIkv.png',17,_binary '\0'),('yNBNIza8mo3JsKULkXADOFVQg1oicwgUTZ6SeSGJ','Jack','Jack@io.vn','2020-08-14 19:20:06','2020-08-18 00:00:00','2020-08-20 00:00:00',11,1,1,9,111,'RbMjZKpmrn.png',20,_binary '\0'),('YT9fukDVhMJMfCJokrYLlGD8uRUq4ky6MSpE0EWK','Harry','Harry@io.us','2020-06-06 18:50:22','2020-06-08 00:00:00','2020-06-10 00:00:00',3,1,1,9,42,'askfiYY6Tl.png',24,_binary '\0'),('ZF4HOhj0XVFNRpWLPZoJpsJ6PTCgxWUzb8Bhaggr','Callum','Callum@gmail.com','2020-06-16 19:15:37','2020-06-18 00:00:00','2020-06-20 00:00:00',3,1,1,9,93,'0tGFvmlWoc.png',27,_binary '\0'),('ZFdX7XibspTWqx9qYOMpuHRgewJpAZ3O8kI5PJKg','Liam','Liam@io.us','2020-05-06 19:13:43','2020-05-10 00:00:00','2020-05-12 00:00:00',3,1,1,9,84,'cVJ28sP1IV.png',22,_binary '\0'),('ZfJCr6VlhUkGlgpYf42J451zcXWeyjgtYaB1Fv1T','Mason','Mason@io.us','2020-08-03 18:51:42','2020-08-04 00:00:00','2020-08-06 00:00:00',1,1,1,8,47,'sNApzHVSoS.png',26,_binary '\0'),('ZwvW4l0F09EyawiqrthvxXYrx0xx8t2fv1h4AKf4','YoYo','yyyoyoooo1123@gmail.com','2020-07-06 19:15:45','2020-07-08 00:00:00','2020-08-10 00:00:00',6,1,1,12.9,94,'D4Oq6njfEM.png',27,_binary '\0');
/*!40000 ALTER TABLE `qrcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt` (
  `ReceiptId` int(11) NOT NULL AUTO_INCREMENT,
  `PayDate` datetime DEFAULT NULL,
  `Subtotal` float DEFAULT NULL,
  `Tax` float DEFAULT NULL,
  `Total` float DEFAULT NULL,
  `PayStatus` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ReceiptId`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
INSERT INTO `receipt` VALUES (23,NULL,50,5,50,_binary '\0'),(24,NULL,55,5.5,55,_binary '\0'),(25,NULL,49,4.9,49,_binary '\0'),(26,NULL,5730,573,6298,_binary '\0'),(27,NULL,13840,1384,15216,_binary '\0'),(28,NULL,129,12.9,129,_binary '\0'),(29,NULL,129,12.9,129,_binary '\0'),(30,NULL,92,9.2,92,_binary '\0'),(31,NULL,138,13.8,138,_binary '\0'),(32,NULL,90,9,90,_binary '\0'),(33,NULL,2490,249,2730,_binary '\0'),(34,NULL,90,9,90,_binary '\0'),(35,NULL,90,9,90,_binary '\0'),(36,NULL,1318,131.8,1436,_binary '\0'),(37,NULL,138,13.8,138,_binary '\0'),(38,NULL,420,42,452,_binary '\0'),(39,NULL,100,10,100,_binary '\0'),(40,NULL,3212,321.2,3524,_binary '\0'),(41,NULL,90,9,90,_binary '\0'),(42,NULL,90,9,90,_binary '\0'),(43,NULL,129,12.9,129,_binary '\0'),(44,NULL,100,10,100,_binary '\0'),(45,NULL,3950,395,4340,_binary '\0'),(46,NULL,6129,612.9,6729,_binary '\0'),(47,NULL,80,8,80,_binary '\0'),(48,NULL,92,9.2,92,_binary '\0'),(49,NULL,138,13.8,138,_binary '\0'),(50,NULL,90,9,90,_binary '\0'),(51,NULL,90,9,90,_binary '\0'),(52,NULL,4100,410,4500,_binary '\0'),(53,NULL,49,4.9,49,_binary '\0'),(54,NULL,100,10,100,_binary '\0'),(55,NULL,129,12.9,129,_binary '\0'),(56,NULL,5080,508,5580,_binary '\0'),(57,NULL,92,9.2,92,_binary '\0'),(58,NULL,6538,653.8,7178,_binary '\0'),(59,NULL,90,9,90,_binary '\0'),(60,NULL,90,9,90,_binary '\0'),(61,NULL,100,10,100,_binary '\0'),(62,NULL,1990,199,2184,_binary '\0'),(63,NULL,5690,569,6254,_binary '\0'),(64,NULL,950,95,1040,_binary '\0'),(65,NULL,80,8,80,_binary '\0'),(66,NULL,129,12.9,129,_binary '\0'),(67,NULL,4652,465.2,5108,_binary '\0'),(68,NULL,1298,129.8,1414,_binary '\0'),(69,NULL,90,9,90,_binary '\0'),(70,NULL,4500,450,4940,_binary '\0'),(71,NULL,4050,405,4450,_binary '\0'),(72,NULL,55,5.5,55,_binary '\0'),(73,NULL,4090,409,4490,_binary '\0'),(74,NULL,138,13.8,138,_binary '\0'),(75,NULL,5712,571.2,6274,_binary '\0'),(76,NULL,129,12.9,129,_binary '\0'),(77,NULL,5080,508,5580,_binary '\0'),(78,NULL,50,5,50,_binary '\0'),(79,NULL,4049,404.9,4449,_binary '\0'),(80,NULL,55,5.5,55,_binary '\0'),(81,NULL,50,5,50,_binary '\0'),(82,NULL,100,10,100,_binary '\0'),(83,NULL,4090,409,4490,_binary '\0'),(84,NULL,450,45,486,_binary '\0'),(85,NULL,458,45.8,490,_binary '\0'),(86,NULL,92,9.2,92,_binary '\0'),(87,NULL,129,12.9,129,_binary '\0'),(88,NULL,80,8,80,_binary '\0'),(89,NULL,410,41,442,_binary '\0'),(90,NULL,5100,510,5600,_binary '\0'),(91,NULL,7080,708,7780,_binary '\0'),(92,NULL,90,9,90,_binary '\0'),(93,NULL,4490,449,4930,_binary '\0'),(94,NULL,4529,452.9,4969,_binary '\0'),(95,NULL,1280,128,1400,_binary '\0'),(96,NULL,10250,1025,11270,_binary '\0'),(97,NULL,529,52.9,577,_binary '\0'),(98,NULL,5255,525.5,5775,_binary '\0'),(99,NULL,6050,605,6650,_binary '\0'),(100,NULL,55,5.5,55,_binary '\0'),(101,NULL,4849,484.9,5329,_binary '\0'),(102,NULL,2230,223,2448,_binary '\0'),(103,NULL,22480,2248,24720,_binary '\0'),(104,NULL,129,12.9,129,_binary '\0'),(105,NULL,90,9,90,_binary '\0'),(106,NULL,90,9,90,_binary '\0'),(107,NULL,4090,409,4490,_binary '\0'),(108,NULL,100,10,100,_binary '\0'),(109,NULL,90,9,90,_binary '\0'),(110,NULL,5100,510,5600,_binary '\0'),(111,NULL,90,9,90,_binary '\0'),(112,NULL,620,62,672,_binary '\0'),(113,NULL,90,9,90,_binary '\0'),(114,NULL,100,10,100,_binary '\0'),(115,NULL,90,9,90,_binary '\0'),(116,NULL,6990,699,7680,_binary '\0'),(117,NULL,138,13.8,138,_binary '\0'),(118,NULL,92,9.2,92,_binary '\0'),(119,NULL,138,13.8,138,_binary '\0'),(120,NULL,5092,509.2,5592,_binary '\0'),(121,NULL,5129,512.9,5629,_binary '\0'),(122,NULL,92,9.2,92,_binary '\0'),(123,NULL,138,13.8,138,_binary '\0'),(124,NULL,80,8,80,_binary '\0'),(125,NULL,138,13.8,138,_binary '\0'),(126,NULL,92,9.2,92,_binary '\0'),(127,NULL,2698,269.8,2954,_binary '\0'),(128,NULL,92,9.2,92,_binary '\0');
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receiptcomponent`
--

DROP TABLE IF EXISTS `receiptcomponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receiptcomponent` (
  `ReceiptComponentId` int(11) NOT NULL AUTO_INCREMENT,
  `ReceiptId` int(11) DEFAULT NULL,
  `ComponentName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Subtotal` float DEFAULT NULL,
  `url` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `OrdererName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Status` bit(1) DEFAULT b'0',
  `ServiceTypeId` int(11) DEFAULT NULL,
  `PayDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ReceiptComponentId`),
  KEY `FK_receiptcomponent_receipt` (`ReceiptId`),
  KEY `FK_receiptcomponent_servicetype_idx` (`ServiceTypeId`),
  CONSTRAINT `FK_receiptcomponent_receipt` FOREIGN KEY (`ReceiptId`) REFERENCES `receipt` (`ReceiptId`),
  CONSTRAINT `FK_receiptcomponent_servicetype` FOREIGN KEY (`ServiceTypeId`) REFERENCES `servicetype` (`ServiceTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receiptcomponent`
--

LOCK TABLES `receiptcomponent` WRITE;
/*!40000 ALTER TABLE `receiptcomponent` DISABLE KEYS */;
INSERT INTO `receiptcomponent` VALUES (38,23,'Room -Bungalow-Da Nang 2(Thu Aug 06 18:28:41 ICT 2020)',50,1,50,'Typeroom_Bungalow.jpg','2020-08-06 18:28:41','yoyo',_binary '\0',4,NULL),(39,24,'Room -Bungalow-Da Nang 4(Thu Aug 06 18:32:55 ICT 2020)',55,1,55,'Typeroom_Bungalow.jpg','2020-08-06 18:32:56','YoYo',_binary '\0',4,NULL),(40,25,'Room -Superior-Hoi An 22(Thu Aug 06 18:34:09 ICT 2020)',49,1,49,'Typeroom_Superior.jpg','2020-08-06 18:34:10','YoYo',_binary '\0',4,NULL),(41,26,'Room -Bungalow-Da Nang 2(Thu Aug 06 18:35:08 ICT 2020)',50,1,50,'Typeroom_Bungalow.jpg','2020-08-06 18:35:09','YoYo',_binary '',4,'2020-08-07 11:18:59'),(42,27,'Room -Bungalow-Phu Quoc 1(Thu Aug 06 18:36:27 ICT 2020)',80,1,80,'Typeroom_Bungalow.jpg','2020-08-06 18:36:27','YoYo',_binary '',4,'2020-08-07 11:07:34'),(43,28,'Room -Deluxe-Phan Thiet 6(Thu Aug 06 18:38:22 ICT 2020)',129,1,129,'Typeroom_Deluxe.jpg','2020-08-06 18:38:22','YoYo',_binary '\0',4,NULL),(44,29,'Room -Deluxe-Phan Thiet 6(Thu Aug 06 18:40:45 ICT 2020)',129,1,129,'Typeroom_Deluxe.jpg','2020-08-06 18:40:46','YoYo',_binary '\0',4,NULL),(45,30,'Room -Deluxe-Da Lat 12(Thu Aug 06 18:41:22 ICT 2020)',92,1,92,'Typeroom_Deluxe.jpg','2020-08-06 18:41:23','YoYo',_binary '\0',4,NULL),(46,31,'Room -Deluxe-Da Lat 12(Thu Aug 06 18:41:29 ICT 2020)',138,1,138,'Typeroom_Deluxe.jpg','2020-08-06 18:41:30','YoYo',_binary '\0',4,NULL),(47,32,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 18:41:34 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 18:41:35','YoYo',_binary '\0',4,NULL),(48,33,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 18:41:38 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 18:41:38','YoYo',_binary '',4,'2020-08-07 12:11:27'),(49,34,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 18:42:26 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 18:42:26','YoYo',_binary '\0',4,NULL),(50,35,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 18:42:57 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 18:42:58','YoYo',_binary '\0',4,NULL),(51,36,'Room -Deluxe-Da Lat 12(Thu Aug 06 18:43:53 ICT 2020)',138,1,138,'Typeroom_Deluxe.jpg','2020-08-06 18:43:54','YoYo',_binary '',4,'2020-08-07 12:03:55'),(52,37,'Room -Deluxe-Da Lat 12(Thu Aug 06 18:44:42 ICT 2020)',138,1,138,'Typeroom_Deluxe.jpg','2020-08-06 18:44:42','YoYo',_binary '\0',4,NULL),(53,38,'Room -Bungalow-Da Nang 2(Thu Aug 06 18:46:35 ICT 2020)',100,1,100,'Typeroom_Bungalow.jpg','2020-08-06 18:46:35','yoyo',_binary '',4,'2020-08-07 11:49:25'),(54,39,'Room -Bungalow-Da Nang 2(Thu Aug 06 18:46:52 ICT 2020)',100,1,100,'Typeroom_Bungalow.jpg','2020-08-06 18:46:52','tie ly',_binary '\0',4,NULL),(55,40,'Room -Deluxe-Da Lat 12(Thu Aug 06 18:50:08 ICT 2020)',92,1,92,'Typeroom_Deluxe.jpg','2020-08-06 18:50:09','YoYo',_binary '',4,'2020-08-07 11:25:44'),(56,41,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 18:50:17 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 18:50:17','YoYo',_binary '\0',4,NULL),(57,42,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 18:50:22 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 18:50:22','YoYo',_binary '\0',4,NULL),(58,43,'Room -Deluxe-Phan Thiet 6(Thu Aug 06 18:50:25 ICT 2020)',129,1,129,'Typeroom_Deluxe.jpg','2020-08-06 18:50:25','YoYo',_binary '\0',4,NULL),(59,44,'Room -Bungalow-Da Nang 2(Thu Aug 06 18:50:28 ICT 2020)',100,1,100,'Typeroom_Bungalow.jpg','2020-08-06 18:50:29','yoyo',_binary '\0',4,NULL),(60,45,'Room -Bungalow-Da Nang 2(Thu Aug 06 18:50:32 ICT 2020)',50,1,50,'Typeroom_Bungalow.jpg','2020-08-06 18:50:33','YoYo',_binary '',4,'2020-08-07 12:22:43'),(61,46,'Room -Deluxe-Phan Thiet 6(Thu Aug 06 18:51:37 ICT 2020)',129,1,129,'Typeroom_Deluxe.jpg','2020-08-06 18:51:37','YoYo',_binary '',4,'2020-08-07 12:06:14'),(62,47,'Room -Bungalow-Phu Quoc 1(Thu Aug 06 18:51:42 ICT 2020)',80,1,80,'Typeroom_Bungalow.jpg','2020-08-06 18:51:42','YoYo',_binary '\0',4,NULL),(63,48,'Room -Deluxe-Da Lat 12(Thu Aug 06 18:51:45 ICT 2020)',92,1,92,'Typeroom_Deluxe.jpg','2020-08-06 18:51:46','YoYo',_binary '\0',4,NULL),(64,49,'Room -Deluxe-Da Lat 12(Thu Aug 06 18:51:49 ICT 2020)',138,1,138,'Typeroom_Deluxe.jpg','2020-08-06 18:51:49','YoYo',_binary '\0',4,NULL),(65,50,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 18:51:53 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 18:51:53','YoYo',_binary '\0',4,NULL),(66,51,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 18:51:55 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 18:51:55','YoYo',_binary '\0',4,NULL),(67,52,'Room -Bungalow-Da Nang 2(Thu Aug 06 18:51:58 ICT 2020)',100,1,100,'Typeroom_Bungalow.jpg','2020-08-06 18:51:58','yoyo',_binary '',4,'2020-08-07 11:48:09'),(68,53,'Room -Superior-Hoi An 22(Thu Aug 06 18:52:02 ICT 2020)',49,1,49,'Typeroom_Superior.jpg','2020-08-06 18:52:02','YoYo',_binary '\0',4,NULL),(69,54,'Room -Bungalow-Da Nang 2(Thu Aug 06 19:08:17 ICT 2020)',100,1,100,'Typeroom_Bungalow.jpg','2020-08-06 19:08:17','yoyo',_binary '\0',4,NULL),(70,55,'Room -Deluxe-Phan Thiet 6(Thu Aug 06 19:08:55 ICT 2020)',129,1,129,'Typeroom_Deluxe.jpg','2020-08-06 19:08:55','YoYo',_binary '\0',4,NULL),(71,56,'Room -Bungalow-Phu Quoc 1(Thu Aug 06 19:09:02 ICT 2020)',80,1,80,'Typeroom_Bungalow.jpg','2020-08-06 19:09:03','YoYo',_binary '',4,'2020-08-07 12:09:05'),(72,57,'Room -Deluxe-Da Lat 12(Thu Aug 06 19:09:05 ICT 2020)',92,1,92,'Typeroom_Deluxe.jpg','2020-08-06 19:09:06','YoYo',_binary '\0',4,NULL),(73,58,'Room -Deluxe-Da Lat 12(Thu Aug 06 19:09:07 ICT 2020)',138,1,138,'Typeroom_Deluxe.jpg','2020-08-06 19:09:08','YoYo',_binary '',4,'2020-08-07 11:32:14'),(74,59,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 19:09:11 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 19:09:12','YoYo',_binary '\0',4,NULL),(75,60,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 19:09:14 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 19:09:15','YoYo',_binary '\0',4,NULL),(76,61,'Room -Bungalow-Da Nang 2(Thu Aug 06 19:09:19 ICT 2020)',100,1,100,'Typeroom_Bungalow.jpg','2020-08-06 19:09:20','yoyo',_binary '\0',4,NULL),(77,62,'Room -Bungalow-Da Nang 2(Thu Aug 06 19:09:29 ICT 2020)',50,1,50,'Typeroom_Bungalow.jpg','2020-08-06 19:09:29','yoyo',_binary '',4,'2020-08-07 11:12:30'),(78,63,'Room -Bungalow-Da Nang 2(Thu Aug 06 19:09:32 ICT 2020)',50,1,50,'Typeroom_Bungalow.jpg','2020-08-06 19:09:32','yoyo',_binary '',4,'2020-08-07 11:15:26'),(79,64,'Room -Bungalow-Da Nang 2(Thu Aug 06 19:10:36 ICT 2020)',50,1,50,'Typeroom_Bungalow.jpg','2020-08-06 19:10:37','YoYo',_binary '',4,'2020-08-07 12:01:16'),(80,65,'Room -Bungalow-Phu Quoc 1(Thu Aug 06 19:10:38 ICT 2020)',80,1,80,'Typeroom_Bungalow.jpg','2020-08-06 19:10:38','YoYo',_binary '\0',4,NULL),(81,66,'Room -Deluxe-Phan Thiet 6(Thu Aug 06 19:10:43 ICT 2020)',129,1,129,'Typeroom_Deluxe.jpg','2020-08-06 19:10:44','YoYo',_binary '\0',4,NULL),(82,67,'Room -Deluxe-Da Lat 12(Thu Aug 06 19:10:47 ICT 2020)',92,1,92,'Typeroom_Deluxe.jpg','2020-08-06 19:10:47','YoYo',_binary '',4,'2020-08-07 12:18:18'),(83,68,'Room -Deluxe-Da Lat 12(Thu Aug 06 19:10:52 ICT 2020)',138,1,138,'Typeroom_Deluxe.jpg','2020-08-06 19:10:53','YoYo',_binary '',4,'2020-08-07 11:53:18'),(84,69,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 19:10:56 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 19:10:57','YoYo',_binary '\0',4,NULL),(85,70,'Room -Bungalow-Da Nang 2(Thu Aug 06 19:10:59 ICT 2020)',100,1,100,'Typeroom_Bungalow.jpg','2020-08-06 19:11:00','yoyo',_binary '',4,'2020-08-07 11:23:21'),(86,71,'Room -Bungalow-Da Nang 2(Thu Aug 06 19:11:03 ICT 2020)',50,1,50,'Typeroom_Bungalow.jpg','2020-08-06 19:11:04','yoyo',_binary '',4,'2020-08-07 11:28:14'),(87,72,'Room -Bungalow-Da Nang 4(Thu Aug 06 19:11:07 ICT 2020)',55,1,55,'Typeroom_Bungalow.jpg','2020-08-06 19:11:07','YoYo',_binary '\0',4,NULL),(88,73,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 19:12:09 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 19:12:09','YoYo',_binary '',4,'2020-08-07 12:02:21'),(89,74,'Room -Deluxe-Da Lat 12(Thu Aug 06 19:12:17 ICT 2020)',138,1,138,'Typeroom_Deluxe.jpg','2020-08-06 19:12:18','YoYo',_binary '\0',4,NULL),(90,75,'Room -Deluxe-Da Lat 12(Thu Aug 06 19:12:21 ICT 2020)',92,1,92,'Typeroom_Deluxe.jpg','2020-08-06 19:12:22','YoYo',_binary '',4,'2020-08-07 11:03:40'),(91,76,'Room -Deluxe-Phan Thiet 6(Thu Aug 06 19:12:26 ICT 2020)',129,1,129,'Typeroom_Deluxe.jpg','2020-08-06 19:12:26','YoYo',_binary '\0',4,NULL),(92,77,'Room -Bungalow-Phu Quoc 1(Thu Aug 06 19:12:29 ICT 2020)',80,1,80,'Typeroom_Bungalow.jpg','2020-08-06 19:12:29','YoYo',_binary '',4,'2020-08-07 11:38:34'),(93,78,'Room -Bungalow-Da Nang 2(Thu Aug 06 19:12:33 ICT 2020)',50,1,50,'Typeroom_Bungalow.jpg','2020-08-06 19:12:33','YoYo',_binary '\0',4,NULL),(94,79,'Room -Superior-Hoi An 22(Thu Aug 06 19:12:37 ICT 2020)',49,1,49,'Typeroom_Superior.jpg','2020-08-06 19:12:38','YoYo',_binary '',4,'2020-08-07 11:33:51'),(95,80,'Room -Bungalow-Da Nang 4(Thu Aug 06 19:12:40 ICT 2020)',55,1,55,'Typeroom_Bungalow.jpg','2020-08-06 19:12:40','YoYo',_binary '\0',4,NULL),(96,81,'Room -Bungalow-Da Nang 2(Thu Aug 06 19:12:44 ICT 2020)',50,1,50,'Typeroom_Bungalow.jpg','2020-08-06 19:12:44','yoyo',_binary '\0',4,NULL),(97,82,'Room -Bungalow-Da Nang 2(Thu Aug 06 19:13:35 ICT 2020)',100,1,100,'Typeroom_Bungalow.jpg','2020-08-06 19:13:35','yoyo',_binary '\0',4,NULL),(98,83,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 19:13:39 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 19:13:40','YoYo',_binary '',4,'2020-08-07 12:07:37'),(99,84,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 19:13:43 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 19:13:43','YoYo',_binary '',4,'2020-08-07 11:21:00'),(100,85,'Room -Deluxe-Da Lat 12(Thu Aug 06 19:13:48 ICT 2020)',138,1,138,'Typeroom_Deluxe.jpg','2020-08-06 19:13:49','YoYo',_binary '',4,'2020-08-07 11:57:10'),(101,86,'Room -Deluxe-Da Lat 12(Thu Aug 06 19:13:52 ICT 2020)',92,1,92,'Typeroom_Deluxe.jpg','2020-08-06 19:13:52','YoYo',_binary '\0',4,NULL),(102,87,'Room -Deluxe-Phan Thiet 6(Thu Aug 06 19:13:56 ICT 2020)',129,1,129,'Typeroom_Deluxe.jpg','2020-08-06 19:13:56','YoYo',_binary '\0',4,NULL),(103,88,'Room -Bungalow-Phu Quoc 1(Thu Aug 06 19:13:59 ICT 2020)',80,1,80,'Typeroom_Bungalow.jpg','2020-08-06 19:13:59','YoYo',_binary '\0',4,NULL),(104,89,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 19:14:43 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 19:14:43','YoYo',_binary '',4,'2020-08-07 11:43:08'),(105,90,'Room -Bungalow-Da Nang 2(Thu Aug 06 19:14:46 ICT 2020)',100,1,100,'Typeroom_Bungalow.jpg','2020-08-06 19:14:46','yoyo',_binary '',4,'2020-08-07 12:10:26'),(106,91,'Room -Bungalow-Phu Quoc 1(Thu Aug 06 19:14:49 ICT 2020)',80,1,80,'Typeroom_Bungalow.jpg','2020-08-06 19:14:49','YoYo',_binary '',4,'2020-08-07 11:22:16'),(107,92,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 19:15:31 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 19:15:31','YoYo',_binary '',4,'2020-08-07 12:19:11'),(108,93,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 19:15:36 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 19:15:37','YoYo',_binary '',4,'2020-08-07 11:46:38'),(109,94,'Room -Deluxe-Phan Thiet 6(Thu Aug 06 19:15:44 ICT 2020)',129,1,129,'Typeroom_Deluxe.jpg','2020-08-06 19:15:45','YoYo',_binary '',4,'2020-08-07 11:58:48'),(110,95,'Room -Bungalow-Phu Quoc 1(Thu Aug 06 19:15:50 ICT 2020)',80,1,80,'Typeroom_Bungalow.jpg','2020-08-06 19:15:51','YoYo',_binary '',4,'2020-08-07 12:25:09'),(111,96,'Room -Bungalow-Da Nang 2(Thu Aug 06 19:15:53 ICT 2020)',50,1,50,'Typeroom_Bungalow.jpg','2020-08-06 19:15:53','YoYo',_binary '',4,'2020-08-07 11:41:55'),(112,97,'Room -Superior-Hoi An 22(Thu Aug 06 19:16:00 ICT 2020)',49,1,49,'Typeroom_Superior.jpg','2020-08-06 19:16:00','YoYo',_binary '',4,'2020-08-07 12:00:00'),(113,98,'Room -Bungalow-Da Nang 4(Thu Aug 06 19:17:30 ICT 2020)',55,1,55,'Typeroom_Bungalow.jpg','2020-08-06 19:17:31','YoYo',_binary '',4,'2020-08-07 11:13:59'),(114,99,'Room -Bungalow-Da Nang 2(Thu Aug 06 19:17:35 ICT 2020)',50,1,50,'Typeroom_Bungalow.jpg','2020-08-06 19:17:36','yoyo',_binary '',4,'2020-08-07 11:50:31'),(115,100,'Room -Bungalow-Da Nang 4(Thu Aug 06 19:17:42 ICT 2020)',55,1,55,'Typeroom_Bungalow.jpg','2020-08-06 19:17:42','YoYo',_binary '\0',4,NULL),(116,101,'Room -Superior-Hoi An 22(Thu Aug 06 19:17:47 ICT 2020)',49,1,49,'Typeroom_Superior.jpg','2020-08-06 19:17:48','YoYo',_binary '',4,'2020-08-07 11:17:23'),(117,102,'Room -Bungalow-Da Nang 2(Thu Aug 06 19:17:51 ICT 2020)',50,1,50,'Typeroom_Bungalow.jpg','2020-08-06 19:17:52','YoYo',_binary '',4,'2020-08-07 11:37:07'),(118,103,'Room -Bungalow-Phu Quoc 1(Thu Aug 06 19:17:55 ICT 2020)',80,1,80,'Typeroom_Bungalow.jpg','2020-08-06 19:17:55','YoYo',_binary '',4,'2020-08-06 22:10:18'),(119,104,'Room -Deluxe-Phan Thiet 6(Thu Aug 06 19:18:11 ICT 2020)',129,1,129,'Typeroom_Deluxe.jpg','2020-08-06 19:18:11','YoYo',_binary '\0',4,NULL),(120,105,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 19:18:15 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 19:18:15','YoYo',_binary '\0',4,NULL),(121,106,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 19:18:47 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 19:18:47','YoYo',_binary '\0',4,NULL),(122,107,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 19:18:48 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 19:18:49','YoYo',_binary '',4,'2020-08-07 11:52:11'),(123,108,'Room -Bungalow-Da Nang 2(Thu Aug 06 19:18:55 ICT 2020)',100,1,100,'Typeroom_Bungalow.jpg','2020-08-06 19:18:55','yoyo',_binary '',4,'2020-08-07 11:39:32'),(124,109,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 19:19:01 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 19:19:02','YoYo',_binary '\0',4,NULL),(125,110,'Room -Bungalow-Da Nang 2(Thu Aug 06 19:19:59 ICT 2020)',100,1,100,'Typeroom_Bungalow.jpg','2020-08-06 19:19:59','yoyo',_binary '',4,'2020-08-07 11:44:20'),(126,111,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 19:20:05 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 19:20:06','YoYo',_binary '\0',4,NULL),(127,112,'Room -Bungalow-Da Nang 2(Thu Aug 06 19:20:10 ICT 2020)',100,1,100,'Typeroom_Bungalow.jpg','2020-08-06 19:20:11','yoyo',_binary '',4,'2020-08-07 11:45:31'),(128,113,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 19:20:12 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 19:20:12','YoYo',_binary '\0',4,NULL),(129,115,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 19:20:46 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 19:20:46','YoYo',_binary '\0',4,NULL),(130,115,'Room -Bungalow-Da Nang 2(Thu Aug 06 19:20:46 ICT 2020)',100,1,100,'Typeroom_Bungalow.jpg','2020-08-06 19:20:46','yoyo',_binary '\0',4,NULL),(131,116,'Room -Bungalow-Phu Quoc 3(Thu Aug 06 19:21:18 ICT 2020)',90,1,90,'Typeroom_Bungalow.jpg','2020-08-06 19:21:19','YoYo',_binary '',4,'2020-08-07 12:14:13'),(132,117,'Room -Deluxe-Da Lat 12(Thu Aug 06 19:21:21 ICT 2020)',138,1,138,'Typeroom_Deluxe.jpg','2020-08-06 19:21:22','YoYo',_binary '\0',4,NULL),(133,118,'Room -Deluxe-Da Lat 12(Thu Aug 06 19:21:25 ICT 2020)',92,1,92,'Typeroom_Deluxe.jpg','2020-08-06 19:21:26','YoYo',_binary '\0',4,NULL),(134,119,'Room -Deluxe-Da Lat 12(Thu Aug 06 19:21:49 ICT 2020)',138,1,138,'Typeroom_Deluxe.jpg','2020-08-06 19:21:49','YoYo',_binary '\0',4,NULL),(135,120,'Room -Deluxe-Da Lat 12(Thu Aug 06 19:23:03 ICT 2020)',92,1,92,'Typeroom_Deluxe.jpg','2020-08-06 19:23:04','YoYo',_binary '',4,'2020-08-07 12:13:03'),(136,121,'Room -Deluxe-Phan Thiet 6(Thu Aug 06 19:23:23 ICT 2020)',129,1,129,'Typeroom_Deluxe.jpg','2020-08-06 19:23:23','YoYo',_binary '',4,'2020-08-07 12:05:07'),(137,122,'Room -Deluxe-Da Lat 12(Thu Aug 06 19:23:36 ICT 2020)',92,1,92,'Typeroom_Deluxe.jpg','2020-08-06 19:23:36','YoYo',_binary '\0',4,NULL),(138,123,'Room -Deluxe-Da Lat 12(Thu Aug 06 19:23:41 ICT 2020)',138,1,138,'Typeroom_Deluxe.jpg','2020-08-06 19:23:42','YoYo',_binary '\0',4,NULL),(139,124,'Room -Bungalow-Phu Quoc 1(Thu Aug 06 19:24:21 ICT 2020)',80,1,80,'Typeroom_Bungalow.jpg','2020-08-06 19:24:22','YoYo',_binary '\0',4,NULL),(140,125,'Room -Deluxe-Da Lat 12(Thu Aug 06 19:24:53 ICT 2020)',138,1,138,'Typeroom_Deluxe.jpg','2020-08-06 19:24:53','YoYo',_binary '\0',4,NULL),(141,126,'Room -Deluxe-Da Lat 12(Thu Aug 06 19:25:00 ICT 2020)',92,1,92,'Typeroom_Deluxe.jpg','2020-08-06 19:25:00','YoYo',_binary '\0',4,NULL),(142,127,'Room -Deluxe-Da Lat 12(Thu Aug 06 19:25:04 ICT 2020)',138,1,138,'Typeroom_Deluxe.jpg','2020-08-06 19:25:04','YoYo',_binary '',4,'2020-08-07 11:27:00'),(143,128,'Room -Deluxe-Da Lat 12(Thu Aug 06 19:25:08 ICT 2020)',92,1,92,'Typeroom_Deluxe.jpg','2020-08-06 19:25:08','YoYo',_binary '\0',4,NULL),(150,103,'Water Park',1000,2,2000,'experience5.jpg','2020-08-06 22:09:06','Callum',_binary '',3,'2020-08-06 22:10:18'),(151,103,'Spa',500,2,1000,'experience2.jpg','2020-08-06 22:09:06','Callum',_binary '',3,'2020-08-06 22:10:18'),(152,103,'Strawberry Cheese Cake',40,2,80,'our-menu-19.jpg','2020-08-06 22:09:06','Callum',_binary '',1,'2020-08-06 22:10:18'),(153,103,' Miele di pollo alla griglia',80,2,160,'our-menu-04.jpg','2020-08-06 22:09:06','Callum',_binary '',1,'2020-08-06 22:10:18'),(154,103,'Costolette di agnello',100,2,200,'our-menu-02.jpg','2020-08-06 22:09:06','Callum',_binary '',1,'2020-08-06 22:10:18'),(155,103,'Costolette di agnello',100,1,100,'our-menu-02.jpg','2020-08-06 22:12:31','Callum',_binary '\0',1,'2020-08-06 22:10:18'),(156,103,'Strawberry Cheese Cake',40,1,40,'our-menu-19.jpg','2020-08-06 22:12:31','Callum',_binary '\0',1,'2020-08-06 22:10:18'),(157,103,' Miele di pollo alla griglia',80,1,80,'our-menu-04.jpg','2020-08-06 22:12:31','Callum',_binary '\0',1,'2020-08-06 22:10:18'),(158,103,'Macallan Fine & Rare Scotch Whisky',500,1,500,'our-menu-05.jpg','2020-08-06 22:12:31','Callum',_binary '\0',2,'2020-08-06 22:10:18'),(159,103,'Wine Castle',200,1,200,'experience3.jpg','2020-08-06 22:12:31','Callum',_binary '\0',3,'2020-08-06 22:10:18'),(160,103,'Spa',500,1,500,'experience2.jpg','2020-08-06 22:12:31','Callum',_binary '\0',3,'2020-08-06 22:10:18'),(161,75,'Costolette di agnello',100,1,100,'our-menu-02.jpg','2020-08-07 11:02:31','Noah',_binary '',1,'2020-08-07 11:03:40'),(162,75,'Strawberry Cheese Cake',40,1,40,'our-menu-19.jpg','2020-08-07 11:02:31','Noah',_binary '',1,'2020-08-07 11:03:40'),(163,75,' Miele di pollo alla griglia',80,1,80,'our-menu-04.jpg','2020-08-07 11:02:31','Noah',_binary '',1,'2020-08-07 11:03:40'),(164,75,'Macallan Fine & Rare Scotch Whisky',500,1,500,'our-menu-05.jpg','2020-08-07 11:02:31','Noah',_binary '',2,'2020-08-07 11:03:40'),(165,75,'Water Park',1000,1,1000,'experience5.jpg','2020-08-07 11:02:31','Noah',_binary '',3,'2020-08-07 11:03:40'),(166,75,'Safari Zone',1000,1,1000,'experience4.jpg','2020-08-07 11:02:31','Noah',_binary '',3,'2020-08-07 11:03:40'),(167,27,'Spa',500,2,1000,'experience2.jpg','2020-08-07 11:04:50','Harry',_binary '',3,'2020-08-07 11:07:34'),(168,27,'Wine Castle',200,2,400,'experience3.jpg','2020-08-07 11:04:50','Harry',_binary '',3,'2020-08-07 11:07:34'),(169,27,'Strawberry Cheese Cake',40,1,40,'our-menu-19.jpg','2020-08-07 11:04:50','Harry',_binary '',1,'2020-08-07 11:07:34'),(170,27,' Miele di pollo alla griglia',80,1,80,'our-menu-04.jpg','2020-08-07 11:04:50','Harry',_binary '',1,'2020-08-07 11:07:34'),(171,27,'Costolette di agnello',100,1,100,'our-menu-02.jpg','2020-08-07 11:06:42','Harry',_binary '',1,'2020-08-07 11:07:34'),(172,27,'Macallan Fine & Rare Scotch Whisky',500,2,1000,'our-menu-05.jpg','2020-08-07 11:06:42','Harry',_binary '',2,'2020-08-07 11:07:34'),(173,27,'Water Park',1000,2,2000,'experience5.jpg','2020-08-07 11:06:42','Harry',_binary '',3,'2020-08-07 11:07:34'),(174,27,'Safari Zone',1000,1,1000,'experience4.jpg','2020-08-07 11:06:42','Harry',_binary '',3,'2020-08-07 11:07:34'),(175,62,'Costolette di agnello',100,2,200,'our-menu-02.jpg','2020-08-07 11:11:36','Oliver ',_binary '',1,'2020-08-07 11:12:30'),(176,62,'Strawberry Cheese Cake',40,2,80,'our-menu-19.jpg','2020-08-07 11:11:36','Oliver ',_binary '',1,'2020-08-07 11:12:30'),(177,62,'Wine Castle',200,1,200,'experience3.jpg','2020-08-07 11:11:36','Oliver ',_binary '',3,'2020-08-07 11:12:30'),(178,62,'Spa',500,1,500,'experience2.jpg','2020-08-07 11:11:36','Oliver ',_binary '',3,'2020-08-07 11:12:30'),(179,98,'Costolette di agnello',100,1,100,'our-menu-02.jpg','2020-08-07 11:13:26','YoYo',_binary '',1,'2020-08-07 11:13:59'),(180,98,'Macallan Fine & Rare Scotch Whisky',500,2,1000,'our-menu-05.jpg','2020-08-07 11:13:26','YoYo',_binary '',2,'2020-08-07 11:13:59'),(181,98,'Wine Castle',200,2,400,'experience3.jpg','2020-08-07 11:13:26','YoYo',_binary '',3,'2020-08-07 11:13:59'),(182,98,'Water Park',1000,1,1000,'experience5.jpg','2020-08-07 11:13:26','YoYo',_binary '',3,'2020-08-07 11:13:59'),(183,63,'Costolette di agnello',100,1,100,'our-menu-02.jpg','2020-08-07 11:14:56','Mason',_binary '',1,'2020-08-07 11:15:26'),(184,63,' Miele di pollo alla griglia',80,1,80,'our-menu-04.jpg','2020-08-07 11:14:56','Mason',_binary '',1,'2020-08-07 11:15:26'),(185,63,'Safari Zone',1000,2,2000,'experience4.jpg','2020-08-07 11:14:56','Mason',_binary '',3,'2020-08-07 11:15:26'),(186,63,'Spa',500,2,1000,'experience2.jpg','2020-08-07 11:14:56','Mason',_binary '',3,'2020-08-07 11:15:26'),(187,101,'Strawberry Cheese Cake',40,2,80,'our-menu-19.jpg','2020-08-07 11:16:47','Oliver ',_binary '',1,'2020-08-07 11:17:23'),(188,101,' Miele di pollo alla griglia',80,2,160,'our-menu-04.jpg','2020-08-07 11:16:47','Oliver ',_binary '',1,'2020-08-07 11:17:23'),(189,101,'Spa',500,2,1000,'experience2.jpg','2020-08-07 11:16:47','Oliver ',_binary '',3,'2020-08-07 11:17:23'),(190,101,'Water Park',1000,2,2000,'experience5.jpg','2020-08-07 11:16:47','Oliver ',_binary '',3,'2020-08-07 11:17:23'),(191,26,'Water Park',1000,1,1000,'experience5.jpg','2020-08-07 11:18:25','John',_binary '',3,'2020-08-07 11:18:59'),(192,26,'Spa',500,1,500,'experience2.jpg','2020-08-07 11:18:25','John',_binary '',3,'2020-08-07 11:18:59'),(193,26,'Strawberry Cheese Cake',40,1,40,'our-menu-19.jpg','2020-08-07 11:18:25','John',_binary '',1,'2020-08-07 11:18:59'),(194,26,'Costolette di agnello',100,1,100,'our-menu-02.jpg','2020-08-07 11:18:25','John',_binary '',1,'2020-08-07 11:18:59'),(195,84,'Strawberry Cheese Cake',40,2,80,'our-menu-19.jpg','2020-08-07 11:20:14','Liam',_binary '',1,'2020-08-07 11:21:00'),(196,84,'Costolette di agnello',100,2,200,'our-menu-02.jpg','2020-08-07 11:20:14','Liam',_binary '',1,'2020-08-07 11:21:00'),(197,91,'Water Park',1000,2,2000,'experience5.jpg','2020-08-07 11:21:43','Noah',_binary '',3,'2020-08-07 11:22:16'),(198,91,'Safari Zone',1000,3,3000,'experience4.jpg','2020-08-07 11:21:43','Noah',_binary '',3,'2020-08-07 11:22:16'),(199,70,'Water Park',1000,2,2000,'experience5.jpg','2020-08-07 11:22:47','Jack',_binary '',3,'2020-08-07 11:23:21'),(200,70,'Wine Castle',200,2,400,'experience3.jpg','2020-08-07 11:22:47','Jack',_binary '',3,'2020-08-07 11:23:21'),(201,40,'Costolette di agnello',100,4,400,'our-menu-02.jpg','2020-08-07 11:24:08','Noah',_binary '',1,'2020-08-07 11:25:44'),(202,40,'Macallan Fine & Rare Scotch Whisky',500,4,2000,'our-menu-05.jpg','2020-08-07 11:24:08','Noah',_binary '',2,'2020-08-07 11:25:44'),(203,40,'Strawberry Cheese Cake',40,2,80,'our-menu-19.jpg','2020-08-07 11:25:08','Noah',_binary '',1,'2020-08-07 11:25:44'),(204,40,' Miele di pollo alla griglia',80,2,160,'our-menu-04.jpg','2020-08-07 11:25:08','Noah',_binary '',1,'2020-08-07 11:25:44'),(205,127,'Strawberry Cheese Cake',40,2,80,'our-menu-19.jpg','2020-08-07 11:26:24','Noah',_binary '',1,'2020-08-07 11:27:00'),(206,127,' Miele di pollo alla griglia',80,2,160,'our-menu-04.jpg','2020-08-07 11:26:24','Noah',_binary '',1,'2020-08-07 11:27:00'),(207,127,'Water Park',1000,2,2000,'experience5.jpg','2020-08-07 11:26:24','Noah',_binary '',3,'2020-08-07 11:27:00'),(208,71,'Spa',500,2,1000,'experience2.jpg','2020-08-07 11:27:42','Noah',_binary '',3,'2020-08-07 11:28:14'),(209,71,'Safari Zone',1000,2,2000,'experience4.jpg','2020-08-07 11:27:42','Noah',_binary '',3,'2020-08-07 11:28:14'),(210,58,'Costolette di agnello',100,2,200,'our-menu-02.jpg','2020-08-07 11:28:59','YoYo',_binary '',1,'2020-08-07 11:32:14'),(211,58,'Strawberry Cheese Cake',40,1,40,'our-menu-19.jpg','2020-08-07 11:28:59','YoYo',_binary '',1,'2020-08-07 11:32:14'),(212,58,'Safari Zone',1000,2,2000,'experience4.jpg','2020-08-07 11:29:20','YoYo',_binary '',3,'2020-08-07 11:32:14'),(213,58,'Wine Castle',200,2,400,'experience3.jpg','2020-08-07 11:29:20','YoYo',_binary '',3,'2020-08-07 11:32:14'),(214,58,'Costolette di agnello',100,2,200,'our-menu-02.jpg','2020-08-07 11:30:49','YoYo',_binary '',1,'2020-08-07 11:32:14'),(215,58,'Macallan Fine & Rare Scotch Whisky',500,2,1000,'our-menu-05.jpg','2020-08-07 11:30:49','YoYo',_binary '',2,'2020-08-07 11:32:15'),(216,58,' Miele di pollo alla griglia',80,2,160,'our-menu-04.jpg','2020-08-07 11:31:35','YoYo',_binary '',1,'2020-08-07 11:32:15'),(217,79,'Spa',500,2,1000,'experience2.jpg','2020-08-07 11:33:08','Oliver ',_binary '',3,'2020-08-07 11:33:51'),(218,79,'Water Park',1000,2,2000,'experience5.jpg','2020-08-07 11:33:08','Oliver ',_binary '',3,'2020-08-07 11:33:51'),(219,102,'Costolette di agnello',100,2,200,'our-menu-02.jpg','2020-08-07 11:35:10','Oliver ',_binary '',1,'2020-08-07 11:37:07'),(220,102,' Miele di pollo alla griglia',80,2,160,'our-menu-04.jpg','2020-08-07 11:35:10','Oliver ',_binary '',1,'2020-08-07 11:37:07'),(221,102,'Strawberry Cheese Cake',40,1,40,'our-menu-19.jpg','2020-08-07 11:35:10','Oliver ',_binary '',1,'2020-08-07 11:37:07'),(222,102,'Macallan Fine & Rare Scotch Whisky',500,1,500,'our-menu-05.jpg','2020-08-07 11:35:10','Oliver ',_binary '',2,'2020-08-07 11:37:07'),(223,102,'Strawberry Cheese Cake',40,2,80,'our-menu-19.jpg','2020-08-07 11:36:31','Oliver ',_binary '',1,'2020-08-07 11:37:07'),(224,102,' Miele di pollo alla griglia',80,2,160,'our-menu-04.jpg','2020-08-07 11:36:31','Oliver ',_binary '',1,'2020-08-07 11:37:07'),(225,77,'Safari Zone',1000,2,2000,'experience4.jpg','2020-08-07 11:38:01','Mason',_binary '',3,'2020-08-07 11:38:34'),(226,77,'Spa',500,2,1000,'experience2.jpg','2020-08-07 11:38:01','Mason',_binary '',3,'2020-08-07 11:38:34'),(227,96,'Water Park',1000,2,2000,'experience5.jpg','2020-08-07 11:41:24','Connor',_binary '',3,'2020-08-07 11:41:55'),(228,96,'Safari Zone',1000,2,2000,'experience4.jpg','2020-08-07 11:41:24','Connor',_binary '',3,'2020-08-07 11:41:55'),(229,96,'Costolette di agnello',100,2,200,'our-menu-02.jpg','2020-08-07 11:41:24','Connor',_binary '',1,'2020-08-07 11:41:55'),(230,89,'Strawberry Cheese Cake',40,2,80,'our-menu-19.jpg','2020-08-07 11:42:31','Harry',_binary '',1,'2020-08-07 11:43:08'),(231,89,' Miele di pollo alla griglia',80,2,160,'our-menu-04.jpg','2020-08-07 11:42:31','Harry',_binary '',1,'2020-08-07 11:43:08'),(232,110,'Water Park',1000,2,2000,'experience5.jpg','2020-08-07 11:43:47','Connor',_binary '',3,'2020-08-07 11:44:20'),(233,110,'Spa',500,2,1000,'experience2.jpg','2020-08-07 11:43:47','Connor',_binary '',3,'2020-08-07 11:44:20'),(234,112,' Miele di pollo alla griglia',80,2,160,'our-menu-04.jpg','2020-08-07 11:44:57','Oliver ',_binary '',1,'2020-08-07 11:45:31'),(235,112,'Costolette di agnello',100,2,200,'our-menu-02.jpg','2020-08-07 11:44:57','Oliver ',_binary '',1,'2020-08-07 11:45:31'),(236,93,'Safari Zone',1000,2,2000,'experience4.jpg','2020-08-07 11:46:02','Callum',_binary '',3,'2020-08-07 11:46:38'),(237,93,'Wine Castle',200,2,400,'experience3.jpg','2020-08-07 11:46:02','Callum',_binary '',3,'2020-08-07 11:46:38'),(238,52,'Spa',500,2,1000,'experience2.jpg','2020-08-07 11:47:20','Jack',_binary '',3,'2020-08-07 11:48:09'),(239,52,'Safari Zone',1000,2,2000,'experience4.jpg','2020-08-07 11:47:20','Jack',_binary '',3,'2020-08-07 11:48:09'),(240,38,'Strawberry Cheese Cake',40,2,80,'our-menu-19.jpg','2020-08-07 11:48:46','Jack',_binary '',1,'2020-08-07 11:49:25'),(241,38,' Miele di pollo alla griglia',80,2,160,'our-menu-04.jpg','2020-08-07 11:48:46','Jack',_binary '',1,'2020-08-07 11:49:25'),(242,99,'Water Park',1000,2,2000,'experience5.jpg','2020-08-07 11:49:59','Harry',_binary '',3,'2020-08-07 11:50:31'),(243,99,'Safari Zone',1000,2,2000,'experience4.jpg','2020-08-07 11:49:59','Harry',_binary '',3,'2020-08-07 11:50:31'),(244,107,'Spa',500,2,1000,'experience2.jpg','2020-08-07 11:51:40','Callum',_binary '',3,'2020-08-07 11:52:11'),(245,107,'Safari Zone',1000,2,2000,'experience4.jpg','2020-08-07 11:51:40','Callum',_binary '',3,'2020-08-07 11:52:11'),(246,68,'Macallan Fine & Rare Scotch Whisky',500,1,500,'our-menu-05.jpg','2020-08-07 11:52:44','Harry',_binary '',2,'2020-08-07 11:53:18'),(247,68,' Miele di pollo alla griglia',80,2,160,'our-menu-04.jpg','2020-08-07 11:52:44','Harry',_binary '',1,'2020-08-07 11:53:18'),(248,85,'Strawberry Cheese Cake',40,2,80,'our-menu-19.jpg','2020-08-07 11:56:16','Noah',_binary '',1,'2020-08-07 11:57:10'),(249,85,' Miele di pollo alla griglia',80,2,160,'our-menu-04.jpg','2020-08-07 11:56:16','Noah',_binary '',1,'2020-08-07 11:57:10'),(250,94,'Water Park',1000,2,2000,'experience5.jpg','2020-08-07 11:58:13','YoYo',_binary '',3,'2020-08-07 11:58:48'),(251,94,'Wine Castle',200,2,400,'experience3.jpg','2020-08-07 11:58:13','YoYo',_binary '',3,'2020-08-07 11:58:48'),(252,97,'Costolette di agnello',100,2,200,'our-menu-02.jpg','2020-08-07 11:59:24','Harry',_binary '',1,'2020-08-07 12:00:00'),(253,97,' Miele di pollo alla griglia',80,1,80,'our-menu-04.jpg','2020-08-07 11:59:24','Harry',_binary '',1,'2020-08-07 12:00:00'),(254,64,'Costolette di agnello',100,2,200,'our-menu-02.jpg','2020-08-07 12:00:45','YoYo',_binary '',1,'2020-08-07 12:01:16'),(255,64,'Macallan Fine & Rare Scotch Whisky',500,1,500,'our-menu-05.jpg','2020-08-07 12:00:45','YoYo',_binary '',2,'2020-08-07 12:01:16'),(256,73,'Spa',500,2,1000,'experience2.jpg','2020-08-07 12:01:48','YoYo',_binary '',3,'2020-08-07 12:02:21'),(257,73,'Safari Zone',1000,2,2000,'experience4.jpg','2020-08-07 12:01:48','YoYo',_binary '',3,'2020-08-07 12:02:21'),(258,36,'Costolette di agnello',100,2,200,'our-menu-02.jpg','2020-08-07 12:03:18','Connor',_binary '',1,'2020-08-07 12:03:55'),(259,36,'Strawberry Cheese Cake',40,1,40,'our-menu-19.jpg','2020-08-07 12:03:18','Connor',_binary '',1,'2020-08-07 12:03:55'),(260,36,'Macallan Fine & Rare Scotch Whisky',500,1,500,'our-menu-05.jpg','2020-08-07 12:03:18','Connor',_binary '',2,'2020-08-07 12:03:55'),(261,121,'Water Park',1000,2,2000,'experience5.jpg','2020-08-07 12:04:33','Noah',_binary '',3,'2020-08-07 12:05:07'),(262,121,'Spa',500,2,1000,'experience2.jpg','2020-08-07 12:04:33','Noah',_binary '',3,'2020-08-07 12:05:07'),(263,46,'Safari Zone',1000,2,2000,'experience4.jpg','2020-08-07 12:05:41','Callum',_binary '',3,'2020-08-07 12:06:14'),(264,46,'Water Park',1000,2,2000,'experience5.jpg','2020-08-07 12:05:41','Callum',_binary '',3,'2020-08-07 12:06:14'),(265,83,'Spa',500,2,1000,'experience2.jpg','2020-08-07 12:06:52','Oliver ',_binary '',3,'2020-08-07 12:07:37'),(266,83,'Safari Zone',1000,2,2000,'experience4.jpg','2020-08-07 12:06:52','Oliver ',_binary '',3,'2020-08-07 12:07:37'),(267,56,'Water Park',1000,2,2000,'experience5.jpg','2020-08-07 12:08:05','John',_binary '',3,'2020-08-07 12:09:05'),(268,56,'Spa',500,2,1000,'experience2.jpg','2020-08-07 12:08:05','John',_binary '',3,'2020-08-07 12:09:05'),(269,90,'Water Park',1000,2,2000,'experience5.jpg','2020-08-07 12:09:51','Connor',_binary '',3,'2020-08-07 12:10:26'),(270,90,'Spa',500,2,1000,'experience2.jpg','2020-08-07 12:09:51','Connor',_binary '',3,'2020-08-07 12:10:26'),(271,33,'Spa',500,2,1000,'experience2.jpg','2020-08-07 12:10:55','Mason',_binary '',3,'2020-08-07 12:11:27'),(272,33,'Wine Castle',200,2,400,'experience3.jpg','2020-08-07 12:10:55','Mason',_binary '',3,'2020-08-07 12:11:27'),(273,120,'Water Park',1000,2,2000,'experience5.jpg','2020-08-07 12:11:56','Jack',_binary '',3,'2020-08-07 12:13:03'),(274,120,'Spa',500,2,1000,'experience2.jpg','2020-08-07 12:11:56','Jack',_binary '',3,'2020-08-07 12:13:03'),(275,116,'Water Park',1000,2,2000,'experience5.jpg','2020-08-07 12:13:40','Noah',_binary '',3,'2020-08-07 12:14:13'),(276,116,'Costolette di agnello',100,2,200,'our-menu-02.jpg','2020-08-07 12:13:40','Noah',_binary '',1,'2020-08-07 12:14:13'),(277,116,'Macallan Fine & Rare Scotch Whisky',500,1,500,'our-menu-05.jpg','2020-08-07 12:13:40','Noah',_binary '',2,'2020-08-07 12:14:13'),(278,67,'Spa',500,2,1000,'experience2.jpg','2020-08-07 12:14:49','Jake',_binary '',3,'2020-08-07 12:18:18'),(279,67,'Water Park',1000,2,2000,'experience5.jpg','2020-08-07 12:14:49','Jake',_binary '',3,'2020-08-07 12:18:18'),(280,67,'Costolette di agnello',100,2,200,'our-menu-02.jpg','2020-08-07 12:16:21','Jake',_binary '',1,'2020-08-07 12:18:18'),(281,67,' Miele di pollo alla griglia',80,2,160,'our-menu-04.jpg','2020-08-07 12:16:21','Jake',_binary '',1,'2020-08-07 12:18:18'),(282,45,'Costolette di agnello',100,2,200,'our-menu-02.jpg','2020-08-07 12:20:41','Connor',_binary '',1,'2020-08-07 12:22:43'),(283,45,'Macallan Fine & Rare Scotch Whisky',500,1,500,'our-menu-05.jpg','2020-08-07 12:20:41','Connor',_binary '',2,'2020-08-07 12:22:43'),(284,45,'Water Park',1000,1,1000,'experience5.jpg','2020-08-07 12:21:58','Connor',_binary '',3,'2020-08-07 12:22:43'),(285,45,'Safari Zone',1000,1,1000,'experience4.jpg','2020-08-07 12:21:58','Connor',_binary '',3,'2020-08-07 12:22:43'),(286,95,'Macallan Fine & Rare Scotch Whisky',500,1,500,'our-menu-05.jpg','2020-08-07 12:24:10','YoYo',_binary '',2,'2020-08-07 12:25:09'),(287,95,'Costolette di agnello',100,2,200,'our-menu-02.jpg','2020-08-07 12:24:10','YoYo',_binary '',1,'2020-08-07 12:25:09');
/*!40000 ALTER TABLE `receiptcomponent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `RoleId` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
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
  `RoomId` int(11) NOT NULL AUTO_INCREMENT,
  `LocationId` int(11) DEFAULT NULL,
  `RoomTypeId` int(11) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Status` bit(1) DEFAULT NULL,
  `Description` varchar(2550) CHARACTER SET utf8 DEFAULT NULL,
  `BedOption` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `Size` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `View` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
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
  `RoomId` int(11) DEFAULT NULL,
  `ConvenientId` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `RoomImageId` int(11) NOT NULL AUTO_INCREMENT,
  `RoomId` int(11) DEFAULT NULL,
  `Url` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `RoomTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `RoomTypeName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Description` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `ServiceId` int(11) NOT NULL AUTO_INCREMENT,
  `SerivceTypeId` int(11) DEFAULT NULL,
  `ServiceName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ServicePrice` float DEFAULT NULL,
  `ServiceDescription` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Serviceurl` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bit(1) DEFAULT b'1',
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
INSERT INTO `service` VALUES (1,1,'Costolette di agnello',100,'lorem i sum','our-menu-02.jpg',_binary ''),(2,1,' Miele di pollo alla griglia',80,'lorem i sum','our-menu-04.jpg',_binary ''),(3,2,'Macallan Fine & Rare Scotch Whisky',500,'lorem i sum','our-menu-05.jpg',_binary ''),(4,1,'Strawberry Cheese Cake',40,'lorem i sum','our-menu-19.jpg',_binary ''),(5,3,'Water Park',1000,'lorem i sum','experience5.jpg',_binary ''),(6,3,'Spa',500,'lorem i sum','experience2.jpg',_binary ''),(7,3,'Wine Castle',200,'lorem i sum','experience3.jpg',_binary ''),(8,3,'Safari Zone',1000,'lorem i sum','experience4.jpg',_binary '');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicetype`
--

DROP TABLE IF EXISTS `servicetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicetype` (
  `ServiceTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ServiceTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicetype`
--

LOCK TABLES `servicetype` WRITE;
/*!40000 ALTER TABLE `servicetype` DISABLE KEYS */;
INSERT INTO `servicetype` VALUES (1,'Food'),(2,'Drink'),(3,'Ticket'),(4,'RoomDeposits');
/*!40000 ALTER TABLE `servicetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `TicketId` varchar(500) CHARACTER SET utf8 NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `TicketName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `TicketUrl` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `BuyerID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BuyDate` datetime DEFAULT NULL,
  PRIMARY KEY (`TicketId`),
  KEY `FK_ticket_buyer_idx` (`BuyerID`),
  CONSTRAINT `FK_ticket_buyer` FOREIGN KEY (`BuyerID`) REFERENCES `qrcode` (`QrCodeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES ('0LSeyQeRYayYga2zkVjO9iN4zNc9mTIVNDCpHdmamLx5quiJNEFaDSFjJV87S5V3e31riQKuRSy7wBjjBMkdqNsntBEGVp6c2jXjidZG745bwE6FkzH7jODB3s2wzVTFqNVwHLm2qMhhTN6m2TsYZsMpTzo9AyoccRKwM7mgl0Lb74AZ55dued0Ok0jZAqLHBz3YSQKL',2,'Water Park','ticket20','1xKwKRZ01HbpXkqxJk9T3clD8jLgoPy3KJ1ds3ZK','2020-08-07 11:16:47'),('0pmDZksf6k2ceWTijQNROJnE2CR2DjDm8aFTAYAqAFcLeGw7mgwIQ6pSyxgawfy0X3sgKZLTqPCSM9Bdi7kBVpxCHncD9826Wt5ZATXfX4JY1wuNnD2Klgry4jNGvuQz8XpujVlo4jrOxuwP056hErN1v03ZG5xcRQy0QRH6Kv0gptfbJib00iFtGJkUUAXd2e4kugev',2,'Wine Castle','ticket63','xr4TXHiBCdqOifj86jPDFP5wrZDPgS7ta7d2e1nF','2020-08-07 12:10:56'),('20iIujCCzgmfRPJjR8Nt41i1kpH61cp13OGBLfovVDJGdft926ooCu0jaHfuwhl9OYNuhLV3XUqmdmwghw7dn4dnN9uobHwBBwL9KroZAixuVUavo4jD5vWQZH5qeSIRA5PWGtJkDbezgxMBM5uu4rvMOn7EcXtqXlZa0Wzbyx52sr8nWnrvV9nutF9zWqbL8pzhtjuR',2,'Safari Zone','ticket29','SH9qBDXnqmCZjW5LIIV02TD2oWjVIBICzMuowdD0','2020-08-07 11:27:42'),('3g7j6C59GjIZyb54CsOONxtLPFwqj4BeiW6V0FK0WZOYGUcx0fP3yxTgluHMepOb662UXfARLlnac0vcSdIODWHliLyXThVuzl8lGwyqHCj4gC1WWxF0DLj78vxzNuJ8M37ikhmclnnAZECEvNfHzRsZqY5EfF69mZaDCgcZG4pDiHtVMAS5OfYIrA6YYBKOp0fj7d6i',2,'Spa','ticket18','VlRKmhPtlbkGb4rmvk5VZBDRSV8PMzTNNuQTNVMc','2020-08-07 11:14:56'),('4rlDhF8uNAJPPn8SjwHnQnBozhWyt4ETAKRnKEn6lLrQYzjYvyzY4b3LT6uAch9Of3Swpl8S9P4n3xt6i30qiu1SJRfeo8iU1gwKoPDtXJoebFcTjjdSbSQwbTov1VBIJuFznxMuuiE3E2yIuK9GiJRzskdmRl8CmNxon1NIJk1JP8AXV4BpOgcEEU6aXhWxqQ97pD2s',1,'Safari Zone','ticket8','au3xH8npQnMSOk8Stlw2Ji9RpRFhq7bIj7gAtqyO','2020-08-07 11:02:32'),('68tOgFkMF9WHw6KqXd86O6jPEk0NKXkgSlYYgQwhyZ5V8HOaPYNbyXaImsauoyIOTBMd9NEclXdIoOVnJB4wYAQKs2MCBYnZ3HuRvhYuAAkF4lTckVvvpXKvdBYejBF5KWnrNUF4ltdvuLY1yEJTTNeZRItFPbvosJlygEc7wHX0Jw1n4o3aiDWl0xzAXFkpMzQEStz7',1,'Spa','ticket14','yKOGQkQ0hdE5HAiNuhJ1AEpgAnyRvH8AkJoEzw70','2020-08-07 11:11:36'),('69dbMglcluGBJlOj3KxjexLyT1xe7PPScHchZ0lt2xSzIxxZv1xdYz2CbtJ3VwyyhQJEYhbdfV72tEmeqhuKTaXUgqca0YrlD9p9CkUfZHst9TRwQMp1xDHn3qh2BbsvgpjTgwog28ayLcULQ7yz5eCiWwUXgGzjkcL8GBGwqG2MliWsCeCeOJLwsUHWa0D3gsILE8dP',2,'Water Park','ticket48','ZwvW4l0F09EyawiqrthvxXYrx0xx8t2fv1h4AKf4','2020-08-07 11:58:13'),('6jBALPFHqi42PzBndtQ6Fgz4CyrY7vAcOKfQpYdPzv92OYibPTosRe4KMfP2K9CcyqpKDyZNawzRqtYcz4WMesrnOTlTYoWphYHcbvsPHMavtufDYRxo204uua4GgoGH6BBUIy9BV0ImWEeysqap5jC5okrjWbwgnMrEwRN647xWKacwGTtSiclG9LPCiSduXyQJZ7jn',1,'Spa','ticket6','8Ce7ToP30xISQ7WpqQd22HVcLpI2CLBpnOtNixvu','2020-08-06 22:12:31'),('7MiG3ebMJZVjzJQJr6ntDOJgWiDKjIoxmIhf1YMFb4l878M4gi9MywzMjPEMNHEMw816CayTFFEBrYkGRjQCVq6WYUta8SqS5PtO0fpe6tFPPvFXDzSDtHdeQSuOK4X38XfF5DNjt4AQW08uUQZp9FukLbr5mEGnGghevbUeA0935Bc7fpBbJElJmbG2VENa5KnxxUx6',2,'Water Park','ticket11','macrHGc9oOYPyhC4sZQkKMBVFbdoP9jVxGms1met','2020-08-07 11:06:42'),('7TTLD5FfWrHaHM66KDx3NyWZ5NVPgLaJHTLULTAmH6iZEW3cTV6OFIzMZGAKuHGI91Lcu2vKDCx081eNCcZU6l8PeKmAZSOOcpL7gCtD3nYGPy8GC2rDXc1CtpBR3QvDgtDNom7xVlnXCwfEmjhBuswePt05sGyDl1tHRsX1JgblCZZsEe6S73ehJMIcZsErTeOgtHQE',2,'Spa','ticket65','pcMiOcJ5uNibnr5fZWEhCpQbnAD0PjGJIsmozBlg','2020-08-07 12:11:57'),('85r0ES91fmg7BQCdd8UPPmQhVs1errLz6tTEkavsbYQgdrMhiB8NpWYSHnHPBJaRDqEZPTnV0mNhL3u7mzSuj89PtqnotuE6sSqh5HiU42aoiUTIn0LSfOvR1WAhBMJLbdZ3SLcdP0vhUyn283RCgCPBB8bYgQTO3njbhnGOIqwDMtdthEAkPO7R0zIHS3x6FsdWxl5Z',2,'Safari Zone','ticket43','uYGhwYpJKGxsWAmmgnHmUMOwvtH9zFfSXdnUKR1o','2020-08-07 11:47:20'),('8J9zUXi6ymGzvjx4EtEvumxboYodBZkOwEwcK9CXsmMxYLYbrKOOI7mlUKFULydm6Mx6mz4VLB9uq1mylEAXeb1E3eAChYzMvhfZ5WIe4XhQn0woLbRzPCykYdnGcFIP5eP8BwTPdiUsI3FVKn005KKXq8U0lKsCJLIYueHfjvmPRRSqVcdjDidQfByQtOJkHeV4xZUd',1,'Wine Castle','ticket1','8Ce7ToP30xISQ7WpqQd22HVcLpI2CLBpnOtNixvu','2020-08-06 21:56:57'),('8xCcnnq3YXL0M5fbrxRIyz82rqzE3WwnWNsiVfUYNS9ZlzPqoqzrBfY50MOTVEGlVHWw3LcYA87Ai5Xot0dc6vFzUXIfkHuzfWZby6sK0sTpDVfxG8rk6USFd4wdB1ulwVUYwoEQbro80yMGSQRjrEpU2MSj2DUfM4HMuLDXLACjpr5EXjN3gqEKooNUdrId9ZVByhFu',2,'Safari Zone','ticket30','vVRsp4dYOyvZjVqA6fsA9GXLzz2MCpurVwH23alz','2020-08-07 11:29:20'),('A9irOsUp4CD2c6Z5gE5hovPDMCKvMWVx82sAXxQ77Y1U53Tz7T5pw4RdeA2WfeMKuhft3WZuT61WVgDkQxJLB2Ile0FE8N71KyR9AMRh9g4reFxwGMg4WshanqyYfuq3mSIKOE2CWVR6nGXSxRgzcNCnG1mSXzNZ2H2gjzBqqtqqE9T9YqYKe1btb5cZiBycs4MOzGdD',2,'Safari Zone','ticket40','ZF4HOhj0XVFNRpWLPZoJpsJ6PTCgxWUzb8Bhaggr','2020-08-07 11:46:02'),('AY8zGd1sESGg5pOUC9hnAtwvLbwZsgpSx6lCVrA3HKwkyZ0pp8mghp4lawyn3CgdPzTO6qqExVTmYjeTshMjRAvTS67TENBeIXRyYsgJTmrBEc1k1aFImiYDLIF3tGjGzgzSfaxizbiilTutk5zCnJJuCBZ7t36m6OvenBiD0XEiFZd9JKpZ1dHV8mwuP8RxnSchTP8P',2,'Spa','ticket59','aZE8kKQd7OFexDKZe440sgb3GVsou2XN1ib2cJev','2020-08-07 12:08:05'),('Bg0uUk9yLsxyLHi1puSJVCCqHMHtkbSfkvnSKlLJyzsK38MRc1cDwsCBKUJuemRzr5tIiScVWRmN0PKvuvnChfqHihk4gNWPIjMQJE16ttK97yLlYPvRQvlZ0ZPKyspJPZYRhTeqW0Gmzc90R9mPH7vMR1ekDPEYpuyRJtP89ZWtqwTAP7eK9Dn3daIGnKteAKcjgif0',2,'Safari Zone','ticket45','jqvtokZAkyzxlAzKIvtrJlmK52dKEIo12TJN3NAj','2020-08-07 11:49:59'),('bholKniUchdatGrifWL0OzPivR7rLfXCsMA7QnMXhg2oJ6owg7JcsddbV5LfGO8kJNpbpnCmUnIBpJrt99JRjxmcrR5nN0fQE2guwioXD0qOn95hdc9aWZBcpCvo6VrI863UBCH9b9KnaR94a5k19OXYrpOmTbyxWyssjAiq3otpS4ztHZuFTODaujSqCvmeQpO2lObk',2,'Safari Zone','ticket51','fdt9iL1d0BLb370eRNyv7Iu8T64tdYD9PnXd642P','2020-08-07 12:01:48'),('Btd5P2RFPDGeoR7QG83aeQzfGE5WjnVH8gTbqTAlv1vFqiCyIXqlrzTV5WCB2NjTRxvm0LSN6ckGepMRPlCgP40f3mpF6qqkcAuxRkML9fMp3PWha2RzfBz76DJ802tYKsYNaru3IknmqGWpagYf7ugzEcsStsYIBbT7Ngp6ac2hlPgNGvgBXZnA8N5UtkoftRnbdb2A',2,'Safari Zone','ticket34','KOB5LGI2ItNbfTZEPRQAu61KdfxDY5GLT1PMKdy8','2020-08-07 11:38:01'),('bxD8i89iSAOoL1PEPbToS4trWBi5I1oC8pofhkr4ToNG7zSPCCvkBGayy0NgssIPDGABgLK8FB8gCgcopi5ep3f7ZiQVPlNiZO0Elq6RjR3neQCO0YJphtACTOBzTfGwjvoXr3Scc7nnHllIcVGednvge4FM7E0y2cl9cQoVKSZ43qvKyy1HhFe8E1aahNlnj6Y3r6sF',2,'Safari Zone','ticket37','SND734hBHXFKILVNIZfDAWDER7kKP6iMbIWpXDi1','2020-08-07 11:41:24'),('dJk3NKrSj9n9TwIOfIHE4OyqvDvu355KQSrx2bzBvQvMEbrfyQ7XiSJpF4ldU26110JbGVHKxHZSwGB51M06btqCPbosEOf6cKBTPwygyGcSnekL6dyECqwZX95aT36LR1XQwftyiqoUMFhx8MiiV1mFNLYDfJJzpNp1GYnSe7ZH9Aup5RO4l5dEoUhJcLCBwQ5rdIcX',2,'Safari Zone','ticket47','jgLcGPH2wTotsGMPMYgIh6vEBjkB1PVGBsprMpFV','2020-08-07 11:51:40'),('Dv7f8aGUbp9QbqIATziVLaDMyAyyrxXo2pog8N5HGPILaPCtavFXO18V7weShu7pHYtca3dO8vXurWEuzuHYtRtv8IfyIiGuLMYAzGW1QpB2hO8Au2jVM4yH4XZniY2HCYchVFt3UyTh4L230TIKO4zCo9yQTVUyh7Ju1AMCq6DlWhDzsCJKQaE6lMsbvnZRXYrDpp67',2,'Wine Castle','ticket15','4MkDmYRQCAiGaFQdN28KHa2crTuWaa8mBJj6sIZk','2020-08-07 11:13:26'),('dWYz5jJSq4wSxKRUKbhpqVT8xZE7jwj3D2v1L3c1emdOyWJWtd52u1yq2mPm87TM5aXe2nnkuQENBUYYNWlgM2soB75bGG9HwU6bgeUirB0SyzpZjGVKpoxPHPe3zkd99H6g4h64rtTzyPJJN4eWlbcklfXi3MWvbL85zM4yUTlswX7o5K123fQjDaBDVCy2vFmng7zz',2,'Water Park','ticket3','8Ce7ToP30xISQ7WpqQd22HVcLpI2CLBpnOtNixvu','2020-08-06 22:09:06'),('Ek7VM3o6DLHii07rniXKCp7tJ2FG9Z78Ao2RgUG5iSNT8JmQR1nHYAmkpOh3xBiyE6T4PnCqDLjwuMpU241w7eDWIc6ahnYC5nd5qOLBNpHVDSsW9xkNTqeZtbajPVlBVLeZqkwOjucoCK6uhJebIQ6zgqtcZx4DuBMN1kbyKXP0kvJjoaLJQmvloW3MgcqLltwwH5oW',2,'Spa','ticket61','i2lUrdZ0iRuz4fkxJPFG12Nl6Ttmo1LtYgkMIBjW','2020-08-07 12:09:51'),('fbVEnZKL50iDGJrlgJfzUFYpGrbGUAwGHuWcWsw1yGL11YFfEWgXmtqucaPBwAFNHcZx6mRHJbpAvHOtckWQbHLvOb2hoylpeEZTQYSwaG70w0MXNZgd287Nd3Pr5KdJpIx8DeTqCM2jPtW7YEtLKNArEhKlgcdNsIKJQet39wiW9ffheWhz2lEYtv26ApyXZ9BALWXo',2,'Water Park','ticket38','8Ko5hzlbvABIAuZOlGbZVrLfRv4vXPT5Syxz7BM4','2020-08-07 11:43:47'),('gwXESGa6vgIi1qZ1BlQ0OhDBSglgTFozWsWNBYBPT4eioYS9prGl7xpYlx5A6oU0lCX6w7fv9Oj1oqYElwJv6uVF5VzIT8WYv3inkPZa5c3SYbH5eomzdKsBErerABQboRSUUo79ZZX3D7ToNx8hrRPOEnHUOKhR95ehSSSGkkH1ujXoK2Emy9OellQVfoTVfLmNanhp',2,'Spa','ticket28','SH9qBDXnqmCZjW5LIIV02TD2oWjVIBICzMuowdD0','2020-08-07 11:27:42'),('IFNPKemSxW2TQ8VWWbMsiH2bQqO6DkVPsA7I1X5WUBBERTODWGbkGcRVWpSk8Njvmvu8sCjZJM2SwO33XtMAqRJKwBprmkoM6Wq2RNbkGH5s7IIyiGg9lomORqIffByEh8IK4Tu7a0zhgbPj2BSnSaw0E9Xc1AYjuLHzTVrbE7XhxGsdVNsGw8rz8JR9g0elAgehRBzG',2,'Spa','ticket46','jgLcGPH2wTotsGMPMYgIh6vEBjkB1PVGBsprMpFV','2020-08-07 11:51:40'),('Il0FAxOGP9NEfcgLztNG2kr0nidY3iemMwLChsfASLMAM4ogch0zVdUJcpzimFAaogihIWoRBCVpHu6OKfBqOQbHfIS7rraNyiPKjWiKIAkOtTqcJQj4VZNnmI2HjEUeeOtPaWfn3b5UGQRXoWKq7qILyBoU165PJ03re53rwuDitkw06oKAM25gHbwgS0GtREXNU6qv',2,'Safari Zone','ticket54','XINOUtbq8ievrhiNpyrGRa4ES4J4b6yCDN9nMlnJ','2020-08-07 12:05:41'),('J3BCc2IVMEbO4xoLzbmNgqhc75DDp632EB2EHKAPWVG1ySIY0Da4immQleDRJCYGmQFlkTOvRgvxm8FmDR2GIlK0OUtogWZ4T8R0RFQzKAgHU8VHJy2rTzoP49qcOLQSVyMas78OFTxJJvsYNDDpvki13YUP0QIAfuMdBUDRrKAY1uFlYDxUevht1owDa0Eo8rq3aJMS',2,'Wine Castle','ticket26','xTZ2njn2Q2CvemVyaSWgjR4cgT1oMXc53iP0QdK6','2020-08-07 11:22:47'),('jfIVVV8UCb1YITVgHYfXpgQimXizHRK1JAAIzORj3O0xV0Tuu2tJfnAJXXRigeTXXWN0XMHFTy6ux7kJJnMWHUu4e9Td81InyUBLCeUTAS62t04ynCynxV2VY0KZmZ5owCYgw7otBKQ52U0q7tO0Y4BMpKvXFSABc6CaIHkwI89fgb9IP6DEqbgdhBotMaJleqwQZPTn',2,'Spa','ticket62','xr4TXHiBCdqOifj86jPDFP5wrZDPgS7ta7d2e1nF','2020-08-07 12:10:55'),('kGSscNIh2fDewQxbMA5WSJi6sq6ZCoTq2hWuC2nGcDl3WLg4jtGUoxq1obhQ5RVwZw27ODtbqjoe3CNzDeO92KRZ9s4PJSJFJGXHi5dpo7P2WA7WcWFO1HQj5Eug0UvGX1ENWw37PidhARJipA0WuwEi2nQb2B5iqabogtaHm0MSjdusezV3goyHyfgbsOOB7C99GHDm',2,'Wine Castle','ticket10','macrHGc9oOYPyhC4sZQkKMBVFbdoP9jVxGms1met','2020-08-07 11:04:51'),('lC7N5rQgVub1wTstw4jN2xTtXlGHnFuAdFqBJJahRiFZlmv2hUJMQVoAlXwFxMGjm4VQY4G9eCHOOAMqkfO2kaNdyhDaek3SJ2oY2V3hnxJhuzKgdt5ESOI7MhOarIZE1bOfcJF9mz6kJyBCDmL2zRPkwHOPbpIzJe2WBqlztoZralXyNCTCBztdNw6IyQ0IQwRpjITx',2,'Spa','ticket4','8Ce7ToP30xISQ7WpqQd22HVcLpI2CLBpnOtNixvu','2020-08-06 22:09:06'),('lpwOcndqa8hL6NgYAirOV0BqYMBoxJfmM9WsSZ6TWa3RLyUAfbKpxSoxSIDtq7W959ntzxKXi1HG7MdbSP4QgAWGfCaRByDengUxMyHQu8U5DJcE0BYpbJyGsIc10jbiWZSu9jGeKnKh5i4RIzic2LJm832kVwQQlnblruiylQVXlYVVAxU6kTtW1dB6CuvzRbAhAQ3i',2,'Spa','ticket35','KOB5LGI2ItNbfTZEPRQAu61KdfxDY5GLT1PMKdy8','2020-08-07 11:38:01'),('MC0noDt4a1idqa31BMqgEtP9kEcvx4FQekqd7C7xSmAMkl8nDpZmZFdWCe7PJnom8HAFOwPfmRqEpxVeCZwSUkxJWgd4ByZ0YR0LT9fPxLCiXECkCGVZtR9Ke6SN2Eh0wzuQ8xSeQTC9XyyEPzAKL6OXHM3nfBz0mVXbL6VXiGvKfskoTIXHjV0Hb8GhsqEqx7dIwLdO',2,'Spa','ticket50','fdt9iL1d0BLb370eRNyv7Iu8T64tdYD9PnXd642P','2020-08-07 12:01:48'),('MZwYviMTCmMRw21uKiCUyiEXd1y9uF40sA9B1NSQtSqkWiK9v9d7Z32zrmIz7kGIOAGbiOP6HxJ7R51Gm0Hy4dcNtCB5YpLduAjOWu1s12vfBJSGwTnq5bKywN8ppguqzMAbiA94bKmuBT9x0RrNo44Tsh30P9xQYlww4zaYrrJh05QPy7sGZZIcyXKggHDVNSndqDF6',2,'Safari Zone','ticket57','0BiNpy4uQbkT4IJrxV39bVpguBPIemaWzqPtFan5','2020-08-07 12:06:52'),('nb0AIKX9Ga0kNhPYVxnIGeDDUjE1Re3kdj26YvVlgrp7sX2W6XRRy7fYBCHslskJgD6AhrbqntghuGRcEWLvEkPiRyFL6zJUkCz8iSoRRt9BsQU3C9xJcwZZD8Q8sh7BXeP7lNUq6MnwAlfTbyp13gW25bmrP1ec5taBUqsC4kgTjzXHaZOwJbAGKmP5uYcJEWG0IG9V',2,'Spa','ticket9','macrHGc9oOYPyhC4sZQkKMBVFbdoP9jVxGms1met','2020-08-07 11:04:51'),('nd8stxz2b0rLctX9wb78xgOMAmhsbKlQnW0gRfkUV3rvElnPZmLWrGdCpz6GGPoUrRbTYpbLn7gcPy5gT3YJPRpaca3g2cqld4rc6l0zJJUwTqcG0zjpib3V2EUWx1jktjPaVPXbxrYq318gb16yrqMERwah20JRjGxNvnv1kqy6Hcp0QN5MXFpv3Jeek5I6rrccQBy4',1,'Water Park','ticket7','au3xH8npQnMSOk8Stlw2Ji9RpRFhq7bIj7gAtqyO','2020-08-07 11:02:32'),('O9FtJ4ZdFidXkBz9t1rpbYJIP6OUPA0Gf2BLl5Ks9u6CgBRjeVqBq8ME2EerNgbp9b23kLy8ZMnbDhfkTMoQcD1xVvrqnT7LruqXG9wbWJ6N1L8ABzxTDOQywSnLfHwSCB2412xZH6tM4MuV503Cf5WYloU3b87xT9fJ0pOHoe1obnskx6ONu8TdH6TkTPDW1sx6LRCv',1,'Safari Zone','ticket12','macrHGc9oOYPyhC4sZQkKMBVFbdoP9jVxGms1met','2020-08-07 11:06:42'),('oDL4GuFjWyF1F4UkRotibPY798fvDimUSwrwyw9VsuhFg5Yk0uPNEfV1uOC9Z13wqcbdPMyPwA1POLLo6Z75gqSeIBP4tX5AKDAmfVWx5CgWRe13ADiOPC2RxBCrnZqUR9z9Is7vRykdpLFpH0WJurEvLNeBGjw1eQTJ9V4nhhVlT3tssybFcOtHU5GjoO4dRTJemo69',2,'Water Park','ticket36','SND734hBHXFKILVNIZfDAWDER7kKP6iMbIWpXDi1','2020-08-07 11:41:24'),('OuZY0wltm0DJFvrPKdWtwe06pQwD6vyEDwerI9tc6QqvVpekBYFAUlhUOmrzy1it0J9XRRhj37xIJ94u9AGbYskI9M1O141gRBKsfMhpoC5w6GoZiNI5kgQRKDTKypVK49vbZuYyNu2rlVyjOGQMo4KAa1KfrAeQCdyKWEYCNNPte2sJ0w7ffBS3r1jhYctd5Sr6Xx4z',2,'Water Park','ticket23','Kve4oP03DCcmAuzfsarYI9DEsDRYUupuzViKuihz','2020-08-07 11:21:43'),('pAMfFbjE0229BvoNjjwVyTngsAChoUoBxasbvSoPrLCL9uMm2CdhfVBO5mHybl6MbQt4debFyIHuAhEipv22cbSvhTxImbhc8JX1qyvpy18e94RVzXeXwSmxK8Eia9eHZF5n2lC0XqJCXcn5WemPEqcxft1syJkx1qxLByUvx5lt76IVneW98mrk7fqzF1YdB3E8RzCQ',2,'Water Park','ticket52','RHPPFMfoOTcZYcx1Si44EZEEj9EDFOdHP8mMKEBu','2020-08-07 12:04:33'),('PGFPgwwB8pfoMAjT41Ni8VPgo4GGzC8wDRcB43OjKXctoZvAX9RF5k55vA0aAbtpdAD4vBQJ8KwNMCYYiIvHDaMdhS6RUNRz3e3ScP1hYh3CN2p6g2SycD77Y2BtFUrZqeQz1fZ7eULKKAiyT3im5b1bcb1SIQEHjrmQcINuhGOIcOtLy9E0x5bDKPAgvuMk0gY49S5G',2,'Spa','ticket19','1xKwKRZ01HbpXkqxJk9T3clD8jLgoPy3KJ1ds3ZK','2020-08-07 11:16:47'),('Pqr42w3SamoZY8RizDfidblScfScypyJxCQsqF096Cod1U7Xvt5k0llYLGKTNQqCg6LmF84Al7bJ2cDoSHwiZkiIQyochuFKuu3cp8iP8XShafaZqtpXtn1SgnTYS0TyiHd6MIwKYLFc8urbXt90wG3w4mAHgHhQXVqFfS42RbKMz0RvZEkFvWuUzGgW2mAILVgILZ4o',2,'Water Park','ticket55','XINOUtbq8ievrhiNpyrGRa4ES4J4b6yCDN9nMlnJ','2020-08-07 12:05:41'),('qeht1TaqoCfCT6vng4qC0IDNI05EOKLatAu1OfudxxwLVMqxGJhOhzXPHJnazEhk1nuXLQsSc2d9ioHRRa6rzCA0fuCDFjzfhZ1pV12zc2BbdUhPMAmgGA6JWaLWHuwBSqPxdsKxivK4z22rbRciD4ZzqIOJLSsCccGBQR0U9goHaahKw2Srue2m0IR79TuYVLQSXPgF',2,'Water Park','ticket66','UbM3NghBkshbjcEQgZfjT7yRMvQChat2hilXJG1L','2020-08-07 12:13:40'),('Qgw8e8Bn556Q1FovM3exRkuZ0hENnZJhIKZWTclIB6cvqldG0yMjmpG8Ki3cIs9ygWwgn9Byy31mLyyCOfKd9z0e3v48mMyCp55cFWYYadiLRDYlQQvuh0UEQrwkqnrHIUnpxGMKCV0JBE9FARvDOXQgEey0Qmgp8QKNcgyfV2iva8ooC1kGuvCyDB3nHcJYCemvljlu',2,'Water Park','ticket60','i2lUrdZ0iRuz4fkxJPFG12Nl6Ttmo1LtYgkMIBjW','2020-08-07 12:09:51'),('qL8nG52qGGXgjuJMjPSAJR38GEBvnxAnZGrU3m638ASg3zYSKB9uWONcC5XGg5JVgvzsOa7YDAz5bUyzdk3ur1pmI1GID1kqDMXnsMHvRZbpYeWMq3MwB0QtebAppOw9dU7GI6WjqHRgPdsGhgaMia9UwgZs3IT1YUrdeqC3NmIWxytrX534xqZ9BQHV8cFwpwnE9vSD',2,'Water Park','ticket44','jqvtokZAkyzxlAzKIvtrJlmK52dKEIo12TJN3NAj','2020-08-07 11:49:59'),('qQzhMuykbB50JpxKa5PpnbAfYLVidDpb9V4fCWwHJNccxbiCddFxOczm5u8h8IQ5ea01IHFeMVemLdR9omexFobXplVyrT750bP7ZuyIy1Sj5fMUznSlfEkBbKCfx3A5JHfJmHlrbvrE4QZM1UyIS3W0AgSXEAmfo41GFM4f99dFZvKPIkgWyD7bHoDD26NPOvs2gQiT',3,'Safari Zone','ticket24','Kve4oP03DCcmAuzfsarYI9DEsDRYUupuzViKuihz','2020-08-07 11:21:43'),('rQ0NFV2rGbnKtCKKsndfPXMDGOgHgDGq3Q2tAXcvuNjAcJM9BdY6JNvxZNrsw6dg48he36M2h60swCXRnLYRfr0yLkDWdP03wRnakd4iDeWxMpbAQAb2RorrvkEeIbvgpfUG56RWqCQBTKjV0Qkj9t05FeQlxPj3bCh2DnM5DILY4bg6e5SoCVBslKKZs4piMtdPOLOC',2,'Wine Castle','ticket49','ZwvW4l0F09EyawiqrthvxXYrx0xx8t2fv1h4AKf4','2020-08-07 11:58:13'),('rUXJO4K354T3e34C7pNPsE8CTGEokWEXzJDjGJswbZual6HOOG1CcX1yri5ocGvRh1qHbWjBm23F36ancvk3fUiYCBlc8218xaiCJdS4GcwHd9qUgKvLclnfvfNK7rgn1D1I1WYVNXa0gpbEIshobkcGDsK49lm5TBOsM6N7IUW5bP9Wrd4pQ0aqtr5QJGU9cwrOoAAW',2,'Spa','ticket53','RHPPFMfoOTcZYcx1Si44EZEEj9EDFOdHP8mMKEBu','2020-08-07 12:04:34'),('rwsgeAGS2dSIftcOCyEeQxhrGuGYhs6J8Vt9aHnylKddVJAEy8ssFwBDEhtTUtgXecgs6XI6O8Caq8TRufnNTT0zGIRmYgyJejCDNE7ylMVcuuGGpJ1BvKYwI9IWadVYraSt8Z42nO6IXcDjlTh6FWNkerV0Puo12ggJLSIqTL3MJnKcpS3bIF3BYPaiKO6MgiFfNOmR',2,'Safari Zone','ticket17','VlRKmhPtlbkGb4rmvk5VZBDRSV8PMzTNNuQTNVMc','2020-08-07 11:14:56'),('SFWCO4mT0KNFHMof6z3dZcylIjZcuSoWIeYIEa1M2Vvo1VcYF0vfGPLAWzmfEje3kfzXFHZ38Yk6NjHNVoQyI1fAmgrSG4DmBrPrIJv6AlS00K8XO0iR9XIJUL7zhjW5wq1p8w7LcP98AFyegFH0cTBcWhhf2rTL4AsEAkQPemp0fTDqQj0eoSFan0zPez6wTO0bGNCN',2,'Water Park','ticket33','1sz8npKUBJrhJosrdXVzhmH7mxE9wr00rjGZtJ1S','2020-08-07 11:33:08'),('shrSrtN3t9g26LoY9A6Vs42mKTioORqJHIfvnIOk6HHpHpMytCBNHIkQV0iEg2JbOlIdCaCF4RYbvZqgYNGQkKwYIGbK0JoOLaTfvyBaKWSx6p3PBP061BLxLFegPLO9lgvwTEEx3gXhSduMF50shZlGI6jTzWXG41WWGtfeYNMYn4K2dwPBpDaliYJXnv1czK45MYuE',1,'Safari Zone','ticket70','QHqaN1guAw53zKt540EsliRR3HmFkhQuo3rsB7Vs','2020-08-07 12:21:58'),('SQtr99DcfOD6nkaCO3kswlzuwJMtCM4firVCAhVd2tTL97n9Jo8eO6chZCP7HXFfPJ9fWfxRwPAEGzkD48dy6KbleaUhmTHFVF6kz7wfXZQrKoNz6DxFEIZu3OYBe9H4DiQSW5LH8b98CuKFlH9HtYECExf3x3e4aCXLmi5hxOoAHusph7bWHSWkcdkVbPJcYH1F4bPs',2,'Spa','ticket56','0BiNpy4uQbkT4IJrxV39bVpguBPIemaWzqPtFan5','2020-08-07 12:06:52'),('sV1vqoaEKZaDdy0cvpM0Utao38g7PgveCN625ZhJPwTHIcpMcf4wwHPjNMoI3si5GQ4tImhojhFWBYnIVcrNSVsUBge5W5ZudBUOC4lLt1YyxBeUAuk60ys04ckNBLZecSi4UTTRWUibzg4ljX69Ok2ZADclvDYp0d37u1HBKw6wtEPIpLNwYNzuNOkTgQVfhKDq0nMV',1,'Wine Castle','ticket5','8Ce7ToP30xISQ7WpqQd22HVcLpI2CLBpnOtNixvu','2020-08-06 22:12:31'),('SWEezn4Cs5svWG4BycZDYUx0Tdn9gJ2jaZkJW2Gh7OcF2tGg24OCEGjCQTJG007GmCnOrUNQoEMOpBS7jzWHGpFiAVcqUJvUtPlNXF2Xc1gdaSx97ax757n2FVUtFIC6omihaWtqbXSwUuQgT8WD0UoqZDKQOg0OaSjnJ8Z8zbd7bMyw3YoJt5YQ0GB07kLqBVywQWKA',2,'Spa','ticket39','8Ko5hzlbvABIAuZOlGbZVrLfRv4vXPT5Syxz7BM4','2020-08-07 11:43:47'),('sYMDiYQp3xqibshkOsPAigmpG28UecRxLl1ZoXix97hO3efly1tkbMObqDxVoHzCVmFYbcpAGrTgQm7AmxXcXDMGOmEQQCAKubcdU7HhnHdnn1qThvh7ZcEVwaApbT4rZDBDuQzZqWfucvwqLvJdvUfajPSOJZ108YGGUPRuKk9NJDUjiNPNJHXuQElodSnKBxUHKVuC',2,'Water Park','ticket64','pcMiOcJ5uNibnr5fZWEhCpQbnAD0PjGJIsmozBlg','2020-08-07 12:11:56'),('UcR8AXsnBAsm2XgpPUsIX1nSkx43N1t7cA89icd3OCSotjpUsIwTTy8mzmRdlWxgqTSdxhONzIp6bDDuEAgLZVi4ZT9jWZIkWQtDwIOOOuTy0rLkfzhru0TN2U3e67ArzYTLqPmOlNB02jKqCEt15TWAnMmzlNLkpv0if9FizoRfswjlu1ZBKjx23evx4QwdaxCZEvrO',2,'Water Park','ticket27','GjQpgD88ABiby33gPwfZ7DOQudsXBbv07aBcaEO8','2020-08-07 11:26:24'),('UEjkDONq2XXQyZ43HxBIzT8gMLuj3bJqlTkPELrxjN3mcrnzKm2KQrNOtUrR6y6tHEkzzm6uUbVSqguqgBJ6BerMxcXKbXet4H07yihmmk4V9aevFs4DYxmSAbP4TQBhPugtQnNRXA3DuhhJyZcX8NM3R9HoJkNktQaM2ZGdYcaj4GNRQAh6RrSNw9VLgwBsbltDKBaZ',2,'Spa','ticket42','uYGhwYpJKGxsWAmmgnHmUMOwvtH9zFfSXdnUKR1o','2020-08-07 11:47:20'),('uJsqNkSqqeJSKkJ1guBpqR8Noz0ytHlO7HlH9s3vGqck0sXAsRK227NGQf8HJoSAI0iHaveakK782TWfGrDBDdE367dcFAnUlLHs8zdY0g3RNOZmJ9AvWLnZo6Y4cbgkYTCVk6B0DgFlNCMd7RrHS8fLhc5DfgnQ4f9OeF7hVFC1G5n5Ha8q20EIb9MoRQ5PlDqgPewT',1,'Spa','ticket22','vzXsH3iInpIl6njRkZEFySql12MbVpsTPH0oQdwS','2020-08-07 11:18:25'),('ukrTFKf49C3NgPg8T0qlefOHiSmXC1balTf6u6oslXSWYPNOiqWN1aWpU13B9SzSylil1qVTqodq1Rvc1snxwqT3aKqQtf2Lwbn0JspdAKwjdmDG5FLEuH8qs9n6dmvGu0boXv5ACvG6HUmjILbOcybhTTh5YApaxiKz1xqAhM1SNxdpG1wlyYbvKaXb9jkBTxoE15Bx',1,'Spa','ticket2','8Ce7ToP30xISQ7WpqQd22HVcLpI2CLBpnOtNixvu','2020-08-06 21:56:57'),('uV4hQgtbC5FhrSCnnJiEyl2MfQzTSyruDcHrUUaQVvLpiyFyvBXZyCatIvlXXp1qCkHEFYCLFAvZsLy194AR3a1jYnfOisswMJXttMoCqgxOlJ8nDesHmiChaG6h8yk0ohGxsHLRtjrRfzZvRTc47JdVnIwXzIZuSor5hCMV5rdtBwz1DAh2XCNlhr2nGv6QarcV95C4',2,'Water Park','ticket25','xTZ2njn2Q2CvemVyaSWgjR4cgT1oMXc53iP0QdK6','2020-08-07 11:22:47'),('viJ59vcTjv2xnwcv8Y1N824OOoq9tRGu6QgRZoROV2ovu5BVfNtmoX1sB17RUDlEa5Vi7gklLfhByz3II5y4uCSZb7bOfstibTerdky2cW4KOWGpz7Ev9vKUckDWdzYX2QY5KWXw5s2x1OVkpLr5HJ2FXEQHd2vYIEJe95MCUDSMxjMQknrmL9Tqe5GrrZquWqNBEIpu',2,'Spa','ticket32','1sz8npKUBJrhJosrdXVzhmH7mxE9wr00rjGZtJ1S','2020-08-07 11:33:08'),('VVgOVog0gkJ1yJceKt7N6k6c0hX6zsuEWId6zNBtpFQ5SyUrivFJpO1duaU1JJRvfV8cjThUXPdN84yxHA7uh7g2usahY6ocQzaGYVIdO0LZoFPuhFXNWLZmuLFNRNX265JnV5stFHrQv0bjEWzXeSjPVbdygSzfwoTAQCyFtOED5b2AOYHd2AqUbYdIn6dpUOzL8W2b',2,'Wine Castle','ticket31','vVRsp4dYOyvZjVqA6fsA9GXLzz2MCpurVwH23alz','2020-08-07 11:29:20'),('wdUYCYtcLfTsN93QEnAIRPylptHXUrJcsaKMMaUKqOlonwVLytVg6bkHrPaouEiDEtiUrMYxnb2MrcAmUH0vbzoTcjajtVcN25oIV5dqMsw4V0rjRwYBMpnzRgrFjnuKknSlZovR075sNMRFU4LTEKdbJknDgub1T4BL2jlIfvoETD1VGaI9gQr2RwKkAy8pVYQ2OL5p',2,'Water Park','ticket58','aZE8kKQd7OFexDKZe440sgb3GVsou2XN1ib2cJev','2020-08-07 12:08:05'),('wEvQZAhfkbLMu1RQCVHI3kFvjqm8Bp4OeI7zyI29J2yMBwwWP8io4UwVdMunKl9k7MHg9lKQnOBJt1j1FQsV9zLW9J09SPaIBJWB0HD6tp6PxnMro0bZhcpHHrQj0SDjZDczg50uCSK26DOOdAcJ8uK3BSkK0Nv5RLEXyYTCmuEbWnH68FiY0LQGlgb8O14gwJebebOu',2,'Spa','ticket67','vdBcCwbsAZam7oQTUSi0G7Mm4APh74DO2RGJca8O','2020-08-07 12:14:49'),('WOiVTbU7zfitgHBzCyiXDqFZtq7j2IB2jQcbAF13cXU1Utq1H5GCpd6tqkB4WqkNCaGSlgIfW41s5lCD7JTw10T4FKCTr1kaRnHjby21hyOaXCivNOgKrA0oXy0btJz2oAaxEjV5LVUvTL1DgGcJqDL5mUElp2nem6vwgTevC5hKFbMCriahyQEdA7cjuLLUL58DqBEJ',2,'Water Park','ticket68','vdBcCwbsAZam7oQTUSi0G7Mm4APh74DO2RGJca8O','2020-08-07 12:14:49'),('WvlTTROoCFQpGaBX2dLBzPxFX1RU2cMwN24MkrdHTKBUthpmO98zwrE3QeC4RgC9hs1abm2DMroQkQw9QXk4DEiS5K4i7au7FmnQKZvxiBBLWo8Qu48bGQdfqLRJhoXAMrMOPpsCoB2KJefEF6WgcdbWdpk9KaIPgatfXvjgPPGaG8Z7MurBtLDrl1rSYlI9a5ivzSLt',1,'Water Park','ticket69','QHqaN1guAw53zKt540EsliRR3HmFkhQuo3rsB7Vs','2020-08-07 12:21:58'),('xFR1FIOy8DGUsWae7l2xJGmj2OxEvJwJcOgTa7Vx2Q54QbTTKa0iETzJw9xkmEJp5kYotD4GvyIKl4yEBtgWmmtxLUClB2hBJd8xqI5LNwXLW2iGInB77jLjaijJKJ0CmFA1ecxCU08NwwVQmhb99t76Zjw2YQaAPcNsYTTzq5i1rzJYYluiZPeUJ28hAfWLR8QDBISq',1,'Water Park','ticket21','vzXsH3iInpIl6njRkZEFySql12MbVpsTPH0oQdwS','2020-08-07 11:18:25'),('y0Z0zAc8Xzh5QD8jqdkQ7jDhTm5xOfzYOXg5R1YrDhW3z8ghEjCqyNEWYUrLX9suSvZJhyv0NFyPtwUh5aB0G1zp5ZCljfY243vjNwbVvWQzxc5eN9SGzExQSwhkAlGIIYRcCgSxiUsiNfV0zYW4sg5ObRj97NJakFOvD5k35hqsdyUtWk0qPTEKLwVllyg3KOfeGtDX',2,'Wine Castle','ticket41','ZF4HOhj0XVFNRpWLPZoJpsJ6PTCgxWUzb8Bhaggr','2020-08-07 11:46:02'),('Ye2l7kxeKIxaN1TdN3uScioBvLDnfBbJSWfgU3WZHRX9TzYtPCn3iK0PscoxJFbJ4poI8f2yhH6kOMhV5XmHnlZducMviuSA72JUBvJnReptzWrDyMhMGDf7eprnUF2SbCklb0hsKTf4lJ7Txo5XxZG2J0LQuPr1lteI1TjAcNr6OBVuhJwJmcFOOZPZcuPQ0XnsvqBH',1,'Water Park','ticket16','4MkDmYRQCAiGaFQdN28KHa2crTuWaa8mBJj6sIZk','2020-08-07 11:13:26'),('z8GK9fpLwdEXg9RGYYg5HXJLuc1bN22wF6Gtd8JBRWW5nY0z3VScjjBWPRWQp6tnGyEsTQpZOcusERo9z6WMvcJYD3nSfi32900hK0oeIcKfsLLuG7bldDAC9aGrpW53iBfk5MIRQs6422pnEYduFiXf5BtR9Rso0i8j9WXPo6YGhDnT8VjV766wzc7YMknYV1kxshwf',1,'Wine Castle','ticket13','yKOGQkQ0hdE5HAiNuhJ1AEpgAnyRvH8AkJoEzw70','2020-08-07 11:11:36');
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
-- Dumping events for database 'prj4db'
--

--
-- Final view structure for view `history`
--

/*!50001 DROP VIEW IF EXISTS `history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
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

-- Dump completed on 2020-08-07 14:38:05
