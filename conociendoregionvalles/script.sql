USE [master]
GO
/****** Object:  Database [RegionValles]    Script Date: 01/22/2015 11:27:40 ******/
CREATE DATABASE [RegionValles] ON  PRIMARY 
( NAME = N'RegionValles', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\RegionValles.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RegionValles_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\RegionValles_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RegionValles] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RegionValles].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RegionValles] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [RegionValles] SET ANSI_NULLS OFF
GO
ALTER DATABASE [RegionValles] SET ANSI_PADDING OFF
GO
ALTER DATABASE [RegionValles] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [RegionValles] SET ARITHABORT OFF
GO
ALTER DATABASE [RegionValles] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [RegionValles] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [RegionValles] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [RegionValles] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [RegionValles] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [RegionValles] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [RegionValles] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [RegionValles] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [RegionValles] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [RegionValles] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [RegionValles] SET  ENABLE_BROKER
GO
ALTER DATABASE [RegionValles] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [RegionValles] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [RegionValles] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [RegionValles] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [RegionValles] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [RegionValles] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [RegionValles] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [RegionValles] SET  READ_WRITE
GO
ALTER DATABASE [RegionValles] SET RECOVERY FULL
GO
ALTER DATABASE [RegionValles] SET  MULTI_USER
GO
ALTER DATABASE [RegionValles] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [RegionValles] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'RegionValles', N'ON'
GO
USE [RegionValles]
GO
/****** Object:  Table [dbo].[Regions]    Script Date: 01/22/2015 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Regions](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 01/22/2015 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Reference] [varchar](max) NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[PaymentMethod] [varchar](max) NOT NULL,
	[State] [varchar](max) NOT NULL,
	[Amount] [money] NOT NULL,
	[AddId] [int] NOT NULL,
	[UserId] [varchar](max) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[General]    Script Date: 01/22/2015 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[General](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Value] [varchar](50) NOT NULL,
	[ValueBackup] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Files]    Script Date: 01/22/2015 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Files](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Url] [varchar](max) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[IdUser] [varchar](max) NOT NULL,
	[IdAdd] [int] NOT NULL,
	[FileType] [varchar](max) NULL,
	[Ext] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empresas]    Script Date: 01/22/2015 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empresas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Imagen1] [varchar](50) NULL,
	[Resumen] [varchar](max) NULL,
	[IdTag] [int] NULL,
	[IdRegion] [int] NULL,
	[Domicilio] [varchar](max) NULL,
	[Correo] [varchar](max) NULL,
	[IdUser] [varchar](max) NULL,
	[ResumenDos] [varchar](max) NULL,
	[Latitud] [varchar](max) NULL,
	[Longitud] [varchar](max) NULL,
	[Activo] [bit] NULL,
	[FechaPago] [date] NULL,
	[FechaVencimiento] [date] NULL,
	[Paquete] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 01/22/2015 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
	[Names] [nvarchar](max) NULL,
	[LastNames] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[IdCompany] [int] NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 01/22/2015 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[IdEmpresa] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 01/22/2015 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 01/22/2015 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 01/22/2015 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEnterprisesByFilter]    Script Date: 01/22/2015 11:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetEnterprisesByFilter]
	@RecordsByPage int,
	@CurrentPage int,
	@Tag int,
	@Region int,
	@Search VARCHAR(MAX)
AS
BEGIN
    DECLARE 
    @start int,
    @end int,
    @where varchar(max),
    @sql varchar(max),
    @bool bit
/*PAGINACION*/
    set @start = 1
    set @end = @RecordsByPage
    if(@CurrentPage<>1)
    begin
		set @start = (@RecordsByPage * (@CurrentPage-1))+1;
		set @end = (@start + @RecordsByPage)-1;
    end
 
/*Construir SELECT*/
set @sql = 'SELECT COUNT(Id) AS TotalEmpresas FROM Empresas'
set @bool = 0
set @where = ' '
/*WHERE*/ 

IF(@Tag<>0)
BEGIN
	set @where = ' where '
	set @where += ' IdTag = ' + CAST(@Tag AS varchar(max))
	set @bool = 1
END
IF(@Region<>0)
BEGIN
	IF(@bool=1)
	BEGIN
		set @where += ' AND '
    END
	ELSE
	BEGIN
		set @where = ' where '
	END
	set @where += ' IdRegion = ' + CAST(@Region AS varchar(max))
	set @bool = 1
END
IF(@Search<>'')
BEGIN
	
	IF(@bool=1)
	BEGIN
		set @where += ' AND '
    END
	ELSE
	BEGIN
		set @where = ' where '
	END
	set @where += ' Nombre LIKE ''%' + @Search + '%'''
	set @bool = 1
