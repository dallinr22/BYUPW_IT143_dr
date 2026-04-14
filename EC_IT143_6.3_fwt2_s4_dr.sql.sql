CREATE TRIGGER trg_hello_world_last_mod_by ON dbo.t_hello_world
AFTER UPDATE
AS 


/*****************************************************************************************************************
NAME:    dbo.trg_hello_world_last_mod_by
PURPOSE: Hello World - Last Modified By Trigger

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     04/14/2026   dramos       1. Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
Keeps track of the last modified by for each row in the table
 
******************************************************************************************************************/

	UPDATE dbo.t_hello_world
		   SET 
			last_modified_by = SUSER_NAME()
	WHERE my_message IN
	(
		SELECT DISTINCT	
				my_message
			FROM Inserted
			
	);