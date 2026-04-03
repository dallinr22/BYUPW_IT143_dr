/*****************************************************************************************************************
NAME:    EC_IT143_W5.2_Video_Games_dr
PURPOSE: Answers questions about my video games database.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     04/3/2026   DRAMOS      1. Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
This script answers 3 questions from myself and one from another student about my three Video Game Sales tables. 
 
******************************************************************************************************************/

--SELECT * FROM dbo.XboxOne_GameSales;
--SELECT * FROM dbo.PS4_GamesSales;
--SELECT * FROM dbo.Video_Games_Sales_as_at_22_Dec_2016
;

-- Q1: Which regions have the most total game sales? Give me the regions with their total game sales on Xbox and PS4. ME
-- A1: This script needs to show the sum of all the number of games sold for each region, on both platforms.

SELECT 
	'XboxOne' AS Platform
	, SUM(x.north_america) AS NA
	, SUM(x.europe) AS EU, SUM(x.japan) AS JAP
	, SUM(x.rest_of_world) as REST
FROM dbo.XboxOne_GameSales x
UNION
SELECT 
	'PS4'
	, SUM(p.north_america) AS NA
	, SUM(p.europe) AS EU
	, SUM(p.japan) AS JAP
	, SUM(p.rest_of_world) AS REST
FROM dbo.PS4_GamesSales p
;


-- Q2: What are the least favored games according to users? Give me the 10 games with the lowest score from the data from 2016. ME
-- A2: A simple select statement to have the 10 user scores from least to greatest.

SELECT TOP 10 
	Name
	, User_Score
FROM dbo.Video_Games_Sales_as_at_22_Dec_2016
WHERE User_Score IS NOT NULL
ORDER BY User_Score ASC
;

-- Q3: Which games that are on both Xbox and PS4 have sold the most? Give me the top 15 games that have the largest combined sales from all places. ME
-- A3:

SELECT TOP 15
	x.Game
	, (x.global + p.global) AS [Global Sales]
FROM dbo.XboxOne_GameSales x
LEFT JOIN dbo.PS4_GamesSales p ON x.game = p.game
ORDER BY (x.global + p.global) DESC
;

-- Q4: I am interested in the top selling genres for both PS4 and Xbox One. Can you tell me which Genre was the top selling for each console? Paytton Alder
-- A4: I accidentally did a command for both consoles combined, so here is top genre for both combined and then separate.

SELECT TOP 1
	x.Genre
	, SUM(x.global + p.global) AS [Comb. Genre Sales]
FROM dbo.XboxOne_GameSales x
LEFT JOIN dbo.PS4_GamesSales p ON x.game = p.game
GROUP BY x.genre
ORDER BY SUM(x.global + p.global) DESC
;

SELECT TOP 1
	Genre
	, SUM(global) AS [Xbox Genre Sales]
FROM dbo.XboxOne_GameSales 
GROUP BY genre
ORDER BY SUM(global) DESC
;

SELECT TOP 1
	Genre
	, SUM(global) AS [PS4 Genre Sales]
FROM dbo.PS4_GamesSales 
GROUP BY genre
ORDER BY SUM(global) DESC
;


SELECT GETDATE() AS my_date;