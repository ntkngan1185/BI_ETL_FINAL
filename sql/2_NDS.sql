USE [master]
GO
/****** Object:  Database [COVID_19_NDS]    Script Date: 1/8/2023 6:19:16 PM ******/
CREATE DATABASE [COVID_19_NDS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'COVID_19_NDS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.PSTUNG\MSSQL\DATA\COVID_19_NDS.mdf' , SIZE = 204800KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'COVID_19_NDS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.PSTUNG\MSSQL\DATA\COVID_19_NDS_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [COVID_19_NDS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [COVID_19_NDS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [COVID_19_NDS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [COVID_19_NDS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [COVID_19_NDS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [COVID_19_NDS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [COVID_19_NDS] SET ARITHABORT OFF 
GO
ALTER DATABASE [COVID_19_NDS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [COVID_19_NDS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [COVID_19_NDS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [COVID_19_NDS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [COVID_19_NDS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [COVID_19_NDS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [COVID_19_NDS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [COVID_19_NDS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [COVID_19_NDS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [COVID_19_NDS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [COVID_19_NDS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [COVID_19_NDS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [COVID_19_NDS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [COVID_19_NDS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [COVID_19_NDS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [COVID_19_NDS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [COVID_19_NDS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [COVID_19_NDS] SET RECOVERY FULL 
GO
ALTER DATABASE [COVID_19_NDS] SET  MULTI_USER 
GO
ALTER DATABASE [COVID_19_NDS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [COVID_19_NDS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [COVID_19_NDS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [COVID_19_NDS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [COVID_19_NDS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [COVID_19_NDS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'COVID_19_NDS', N'ON'
GO
ALTER DATABASE [COVID_19_NDS] SET QUERY_STORE = OFF
GO
USE [COVID_19_NDS]
GO
/****** Object:  UserDefinedTableType [dbo].[THONG_KE_FACT1]    Script Date: 1/8/2023 6:19:17 PM ******/
CREATE TYPE [dbo].[THONG_KE_FACT1] AS TABLE(
	[PHU_ID] [int] NULL,
	[DYEAR] [int] NULL,
	[NUM_OF_CASES] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[THONG_KE_FACT4]    Script Date: 1/8/2023 6:19:17 PM ******/
CREATE TYPE [dbo].[THONG_KE_FACT4] AS TABLE(
	[D_DATE] [datetime] NULL,
	[NUM_OF_CASES] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[THONG_KE_FACT5A]    Script Date: 1/8/2023 6:19:17 PM ******/
CREATE TYPE [dbo].[THONG_KE_FACT5A] AS TABLE(
	[D_YEAR] [int] NULL,
	[PHU_ID] [int] NULL,
	[NUM_OF_CASES] [int] NULL
)
GO
/****** Object:  Table [dbo].[Ongoing_break_PHU]    Script Date: 1/8/2023 6:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ongoing_break_PHU](
	[Breaks_SK] [int] IDENTITY(1,1) NOT NULL,
	[PHU_SK] [int] NULL,
	[Out_break_group] [varchar](50) NULL,
	[Ongoing_break_Date] [datetime] NULL,
	[Number_ongoing_outbreaks] [int] NULL,
	[Breaks_ID] [int] NULL,
	[SOR] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Ongoing_break_PHU] PRIMARY KEY CLUSTERED 
(
	[Breaks_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHU]    Script Date: 1/8/2023 6:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHU](
	[PHU_SK] [int] IDENTITY(1,1) NOT NULL,
	[Reporting_PHU] [nvarchar](255) NULL,
	[Reporting_PHU_Address] [nvarchar](255) NULL,
	[Reporting_PHU_City] [nvarchar](255) NULL,
	[Reporting_PHU_Postal_Code] [nvarchar](255) NULL,
	[Reporting_PHU_Website] [nvarchar](255) NULL,
	[Reporting_PHU_Latitude] [float] NULL,
	[Reporting_PHU_Longitude] [float] NULL,
	[PHU_ID] [int] NULL,
	[SOR] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_PHU] PRIMARY KEY CLUSTERED 
(
	[PHU_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHU_GROUP]    Script Date: 1/8/2023 6:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHU_GROUP](
	[PHU_GROUP_SK] [int] IDENTITY(1,1) NOT NULL,
	[PHU_SK] [int] NULL,
	[PHU_CITY] [nvarchar](50) NULL,
	[PHU_GROUP] [nvarchar](50) NULL,
	[CREATED_DATE] [datetime] NULL,
	[UPDATED_DATE] [datetime] NULL,
	[STATUS] [int] NULL,
	[SOR] [int] NULL,
	[phu_group_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PHU_GROUP_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reported_Case]    Script Date: 1/8/2023 6:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reported_Case](
	[Object_SK] [int] IDENTITY(1,1) NOT NULL,
	[Age] [varchar](50) NULL,
	[Gender] [nvarchar](20) NULL,
	[AccurateEpisode_Dt] [datetime] NULL,
	[OutbreakRelated] [char](10) NULL,
	[Exposure] [varchar](50) NULL,
	[SpecimenDate] [datetime] NULL,
	[CaseReported_Date] [datetime] NULL,
	[Test_Reported_Date] [datetime] NULL,
	[Case_Status] [varchar](50) NULL,
	[PHU_SK] [int] NULL,
	[Object_ID] [int] NULL,
	[SOR] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Status] [int] NULL,
	[Outcome] [varchar](50) NULL,
	[Case_Acquisition] [nvarchar](255) NULL,
 CONSTRAINT [PK_Case] PRIMARY KEY CLUSTERED 
(
	[Object_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vaccines_by_age_PHU]    Script Date: 1/8/2023 6:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vaccines_by_age_PHU](
	[Vaccination_SK] [int] IDENTITY(1,1) NOT NULL,
	[Age_group] [varchar](50) NULL,
	[PHU_SK] [int] NULL,
	[Vaccination_Date] [datetime] NULL,
	[First_Dose] [int] NULL,
	[Second_Dose] [int] NULL,
	[Third_dose] [int] NULL,
	[Fully_Vaccinated] [int] NULL,
	[Vaccines_ID] [int] NULL,
	[SOR] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Vaccines_by_age_PHU] PRIMARY KEY CLUSTERED 
(
	[Vaccination_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ongoing_break_PHU]  WITH CHECK ADD  CONSTRAINT [FK_Ongoing_break_PHU] FOREIGN KEY([PHU_SK])
REFERENCES [dbo].[PHU] ([PHU_SK])
GO
ALTER TABLE [dbo].[Ongoing_break_PHU] CHECK CONSTRAINT [FK_Ongoing_break_PHU]
GO
ALTER TABLE [dbo].[PHU_GROUP]  WITH CHECK ADD  CONSTRAINT [FK_PHU_GROUP_PHU] FOREIGN KEY([PHU_SK])
REFERENCES [dbo].[PHU] ([PHU_SK])
GO
ALTER TABLE [dbo].[PHU_GROUP] CHECK CONSTRAINT [FK_PHU_GROUP_PHU]
GO
ALTER TABLE [dbo].[Reported_Case]  WITH CHECK ADD  CONSTRAINT [FK_Case] FOREIGN KEY([PHU_SK])
REFERENCES [dbo].[PHU] ([PHU_SK])
GO
ALTER TABLE [dbo].[Reported_Case] CHECK CONSTRAINT [FK_Case]
GO
ALTER TABLE [dbo].[Vaccines_by_age_PHU]  WITH CHECK ADD  CONSTRAINT [FK_Vaccines_by_age_PHU] FOREIGN KEY([PHU_SK])
REFERENCES [dbo].[PHU] ([PHU_SK])
GO
ALTER TABLE [dbo].[Vaccines_by_age_PHU] CHECK CONSTRAINT [FK_Vaccines_by_age_PHU]
GO
/****** Object:  StoredProcedure [dbo].[FACT1_CALCULATED]    Script Date: 1/8/2023 6:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  OR ALTER PROCEDURE [dbo].[FACT1_CALCULATED]
AS
BEGIN
	DECLARE @case_report THONG_KE_FACT1
	insert into @case_report
	select p.phu_id, DATEPART(YEAR, r.CASEREPORTED_DATE) AS YEAR, COUNT(r.OBJECT_SK) AS [SO CA NHIEM]
	from Reported_Case r, PHU p
	where r.SOR = 2	--AND (r.CreatedDate between @lset and @cet or r.UpdatedDate between @lset and @cet)
	AND r.phu_sk = p.phu_sk AND p.Status = 1
	group by r.SOR, p.phu_id, DATEPART(YEAR, r.CASEREPORTED_DATE)

	insert into @case_report
	select p.phu_id, DATEPART(YEAR, AccurateEpisode_Dt) AS YEAR, COUNT(OBJECT_SK) AS [SO CA NHIEM]
	from Reported_Case r, PHU p
	where r.sor = 1 --AND (r.CreatedDate between @lset and @cet or r.UpdatedDate between @lset and @cet)
		AND r.phu_sk = p.phu_sk AND p.Status = 1
	group by r.SOR, p.PHU_ID, DATEPART(YEAR, r.AccurateEpisode_Dt)

	
	select PHU_ID, DYEAR, SUM(NUM_OF_CASES) AS 'SO CA NHIEM'
	from @case_report
	group by PHU_ID, DYEAR
END;

GO
/****** Object:  StoredProcedure [dbo].[FACT1_CALCULATED_OUTCOME]    Script Date: 1/8/2023 6:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER  PROCEDURE [dbo].[FACT1_CALCULATED_OUTCOME]  @outcome INT
AS
BEGIN
	DECLARE @outcome_1 VARCHAR(50)
	DECLARE @case_status VARCHAR(50)

	IF @outcome = 1
	BEGIN
		SET @outcome_1 = 'Fatal'
		SET @case_status = 'Deceased'
	END
	IF @outcome = 2
	BEGIN
		SET @outcome_1 = 'Resolved'
		SET @case_status = 'Recovered'
	END
	IF @outcome = 3
	BEGIN
		SET @case_status = 'Active'
		SET @outcome_1 = 'Not Resolved'
	END

	DECLARE @case_report THONG_KE_FACT1

	insert into @case_report
	select p.PHU_ID, DATEPART(YEAR, CASEREPORTED_DATE) AS YEAR, COUNT(OBJECT_SK) AS [SO CA NHIEM]
	from Reported_Case r, phu p
	where r.SOR = 2 AND r.PHU_SK = p.PHU_SK
		--AND (r.CreatedDate between @lset and @cet or r.UpdatedDate between @lset and @cet)
		AND Case_Status LIKE @case_status and p.Status = 1
	group by r.SOR, p.PHU_ID, DATEPART(YEAR, CASEREPORTED_DATE)
	ORDER BY p.PHU_ID, DATEPART(YEAR, CASEREPORTED_DATE)

	insert into @case_report
	select p.PHU_ID, DATEPART(YEAR, AccurateEpisode_Dt) AS YEAR, COUNT(OBJECT_SK) AS [SO CA NHIEM]
	from Reported_Case r, PHU p
	where r.SOR = 1 AND r.PHU_SK = p.PHU_ID
		--AND (r.CreatedDate between @lset and @cet or r.UpdatedDate between @lset and @cet)
		AND Outcome LIKE @outcome_1
	group by r.SOR, p.PHU_ID, DATEPART(YEAR, AccurateEpisode_Dt)
	ORDER BY p.PHU_ID, DATEPART(YEAR, AccurateEpisode_Dt)

	
	select PHU_ID, DYEAR, SUM(NUM_OF_CASES) AS 'SO CA NHIEM'
	from @case_report
	group by PHU_ID, DYEAR
END;
GO
/****** Object:  StoredProcedure [dbo].[FACT4_CALCULATED]    Script Date: 1/8/2023 6:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER  PROCEDURE [dbo].[FACT4_CALCULATED] 
AS
BEGIN
	DECLARE @case_report THONG_KE_FACT4
	insert into @case_report
	select CONVERT(DATE,r.CASEREPORTED_DATE) AS DOY, COUNT(r.OBJECT_SK) AS [SO CA NHIEM]
	from Reported_Case r
	where r.SOR = 2	--AND (r.CreatedDate between @lset and @cet or r.UpdatedDate between @lset and @cet)
	group by CONVERT(DATE,r.CASEREPORTED_DATE)

	insert into @case_report
	select CONVERT(DATE, r.AccurateEpisode_Dt) AS DOY, COUNT(OBJECT_SK) AS [SO CA NHIEM]
	from Reported_Case r, PHU p
	where r.sor = 1 --AND (r.CreatedDate between @lset and @cet or r.UpdatedDate between @lset and @cet)
	group by CONVERT(DATE, r.AccurateEpisode_Dt)

	select D_DATE, SUM(NUM_OF_CASES) AS 'SO CA NHIEM'
	from @case_report
	group by D_DATE
	ORDER BY SUM(NUM_OF_CASES) DESC
END;
GO
/****** Object:  StoredProcedure [dbo].[FACT4_CALCULATED_DEATH]    Script Date: 1/8/2023 6:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER  PROCEDURE [dbo].[FACT4_CALCULATED_DEATH]  @outcome INT
AS
BEGIN
	DECLARE @outcome_1 VARCHAR(50)
	DECLARE @case_status VARCHAR(50)

	IF @outcome = 1
	BEGIN
		SET @outcome_1 = 'Fatal'
		SET @case_status = 'Deceased'
	END
	
	DECLARE @case_report THONG_KE_FACT4

	insert into @case_report
	select CONVERT(DATE,r.CASEREPORTED_DATE) AS DOY, COUNT(OBJECT_SK) AS [SO CA NHIEM]
	from Reported_Case r
	where r.SOR = 2
		--AND (r.CreatedDate between @lset and @cet or r.UpdatedDate between @lset and @cet)
		AND Case_Status LIKE @case_status
	group by CONVERT(DATE,r.CASEREPORTED_DATE)

	insert into @case_report
	select CONVERT(DATE, AccurateEpisode_Dt) AS DOY, COUNT(OBJECT_SK) AS [SO CA NHIEM]
	from Reported_Case r
	where r.SOR = 1 
		--AND (r.CreatedDate between @lset and @cet or r.UpdatedDate between @lset and @cet)
		AND Outcome LIKE @outcome_1
	group by CONVERT(DATE, AccurateEpisode_Dt)

	select d_date, SUM(NUM_OF_CASES) AS 'SO CA NHIEM'
	from @case_report
	group by d_date
	ORDER BY SUM(NUM_OF_CASES) DESC
END;
GO
/****** Object:  StoredProcedure [dbo].[FACT5A_CALCULATED]    Script Date: 1/8/2023 6:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  OR ALTER PROCEDURE [dbo].[FACT5A_CALCULATED] 
AS
BEGIN
	DECLARE @case_report THONG_KE_FACT5A
	insert into @case_report
	Select YEAR(r.CASEREPORTED_DATE) AS YEARMAP,  P.PHU_ID, COUNT(r.OBJECT_SK) AS [SO CA NHIEM]
	from Reported_Case r JOIN [dbo].[PHU] p ON P.PHU_SK = R.PHU_SK
	where r.SOR = 2	--AND (r.CreatedDate between @lset and @cet or r.UpdatedDate between @lset and @cet)
	group by YEAR(r.CASEREPORTED_DATE), P.PHU_ID

	insert into @case_report
	select YEAR(r.AccurateEpisode_Dt) AS YEARMAP , P.PHU_ID, COUNT(OBJECT_SK) AS [SO CA NHIEM]
	from Reported_Case r JOIN  PHU p ON P.PHU_SK = R.PHU_SK
	where r.sor = 1 --AND (r.CreatedDate between @lset and @cet or r.UpdatedDate between @lset and @cet)
	group by YEAR(r.AccurateEpisode_Dt), P.PHU_ID


	select D_YEAR, SUM(NUM_OF_CASES) AS 'SO CA NHIEM', PHU_ID , [covid19_dds].[dbo].SP_GetSeriousLevel(SUM(NUM_OF_CASES)) AS SERIOUS_LEVEL
	from @case_report
	group by D_YEAR, PHU_ID
	ORDER BY SUM(NUM_OF_CASES) DESC
END;
GO
/****** Object:  StoredProcedure [dbo].[FACT5A_CALCULATED_DEATH]    Script Date: 1/8/2023 6:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER  PROCEDURE [dbo].[FACT5A_CALCULATED_DEATH]  @outcome INT
AS
BEGIN
	DECLARE @outcome_1 VARCHAR(50)
	DECLARE @case_status VARCHAR(50)

	IF @outcome = 1
	BEGIN
		SET @outcome_1 = 'Fatal'
		SET @case_status = 'Deceased'
	END
	
	DECLARE @case_report THONG_KE_FACT5A

	insert into @case_report
	select YEAR(r.CASEREPORTED_DATE) AS YEARMAP,  P.PHU_ID, COUNT(r.OBJECT_SK) AS [SO CA NHIEM]
	from Reported_Case r JOIN [dbo].[PHU] P ON P.PHU_SK = R.PHU_SK
	where r.SOR = 2
		--AND (r.CreatedDate between @lset and @cet or r.UpdatedDate between @lset and @cet)
		AND Case_Status LIKE @case_status
	group by YEAR(r.CASEREPORTED_DATE), P.PHU_ID

	insert into @case_report
	select  YEAR(r.AccurateEpisode_Dt) AS YEARMAP , P.PHU_ID, COUNT(OBJECT_SK) AS [SO CA NHIEM]
	from Reported_Case r JOIN  PHU p ON P.PHU_SK = R.PHU_SK
	where r.SOR = 1 
		--AND (r.CreatedDate between @lset and @cet or r.UpdatedDate between @lset and @cet)
		AND Outcome LIKE @outcome_1
	group by YEAR(r.AccurateEpisode_Dt), P.PHU_ID

	select D_YEAR, PHU_ID, SUM(NUM_OF_CASES) AS 'SO CA NHIEM'
	from @case_report
	group by D_YEAR, PHU_ID
	ORDER BY SUM(NUM_OF_CASES) DESC
END;
GO
USE [master]
GO
ALTER DATABASE [COVID_19_NDS] SET  READ_WRITE 
GO
