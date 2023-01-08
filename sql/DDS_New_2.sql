use [master]
go
CREATE DATABASE [COVID19_DDS]
GO
USE [COVID19_DDS]
GO
/****** Object:  Table [dbo].[DIM_AGE_GROUP]    Script Date: 1/8/2023 3:46:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_AGE_GROUP](
	[AgeGroup_SK] [int] IDENTITY(1,1) NOT NULL,
	[AgeGroup] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AgeGroup_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_CASE_ACQUISITION]    Script Date: 1/8/2023 3:46:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_CASE_ACQUISITION](
	[ACQUISITION_SK] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ACQUISITION_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_GENDER]    Script Date: 1/8/2023 3:46:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_GENDER](
	[Gender_SK] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Gender_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_OUT_BREAK_GROUP]    Script Date: 1/8/2023 3:46:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_OUT_BREAK_GROUP](
	[OUT_BREAK_GROUP_SK] [int] IDENTITY(1,1) NOT NULL,
	[Out_break_Group] [nvarchar](50) NULL,
	[Created_Date] [date] NULL,
	[Updated_Date] [date] NULL,
	[Status] [int] NULL,
	[SOR] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OUT_BREAK_GROUP_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_SEVERITY]    Script Date: 1/8/2023 3:46:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_SEVERITY](
	[SEVERITY_SK] [int] IDENTITY(1,1) NOT NULL,
	[Min_Case] [int] NULL,
	[Max_Case] [int] NULL,
	[Serious_level] [int] NULL,
	[MIN_CASE_DATE] [int] NULL,
	[MAX_CASE_DATE] [int] NULL,
	[MIN_CASE_YEAR] [int] NULL,
	[MAX_CASE_YEAR] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SEVERITY_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DIM_AGE_GROUP] ON 

INSERT [dbo].[DIM_AGE_GROUP] ([AgeGroup_SK], [AgeGroup]) VALUES (1, N'<20')
INSERT [dbo].[DIM_AGE_GROUP] ([AgeGroup_SK], [AgeGroup]) VALUES (2, N'20-29')
INSERT [dbo].[DIM_AGE_GROUP] ([AgeGroup_SK], [AgeGroup]) VALUES (3, N'30-39')
INSERT [dbo].[DIM_AGE_GROUP] ([AgeGroup_SK], [AgeGroup]) VALUES (4, N'40-49')
INSERT [dbo].[DIM_AGE_GROUP] ([AgeGroup_SK], [AgeGroup]) VALUES (5, N'50-59')
INSERT [dbo].[DIM_AGE_GROUP] ([AgeGroup_SK], [AgeGroup]) VALUES (6, N'60-69')
INSERT [dbo].[DIM_AGE_GROUP] ([AgeGroup_SK], [AgeGroup]) VALUES (7, N'70-79')
INSERT [dbo].[DIM_AGE_GROUP] ([AgeGroup_SK], [AgeGroup]) VALUES (8, N'80+')
INSERT [dbo].[DIM_AGE_GROUP] ([AgeGroup_SK], [AgeGroup]) VALUES (9, N'Not Reported')
SET IDENTITY_INSERT [dbo].[DIM_AGE_GROUP] OFF
GO
SET IDENTITY_INSERT [dbo].[DIM_CASE_ACQUISITION] ON 

INSERT [dbo].[DIM_CASE_ACQUISITION] ([ACQUISITION_SK], [NAME]) VALUES (1, N'CC')
INSERT [dbo].[DIM_CASE_ACQUISITION] ([ACQUISITION_SK], [NAME]) VALUES (2, N'MISSING INFORMATION')
INSERT [dbo].[DIM_CASE_ACQUISITION] ([ACQUISITION_SK], [NAME]) VALUES (3, N'NO KNOWN EPI LINK')
INSERT [dbo].[DIM_CASE_ACQUISITION] ([ACQUISITION_SK], [NAME]) VALUES (4, N'OB')
INSERT [dbo].[DIM_CASE_ACQUISITION] ([ACQUISITION_SK], [NAME]) VALUES (5, N'TRAVEL')
INSERT [dbo].[DIM_CASE_ACQUISITION] ([ACQUISITION_SK], [NAME]) VALUES (6, N'UNSPECIFIED EPI LINK')
SET IDENTITY_INSERT [dbo].[DIM_CASE_ACQUISITION] OFF
GO
SET IDENTITY_INSERT [dbo].[DIM_GENDER] ON 

INSERT [dbo].[DIM_GENDER] ([Gender_SK], [Gender]) VALUES (1, N'Male')
INSERT [dbo].[DIM_GENDER] ([Gender_SK], [Gender]) VALUES (2, N'Female')
INSERT [dbo].[DIM_GENDER] ([Gender_SK], [Gender]) VALUES (3, N'Not Reported')
SET IDENTITY_INSERT [dbo].[DIM_GENDER] OFF
GO
SET IDENTITY_INSERT [dbo].[DIM_OUT_BREAK_GROUP] ON 

INSERT [dbo].[DIM_OUT_BREAK_GROUP] ([OUT_BREAK_GROUP_SK], [Out_break_Group], [Created_Date], [Updated_Date], [Status], [SOR]) VALUES (1, N'1 Congregate Care', CAST(N'2022-12-01' AS Date), CAST(N'2022-12-02' AS Date), 1, 3)
INSERT [dbo].[DIM_OUT_BREAK_GROUP] ([OUT_BREAK_GROUP_SK], [Out_break_Group], [Created_Date], [Updated_Date], [Status], [SOR]) VALUES (2, N'2 Congregate Living', CAST(N'2022-12-01' AS Date), CAST(N'2022-12-02' AS Date), 1, 3)
INSERT [dbo].[DIM_OUT_BREAK_GROUP] ([OUT_BREAK_GROUP_SK], [Out_break_Group], [Created_Date], [Updated_Date], [Status], [SOR]) VALUES (3, N'3 Education', CAST(N'2022-12-01' AS Date), CAST(N'2022-12-02' AS Date), 1, 3)
INSERT [dbo].[DIM_OUT_BREAK_GROUP] ([OUT_BREAK_GROUP_SK], [Out_break_Group], [Created_Date], [Updated_Date], [Status], [SOR]) VALUES (4, N'4 Workplace', CAST(N'2022-12-01' AS Date), CAST(N'2022-12-02' AS Date), 1, 3)
INSERT [dbo].[DIM_OUT_BREAK_GROUP] ([OUT_BREAK_GROUP_SK], [Out_break_Group], [Created_Date], [Updated_Date], [Status], [SOR]) VALUES (5, N'5 Recreational', CAST(N'2022-12-01' AS Date), CAST(N'2022-12-02' AS Date), 1, 3)
INSERT [dbo].[DIM_OUT_BREAK_GROUP] ([OUT_BREAK_GROUP_SK], [Out_break_Group], [Created_Date], [Updated_Date], [Status], [SOR]) VALUES (6, N'6 Other/Unknown', CAST(N'2022-12-01' AS Date), CAST(N'2022-12-02' AS Date), 1, 3)
SET IDENTITY_INSERT [dbo].[DIM_OUT_BREAK_GROUP] OFF
GO
SET IDENTITY_INSERT [dbo].[DIM_SEVERITY] ON 

INSERT [dbo].[DIM_SEVERITY] ([SEVERITY_SK], [Min_Case], [Max_Case], [Serious_level], [MIN_CASE_DATE], [MAX_CASE_DATE], [MIN_CASE_YEAR], [MAX_CASE_YEAR]) VALUES (1, 0, 5, 1, 0, 500, 0, 50)
INSERT [dbo].[DIM_SEVERITY] ([SEVERITY_SK], [Min_Case], [Max_Case], [Serious_level], [MIN_CASE_DATE], [MAX_CASE_DATE], [MIN_CASE_YEAR], [MAX_CASE_YEAR]) VALUES (2, 6, 10, 2, 501, 1500, 51, 100)
INSERT [dbo].[DIM_SEVERITY] ([SEVERITY_SK], [Min_Case], [Max_Case], [Serious_level], [MIN_CASE_DATE], [MAX_CASE_DATE], [MIN_CASE_YEAR], [MAX_CASE_YEAR]) VALUES (3, 11, 20, 3, 1501, 3500, 101, 500)
INSERT [dbo].[DIM_SEVERITY] ([SEVERITY_SK], [Min_Case], [Max_Case], [Serious_level], [MIN_CASE_DATE], [MAX_CASE_DATE], [MIN_CASE_YEAR], [MAX_CASE_YEAR]) VALUES (4, 21, 50, 4, 3501, 6500, 501, 1000)
INSERT [dbo].[DIM_SEVERITY] ([SEVERITY_SK], [Min_Case], [Max_Case], [Serious_level], [MIN_CASE_DATE], [MAX_CASE_DATE], [MIN_CASE_YEAR], [MAX_CASE_YEAR]) VALUES (5, 51, 100, 5, 6501, 9000, 1001, 2000)
INSERT [dbo].[DIM_SEVERITY] ([SEVERITY_SK], [Min_Case], [Max_Case], [Serious_level], [MIN_CASE_DATE], [MAX_CASE_DATE], [MIN_CASE_YEAR], [MAX_CASE_YEAR]) VALUES (6, 101, 100000, 6, 9001, 50000, 2000, 5000)
INSERT [dbo].[DIM_SEVERITY] ([SEVERITY_SK], [Min_Case], [Max_Case], [Serious_level], [MIN_CASE_DATE], [MAX_CASE_DATE], [MIN_CASE_YEAR], [MAX_CASE_YEAR]) VALUES (7, NULL, NULL, 7, NULL, NULL, 5001, 15000)
INSERT [dbo].[DIM_SEVERITY] ([SEVERITY_SK], [Min_Case], [Max_Case], [Serious_level], [MIN_CASE_DATE], [MAX_CASE_DATE], [MIN_CASE_YEAR], [MAX_CASE_YEAR]) VALUES (8, NULL, NULL, 8, NULL, NULL, 15001, 50000)
INSERT [dbo].[DIM_SEVERITY] ([SEVERITY_SK], [Min_Case], [Max_Case], [Serious_level], [MIN_CASE_DATE], [MAX_CASE_DATE], [MIN_CASE_YEAR], [MAX_CASE_YEAR]) VALUES (9, NULL, NULL, 9, NULL, NULL, 50001, 100000)
INSERT [dbo].[DIM_SEVERITY] ([SEVERITY_SK], [Min_Case], [Max_Case], [Serious_level], [MIN_CASE_DATE], [MAX_CASE_DATE], [MIN_CASE_YEAR], [MAX_CASE_YEAR]) VALUES (10, NULL, NULL, 10, NULL, NULL, 100001, 200000)
SET IDENTITY_INSERT [dbo].[DIM_SEVERITY] OFF
GO
