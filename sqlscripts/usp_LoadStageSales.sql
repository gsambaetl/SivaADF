USE [WineStoreDW]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadStageSales]    Script Date: 01.02.2023 10:06:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_LoadStageSales]
AS 
BEGIN

	TRUNCATE TABLE [stage].[Sales]

	INSERT INTO [stage].[Sales]
	([ProductNo], [OnlineRetailer], [SalesMonth], [SalesTerritory], [SalesCurrency], [Title], [Vintage], [Variety], [Score], [ListPrice], [Quantity])
	SELECT	[ProductNo], [OnlineRetailer], [SalesMonth], 'EU', 'EUR', [Title], ISNULL([Vintage], 9999), [Variety], [Score], [ListPrice], [Quantity]
	FROM	[stage].[Arancione_2022_01]
	WHERE	[Quantity] > 0
	AND		[SalesMonth] IS NOT NULL

	INSERT INTO [stage].[Sales]
	([ProductNo], [OnlineRetailer], [SalesMonth], [SalesTerritory], [SalesCurrency], [Title], [Vintage], [Variety], [Score], [ListPrice], [Quantity])
	SELECT	[ProductNo], [OnlineRetailer], [SalesMonth], [SalesRegion], [SalesCurrency], [Title], ISNULL([Vintage], 9999), [Variety], [Score], ROUND([ListPrice], 0), SUM([Quantity])
	FROM	[stage].[Celeste_2022_01]
	WHERE	[OnlineRetailer] IS NOT NULL 
	AND		[Quantity] > 0 
	GROUP BY [ProductNo], [OnlineRetailer], [SalesMonth], [SalesRegion], [SalesCurrency], [Title], ISNULL([Vintage], 9999), [Variety], [Score], ROUND([ListPrice], 0)

END


GO


