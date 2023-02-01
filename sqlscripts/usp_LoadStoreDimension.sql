USE [WineStoreDW]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadStoreDimension]    Script Date: 01.02.2023 10:08:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_LoadStoreDimension]
AS
BEGIN
	TRUNCATE TABLE [dbo].[dimStore]

	INSERT INTO [dbo].[dimStore]
			([StoreName], [StoreType], [Description])
	SELECT	[StoreName], [StoreType], [Description]
	FROM	[stage].[Store]
END
GO



