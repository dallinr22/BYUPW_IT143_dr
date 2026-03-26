DROP VIEW IF EXISTS dbo.video_games_load
GO

CREATE VIEW dbo.video_games_load
AS

/*****************************************************************************************************************
NAME:    dbo.video_games_load
PURPOSE: Create the Video Games Load view

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     03/23/2026   DRAMOS      1. Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
This script helps me to fulfill step 4 of 8 in 4.2.
 
******************************************************************************************************************/

	SELECT TOP 3 Game, North_America AS NAXboxGameSales
		FROM dbo.XboxOne_GameSales
		ORDER BY NAXboxSales DESC;