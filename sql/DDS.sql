USE [COVID19_DDS]
GO
/****** Object:  UserDefinedFunction [dbo].[SP_GetSeriousLevel]    Script Date: 1/8/2023 2:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   function [dbo].[SP_GetSeriousLevel] (@number int )
returns int
begin
	declare @kq int;
	declare @min int;
	declare @max int;
	declare @level int;

	declare c cursor for (select min_case_year, max_case_year, serious_level from [dbo].[DIM_SEVERITY])
	set @kq=1;
	open c
	while @@fetch_status=0
	begin
		fetch next from c into @min, @max, @level
		if ( @number < @max)
		begin
			if (@number > @min)
				return @kq;
		end
			
		else
		begin
			set @kq = @kq + 1
		end
	end
	close c
	deallocate c
	return @kq;
end
GO
/****** Object:  Table [dbo].[DIM_CITY]    Script Date: 1/8/2023 2:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_CITY](
	[CITY_SK] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](50) NULL,
	[PHU_Group_ID] [int] NULL,
	[Created_Date] [date] NULL,
	[Updated_Date] [date] NULL,
	[Status] [int] NULL,
	[SOR] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CITY_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_PHU]    Script Date: 1/8/2023 2:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_PHU](
	[PHU_SK] [int] IDENTITY(1,1) NOT NULL,
	[Reporting_PHU] [nvarchar](max) NULL,
	[Reporting_PHU_Address] [nvarchar](max) NULL,
	[Reporting_PHU_Postal_Code] [nvarchar](10) NULL,
	[Reporting_PHU_Website] [nvarchar](max) NULL,
	[Reporting_PHU_Latitude] [float] NULL,
	[Reporting_PHU_Longitude] [float] NULL,
	[Province] [nvarchar](255) NULL,
	[Created_Date] [date] NULL,
	[Updated_Date] [date] NULL,
	[Status] [int] NULL,
	[SOR] [int] NULL,
	[City_ID] [int] NULL,
	[PHU_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PHU_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_PHU_GROUP]    Script Date: 1/8/2023 2:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_PHU_GROUP](
	[PHU_GROUP_SK] [int] IDENTITY(1,1) NOT NULL,
	[PHU_Group] [nvarchar](50) NULL,
	[Created_Date] [date] NULL,
	[Updated_Date] [date] NULL,
	[Status] [int] NULL,
	[SOR] [int] NULL,
	[phu_group_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PHU_GROUP_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_A]    Script Date: 1/8/2023 2:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_A](
	[DATE_SK] [int] NOT NULL,
	[SEVERITY_SK] [int] NOT NULL,
	[NUM_OF_CASES] [int] NULL,
	[DEATH_CASE] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DATE_SK] ASC,
	[SEVERITY_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT1_COVID_COUNT]    Script Date: 1/8/2023 2:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT1_COVID_COUNT](
	[PHU_SK] [int] NOT NULL,
	[YEAR_SK] [int] NOT NULL,
	[Death_Cases] [int] NULL,
	[Num_of_Cases] [int] NULL,
	[Recovery_cases] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PHU_SK] ASC,
	[YEAR_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT2_SEVERITY]    Script Date: 1/8/2023 2:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT2_SEVERITY](
	[PHU_SK] [int] NOT NULL,
	[SEVERITY_SK] [int] NOT NULL,
	[QUATER_SK] [int] NOT NULL,
	[Check_Severity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PHU_SK] ASC,
	[SEVERITY_SK] ASC,
	[QUATER_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT3_CASES]    Script Date: 1/8/2023 2:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT3_CASES](
	[Gender_SK] [int] NOT NULL,
	[AgeGroup_SK] [int] NOT NULL,
	[Year_SK] [int] NOT NULL,
	[Death_Case] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Gender_SK] ASC,
	[AgeGroup_SK] ASC,
	[Year_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT5A]    Script Date: 1/8/2023 2:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT5A](
	[YEAR_SK] [int] NOT NULL,
	[PHU_SK] [int] NOT NULL,
	[SEVERITY_SK] [int] NOT NULL,
	[NUM_CASE] [int] NULL,
	[DEATH_CASE] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[YEAR_SK] ASC,
	[PHU_SK] ASC,
	[SEVERITY_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT5B_VACCINES]    Script Date: 1/8/2023 2:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT5B_VACCINES](
	[Year_SK] [int] NOT NULL,
	[First_Dose] [bigint] NULL,
	[Second_dose] [bigint] NULL,
	[Third_dose] [bigint] NULL,
	[Fully_vaccinated] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Year_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT6_CASES]    Script Date: 1/8/2023 2:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT6_CASES](
	[PHU_GROUP_SK] [int] NOT NULL,
	[SEVERITY_SK] [int] NOT NULL,
	[OUT_BREAK_GROUP_SK] [int] NOT NULL,
	[YEAR_SK] [int] NULL,
	[Num_of_Cases] [int] NULL,
	[Death_Cases] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PHU_GROUP_SK] ASC,
	[SEVERITY_SK] ASC,
	[OUT_BREAK_GROUP_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT6_NEW]    Script Date: 1/8/2023 2:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT6_NEW](
	[YEAR_SK] [int] NOT NULL,
	[SEVERITY_SK] [int] NOT NULL,
	[PHU_GROUP_SK] [int] NOT NULL,
	[ACIQUISITION_SK] [int] NOT NULL,
	[NUMBER_OF_CASE] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[YEAR_SK] ASC,
	[SEVERITY_SK] ASC,
	[PHU_GROUP_SK] ASC,
	[ACIQUISITION_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[INSERT_DIM_DATE]    Script Date: 1/8/2023 2:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[INSERT_DIM_DATE]
AS
BEGIN
	DECLARE @year INT, @month INT, @day INT, @quater INT, @year_id int, @quater_id int, @month_id int

	SET @year = 2019
	WHILE @year < 2023
	BEGIN
		INSERT INTO DIM_YEAR(DYear) VALUES (@year)
		SELECT @year_id = Year_SK from DIM_YEAR where DYear = @year
		SET @quater = 1
		WHILE @quater < 5
		BEGIN
			INSERT INTO dim_quater(Quater,Year_SK) VALUES (@quater,@year_id)
			SELECT @quater_id = Quater_SK from DIM_QUATER where Quater = @quater
			if (@quater = 1)
			BEGIN
				SET @month = 1
				WHILE @month < 4
				BEGIN
					INSERT INTO DIM_MONTH(DMonth, Quater_SK) VALUES (@month,@quater_id)
					select @month_id = MONTH_SK from DIM_MONTH where DMonth = @month
					set @day = 1
					while @day < 32
					begin
						If @day = 29 and @month = 2
							BREAK
						insert into DIM_DATE(DDay, Month_SK) values (@day, @month_id)
						SET @day = @day + 1
					end
					SET @month = @month + 1
				END

			END
			if (@quater = 2)
			BEGIN
				SET @month = 4
				WHILE @month < 7
				BEGIN
					INSERT INTO DIM_MONTH(DMonth, Quater_SK) VALUES (@month,@quater_id)
					select @month_id = MONTH_SK from DIM_MONTH where DMonth = @month
					set @day = 1
					while @day < 32
					begin
						If @day = 31 and (@month = 4 or @month = 6)
							BREAK
						insert into DIM_DATE(DDay, Month_SK) values (@day, @month_id)
						SET @day = @day + 1
					end
					SET @month = @month + 1
				END

			END
			if (@quater = 3)
			BEGIN
				SET @month = 7
				WHILE @month < 10
				BEGIN
					INSERT INTO DIM_MONTH(DMonth, Quater_SK) VALUES (@month,@quater_id)
					select @month_id = MONTH_SK from DIM_MONTH where DMonth = @month
					set @day = 1
					while @day < 32
					begin
						If @day = 31 and (@month = 9)
							BREAK
						insert into DIM_DATE(DDay, Month_SK) values (@day, @month_id)
						SET @day = @day + 1
					end
					SET @month = @month + 1
				END

			END
			if (@quater = 4)
			BEGIN
				SET @month = 10
				WHILE @month < 13
				BEGIN
					INSERT INTO DIM_MONTH(DMonth, Quater_SK) VALUES (@month,@quater_id)
					select @month_id = MONTH_SK from DIM_MONTH where DMonth = @month
					set @day = 1
					while @day < 32
					begin
						If @day = 31 and (@month = 11)
							BREAK
						insert into DIM_DATE(DDay, Month_SK) values (@day, @month_id)
						SET @day = @day + 1
					end
					SET @month = @month + 1
				END

			END
			SET @quater = @quater + 1
		END	
		SET @year = @year + 1
	END
END
GO
EXEC [INSERT_DIM_DATE]
GO