END
IF(@bool=1)
BEGIN
	set @where += ' AND '
END
ELSE
BEGIN
	set @where = ' where '
END
set @where += ' Activo=1'

set @sql += @where
print @sql
exec (@sql)	

set @sql = 'WITH cte AS (SELECT ROW_NUMBER() OVER(ORDER BY Id) AS ROW,* FROM Empresas '+@where+')'

set @sql += ' SELECT *,reg.Name as RName,tag.Name as TName FROM cte 
			  INNER JOIN Regions reg ON reg.Id = cte.IdRegion
			  INNER JOIN Tags tag ON tag.Id = cte.IdTag  where ROW BETWEEN ' + 
			 CAST(@start AS varchar(max)) + ' AND ' + 
			 CAST(@end AS varchar(max)) 

print @sql
exec (@sql)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllTags]    Script Date: 01/22/2015 11:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAllTags]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Tags WHERE Id<>0 ORDER BY Name 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllRegions]    Script Date: 01/22/2015 11:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAllRegions]

AS
BEGIN
	SELECT * FROM Regions WHERE Id<>0 ORDER BY Name
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllEnterprise]    Script Date: 01/22/2015 11:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllEnterprise]
AS
BEGIN
	SELECT * FROM Empresas WHERE Activo=1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_General]    Script Date: 01/22/2015 11:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_General]
	
AS
BEGIN 
 Select * from General
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteAdd]    Script Date: 01/22/2015 11:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteAdd]
	@IdAdd INT
AS
BEGIN
	DELETE FROM Empresas WHERE Id=@IdAdd
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateVideoById]    Script Date: 01/22/2015 11:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateVideoById]
	@IdVideo int,
	@Name VARCHAR(MAX),
	@Url VARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	UPDATE Files SET Name=@Name,
				      Url=@Url
	WHERE Id=@IdVideo
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateFileById]    Script Date: 01/22/2015 11:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateFileById]
	@IdVideo int,
	@Name VARCHAR(MAX),
	@Url VARCHAR(MAX),
	@Type VARCHAR(MAX),
	@Ext VARCHAR (MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	UPDATE Files SET Name=@Name,
				      Url=@Url,
				      FileType=@Type,
				      Ext=@Ext
				      
	WHERE Id=@IdVideo
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateAdd]    Script Date: 01/22/2015 11:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateAdd]
	-- Add the parameters for the stored procedure here
	@CompanyName VARCHAR(MAX),
	@Address VARCHAR(MAX),
	@Email VARCHAR(MAX),
	@Summary VARCHAR(MAX),
	@LogoSRC VARCHAR(MAX),
	@IdRegion int,
	@IdTag int,
	@Telephone VARCHAR(MAX),
	@IdCompany VARCHAR(MAX),
	@MoreSummary VARCHAR(MAX),
	@Latitude VARCHAR(MAX),
	@Longitude VARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    UPDATE Empresas SET Nombre=@CompanyName,
					    Descripcion='Descripcion',
					    Telefono=@Telephone,
					    Resumen=@Summary,
						IdTag=@IdTag,
						IdRegion=@IdRegion,
						Domicilio=@Address,
						Correo=@Email,
						ResumenDos=@MoreSummary,
						Latitud=@Latitude,
						Longitud=@Longitude
						
	WHERE Id=@IdCompany;
	IF @LogoSRC<>'NC'
	BEGIN
		 UPDATE Empresas SET Imagen1=@LogoSRC WHERE Id=@IdCompany;
	END
	SELECT 1 AS ESTADO
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 01/22/2015 11:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Login]
	@Username VARCHAR(MAX),
	@Password VARCHAR(MAX)
