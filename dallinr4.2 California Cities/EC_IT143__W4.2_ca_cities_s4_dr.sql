DROP VIEW IF EXISTS dbo.v_ca_cities_load;
GO

CREATE VIEW dbo.v_ca_cities_load
AS

/*****************************************************************************************************************
NAME:    dbo.v_ca_cities_load
PURPOSE: Create the CA Cities load view

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     03/23/2026   DRAMOS      1. Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
This script helps me to fulfill step 4 of 8 in 4.2.
 
******************************************************************************************************************/

SELECT TOP 10 City, Incorportation_date 
	FROM dbo.cal_populations_city
	ORDER BY Incorportation_date
;