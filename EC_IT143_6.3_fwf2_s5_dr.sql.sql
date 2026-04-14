--DROP FUNCTION IF EXISTS dbo.udf_parse_last_name;

CREATE FUNCTION dbo.udf_parse_last_name
(@v_combined_name AS VARCHAR(500)
)
RETURNS VARCHAR(100)


/*****************************************************************************************************************
NAME:    dbo.udf_parse_last_name
PURPOSE: Parse last name from combined name

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     04/11/2026   dramos       1. Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
Adapted froom right here:
https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name
 
******************************************************************************************************************/

	BEGIN
		
		DECLARE @v_last_name AS VARCHAR(100);

		SET @v_last_name = SUBSTRING(@v_combined_name, CHARINDEX(' ', @v_combined_name + ' ') + 1, LEN(@v_combined_name));

		RETURN @v_last_name;

	END;
GO