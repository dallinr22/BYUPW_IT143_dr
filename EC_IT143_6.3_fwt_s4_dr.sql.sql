CREATE TRIGGER trg_hello_world_last_mod_date ON dbo.t_hello_world
AFTER UPDATE
AS 


/*****************************************************************************************************************
NAME:    dbo.trg_hello_world_last_mod_date
PURPOSE: Hello World - Last Modified Date Trigger

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     04/11/2026   dramos       1. Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
Keeps track of the last modified date for each row in the table
 
******************************************************************************************************************/

	UPDATE dbo.t_hello_world
		SET 
			last_modified_date = GETDATE()
		WHERE my_message IN
		(
			SELECT DISTINCT	
					my_message
				FROM Inserted
			
		);