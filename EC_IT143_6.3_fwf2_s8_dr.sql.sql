-- Q: How to extract last name from Contact Name?

-- A: Well, here is your problem...
-- CustomerName =  Alejandra Camino -> Camino
-- Google search "How to extract last name from combined name tsql stack overflow"
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

SELECT t.CustomerID
	, t.CustomerName
	, t.ContactName
	, dbo.udf_parse_first_name(t.ContactName) AS ContactName_first_name
	, dbo.udf_parse_last_name(t.ContactName) AS ContactName_last_name
	, ' ' AS ContactName_Phone_Number -- How to add phone number Contact Name?
	, t.Address
	, t.City
	, t.Country
  FROM dbo.t_w3_schools_customers AS t
  ORDER BY 3;