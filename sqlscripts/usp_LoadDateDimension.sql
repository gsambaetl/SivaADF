USE [WineStoreDW]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadDateDimension]    Script Date: 01.02.2023 10:08:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_LoadDateDimension]
AS
BEGIN
	TRUNCATE TABLE [dbo].[dimDate]

	INSERT INTO [dbo].[dimDate]
			([DateYear], [DateMonth], [YearMonth], [LastDayOfMonth], [Quarter], [Season])
	SELECT	[DateYear], [DateMonth], [YearMonth], [LastDayOfMonth], [Quarter], [Season]
	FROM	[stage].[Dates]
END
GO


