-- Q: What were the first incorporated cities in California?

-- A: The data is there, we can get it with SQL Server...

SELECT TOP 10 City, Incorportation_date 
	FROM dbo.cal_populations_city
	ORDER BY Incorportation_date
;