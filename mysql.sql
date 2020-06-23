Create database `Project4DB`;
USE `Project4DB`;
 
/****** Object:  Table [dbo].[Account]    Script Date: 6/20/2020 6:39:48 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Account(
	`AccountID` int AUTO_INCREMENT NOT NULL,
	`Email` varchar(50) NULL,
	`Password` varchar(50) NULL,
	`CreateDay` datetime(3) NULL,
	`RoleID` int NULL,
	`CurrentQR` varchar(100) NULL,
 CONSTRAINT `PK_Account` PRIMARY KEY 
(
	`AccountID` ASC
) ,
 CONSTRAINT `IX_Account_Email` UNIQUE 
(
	`Email` ASC
) 
);
/****** Object:  Table [dbo].[Location]    Script Date: 6/20/2020 6:39:48 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Location(
	`LocationID` int AUTO_INCREMENT NOT NULL,
	`LocationName` nvarchar(50) NULL,
	`Description` nvarchar(500) NULL,
	`ImagePath` nvarchar(500) NULL,
 CONSTRAINT `PK_Location` PRIMARY KEY 
(
	`LocationID` ASC
) 
);
/****** Object:  Table [dbo].[QRCode]    Script Date: 6/20/2020 6:39:48 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE QRCode(
	`QRCodeID` varchar(100) NOT NULL,
	`CustomerName` nvarchar(50) NULL,
	`IdentityCard` varchar(50) NULL,
	`EmailSendedTo` varchar(50) NULL,
	`CreateDate` datetime(3) NULL,
	`CheckinDate` datetime(3) NULL,
	`CheckoutDate` datetime(3) NULL,
	`Status` nvarchar(50) NULL,
	`CurrentAdult` int NULL,
	`CurrentChildren` int NULL,
	`CurrentRoomNumber` nvarchar(50) NULL,
	`DownPayment` Double NULL,
	`ImagePath` varchar(500) NULL,
 CONSTRAINT `PK_QRCode` PRIMARY KEY 
(
	`QRCodeID` ASC
) 
);
/****** Object:  Table [dbo].[Receipt]    Script Date: 6/20/2020 6:39:48 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Receipt(
	`ReceiptID` int AUTO_INCREMENT NOT NULL,
	`PayDate` datetime(3) NULL,
	`Subtotal` Double NULL,
	`Tax` Double NULL,
	`Total` Double NULL,
	`PaymentMethod` nvarchar(50) NULL,
	`PayStatus` Tinyint NULL,
	`QRCode` varchar(100) NULL,
 CONSTRAINT `PK_Receipt` PRIMARY KEY 
(
	`ReceiptID` ASC
) 
);
/****** Object:  Table [dbo].[ReceiptComponent]    Script Date: 6/20/2020 6:39:48 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE ReceiptComponent(
	`ReceiptComponentID` int AUTO_INCREMENT NOT NULL,
	`ServiceID` int NULL,
	`Quantity` int NULL,
	`Subtotal` Double NULL,
	`ReceiptID` int NULL,
 CONSTRAINT `PK_ReceiptComponent` PRIMARY KEY 
(
	`ReceiptComponentID` ASC
) 
);
/****** Object:  Table [dbo].[Role]    Script Date: 6/20/2020 6:39:48 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Role(
	`RoleID` int AUTO_INCREMENT NOT NULL,
	`RoleName` nvarchar(50) NULL,
 CONSTRAINT `PK_Role` PRIMARY KEY 
(
	`RoleID` ASC
) 
);
/****** Object:  Table [dbo].[Room]    Script Date: 6/20/2020 6:39:48 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Room(
	`RoomID` nvarchar(50) NOT NULL,
	`RoomTypeID` int NULL,
 CONSTRAINT `PK_Room_1` PRIMARY KEY 
(
	`RoomID` ASC
) 
);
/****** Object:  Table [dbo].[RoomImage]    Script Date: 6/20/2020 6:39:48 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE RoomImage(
	`RoomImgID` int AUTO_INCREMENT NOT NULL,
	`RoomTypeID` int NULL,
	`ImagePath` varchar(500) NULL,
 CONSTRAINT `PK_RoomImage` PRIMARY KEY 
(
	`RoomImgID` ASC
) 
);
/****** Object:  Table [dbo].[RoomType]    Script Date: 6/20/2020 6:39:48 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE RoomType(
	`RoomTypeID` int AUTO_INCREMENT NOT NULL,
	`RoomTypeName` nvarchar(70) NULL,
	`AvailableNum` int NULL,
	`RoomTypePrice` Double NULL,
	`MaximumAdultCapacity` int NULL,
	`MaximumChildrenCapacity` int NULL,
	`LocationID` int NULL,
 CONSTRAINT `PK_Room` PRIMARY KEY 
(
	`RoomTypeID` ASC
) 
);
/****** Object:  Table [dbo].[Service]    Script Date: 6/20/2020 6:39:48 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Service(
	`ServiceID` int AUTO_INCREMENT NOT NULL,
	`ServiceTypeID` int NULL,
	`ServiceName` nvarchar(50) NULL,
	`ServicePrice` Double NULL,
 CONSTRAINT `PK_Service` PRIMARY KEY 
(
	`ServiceID` ASC
) 
);
/****** Object:  Table [dbo].[ServiceType]    Script Date: 6/20/2020 6:39:48 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE ServiceType(
	`ServiceTypeID` int AUTO_INCREMENT NOT NULL,
	`ServiceTypeName` nvarchar(50) NULL,
 CONSTRAINT `PK_ServiceType` PRIMARY KEY 
(
	`ServiceTypeID` ASC
) 
);
ALTER TABLE `project4db`.`Account` ALTER `CreateDay` SET DEFAULT (now());
ALTER TABLE `project4db`.`QRCode` ALTER `QRCodeID` SET DEFAULT (uuid());
ALTER TABLE `project4db`.`QRCode` ALTER `CreateDate` SET DEFAULT (now());
ALTER TABLE `project4db`.`QRCode` ALTER `Status` SET DEFAULT ('deactive');
ALTER TABLE `project4db`.`Receipt` ALTER `PayStatus` SET DEFAULT ((0));

ALTER TABLE `project4db`.`Account` ADD CONSTRAINT `FK_Account_QRCode` FOREIGN KEY (`CurrentQR`) REFERENCES QRCode(`QRCodeID`);

ALTER TABLE `project4db`.`Account` ADD CONSTRAINT `FK_Account_Role` FOREIGN KEY (`RoleID`) REFERENCES Role(`RoleID`);

ALTER TABLE `project4db`.`QRCode` ADD CONSTRAINT `FK_QRCode_Room` FOREIGN KEY (`CurrentRoomNumber`) REFERENCES Room(`RoomID`);

ALTER TABLE `project4db`.`Receipt` ADD CONSTRAINT `FK_Receipt_QRCode` FOREIGN KEY (`QRCode`) REFERENCES QRCode(`QRCodeID`);

ALTER TABLE `project4db`.`ReceiptComponent` ADD CONSTRAINT `FK_ReceiptComponent_Receipt` FOREIGN KEY (`ReceiptID`) REFERENCES Receipt(`ReceiptID`);

ALTER TABLE `project4db`.`ReceiptComponent` ADD CONSTRAINT `FK_ReceiptComponent_Service` FOREIGN KEY (`ServiceID`) REFERENCES Service(`ServiceID`);

ALTER TABLE `project4db`.`Room` ADD CONSTRAINT `FK_Room_RoomType` FOREIGN KEY (`RoomTypeID`) REFERENCES RoomType(`RoomTypeID`);

ALTER TABLE `project4db`.`RoomImage` ADD CONSTRAINT `FK_RoomImage_RoomType` FOREIGN KEY (`RoomTypeID`) REFERENCES RoomType(`RoomTypeID`);

ALTER TABLE `project4db`.`RoomType` ADD CONSTRAINT `FK_RoomType_Location` FOREIGN KEY (`LocationID`) REFERENCES Location(`LocationID`);

ALTER TABLE `project4db`.`Service` ADD CONSTRAINT `FK_Service_ServiceType` FOREIGN KEY (`ServiceTypeID`) REFERENCES ServiceType(`ServiceTypeID`);

