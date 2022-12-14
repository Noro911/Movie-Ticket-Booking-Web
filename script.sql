USE [master]
GO
/****** Object:  Database [TicketBookingWeb]    Script Date: 8/16/2022 9:17:19 PM ******/
CREATE DATABASE [TicketBookingWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TicketBookingWeb', FILENAME = N'D:\JAVA_WEB\Assignment\TicketBookingWeb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TicketBookingWeb_log', FILENAME = N'D:\JAVA_WEB\Assignment\TicketBookingWeb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TicketBookingWeb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TicketBookingWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TicketBookingWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TicketBookingWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TicketBookingWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TicketBookingWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TicketBookingWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [TicketBookingWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TicketBookingWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TicketBookingWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TicketBookingWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TicketBookingWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TicketBookingWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TicketBookingWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TicketBookingWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TicketBookingWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TicketBookingWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TicketBookingWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TicketBookingWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TicketBookingWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TicketBookingWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TicketBookingWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TicketBookingWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TicketBookingWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TicketBookingWeb] SET RECOVERY FULL 
GO
ALTER DATABASE [TicketBookingWeb] SET  MULTI_USER 
GO
ALTER DATABASE [TicketBookingWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TicketBookingWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TicketBookingWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TicketBookingWeb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TicketBookingWeb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TicketBookingWeb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TicketBookingWeb', N'ON'
GO
ALTER DATABASE [TicketBookingWeb] SET QUERY_STORE = OFF
GO
USE [TicketBookingWeb]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 8/16/2022 9:17:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[adminID] [varchar](5) NOT NULL,
	[adminName] [varchar](50) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[passwrd] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[adminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cinemas]    Script Date: 8/16/2022 9:17:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinemas](
	[cinemaID] [nvarchar](5) NOT NULL,
	[locationName] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cinemaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 8/16/2022 9:17:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[customerID] [nvarchar](5) NOT NULL,
	[customerName] [nvarchar](30) NOT NULL,
	[username] [nvarchar](10) NULL,
	[passwd] [nvarchar](10) NULL,
	[role] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 8/16/2022 9:17:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[movieID] [nvarchar](5) NOT NULL,
	[moiveName] [text] NOT NULL,
	[cost] [int] NULL,
	[length] [nvarchar](5) NULL,
	[syn] [text] NULL,
	[img] [text] NULL,
	[poster] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[movieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieShowTimes]    Script Date: 8/16/2022 9:17:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieShowTimes](
	[movieShowtimeID] [nvarchar](5) NOT NULL,
	[movieID] [nvarchar](5) NULL,
	[showTimeID] [nvarchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[movieShowtimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/16/2022 9:17:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [nvarchar](5) NOT NULL,
	[customerID] [nvarchar](5) NULL,
	[movieShowTimeID] [nvarchar](5) NULL,
	[cinemaID] [nvarchar](5) NULL,
	[bookedDate] [date] NULL,
	[mount] [int] NULL,
	[total] [int] NULL,
	[checkoutTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShowTimes]    Script Date: 8/16/2022 9:17:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShowTimes](
	[showTimeID] [nvarchar](5) NOT NULL,
	[showTime] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[showTimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MovieShowTimes]  WITH CHECK ADD FOREIGN KEY([movieID])
REFERENCES [dbo].[Movies] ([movieID])
GO
ALTER TABLE [dbo].[MovieShowTimes]  WITH CHECK ADD FOREIGN KEY([showTimeID])
REFERENCES [dbo].[ShowTimes] ([showTimeID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([cinemaID])
REFERENCES [dbo].[Cinemas] ([cinemaID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([customerID])
REFERENCES [dbo].[Customers] ([customerID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([movieShowTimeID])
REFERENCES [dbo].[MovieShowTimes] ([movieShowtimeID])
GO
USE [master]
GO
ALTER DATABASE [TicketBookingWeb] SET  READ_WRITE 
GO
