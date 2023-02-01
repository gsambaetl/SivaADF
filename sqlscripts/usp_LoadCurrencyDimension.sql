USE [WineStoreDW]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadCurrencyDimension]    Script Date: 01.02.2023 10:08:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_LoadCurrencyDimension]
AS
BEGIN
	TRUNCATE TABLE [dbo].[dimCurrency]

	INSERT INTO [dbo].[dimCurrency]
			([CurrencyCode], [CurrencyName])
	SELECT	[CurrencyCode], [CurrencyName]
	FROM	[stage].[Currency]
END
GO



