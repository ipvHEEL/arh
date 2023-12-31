USE [master]
GO
/****** Object:  Database [tours]    Script Date: 23.03.2023 15:30:51 ******/
CREATE DATABASE [tours]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tours', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\tours.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tours_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\tours_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [tours] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tours].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tours] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tours] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tours] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tours] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tours] SET ARITHABORT OFF 
GO
ALTER DATABASE [tours] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tours] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tours] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tours] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tours] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tours] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tours] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tours] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tours] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tours] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tours] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tours] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tours] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tours] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tours] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tours] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tours] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tours] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tours] SET  MULTI_USER 
GO
ALTER DATABASE [tours] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tours] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tours] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tours] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tours] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tours] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [tours] SET QUERY_STORE = OFF
GO
USE [tours]
GO
/****** Object:  Table [dbo].[country]    Script Date: 23.03.2023 15:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[code] [nchar](2) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hotel]    Script Date: 23.03.2023 15:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hotel](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[countryofstars] [int] NOT NULL,
	[countrycode] [nchar](2) NOT NULL,
 CONSTRAINT [PK_hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hotelcomment]    Script Date: 23.03.2023 15:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hotelcomment](
	[id] [int] NOT NULL,
	[hotelid] [int] NOT NULL,
	[text] [nvarchar](max) NOT NULL,
	[author] [nvarchar](100) NOT NULL,
	[creationdate] [datetime] NOT NULL,
 CONSTRAINT [PK_hotelcomment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hotelimage]    Script Date: 23.03.2023 15:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hotelimage](
	[id] [int] NOT NULL,
	[hotelid] [int] NOT NULL,
	[imagesourse] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_hotelimage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoteloftour]    Script Date: 23.03.2023 15:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoteloftour](
	[hotelid] [int] NOT NULL,
	[tourid] [int] NOT NULL,
 CONSTRAINT [PK_hoteloftour] PRIMARY KEY CLUSTERED 
(
	[hotelid] ASC,
	[tourid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tour]    Script Date: 23.03.2023 15:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tour](
	[id] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour_abeltin]    Script Date: 23.03.2023 15:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour_abeltin](
	[id] [int] NOT NULL,
	[ticketcount] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NULL,
	[imagepreview] [varbinary](max) NULL,
	[price] [money] NOT NULL,
	[isactual] [bit] NOT NULL,
 CONSTRAINT [PK_Tour_abeltin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type]    Script Date: 23.03.2023 15:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[typeoftour]    Script Date: 23.03.2023 15:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[typeoftour](
	[tourid] [int] NOT NULL,
	[typeid] [int] NOT NULL,
 CONSTRAINT [PK_typeoftour] PRIMARY KEY CLUSTERED 
(
	[tourid] ASC,
	[typeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[type] ON 

INSERT [dbo].[type] ([id], [name], [description]) VALUES (1, N'Тип 1', NULL)
INSERT [dbo].[type] ([id], [name], [description]) VALUES (2, N'Тип 2', NULL)
INSERT [dbo].[type] ([id], [name], [description]) VALUES (3, N'Тип 3', NULL)
INSERT [dbo].[type] ([id], [name], [description]) VALUES (4, N'Тип 4', NULL)
INSERT [dbo].[type] ([id], [name], [description]) VALUES (5, N'Тип 5', NULL)
SET IDENTITY_INSERT [dbo].[type] OFF
GO
ALTER TABLE [dbo].[hotel]  WITH CHECK ADD  CONSTRAINT [FK_hotel_country] FOREIGN KEY([countrycode])
REFERENCES [dbo].[country] ([code])
GO
ALTER TABLE [dbo].[hotel] CHECK CONSTRAINT [FK_hotel_country]
GO
ALTER TABLE [dbo].[hotelcomment]  WITH CHECK ADD  CONSTRAINT [FK_hotelcomment_hotel] FOREIGN KEY([hotelid])
REFERENCES [dbo].[hotel] ([id])
GO
ALTER TABLE [dbo].[hotelcomment] CHECK CONSTRAINT [FK_hotelcomment_hotel]
GO
ALTER TABLE [dbo].[hotelimage]  WITH CHECK ADD  CONSTRAINT [FK_hotelimage_hotel] FOREIGN KEY([hotelid])
REFERENCES [dbo].[hotel] ([id])
GO
ALTER TABLE [dbo].[hotelimage] CHECK CONSTRAINT [FK_hotelimage_hotel]
GO
ALTER TABLE [dbo].[hoteloftour]  WITH CHECK ADD  CONSTRAINT [FK_hoteloftour_hotel] FOREIGN KEY([hotelid])
REFERENCES [dbo].[hotel] ([id])
GO
ALTER TABLE [dbo].[hoteloftour] CHECK CONSTRAINT [FK_hoteloftour_hotel]
GO
ALTER TABLE [dbo].[hoteloftour]  WITH CHECK ADD  CONSTRAINT [FK_hoteloftour_Tour_abeltin] FOREIGN KEY([tourid])
REFERENCES [dbo].[Tour_abeltin] ([id])
GO
ALTER TABLE [dbo].[hoteloftour] CHECK CONSTRAINT [FK_hoteloftour_Tour_abeltin]
GO
ALTER TABLE [dbo].[typeoftour]  WITH CHECK ADD  CONSTRAINT [FK_typeoftour_Tour_abeltin] FOREIGN KEY([tourid])
REFERENCES [dbo].[Tour_abeltin] ([id])
GO
ALTER TABLE [dbo].[typeoftour] CHECK CONSTRAINT [FK_typeoftour_Tour_abeltin]
GO
ALTER TABLE [dbo].[typeoftour]  WITH CHECK ADD  CONSTRAINT [FK_typeoftour_type] FOREIGN KEY([typeid])
REFERENCES [dbo].[type] ([id])
GO
ALTER TABLE [dbo].[typeoftour] CHECK CONSTRAINT [FK_typeoftour_type]
GO
USE [master]
GO
ALTER DATABASE [tours] SET  READ_WRITE 
GO
