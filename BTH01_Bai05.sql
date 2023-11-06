USE [master]
GO
/****** Object:  Database [QLThueSan]    Script Date: 06/11/2023 10:04:15 CH ******/
CREATE DATABASE [QLThueSan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLThueSan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QLThueSan.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLThueSan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QLThueSan_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLThueSan] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLThueSan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLThueSan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLThueSan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLThueSan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLThueSan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLThueSan] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLThueSan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLThueSan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLThueSan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLThueSan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLThueSan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLThueSan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLThueSan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLThueSan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLThueSan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLThueSan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLThueSan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLThueSan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLThueSan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLThueSan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLThueSan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLThueSan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLThueSan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLThueSan] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLThueSan] SET  MULTI_USER 
GO
ALTER DATABASE [QLThueSan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLThueSan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLThueSan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLThueSan] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLThueSan] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLThueSan] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLThueSan] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLThueSan] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLThueSan]
GO
/****** Object:  Table [dbo].[KHACH_HANG]    Script Date: 06/11/2023 10:04:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACH_HANG](
	[maKH] [int] IDENTITY(1,1) NOT NULL,
	[tenKH] [nvarchar](50) NOT NULL,
	[diaChi] [nvarchar](100) NULL,
	[SDT] [nvarchar](12) NOT NULL,
	[ghiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_KHACH_HANG] PRIMARY KEY CLUSTERED 
(
	[maKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SAN]    Script Date: 06/11/2023 10:04:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAN](
	[maSan] [char](10) NOT NULL,
	[tinhTrang] [nvarchar](50) NOT NULL,
	[giaThue] [decimal](8, 2) NULL,
	[ghiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_SAN] PRIMARY KEY CLUSTERED 
(
	[maSan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THUE_BANG]    Script Date: 06/11/2023 10:04:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THUE_BANG](
	[maKH] [int] IDENTITY(1,1) NOT NULL,
	[maSan] [char](10) NOT NULL,
	[ngayGioThue] [date] NOT NULL,
	[ngayGioTra] [date] NULL,
	[soTienThu] [decimal](8, 2) NULL,
	[ghiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_THUE_BANG] PRIMARY KEY CLUSTERED 
(
	[maKH] ASC,
	[maSan] ASC,
	[ngayGioThue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[KHACH_HANG] ON 

INSERT [dbo].[KHACH_HANG] ([maKH], [tenKH], [diaChi], [SDT], [ghiChu]) VALUES (1, N'Le Gia Huy', NULL, N'0899308755', NULL)
INSERT [dbo].[KHACH_HANG] ([maKH], [tenKH], [diaChi], [SDT], [ghiChu]) VALUES (2, N'Luong The', NULL, N'0899344755', NULL)
INSERT [dbo].[KHACH_HANG] ([maKH], [tenKH], [diaChi], [SDT], [ghiChu]) VALUES (3, N'Vo Phuc Nhien', NULL, N'0909544655', NULL)
SET IDENTITY_INSERT [dbo].[KHACH_HANG] OFF
GO
INSERT [dbo].[SAN] ([maSan], [tinhTrang], [giaThue], [ghiChu]) VALUES (N'A01       ', N'da dat', CAST(50000.00 AS Decimal(8, 2)), NULL)
INSERT [dbo].[SAN] ([maSan], [tinhTrang], [giaThue], [ghiChu]) VALUES (N'A02       ', N'da dat', CAST(45000.00 AS Decimal(8, 2)), NULL)
INSERT [dbo].[SAN] ([maSan], [tinhTrang], [giaThue], [ghiChu]) VALUES (N'B01       ', N'da dat', CAST(100000.00 AS Decimal(8, 2)), NULL)
GO
SET IDENTITY_INSERT [dbo].[THUE_BANG] ON 

INSERT [dbo].[THUE_BANG] ([maKH], [maSan], [ngayGioThue], [ngayGioTra], [soTienThu], [ghiChu]) VALUES (1, N'A01       ', CAST(N'2023-05-04' AS Date), NULL, CAST(50000.00 AS Decimal(8, 2)), NULL)
INSERT [dbo].[THUE_BANG] ([maKH], [maSan], [ngayGioThue], [ngayGioTra], [soTienThu], [ghiChu]) VALUES (2, N'A02       ', CAST(N'2023-08-06' AS Date), CAST(N'2023-08-06' AS Date), CAST(45000.00 AS Decimal(8, 2)), NULL)
INSERT [dbo].[THUE_BANG] ([maKH], [maSan], [ngayGioThue], [ngayGioTra], [soTienThu], [ghiChu]) VALUES (3, N'B01       ', CAST(N'2023-05-04' AS Date), CAST(N'2023-05-04' AS Date), CAST(100000.00 AS Decimal(8, 2)), NULL)
SET IDENTITY_INSERT [dbo].[THUE_BANG] OFF
GO
ALTER TABLE [dbo].[THUE_BANG]  WITH CHECK ADD  CONSTRAINT [FK_THUE_BANG_KHACH_HANG] FOREIGN KEY([maKH])
REFERENCES [dbo].[KHACH_HANG] ([maKH])
GO
ALTER TABLE [dbo].[THUE_BANG] CHECK CONSTRAINT [FK_THUE_BANG_KHACH_HANG]
GO
ALTER TABLE [dbo].[THUE_BANG]  WITH CHECK ADD  CONSTRAINT [FK_THUE_BANG_SAN] FOREIGN KEY([maSan])
REFERENCES [dbo].[SAN] ([maSan])
GO
ALTER TABLE [dbo].[THUE_BANG] CHECK CONSTRAINT [FK_THUE_BANG_SAN]
GO
USE [master]
GO
ALTER DATABASE [QLThueSan] SET  READ_WRITE 
GO
