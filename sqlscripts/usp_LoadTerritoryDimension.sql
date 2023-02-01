USE [WineStoreDW]
GO
/****** Object:  StoredProcedure [dbo].[usp_LoadTerritoryDimension]    Script Date: 01.02.2023 15:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_LoadTerritoryDimension]
AS
BEGIN

	IF EXISTS (SELECT * 
				FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
				WHERE CONSTRAINT_NAME='FK_factSales_dimTerritory'  
	)
		ALTER TABLE [dbo].[factSales] DROP CONSTRAINT [FK_factSales_dimTerritory]
	

	TRUNCATE TABLE  [dbo].[dimTerritory]

	INSERT INTO [dbo].[dimTerritory]
			([TerritoryCode], [TerritoryName], [TradeRegion], [Continent])
	SELECT	[TerritoryCode], [TerritoryName], [TradeRegion], [Continent]
	FROM	[stage].[Territory]
	ORDER BY [TerritoryCode]

	ALTER TABLE [dbo].[factSales]  WITH CHECK ADD  CONSTRAINT [FK_factSales_dimTerritory] FOREIGN KEY([TerritoryId])
	REFERENCES [dbo].[dimTerritory] ([TerritoryId])

	ALTER TABLE [dbo].[factSales] CHECK CONSTRAINT [FK_factSales_dimTerritory]
	
END
