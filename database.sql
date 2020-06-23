USE [Project4DB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/20/2020 6:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[CreateDay] [datetime] NULL,
	[RoleID] [int] NULL,
	[CurrentQR] [varchar](100) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Account_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 6/20/2020 6:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[ImagePath] [nvarchar](500) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QRCode]    Script Date: 6/20/2020 6:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QRCode](
	[QRCodeID] [varchar](100) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[IdentityCard] [varchar](50) NULL,
	[EmailSendedTo] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[CheckinDate] [datetime] NULL,
	[CheckoutDate] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
	[CurrentAdult] [int] NULL,
	[CurrentChildren] [int] NULL,
	[CurrentRoomNumber] [nvarchar](50) NULL,
	[DownPayment] [float] NULL,
	[ImagePath] [varchar](500) NULL,
 CONSTRAINT [PK_QRCode] PRIMARY KEY CLUSTERED 
(
	[QRCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 6/20/2020 6:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[ReceiptID] [int] IDENTITY(1,1) NOT NULL,
	[PayDate] [datetime] NULL,
	[Subtotal] [float] NULL,
	[Tax] [float] NULL,
	[Total] [float] NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[PayStatus] [bit] NULL,
	[QRCode] [varchar](100) NULL,
 CONSTRAINT [PK_Receipt] PRIMARY KEY CLUSTERED 
(
	[ReceiptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceiptComponent]    Script Date: 6/20/2020 6:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceiptComponent](
	[ReceiptComponentID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NULL,
	[Quantity] [int] NULL,
	[Subtotal] [float] NULL,
	[ReceiptID] [int] NULL,
 CONSTRAINT [PK_ReceiptComponent] PRIMARY KEY CLUSTERED 
(
	[ReceiptComponentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/20/2020 6:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 6/20/2020 6:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomID] [nvarchar](50) NOT NULL,
	[RoomTypeID] [int] NULL,
 CONSTRAINT [PK_Room_1] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomImage]    Script Date: 6/20/2020 6:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomImage](
	[RoomImgID] [int] IDENTITY(1,1) NOT NULL,
	[RoomTypeID] [int] NULL,
	[ImagePath] [varchar](500) NULL,
 CONSTRAINT [PK_RoomImage] PRIMARY KEY CLUSTERED 
(
	[RoomImgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 6/20/2020 6:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[RoomTypeID] [int] IDENTITY(1,1) NOT NULL,
	[RoomTypeName] [nvarchar](70) NULL,
	[AvailableNum] [int] NULL,
	[RoomTypePrice] [float] NULL,
	[MaximumAdultCapacity] [int] NULL,
	[MaximumChildrenCapacity] [int] NULL,
	[LocationID] [int] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 6/20/2020 6:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceTypeID] [int] NULL,
	[ServiceName] [nvarchar](50) NULL,
	[ServicePrice] [float] NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceType]    Script Date: 6/20/2020 6:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceType](
	[ServiceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_ServiceType] PRIMARY KEY CLUSTERED 
(
	[ServiceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_CreateDay]  DEFAULT (getdate()) FOR [CreateDay]
GO
ALTER TABLE [dbo].[QRCode] ADD  CONSTRAINT [DF_Table_1_QRCode]  DEFAULT (newid()) FOR [QRCodeID]
GO
ALTER TABLE [dbo].[QRCode] ADD  CONSTRAINT [DF_QRCode_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[QRCode] ADD  CONSTRAINT [DF_QRCode_Status]  DEFAULT ('deactive') FOR [Status]
GO
ALTER TABLE [dbo].[Receipt] ADD  CONSTRAINT [DF_Receipt_Status]  DEFAULT ((0)) FOR [PayStatus]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_QRCode] FOREIGN KEY([CurrentQR])
REFERENCES [dbo].[QRCode] ([QRCodeID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_QRCode]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[QRCode]  WITH CHECK ADD  CONSTRAINT [FK_QRCode_Room] FOREIGN KEY([CurrentRoomNumber])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[QRCode] CHECK CONSTRAINT [FK_QRCode_Room]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [FK_Receipt_QRCode] FOREIGN KEY([QRCode])
REFERENCES [dbo].[QRCode] ([QRCodeID])
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [FK_Receipt_QRCode]
GO
ALTER TABLE [dbo].[ReceiptComponent]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptComponent_Receipt] FOREIGN KEY([ReceiptID])
REFERENCES [dbo].[Receipt] ([ReceiptID])
GO
ALTER TABLE [dbo].[ReceiptComponent] CHECK CONSTRAINT [FK_ReceiptComponent_Receipt]
GO
ALTER TABLE [dbo].[ReceiptComponent]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptComponent_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ServiceID])
GO
ALTER TABLE [dbo].[ReceiptComponent] CHECK CONSTRAINT [FK_ReceiptComponent_Service]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomType] FOREIGN KEY([RoomTypeID])
REFERENCES [dbo].[RoomType] ([RoomTypeID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_RoomType]
GO
ALTER TABLE [dbo].[RoomImage]  WITH CHECK ADD  CONSTRAINT [FK_RoomImage_RoomType] FOREIGN KEY([RoomTypeID])
REFERENCES [dbo].[RoomType] ([RoomTypeID])
GO
ALTER TABLE [dbo].[RoomImage] CHECK CONSTRAINT [FK_RoomImage_RoomType]
GO
ALTER TABLE [dbo].[RoomType]  WITH CHECK ADD  CONSTRAINT [FK_RoomType_Location] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[RoomType] CHECK CONSTRAINT [FK_RoomType_Location]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_ServiceType] FOREIGN KEY([ServiceTypeID])
REFERENCES [dbo].[ServiceType] ([ServiceTypeID])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_ServiceType]
GO
