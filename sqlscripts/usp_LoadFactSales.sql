USE [WineStoreDW]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadFactSales]    Script Date: 01.02.2023 16:52:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_LoadFactSales]
AS
BEGIN

	TRUNCATE TABLE [dbo].[factSales]

	INSERT INTO		[dbo].[factSales]
	(
					 [StoreId]
					,[TerritoryId]
					,[ProductId]
					,[DateId]
					,[CurrencyId]
					,[SalesQty]
					,[SalesAmount]
					,[CostAmount]
					,[MarginAmount]
					,[InsertDate]
					,[BatchId]
	)
	SELECT			Store.StoreId,
					Territory.TerritoryId,
					Product.ProductId,
					DD.DateId,
					Currency.CurrencyId,
					Sales.Quantity,
					Sales.Quantity * Sales.ListPrice,
					Sales.Quantity * Product.DealerPrice,
					(Sales.Quantity * Sales.ListPrice - Sales.Quantity * Product.DealerPrice),
					CURRENT_TIMESTAMP,
					-1
	FROM	Stage.Sales Sales

	INNER JOIN
			[dbo].[dimStore] Store
	ON		Sales.OnlineRetailer = Store.StoreName

	INNER JOIN 
			[dbo].[dimTerritory] Territory
	ON		Sales.SalesTerritory = Territory.TerritoryCode

	INNER JOIN
			[dbo].[dimProduct] Product
	ON		Sales.ProductNo = Product.ProductNo

	INNER JOIN 
			[dbo].[dimDate] DD
	ON		Sales.SalesMonth = DD.YearMonth

	INNER JOIN
			[dbo].[dimCurrency] Currency
	ON		Sales.SalesCurrency = Currency. CurrencyCode


END
GO


