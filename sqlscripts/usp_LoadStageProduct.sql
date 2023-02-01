USE [WineStoreDW]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadStageProduct]    Script Date: 01.02.2023 10:05:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE PROCEDURE [dbo].[usp_LoadStageProduct]
AS
BEGIN
	TRUNCATE TABLE [stage].[Product]
	

	INSERT INTO [stage].[Product]
	([ProductNo], [Country], [Description], [Designation], [Score], [DealerPrice], [Markup], [ListPrice], [Province], [Region_1], [Region_2], [Varietal], [Taster], [Twitter], [Title], [Vintage], [Winery])

	SELECT [ProductNo]
		  ,[country]
		  ,[description]
		  ,[designation]
		  ,[Score]
		  ,[DealerPrice]
		  ,[Markup]
		  ,[ListPrice]
		  ,[province]
		  ,[region_1]
		  ,[region_2]
		  ,[Variety]
		  ,[taster_ProductName]
		  ,[taster_twitter_handle]
		  ,[Title]
		  ,CASE WHEN [Vintage] is NULL THEN 9999 ELSE [Vintage] END 
		  ,[Winery]
	  FROM [WineStoreDW].[stage].[Arancione_Products]

	INSERT INTO [stage].[Product]
	([ProductNo], [Country], [Description], [Designation], [Score], [DealerPrice], [Markup], [ListPrice], [Province], [Region_1], [Region_2], [Varietal], [Taster], [Twitter], [Title], [Vintage], [Winery])

	SELECT [ProductNo]
		  ,[country]
		  ,[description]
		  ,[designation]
		  ,[Score]
		  ,[DealerPrice]
		  ,[Markup]
		  ,[ListPrice]
		  ,[province]
		  ,[region_1]
		  ,[region_2]
		  ,[Variety]
		  ,[taster_ProductName]
		  ,[taster_twitter_handle]
		  ,[Title]
		  ,CASE WHEN [Vintage] is NULL THEN 9999 ELSE [Vintage] END 
		  ,[Winery]
	  FROM [WineStoreDW].[stage].[Verde_Products]

	  INSERT INTO [stage].[Product]
	([ProductNo], [Country], [Description], [Designation], [Score], [DealerPrice], [Markup], [ListPrice], [Province], [Region_1], [Region_2], [Varietal], [Taster], [Twitter], [Title], [Vintage], [Winery])

	SELECT [ProductNo]
		  ,[country]
		  ,[description]
		  ,[designation]
		  ,[Score]
		  ,[DealerPrice]
		  ,[Markup]
		  ,[ListPrice]
		  ,[province]
		  ,[region_1]
		  ,[region_2]
		  ,[Variety]
		  ,[taster_ProductName]
		  ,[taster_twitter_handle]
		  ,[Title]
		  ,CASE WHEN [Vintage] is NULL THEN 9999 ELSE [Vintage] END 
		  ,[Winery]
	  FROM [WineStoreDW].[stage].[Celeste_Products]


  END
GO


