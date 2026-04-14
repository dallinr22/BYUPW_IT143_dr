-- Q2: How to keep track of who last modified a record?
-- A2: Use an after update trigger!


-- Q3: Did it work?
-- A3: Sure did.

-- Karemaot sapos i stap finis
DELETE FROM dbo.t_hello_world
 WHERE my_message IN('Hello World2', 'Hello World3', 'Hello World4');

-- Load test rows
INSERT INTO dbo.t_hello_world (my_message)
VALUES ('Hello World2'), ('Hello World3');

-- See if the trigger worked
SELECT t.*
  FROM dbo.t_hello_world AS t;

-- Try it again
UPDATE dbo.t_hello_world SET my_message = 'Hello World4'
 WHERE my_message = 'Hello World3';

 -- See if trigger worked
 Select t.*
   FROM dbo.t_hello_world AS t;