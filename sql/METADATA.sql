CREATE DATABASE [Covid_19_METADATA]
GO
USE [Covid_19_METADATA]
GO
/****** Object:  Table [dbo].[COVID_DB]    Script Date: 1/8/2023 2:38:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COVID_DB](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tenbang] [varchar](50) NULL,
	[ngaycapnhat] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DDS]    Script Date: 1/8/2023 2:38:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DDS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tenbang] [nvarchar](50) NULL,
	[ngaycapnhat] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[COVID_DB] ON 

INSERT [dbo].[COVID_DB] ([id], [tenbang], [ngaycapnhat]) VALUES (1, N'Ontario_Cases_Report', CAST(N'2023-01-06T18:10:57.000' AS DateTime))
INSERT [dbo].[COVID_DB] ([id], [tenbang], [ngaycapnhat]) VALUES (2, N'Canada_Compiled_Case', CAST(N'2023-01-06T18:10:59.000' AS DateTime))
INSERT [dbo].[COVID_DB] ([id], [tenbang], [ngaycapnhat]) VALUES (3, N'Ontario_ongoing_outbreaks', CAST(N'2023-01-06T18:11:37.000' AS DateTime))
INSERT [dbo].[COVID_DB] ([id], [tenbang], [ngaycapnhat]) VALUES (4, N'Ontario_PHU', CAST(N'2023-01-06T18:11:35.000' AS DateTime))
INSERT [dbo].[COVID_DB] ([id], [tenbang], [ngaycapnhat]) VALUES (5, N'Ontario_PHU_GROUP', CAST(N'2023-01-06T18:11:39.000' AS DateTime))
INSERT [dbo].[COVID_DB] ([id], [tenbang], [ngaycapnhat]) VALUES (6, N'Ontario_Vaccines_By_Age', CAST(N'2023-01-06T18:10:47.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[COVID_DB] OFF
GO
SET IDENTITY_INSERT [dbo].[DDS] ON 

INSERT [dbo].[DDS] ([id], [tenbang], [ngaycapnhat]) VALUES (1, N'DIM_AGE_GROUP', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[DDS] ([id], [tenbang], [ngaycapnhat]) VALUES (2, N'DIM_CITY', CAST(N'2023-01-06T21:57:06.000' AS DateTime))
INSERT [dbo].[DDS] ([id], [tenbang], [ngaycapnhat]) VALUES (3, N'DIM_DATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[DDS] ([id], [tenbang], [ngaycapnhat]) VALUES (4, N'DIM_GENDER', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[DDS] ([id], [tenbang], [ngaycapnhat]) VALUES (5, N'DIM_MONTH', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[DDS] ([id], [tenbang], [ngaycapnhat]) VALUES (6, N'DIM_OUT_BREAK_GROUP', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[DDS] ([id], [tenbang], [ngaycapnhat]) VALUES (7, N'DIM_PHU', CAST(N'2023-01-07T00:19:11.000' AS DateTime))
INSERT [dbo].[DDS] ([id], [tenbang], [ngaycapnhat]) VALUES (8, N'DIM_PHU_GROUP', CAST(N'2023-01-06T13:28:34.000' AS DateTime))
INSERT [dbo].[DDS] ([id], [tenbang], [ngaycapnhat]) VALUES (9, N'DIM_QUATER', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[DDS] ([id], [tenbang], [ngaycapnhat]) VALUES (10, N'DIM_SEVERITY', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[DDS] ([id], [tenbang], [ngaycapnhat]) VALUES (11, N'DIM_YEAR', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[DDS] ([id], [tenbang], [ngaycapnhat]) VALUES (12, N'FACT1_COVID_COUNT', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[DDS] ([id], [tenbang], [ngaycapnhat]) VALUES (13, N'FACT2_SEVERITY', CAST(N'2022-12-30T00:13:49.000' AS DateTime))
INSERT [dbo].[DDS] ([id], [tenbang], [ngaycapnhat]) VALUES (14, N'FACT3_CASES', CAST(N'2023-01-06T15:03:39.000' AS DateTime))
INSERT [dbo].[DDS] ([id], [tenbang], [ngaycapnhat]) VALUES (15, N'FACT4_5A_CASES', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[DDS] ([id], [tenbang], [ngaycapnhat]) VALUES (16, N'FACT5B_VACCINES', CAST(N'2023-01-06T15:24:36.000' AS DateTime))
INSERT [dbo].[DDS] ([id], [tenbang], [ngaycapnhat]) VALUES (17, N'FACT6_NEW', CAST(N'2023-01-03T14:49:08.000' AS DateTime))
INSERT [dbo].[DDS] ([id], [tenbang], [ngaycapnhat]) VALUES (18, N'FACT_A', CAST(N'2023-01-01T17:33:50.000' AS DateTime))
INSERT [dbo].[DDS] ([id], [tenbang], [ngaycapnhat]) VALUES (19, N'FACT5A', CAST(N'2023-01-07T00:19:52.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[DDS] OFF
GO
