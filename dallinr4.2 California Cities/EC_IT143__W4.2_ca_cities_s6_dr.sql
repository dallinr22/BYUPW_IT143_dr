-- Q: What were the first incorporated cities in California?

-- A: The data is there, we can get it with SQL Server...


-- 1) Reload data

TRUNCATE TABLE dbo.t_ca_cities;

INSERT INTO dbo.t_ca_cities
	SELECT v.City
		, v.Incorportation_date
	  FROM dbo.v_ca_cities_load AS v;

-- 2) Review results

SELECT t.*
  FROM dbo.t_ca_cities AS t;