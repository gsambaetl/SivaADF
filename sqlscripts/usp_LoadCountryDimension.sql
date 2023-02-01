USE [WineStoreDW]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadCountryDimension]    Script Date: 01.02.2023 10:08:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_LoadCountryDimension]
AS
BEGIN
	TRUNCATE TABLE [dbo].[dimCountry]

	INSERT INTO [dbo].[dimCountry]
			([CountryCode], [CountryName], [TradeRegion], [Continent])
	SELECT	[CountryCode], [CountryName], [TradeRegion], [Continent]
	FROM	[stage].[Country]
	ORDER BY [CountryCode]
	
END
GO

