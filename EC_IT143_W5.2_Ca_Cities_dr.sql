/*****************************************************************************************************************
NAME:    CaCitiesAnswers
PURPOSE: Answers questions about my CA Cities database.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     04/3/2026   DRAMOS      1. Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
This script answers 3 questions from myself and one from another student about my three California Cities tables. 
 
******************************************************************************************************************/

--SELECT * FROM dbo.cal_cities_lat_long;
--SELECT * FROM dbo.cal_populations_city
--ORDER BY Incorportation_date;


-- Q1: What are the newer cities according to the data? Show me the ones that have been incorporated since 1985, and their location. ME
-- A1: We need to join both tables and show the latitude and longitude of the cities incorprated after 1984.

SELECT 
	c.City
	, c.Incorportation_date
	, l.Latitude
	, l.Longitude
FROM dbo.cal_populations_city c
LEFT JOIN dbo.cal_cities_lat_long l on c.city = l.name
WHERE c.Incorportation_date >= 1985
ORDER BY c.Incorportation_date
;


-- Q2:How many cities have a latitude north of San Francisco? Give me a list of the cities in CA where the latitude is greater than that of SF, 
-- and their populations greatest to least. ME
-- A2: This find the latitude of SF, then all the cities with a greater latitude, and it includes their latest population.

SELECT 
	l.Name
	, l.Latitude
	, c.pop_april_2010
FROM dbo.cal_cities_lat_long l
LEFT JOIN dbo.cal_populations_city c ON c.city = l.name
WHERE l.Latitude > (
	SELECT latitude
	FROM dbo.cal_cities_lat_long
	WHERE name = 'San Francisco'
	)
	AND c.pop_april_2010 IS NOT NULL
ORDER BY c.pop_april_2010 DESC
;


-- Q3: What cities have the smallest populations, as of the latest data? I need to see the 20 smallest cities and their population in 2010. ME
-- A3: We will use a select statement for the top 20 cities by population descending. 

SELECT TOP 20
	City
	, pop_april_2010
FROM dbo.cal_populations_city
WHERE pop_april_2010 IS NOT NULL
ORDER BY pop_april_2010 ASC



-- Q4:Which California cities have experienced the greatest population growth since 1980 and where are they geographically located? I would need
-- to combine the population columns from the City Populations table with the latitude and longitude fields from the CA Cities Lat/Long table. Moses Anafe
-- A4: This statement calculates the percentage growth, and selects the 20 with the most growth. 

SELECT TOP 20
	c.City
	, (((c.pop_april_2010 - c.pop_april_1980) * 100) / c.pop_april_1980) AS "Growth%"
	, l.Latitude
	, l.Longitude
FROM dbo.cal_populations_city c
LEFT JOIN dbo.cal_cities_lat_long l ON c.city = l.name
WHERE c.pop_april_2010 IS NOT NULL
AND c.pop_april_1980 IS NOT NULL
ORDER BY ((c.pop_april_2010 - c.pop_april_1980) / c.pop_april_1980) DESC
;

SELECT GETDATE() AS My_Date