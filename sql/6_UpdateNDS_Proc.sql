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
