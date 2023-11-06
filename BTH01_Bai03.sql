USE [master]
GO
/****** Object:  Database [QLThueBang]    Script Date: 06/11/2023 9:45:41 CH ******/
CREATE DATABASE [QLThueBang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLThueBang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QLThueBang.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLThueBang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QLThueBang_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLThueBang] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLThueBang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLThueBang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLThueBang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLThueBang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLThueBang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLThueBang] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLThueBang] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLThueBang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLThueBang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLThueBang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLThueBang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLThueBang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLThueBang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLThueBang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLThueBang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLThueBang] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLThueBang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLThueBang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLThueBang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLThueBang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLThueBang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLThueBang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLThueBang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLThueBang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLThueBang] SET  MULTI_USER 
GO
ALTER DATABASE [QLThueBang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLThueBang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLThueBang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLThueBang] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLThueBang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLThueBang] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLThueBang] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLThueBang] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLThueBang]
GO
/****** Object:  Table [dbo].[BANG]    Script Date: 06/11/2023 9:45:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BANG](
	[maBang] [char](10) NOT NULL,
	[tenBang] [nvarchar](50) NOT NULL,
	[theLoai] [nvarchar](20) NULL,
	[nuocSX] [nvarchar](20) NULL,
	[giaMua] [decimal](8, 2) NOT NULL,
	[ghiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_BANG] PRIMARY KEY CLUSTERED 
(
	[maBang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACH_HANG]    Script Date: 06/11/2023 9:45:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACH_HANG](
	[maKH] [int] IDENTITY(1,1) NOT NULL,
	[tenKH] [nvarchar](50) NOT NULL,
	[diaChi] [nvarchar](100) NULL,
	[SDT] [nvarchar](12) NOT NULL,
	[theLoaiYeuThich] [nvarchar](20) NULL,
	[ghiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_KHACH_HANG] PRIMARY KEY CLUSTERED 
(
	[maKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THUE_BANG]    Script Date: 06/11/2023 9:45:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THUE_BANG](
	[maKH] [int] IDENTITY(1,1) NOT NULL,
	[maBang] [char](10) NOT NULL,
	[ngayThue] [date] NOT NULL,
	[ngayTra] [date] NULL,
	[soTienThu] [decimal](8, 2) NULL,
	[ghiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_THUE_BANG] PRIMARY KEY CLUSTERED 
(
	[maKH] ASC,
	[maBang] ASC,
	[ngayThue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[BANG] ([maBang], [tenBang], [theLoai], [nuocSX], [giaMua], [ghiChu]) VALUES (N'A001      ', N'Bao Dieu Khong Noi', N'Trinh Tham', N'My', CAST(145000.00 AS Decimal(8, 2)), NULL)
INSERT [dbo].[BANG] ([maBang], [tenBang], [theLoai], [nuocSX], [giaMua], [ghiChu]) VALUES (N'A002      ', N'Taylor Swift', NULL, N'My', CAST(227000.00 AS Decimal(8, 2)), NULL)
INSERT [dbo].[BANG] ([maBang], [tenBang], [theLoai], [nuocSX], [giaMua], [ghiChu]) VALUES (N'A003      ', N'The Videos', N'Drama', N'Australia', CAST(450000.00 AS Decimal(8, 2)), NULL)
GO
SET IDENTITY_INSERT [dbo].[KHACH_HANG] ON 

INSERT [dbo].[KHACH_HANG] ([maKH], [tenKH], [diaChi], [SDT], [theLoaiYeuThich], [ghiChu]) VALUES (1, N'Le Gia Huy', NULL, N'0899308755', N'Drama', NULL)
INSERT [dbo].[KHACH_HANG] ([maKH], [tenKH], [diaChi], [SDT], [theLoaiYeuThich], [ghiChu]) VALUES (2, N'Luong The', NULL, N'0899344655', N'Music', NULL)
INSERT [dbo].[KHACH_HANG] ([maKH], [tenKH], [diaChi], [SDT], [theLoaiYeuThich], [ghiChu]) VALUES (3, N'Vo Phuc Nhien', NULL, N'0909344655', N'Trinh Tham', NULL)
SET IDENTITY_INSERT [dbo].[KHACH_HANG] OFF
GO
SET IDENTITY_INSERT [dbo].[THUE_BANG] ON 

INSERT [dbo].[THUE_BANG] ([maKH], [maBang], [ngayThue], [ngayTra], [soTienThu], [ghiChu]) VALUES (1, N'A001      ', CAST(N'2023-01-03' AS Date), CAST(N'2023-05-04' AS Date), CAST(145000.00 AS Decimal(8, 2)), NULL)
INSERT [dbo].[THUE_BANG] ([maKH], [maBang], [ngayThue], [ngayTra], [soTienThu], [ghiChu]) VALUES (2, N'A002      ', CAST(N'2023-06-05' AS Date), NULL, CAST(227000.00 AS Decimal(8, 2)), NULL)
INSERT [dbo].[THUE_BANG] ([maKH], [maBang], [ngayThue], [ngayTra], [soTienThu], [ghiChu]) VALUES (3, N'A003      ', CAST(N'2023-05-06' AS Date), CAST(N'2023-08-07' AS Date), CAST(450000.00 AS Decimal(8, 2)), NULL)
SET IDENTITY_INSERT [dbo].[THUE_BANG] OFF
GO
ALTER TABLE [dbo].[THUE_BANG]  WITH CHECK ADD  CONSTRAINT [FK_THUE_BANG_BANG] FOREIGN KEY([maBang])
REFERENCES [dbo].[BANG] ([maBang])
GO
ALTER TABLE [dbo].[THUE_BANG] CHECK CONSTRAINT [FK_THUE_BANG_BANG]
GO
ALTER TABLE [dbo].[THUE_BANG]  WITH CHECK ADD  CONSTRAINT [FK_THUE_BANG_KHACH_HANG] FOREIGN KEY([maKH])
REFERENCES [dbo].[KHACH_HANG] ([maKH])
GO
ALTER TABLE [dbo].[THUE_BANG] CHECK CONSTRAINT [FK_THUE_BANG_KHACH_HANG]
GO
USE [master]
GO
ALTER DATABASE [QLThueBang] SET  READ_WRITE 
GO