AS
BEGIN
	SELECT UserName,Name,LastName,Email FROM Users WHERE UserName=@Username AND Password=@Password
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertNewVideo]    Script Date: 01/22/2015 11:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertNewVideo]
	-- Add the parameters for the stored procedure here
	@Url VARCHAR(MAX),
	@Name VARCHAR(MAX),
	@IdUser VARCHAR(MAX),
	@IdAdd int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Files (Url,Name,IdUser,IdAdd)VALUES (@Url,@Name,@IdUser,@IdAdd)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertNewUser]    Script Date: 01/22/2015 11:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertNewUser]
	-- Add the parameters for the stored procedure here
	@Name varchar(MAX),
	@LastName varchar(MAX),
	@UserName varchar(MAX),
	@Email varchar(MAX),
	@Password varchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF NOT EXISTS(SELECT * FROM Users WHERE UserName=@UserName)
	BEGIN
	   INSERT INTO Users VALUES(@Name,@LastName,@UserName,@Email,@Password,0)
	   SELECT 1 AS ESTADO
	END
	ELSE
	BEGIN
		SELECT 0 AS ESTADO
	END
    
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertNewFile]    Script Date: 01/22/2015 11:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertNewFile]
	-- Add the parameters for the stored procedure here
	@Url VARCHAR(MAX),
	@Name VARCHAR(MAX),
	@IdUser VARCHAR(MAX),
	@IdAdd int,
	@Type VARCHAR(MAX),
	@Ext VARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Files (Url,Name,IdUser,IdAdd,FileType,Ext)VALUES (@Url,@Name,@IdUser,@IdAdd,@Type,@Ext)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertNewAdd]    Script Date: 01/22/2015 11:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertNewAdd]
	-- Add the parameters for the stored procedure here
	@CompanyName VARCHAR(MAX),
	@Address VARCHAR(MAX),
	@Email VARCHAR(MAX),
	@Summary VARCHAR(MAX),
	@LogoSRC VARCHAR(MAX),
	@IdRegion int,
	@IdTag int,
	@Telephone VARCHAR(MAX),
	@IdUser VARCHAR(MAX),
	@MoreSummary VARCHAR(MAX),
	@Latitude VARCHAR(MAX),
	@Longitude VARCHAR(MAX),
	@Pack int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE @Active int
IF @Pack=1
BEGIN
	SET @Active=1
END
ELSE
BEGIN
	SET @Active=0
END
	   INSERT INTO Empresas VALUES(@CompanyName,
								   'Descripcion',
								   @Telephone,
								   @LogoSRC,
								   @Summary,
								   @IdTag,
								   @IdRegion,
								   @Address,
								   @Email,
								   @IdUser,
								   @MoreSummary,
								   @Latitude,
								   @Longitude,
								   @Active,
								   GETDATE(),
								   DATEADD(month,1,GETDATE()),
								   @Pack)
	   SELECT 1 AS ESTADO,SCOPE_IDENTITY() AS LastId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetVideosByUser]    Script Date: 01/22/2015 11:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetVideosByUser]
	@IdUser VARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Files WHERE IdUser=@IdUser
						  AND FileType='YouTube'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetVideosByAdd]    Script Date: 01/22/2015 11:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetVideosByAdd]
	@IdAdd VARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Files WHERE IdAdd=@IdAdd
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetPaymentsByUser]    Script Date: 01/22/2015 11:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetPaymentsByUser]
	-- Add the parameters for the stored procedure here
	@UserId VARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Payments WHERE UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFilesByAdd]    Script Date: 01/22/2015 11:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetFilesByAdd]
	@IdAdd VARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Files WHERE IdAdd=@IdAdd
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEnterprisesByUser]    Script Date: 01/22/2015 11:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetEnterprisesByUser]
	@IdUser VARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--DECLARE @IdUser VARCHAR(MAX)
	--SET @IdUser = '63a8f998-775b-4950-b821-0e244250f8a8'
    -- Insert statements for procedure here
	SELECT em.Id as Id,Nombre,Descripcion,Telefono,Imagen1,Resumen,
	Domicilio,Correo,ResumenDos,Latitud,Longitud,Activo,Paquete,
	tg.Name as Tag,rg.Name as Region
	FROM Empresas em
	INNER JOIN Tags tg on em.IdTag =tg.Id
	INNER JOIN Regions rg on em.IdRegion = rg.Id 
	WHERE IdUser = @IdUser
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEnterprisesById]    Script Date: 01/22/2015 11:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetEnterprisesById]
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT em.Id as Id,Nombre,Descripcion,Telefono,Imagen1,Resumen,Domicilio,Correo,ResumenDos,Latitud,Longitud,Paquete,
	tg.Name as Tag,rg.Name as Region
	FROM Empresas em
	INNER JOIN Tags tg on em.IdTag =tg.Id
	INNER JOIN Regions rg on em.IdRegion = rg.Id 
	WHERE em.Id = @id
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 01/22/2015 11:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles] 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 01/22/2015 11:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[UserId] [nvarchar](128) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 01/22/2015 11:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[User_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_User_Id] ON [dbo].[AspNetUserClaims] 
(
	[User_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]    Script Date: 01/22/2015 11:28:03 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]    Script Date: 01/22/2015 11:28:03 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]    Script Date: 01/22/2015 11:28:03 ******/
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id]    Script Date: 01/22/2015 11:28:03 ******/
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id]
GO
