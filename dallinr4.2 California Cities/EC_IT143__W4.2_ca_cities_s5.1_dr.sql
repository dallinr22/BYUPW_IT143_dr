-- Q: What were the first incorporated cities in California?

-- A: The data is there, we can get it with SQL Server...

SELECT v.City
	, v.Incorportation_date
	INTO dbo.t_ca_cities
  FROM dbo.v_ca_cities_load AS v;