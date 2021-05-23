USE [master]
GO
/****** Object:  Database [ASG1FA_BOOKINGHOTELDB]    Script Date: 19-May-21 5:36:48 PM ******/
CREATE DATABASE [ASG1FA_BOOKINGHOTELDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ASG1FA_BOOKINGHOTELDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ASG1FA_BOOKINGHOTELDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ASG1FA_BOOKINGHOTELDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ASG1FA_BOOKINGHOTELDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASG1FA_BOOKINGHOTELDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET  MULTI_USER 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ASG1FA_BOOKINGHOTELDB', N'ON'
GO
USE [ASG1FA_BOOKINGHOTELDB]
GO
/****** Object:  Table [dbo].[RentedRoom]    Script Date: 19-May-21 5:36:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentedRoom](
	[RentedRoomID] [int] IDENTITY(1,1) NOT NULL,
	[RR_RoomID] [int] NOT NULL,
	[RR_UserID] [int] NOT NULL,
	[RR_CheckinDate] [date] NOT NULL,
	[RR_CheckoutDate] [date] NOT NULL,
	[RR_Status] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[RentedRoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 19-May-21 5:36:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Rl_Name] [nvarchar](500) NOT NULL,
	[Rl_Status] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 19-May-21 5:36:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[R_RoomTypeID] [int] NOT NULL,
	[R_Status] [bit] NOT NULL DEFAULT ((1)),
	[R_Number] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoomTypes]    Script Date: 19-May-21 5:36:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomTypes](
	[RoomTypeID] [int] IDENTITY(1,1) NOT NULL,
	[RT_Name] [nvarchar](500) NOT NULL,
	[RT_Status] [bit] NOT NULL DEFAULT ((1)),
	[RT_Quality] [int] NULL,
	[RT_Price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 19-May-21 5:36:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[U_Username] [nvarchar](50) NOT NULL,
	[U_Password] [varbinary](max) NOT NULL,
	[U_Name] [nvarchar](max) NOT NULL,
	[U_Phone] [char](10) NOT NULL,
	[U_RoleID] [int] NOT NULL DEFAULT ((1)),
	[U_Status] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[RentedRoom] ON 

INSERT [dbo].[RentedRoom] ([RentedRoomID], [RR_RoomID], [RR_UserID], [RR_CheckinDate], [RR_CheckoutDate], [RR_Status]) VALUES (33, 3, 3, CAST(N'2021-05-19' AS Date), CAST(N'2021-05-20' AS Date), 1)
INSERT [dbo].[RentedRoom] ([RentedRoomID], [RR_RoomID], [RR_UserID], [RR_CheckinDate], [RR_CheckoutDate], [RR_Status]) VALUES (34, 4, 3, CAST(N'2021-05-19' AS Date), CAST(N'2021-05-20' AS Date), 1)
INSERT [dbo].[RentedRoom] ([RentedRoomID], [RR_RoomID], [RR_UserID], [RR_CheckinDate], [RR_CheckoutDate], [RR_Status]) VALUES (35, 5, 3, CAST(N'2021-05-19' AS Date), CAST(N'2021-05-20' AS Date), 1)
INSERT [dbo].[RentedRoom] ([RentedRoomID], [RR_RoomID], [RR_UserID], [RR_CheckinDate], [RR_CheckoutDate], [RR_Status]) VALUES (36, 6, 3, CAST(N'2021-05-19' AS Date), CAST(N'2021-05-20' AS Date), 1)
INSERT [dbo].[RentedRoom] ([RentedRoomID], [RR_RoomID], [RR_UserID], [RR_CheckinDate], [RR_CheckoutDate], [RR_Status]) VALUES (37, 7, 3, CAST(N'2021-05-19' AS Date), CAST(N'2021-05-20' AS Date), 1)
INSERT [dbo].[RentedRoom] ([RentedRoomID], [RR_RoomID], [RR_UserID], [RR_CheckinDate], [RR_CheckoutDate], [RR_Status]) VALUES (38, 8, 3, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-21' AS Date), 1)
INSERT [dbo].[RentedRoom] ([RentedRoomID], [RR_RoomID], [RR_UserID], [RR_CheckinDate], [RR_CheckoutDate], [RR_Status]) VALUES (39, 9, 3, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-21' AS Date), 1)
SET IDENTITY_INSERT [dbo].[RentedRoom] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [Rl_Name], [Rl_Status]) VALUES (1, N'Customer', 1)
INSERT [dbo].[Roles] ([RoleID], [Rl_Name], [Rl_Status]) VALUES (2, N'Administrator', 1)
INSERT [dbo].[Roles] ([RoleID], [Rl_Name], [Rl_Status]) VALUES (3, N'Hotel Clerk', 1)
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (3, 1, 0, 1)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (4, 1, 1, 2)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (5, 1, 1, 3)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (6, 1, 1, 4)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (7, 1, 1, 5)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (8, 2, 1, 6)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (9, 2, 1, 7)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (10, 2, 1, 8)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (11, 2, 1, 9)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (12, 2, 1, 10)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (13, 3, 1, 11)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (14, 3, 1, 12)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (15, 3, 1, 16)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (16, 3, 1, 14)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (17, 3, 1, 15)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (18, 4, 1, 17)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (19, 4, 1, 18)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (20, 4, 1, 19)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (21, 4, 1, 20)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (22, 4, 1, 21)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (23, 5, 1, 22)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (24, 5, 1, 23)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (25, 5, 1, 24)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (26, 5, 1, 25)
INSERT [dbo].[Rooms] ([RoomID], [R_RoomTypeID], [R_Status], [R_Number]) VALUES (27, 5, 1, 26)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
SET IDENTITY_INSERT [dbo].[RoomTypes] ON 

INSERT [dbo].[RoomTypes] ([RoomTypeID], [RT_Name], [RT_Status], [RT_Quality], [RT_Price]) VALUES (1, N'Single', 1, 5, 100)
INSERT [dbo].[RoomTypes] ([RoomTypeID], [RT_Name], [RT_Status], [RT_Quality], [RT_Price]) VALUES (2, N'Double', 1, 5, 200)
INSERT [dbo].[RoomTypes] ([RoomTypeID], [RT_Name], [RT_Status], [RT_Quality], [RT_Price]) VALUES (3, N'Twin', 1, 5, 200)
INSERT [dbo].[RoomTypes] ([RoomTypeID], [RT_Name], [RT_Status], [RT_Quality], [RT_Price]) VALUES (4, N'Double double', 1, 5, 400)
INSERT [dbo].[RoomTypes] ([RoomTypeID], [RT_Name], [RT_Status], [RT_Quality], [RT_Price]) VALUES (5, N'Quad', 1, 5, 500)
SET IDENTITY_INSERT [dbo].[RoomTypes] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [U_Username], [U_Password], [U_Name], [U_Phone], [U_RoleID], [U_Status]) VALUES (3, N'tranvinhan', 0x8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92, N'Tran Vi Nhan', N'1234567890', 1, 1)
INSERT [dbo].[Users] ([UserID], [U_Username], [U_Password], [U_Name], [U_Phone], [U_RoleID], [U_Status]) VALUES (4, N'admin123', 0x240BE518FABD2724DDB6F04EEB1DA5967448D7E831C08C8FA822809F74C720A9, N'ADMINISTRATOR', N'0123456789', 2, 1)
INSERT [dbo].[Users] ([UserID], [U_Username], [U_Password], [U_Name], [U_Phone], [U_RoleID], [U_Status]) VALUES (5, N'hotelclerk', 0x8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92, N'Hotel Clerk', N'0123456789', 3, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[RentedRoom]  WITH CHECK ADD  CONSTRAINT [FK_RentedRoom_Rooms] FOREIGN KEY([RR_RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO
ALTER TABLE [dbo].[RentedRoom] CHECK CONSTRAINT [FK_RentedRoom_Rooms]
GO
ALTER TABLE [dbo].[RentedRoom]  WITH CHECK ADD  CONSTRAINT [FK_RentedRoom_Users] FOREIGN KEY([RR_UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[RentedRoom] CHECK CONSTRAINT [FK_RentedRoom_Users]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_RoomTypes] FOREIGN KEY([R_RoomTypeID])
REFERENCES [dbo].[RoomTypes] ([RoomTypeID])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_RoomTypes]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([U_RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [ASG1FA_BOOKINGHOTELDB] SET  READ_WRITE 
GO
