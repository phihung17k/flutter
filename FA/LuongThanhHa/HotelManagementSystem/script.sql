USE [master]
GO
/****** Object:  Database [HotelManagementDb]    Script Date: 5/21/2021 10:46:57 AM ******/
CREATE DATABASE [HotelManagementDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelManagementDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HotelManagementDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HotelManagementDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HotelManagementDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HotelManagementDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelManagementDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelManagementDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelManagementDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelManagementDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelManagementDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelManagementDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelManagementDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HotelManagementDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelManagementDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelManagementDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelManagementDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelManagementDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelManagementDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelManagementDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelManagementDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelManagementDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HotelManagementDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelManagementDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelManagementDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelManagementDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelManagementDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelManagementDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelManagementDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelManagementDb] SET RECOVERY FULL 
GO
ALTER DATABASE [HotelManagementDb] SET  MULTI_USER 
GO
ALTER DATABASE [HotelManagementDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelManagementDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelManagementDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelManagementDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HotelManagementDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HotelManagementDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HotelManagementDb', N'ON'
GO
ALTER DATABASE [HotelManagementDb] SET QUERY_STORE = OFF
GO
USE [HotelManagementDb]
GO
/****** Object:  Table [dbo].[BookingDetail]    Script Date: 5/21/2021 10:46:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingDetail](
	[userId] [int] NOT NULL,
	[roomId] [int] NOT NULL,
	[bookingDate] [datetime] NOT NULL,
	[expireDate] [datetime] NOT NULL,
	[isBooked] [bit] NULL,
 CONSTRAINT [PK_BookingDetail] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[roomId] ASC,
	[bookingDate] ASC,
	[expireDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/21/2021 10:46:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 5/21/2021 10:46:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/21/2021 10:46:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](64) NULL,
	[firstName] [varchar](50) NULL,
	[lastName] [varchar](50) NULL,
	[phoneNumber] [varchar](10) NULL,
	[email] [varchar](50) NULL,
	[address] [varchar](100) NULL,
	[roleId] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BookingDetail] ([userId], [roomId], [bookingDate], [expireDate], [isBooked]) VALUES (3, 1, CAST(N'2021-05-19T00:00:00.000' AS DateTime), CAST(N'2021-05-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[BookingDetail] ([userId], [roomId], [bookingDate], [expireDate], [isBooked]) VALUES (3, 1, CAST(N'2021-05-19T00:00:00.000' AS DateTime), CAST(N'2021-05-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[BookingDetail] ([userId], [roomId], [bookingDate], [expireDate], [isBooked]) VALUES (3, 1, CAST(N'2021-05-19T00:00:00.000' AS DateTime), CAST(N'2021-05-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[BookingDetail] ([userId], [roomId], [bookingDate], [expireDate], [isBooked]) VALUES (3, 1, CAST(N'2021-05-20T00:00:00.000' AS DateTime), CAST(N'2021-05-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[BookingDetail] ([userId], [roomId], [bookingDate], [expireDate], [isBooked]) VALUES (3, 3, CAST(N'2021-05-19T00:00:00.000' AS DateTime), CAST(N'2021-05-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[BookingDetail] ([userId], [roomId], [bookingDate], [expireDate], [isBooked]) VALUES (3, 4, CAST(N'2021-05-20T00:00:00.000' AS DateTime), CAST(N'2021-05-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[BookingDetail] ([userId], [roomId], [bookingDate], [expireDate], [isBooked]) VALUES (6, 4, CAST(N'2021-05-19T00:00:00.000' AS DateTime), CAST(N'2021-05-31T00:00:00.000' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([id], [name]) VALUES (1, N'Admin     ')
INSERT [dbo].[Roles] ([id], [name]) VALUES (2, N'Hotel Clerk')
INSERT [dbo].[Roles] ([id], [name]) VALUES (3, N'Customer')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([id], [name], [price]) VALUES (1, N'President Room', 1000)
INSERT [dbo].[Rooms] ([id], [name], [price]) VALUES (2, N'VIP Room', 700)
INSERT [dbo].[Rooms] ([id], [name], [price]) VALUES (3, N'Normal Room', 300)
INSERT [dbo].[Rooms] ([id], [name], [price]) VALUES (4, N'VIP2 Room', 500)
INSERT [dbo].[Rooms] ([id], [name], [price]) VALUES (5, N'President VIP Room', 1500)
INSERT [dbo].[Rooms] ([id], [name], [price]) VALUES (6, N'VIP3 Room', 600)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password], [firstName], [lastName], [phoneNumber], [email], [address], [roleId]) VALUES (1, N'admin', N'admin', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Users] ([id], [username], [password], [firstName], [lastName], [phoneNumber], [email], [address], [roleId]) VALUES (3, N'member', N'4xq2Q8RPeg7IJLWdEZTWDawzQgDYReYdLSidqg8IfqQ=', N'Huy', N'Phung Chi', N'0349797318', N'huypc2410@gmail.com', N'218/25 Hong Bang', 3)
INSERT [dbo].[Users] ([id], [username], [password], [firstName], [lastName], [phoneNumber], [email], [address], [roleId]) VALUES (6, N'member2', N'QSdvME7QynYoWCMrxuFrMCOuT2K0NjB7UdMVpYqPNVY=', N'Huy', N'Phung', N'0349797318', N'huypc2410@gmail.com', N'218/25 Hong Bang Str', 3)
INSERT [dbo].[Users] ([id], [username], [password], [firstName], [lastName], [phoneNumber], [email], [address], [roleId]) VALUES (7, N'hotelclerk', N'123123', N'1', N'1', N'1', N'2', N'3', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[BookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetail_Rooms] FOREIGN KEY([roomId])
REFERENCES [dbo].[Rooms] ([id])
GO
ALTER TABLE [dbo].[BookingDetail] CHECK CONSTRAINT [FK_BookingDetail_Rooms]
GO
ALTER TABLE [dbo].[BookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetail_Users] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[BookingDetail] CHECK CONSTRAINT [FK_BookingDetail_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([roleId])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [HotelManagementDb] SET  READ_WRITE 
GO
