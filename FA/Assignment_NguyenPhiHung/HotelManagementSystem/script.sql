USE [master]
GO
/****** Object:  Database [HotelManagementSystem_Hungnp]    Script Date: 2021-05-21 2:05:36 PM ******/
CREATE DATABASE [HotelManagementSystem_Hungnp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelManagementSystem_Hungnp', FILENAME = N'D:\SQL2019\HotelManagementSystem_Hungnp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HotelManagementSystem_Hungnp_log', FILENAME = N'D:\SQL2019\HotelManagementSystem_Hungnp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelManagementSystem_Hungnp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET  MULTI_USER 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET QUERY_STORE = OFF
GO
USE [HotelManagementSystem_Hungnp]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2021-05-21 2:05:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [varchar](100) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[AccountRoleID] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountRole]    Script Date: 2021-05-21 2:05:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountRole](
	[AccountRoleID] [varchar](20) NOT NULL,
	[AccountRoleName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 2021-05-21 2:05:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[BookingDate] [date] NOT NULL,
	[CheckoutDate] [date] NOT NULL,
	[AccountID] [varchar](100) NOT NULL,
	[RoomNo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 2021-05-21 2:05:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomNo] [int] IDENTITY(1,1) NOT NULL,
	[RoomTypeID] [varchar](20) NOT NULL,
	[Price] [float] NOT NULL,
	[Unit] [varchar](20) NOT NULL,
	[IsEmpty] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 2021-05-21 2:05:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[RoomTypeID] [varchar](20) NOT NULL,
	[RoomTypeName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([AccountID], [Password], [AccountRoleID]) VALUES (N'1', N'1', N'AR0')
INSERT [dbo].[Account] ([AccountID], [Password], [AccountRoleID]) VALUES (N'2', N'2', N'AR2')
INSERT [dbo].[Account] ([AccountID], [Password], [AccountRoleID]) VALUES (N'Acc', N'12', N'AR2')
INSERT [dbo].[Account] ([AccountID], [Password], [AccountRoleID]) VALUES (N'Acc1', N'12345', N'AR0')
INSERT [dbo].[Account] ([AccountID], [Password], [AccountRoleID]) VALUES (N'Acc2', N'1', N'AR1')
INSERT [dbo].[Account] ([AccountID], [Password], [AccountRoleID]) VALUES (N'Acc3', N'1', N'AR2')
INSERT [dbo].[Account] ([AccountID], [Password], [AccountRoleID]) VALUES (N'Acc4', N'12345', N'AR2')
INSERT [dbo].[Account] ([AccountID], [Password], [AccountRoleID]) VALUES (N'Acc5', N'1', N'AR2')
INSERT [dbo].[AccountRole] ([AccountRoleID], [AccountRoleName]) VALUES (N'AR0', N'Admin')
INSERT [dbo].[AccountRole] ([AccountRoleID], [AccountRoleName]) VALUES (N'AR1', N'Clerk')
INSERT [dbo].[AccountRole] ([AccountRoleID], [AccountRoleName]) VALUES (N'AR2', N'Customer')
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([BookingID], [BookingDate], [CheckoutDate], [AccountID], [RoomNo]) VALUES (1, CAST(N'2021-05-23' AS Date), CAST(N'2021-05-25' AS Date), N'Acc2', 5)
INSERT [dbo].[Booking] ([BookingID], [BookingDate], [CheckoutDate], [AccountID], [RoomNo]) VALUES (3, CAST(N'2021-05-21' AS Date), CAST(N'2021-05-22' AS Date), N'2', 5)
INSERT [dbo].[Booking] ([BookingID], [BookingDate], [CheckoutDate], [AccountID], [RoomNo]) VALUES (4, CAST(N'2021-05-21' AS Date), CAST(N'2021-05-22' AS Date), N'2', 2)
SET IDENTITY_INSERT [dbo].[Booking] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [Price], [Unit], [IsEmpty]) VALUES (1, N'RT0', 6, N'$/hour', 1)
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [Price], [Unit], [IsEmpty]) VALUES (2, N'RT0', 6, N'$/hour', 1)
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [Price], [Unit], [IsEmpty]) VALUES (3, N'RT0', 6, N'$/hour', 1)
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [Price], [Unit], [IsEmpty]) VALUES (4, N'RT0', 6, N'$/hour', 1)
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [Price], [Unit], [IsEmpty]) VALUES (5, N'RT0', 6, N'$/hour', 1)
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [Price], [Unit], [IsEmpty]) VALUES (6, N'RT1', 22, N'$/day', 1)
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [Price], [Unit], [IsEmpty]) VALUES (7, N'RT1', 22, N'$/day', 1)
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [Price], [Unit], [IsEmpty]) VALUES (8, N'RT1', 22, N'$/day', 1)
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [Price], [Unit], [IsEmpty]) VALUES (9, N'RT1', 22, N'$/day', 1)
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [Price], [Unit], [IsEmpty]) VALUES (10, N'RT1', 22, N'$/day', 1)
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [Price], [Unit], [IsEmpty]) VALUES (11, N'RT2', 30, N'$/day', 1)
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [Price], [Unit], [IsEmpty]) VALUES (12, N'RT2', 30, N'$/day', 1)
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [Price], [Unit], [IsEmpty]) VALUES (13, N'RT2', 30, N'$/day', 1)
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [Price], [Unit], [IsEmpty]) VALUES (14, N'RT2', 30, N'$/day', 1)
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [Price], [Unit], [IsEmpty]) VALUES (15, N'RT2', 30, N'$/day', 1)
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [Price], [Unit], [IsEmpty]) VALUES (16, N'RT3', 36, N'$/day', 1)
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [Price], [Unit], [IsEmpty]) VALUES (17, N'RT3', 36, N'$/day', 1)
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [Price], [Unit], [IsEmpty]) VALUES (18, N'RT3', 36, N'$/day', 1)
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [Price], [Unit], [IsEmpty]) VALUES (19, N'RT3', 36, N'$/day', 1)
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [Price], [Unit], [IsEmpty]) VALUES (20, N'RT3', 36, N'$/day', 1)
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [Price], [Unit], [IsEmpty]) VALUES (21, N'RT4', 42, N'$/day', 1)
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [Price], [Unit], [IsEmpty]) VALUES (22, N'RT4', 42, N'$/day', 1)
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [Price], [Unit], [IsEmpty]) VALUES (23, N'RT4', 42, N'$/day', 1)
SET IDENTITY_INSERT [dbo].[Room] OFF
INSERT [dbo].[RoomType] ([RoomTypeID], [RoomTypeName]) VALUES (N'RT0', N'Day-use room')
INSERT [dbo].[RoomType] ([RoomTypeID], [RoomTypeName]) VALUES (N'RT1', N'Standard room')
INSERT [dbo].[RoomType] ([RoomTypeID], [RoomTypeName]) VALUES (N'RT2', N'Superior room')
INSERT [dbo].[RoomType] ([RoomTypeID], [RoomTypeName]) VALUES (N'RT3', N'Deluxe room')
INSERT [dbo].[RoomType] ([RoomTypeID], [RoomTypeName]) VALUES (N'RT4', N'Suite room')
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [default_value_AR]  DEFAULT ('AR2') FOR [AccountRoleID]
GO
ALTER TABLE [dbo].[Room] ADD  DEFAULT ('$/day') FOR [Unit]
GO
ALTER TABLE [dbo].[Room] ADD  DEFAULT ((0)) FOR [IsEmpty]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([AccountRoleID])
REFERENCES [dbo].[AccountRole] ([AccountRoleID])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([RoomNo])
REFERENCES [dbo].[Room] ([RoomNo])
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD FOREIGN KEY([RoomTypeID])
REFERENCES [dbo].[RoomType] ([RoomTypeID])
GO
USE [master]
GO
ALTER DATABASE [HotelManagementSystem_Hungnp] SET  READ_WRITE 
GO
