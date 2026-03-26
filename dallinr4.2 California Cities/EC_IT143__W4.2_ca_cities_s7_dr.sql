CREATE PROCEDURE dbo.usp_ca_cities_load
AS

/*****************************************************************************************************************
NAME:    dbo.usp_ca_cities_load
PURPOSE: CA Cities load user stored procedure

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

		TRUNCATE TABLE dbo.t_ca_cities;

		INSERT INTO dbo.t_ca_cities
			SELECT v.City
				, v.Incorportation_date
			 FROM dbo.v_ca_cities_load AS v;

		-- 2) Review results
				
		SELECT t.*
			FROM dbo.t_ca_cities AS t;

	END;
GO