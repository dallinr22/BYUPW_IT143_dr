CREATE PROCEDURE dbo.usp_video_games_load
AS

/*****************************************************************************************************************
NAME:    dbo.v_video_games_load
PURPOSE: Video Games - load user stored procedure

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     03/23/2026   DRAMOS      1. Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
This script helps me to fulfill step 7 of 8 in 4.2.
 
******************************************************************************************************************/


BEGIN

	-- 1) Reload data

	TRUNCATE TABLE dbo.t_video_games;

	INSERT INTO dbo.t_video_games
		SELECT v.Game
			, v.NAXboxGameSales
			FROM dbo.v_video_games_load AS v;


	-- 2) Review Results

	SELECT t.*
		FROM dbo.t_video_games AS t;

END;
GO