-- Q1: How to keep track of who last modified a record?
-- A1: This works for server user and the initial INSERT...

--ALTER TABLE dbo.t_hello_world
--ADD last_modified_by VARCHAR(50) DEFAULT SUSER_NAME();


-- Q2: How to keep track of who last modified a record?
-- A2: Probably use an after update trigger!
-- https://stackoverflow.com/questions/9522982/t-sql-trigger-update
-- https://stackoverflow.com/questions/4574010/how-to-create-trigger-to-keep-track-of-last-changed-data