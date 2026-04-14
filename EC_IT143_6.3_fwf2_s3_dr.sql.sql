-- Q: How to extract last name from Contact Name?

-- A: Well, here is your problem...
-- CustomerName =  Alejandra Camino -> Camino

SELECT t.ContactName
  FROM dbo.t_w3_schools_customers AS t
 ORDER BY 1
;