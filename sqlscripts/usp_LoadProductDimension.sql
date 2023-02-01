USE [WineStoreDW]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadProductDimension]    Script Date: 01.02.2023 10:50:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_LoadProductDimension]
AS
BEGIN
	DELETE  [dbo].[dimProduct] 

	INSERT INTO [dbo].[dimProduct]
			(	[ProductNo], [ProductName], [Type], [Designation], [Winery], [Varietal], [Vintage], 
				[Score], [DealerPrice], [Markup], [ListPrice], [EffectiveDate], [EndDate]
			)
	SELECT		[ProductNo], [Title], [Varietal], [Designation], [Winery], [Varietal], [Vintage], 
				[Score], [DealerPrice], [Markup], [ListPrice], '1/1/2021', '12/31/9999'
	FROM	[stage].[Product]
	ORDER BY ProductNo
END
GO