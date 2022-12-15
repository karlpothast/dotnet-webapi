USE [master]
GO
/****** Object:  Database [counties]    Script Date: 11/28/2022 15:34:25 ******/
CREATE DATABASE [counties]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'counties', FILENAME = N'/var/opt/mssql/data/counties.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'counties_log', FILENAME = N'/var/opt/mssql/data/counties_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [counties].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [counties] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [counties] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [counties] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [counties] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [counties] SET ARITHABORT OFF 
GO
ALTER DATABASE [counties] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [counties] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [counties] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [counties] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [counties] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [counties] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [counties] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [counties] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [counties] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [counties] SET  ENABLE_BROKER 
GO
ALTER DATABASE [counties] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [counties] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [counties] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [counties] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [counties] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [counties] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [counties] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [counties] SET RECOVERY FULL 
GO
ALTER DATABASE [counties] SET  MULTI_USER 
GO
ALTER DATABASE [counties] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [counties] SET DB_CHAINING OFF 
GO
ALTER DATABASE [counties] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [counties] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [counties] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'counties', N'ON'
GO
ALTER DATABASE [counties] SET QUERY_STORE = OFF
GO
USE [counties]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [counties]
GO
/****** Object:  Schema [counties]    Script Date: 11/28/2022 15:34:25 ******/
CREATE SCHEMA [counties]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/28/2022 15:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adjacentCounties]    Script Date: 11/28/2022 15:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adjacentCounties](
	[baseCountyId] [uniqueidentifier] NOT NULL,
	[adjacentCountyId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_adjacentCounties] PRIMARY KEY CLUSTERED 
(
	[baseCountyId] ASC,
	[adjacentCountyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adjacentCountiesLoad]    Script Date: 11/28/2022 15:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adjacentCountiesLoad](
	[baseCountyFipsId] [char](3) NOT NULL,
	[adjacentCountyFipsId] [char](3) NOT NULL,
 CONSTRAINT [PK_adjacentCountiesLoad] PRIMARY KEY CLUSTERED 
(
	[baseCountyFipsId] ASC,
	[adjacentCountyFipsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[counties]    Script Date: 11/28/2022 15:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[counties](
	[Id] [uniqueidentifier] NOT NULL,
	[countyName] [varchar](50) NOT NULL,
	[countyFipsId] [char](3) NOT NULL,
	[countyMapId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Heroes]    Script Date: 11/28/2022 15:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Heroes](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Nickname] [nvarchar](max) NULL,
	[Individuality] [nvarchar](max) NULL,
	[Age] [int] NULL,
	[HeroType] [int] NOT NULL,
	[Team] [nvarchar](max) NULL,
 CONSTRAINT [PK_Heroes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/28/2022 15:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](254) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Role] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 11/28/2022 15:34:25 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[counties] ADD  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  StoredProcedure [dbo].[getAdjacentCounties]    Script Date: 11/28/2022 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAdjacentCounties]
(@CountyId1 INT, @CountyId2 INT)
AS
BEGIN
SET NOCOUNT ON

DECLARE @adjacentCountyId_FipsIdMatch uniqueidentifier
SET @adjacentCountyId_FipsIdMatch = 
                         (SELECT TOP 1 Id 
                         FROM Counties 
                         WHERE countyFipsId = @countyId2)
                         
                         
DECLARE @adjacentCountyId_MapIdMatch uniqueidentifier
SET @adjacentCountyId_MapIdMatch = 
                         (SELECT TOP 1 Id 
                         FROM Counties 
                         WHERE countyMapId = @countyId2)
              
                         
DECLARE @countiesAreAdjacentByFipsId BIT = 0
DECLARE @countiesAreAdjacentByMapId BIT = 0
DECLARE @returnValue BIT = 0
DECLARE @matchedBy VARCHAR(6) = 'none'

IF EXISTS (
    SELECT c.Id
    FROM counties c, adjacentCounties a 
    WHERE c.Id = a.baseCountyId AND
    c.countyFipsId = @CountyId1 AND
    a.adjacentCountyId = @adjacentCountyId_FipsIdMatch
)
 BEGIN
    SET @countiesAreAdjacentByFipsId = 1
    SET @matchedBy = 'FIPSId'
 END
 
IF EXISTS (
    SELECT c.Id
    FROM counties c, adjacentCounties a 
    WHERE c.Id = a.baseCountyId AND
    c.countyMapId = @CountyId1 AND
    a.adjacentCountyId = @adjacentCountyId_MapIdMatch
)
 BEGIN
    SET @countiesAreAdjacentByMapId = 1
    SET @matchedBy = 'MapId'
 END
 
 DECLARE @booleanString VARCHAR(5) = 'false'
 IF (@countiesAreAdjacentByFipsId = 1 OR 
     @countiesAreAdjacentByMapId = 1)
   BEGIN
     SET @returnValue = 1
     SET @booleanString = 'true'
   END
 ELSE
  BEGIN
     SET @returnValue = 0
   END
   
 print '{"CountiesAreAdjacent":' + @booleanString + '}'

END;
GO
USE [master]
GO
ALTER DATABASE [counties] SET  READ_WRITE 
GO
