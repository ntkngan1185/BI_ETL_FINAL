USE [master]
GO
/****** Object:  Database [COVID_DB]    Script Date: 1/8/2023 6:18:52 PM ******/
CREATE DATABASE [COVID_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'COVID_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.PSTUNG\MSSQL\DATA\COVID_DB.mdf' , SIZE = 270336KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'COVID_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.PSTUNG\MSSQL\DATA\COVID_DB_log.ldf' , SIZE = 270336KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [COVID_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [COVID_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [COVID_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [COVID_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [COVID_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [COVID_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [COVID_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [COVID_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [COVID_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [COVID_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [COVID_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [COVID_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [COVID_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [COVID_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [COVID_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [COVID_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [COVID_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [COVID_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [COVID_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [COVID_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [COVID_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [COVID_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [COVID_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [COVID_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [COVID_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [COVID_DB] SET  MULTI_USER 
GO
ALTER DATABASE [COVID_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [COVID_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [COVID_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [COVID_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [COVID_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [COVID_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'COVID_DB', N'ON'
GO
ALTER DATABASE [COVID_DB] SET QUERY_STORE = OFF
GO
USE [COVID_DB]
GO
/****** Object:  Table [dbo].[Canada_Compiled_Case]    Script Date: 1/8/2023 6:18:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canada_Compiled_Case](
	[ObjectId] [varchar](50) NULL,
	[row_id] [varchar](50) NULL,
	[date_reported] [datetime] NULL,
	[health_region] [nvarchar](255) NULL,
	[age_group] [varchar](50) NULL,
	[gender] [nvarchar](20) NULL,
	[exposure] [varchar](50) NULL,
	[case_status] [varchar](50) NULL,
	[province] [varchar](50) NULL,
	[Created Date] [datetime] NULL,
	[Updated Date] [datetime] NULL,
	[Status] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ontario_Cases_Report]    Script Date: 1/8/2023 6:18:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ontario_Cases_Report](
	[Outcome] [nvarchar](255) NULL,
	[Age] [nvarchar](255) NULL,
	[Gender] [nvarchar](255) NULL,
	[Reporting PHU] [nvarchar](255) NULL,
	[SpecimenDate] [datetime] NULL,
	[CaseReported Date] [datetime] NULL,
	[PHUCity] [nvarchar](255) NULL,
	[TestReported Date] [datetime] NULL,
	[CaseAcquisition info] [nvarchar](255) NULL,
	[AccurateEpisode Dt] [datetime] NULL,
	[PHU Address] [nvarchar](255) NULL,
	[PHU Website] [nvarchar](255) NULL,
	[OutbreakRelated] [nvarchar](255) NULL,
	[PHU Latitude] [float] NULL,
	[PHU Longitude] [float] NULL,
	[PHU Postal Code] [nvarchar](255) NULL,
	[Created Date] [datetime] NULL,
	[Updated Date] [datetime] NULL,
	[Status] [float] NULL,
	[Case_id] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ontario_ongoing_outbreaks]    Script Date: 1/8/2023 6:18:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ontario_ongoing_outbreaks](
	[date] [datetime] NULL,
	[phu_num] [varchar](50) NULL,
	[outbreak_group] [varchar](50) NULL,
	[number_ongoing_outbreaks] [int] NULL,
	[Created Date] [datetime] NULL,
	[Updated Date] [datetime] NULL,
	[Status] [int] NULL,
	[Going_breaks_ID] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ontario_PHU]    Script Date: 1/8/2023 6:18:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ontario_PHU](
	[PHU_ID] [varchar](50) NULL,
	[Reporting_PHU] [nvarchar](255) NULL,
	[Reporting_PHU_Address] [nvarchar](255) NULL,
	[Reporting_PHU_City] [nvarchar](255) NULL,
	[Reporting_PHU_Postal_Code] [nvarchar](255) NULL,
	[Reporting_PHU_Website] [nvarchar](255) NULL,
	[Reporting_PHU_Latitude] [float] NULL,
	[Reporting_PHU_Longitude] [float] NULL,
	[Created Date] [datetime] NULL,
	[Updated Date] [datetime] NULL,
	[Status] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ontario_PHU_GROUP]    Script Date: 1/8/2023 6:18:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ontario_PHU_GROUP](
	[PHU_Group] [nvarchar](255) NULL,
	[PHU_City] [nvarchar](255) NULL,
	[PHU_region] [nvarchar](255) NULL,
	[Created Date] [datetime] NULL,
	[Updated Date] [datetime] NULL,
	[Status] [float] NULL,
	[PHU_Group_ID] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ontario_Vaccines_By_Age]    Script Date: 1/8/2023 6:18:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ontario_Vaccines_By_Age](
	[Date] [datetime] NULL,
	[PHU ID] [varchar](50) NULL,
	[Agegroup] [varchar](50) NULL,
	[At least one dose_cumulative] [float] NULL,
	[Second_dose_cumulative] [float] NULL,
	[fully_vaccinated_cumulative] [float] NULL,
	[third_dose_cumulative] [float] NULL,
	[Created Date] [datetime] NULL,
	[Updated Date] [datetime] NULL,
	[Status] [int] NULL,
	[Vaccines_ID] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Update_Age_Gender_Ontario]    Script Date: 1/8/2023 6:18:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Update_Age_Gender_Ontario]
as 
begin 
	update Ontario_Cases_Report set Gender = 'Male' where Gender = 'MALE'
	update Ontario_Cases_Report set Gender = 'Female' where Gender = 'FEMALE'
	update Ontario_Cases_Report set Gender = 'Not Reported' where Gender = 'GENDER DIVERSE' or Gender = 'UNSPECIFIED'

	update Ontario_Cases_Report set Age = '20-29' where Age = '20s'
	update Ontario_Cases_Report set Age = '30-39' where Age = '30s'
	update Ontario_Cases_Report set Age = '40-49' where Age = '40s'
	update Ontario_Cases_Report set Age = '50-59' where Age = '50s'
	update Ontario_Cases_Report set Age = '60-69' where Age = '60s'
	update Ontario_Cases_Report set Age = '70-79' where Age = '70s'
	update Ontario_Cases_Report set Age = '80+' where Age = '80s' or Age = '90+'
end
GO
/****** Object:  StoredProcedure [dbo].[update_PHU_group]    Script Date: 1/8/2023 6:18:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   proc [dbo].[update_PHU_group]
as
begin
	declare c cursor for (select distinct PHU_Group from Ontario_PHU_GROUP)
	open c
	declare @group nvarchar(100)
	
	declare @i int
	set @i = 1
	while @@FETCH_STATUS = 0
	begin
		fetch next from c into @group
		update Ontario_PHU_GROUP set PHU_Group_ID = @i where PHU_Group like @group
		set @i = @i + 1
	end
	close c
	deallocate c
end
GO
USE [master]
GO
ALTER DATABASE [COVID_DB] SET  READ_WRITE 
GO
