/*****************************************************************************************************************
NAME:    Dallin's AdventureWorks Solutions
PURPOSE: The purpose of this script is to answer 8 questions posed by me and some classmates.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     03/21/2026   DRAMOS       1. Built this script for EC IT143


RUNTIME: 
00m 01s

NOTES: 
This is my script. It provides solutions to 8 questions, including business data and metadata themed questions.  
It took me hours over a few days. Hopefully it all works good. Sometimes my format is not perfect but it should be legible.
 
******************************************************************************************************************/

-- Q1: What are the top 17 most expensive products? -Davidson Charles
-- A1: This lists the top 17 products from highest price to lowest, and includes the name and price. 

SELECT TOP 17 Name AS ProductName, ListPrice 
FROM Production.Product
ORDER BY ListPrice DESC
;


-- Q2: How many employees currently work in the Sales department? -Davidson Charles and me
-- A2: This counts the number of unique business entity IDs in the list of salespeople. 

SELECT COUNT(DISTINCT BusinessentityID) AS #ofSalesPeople
FROM Sales.salesperson
;


-- Q3: I need to identify our most profitable products. Which products generate the highest total profit, calculated as 
--     quantity sold multiplied by UnitPrice minus StandardCost? Davidson Charles
-- A3: This code calculates the revenue by each product, multiplying the order quantity and the list price, and substracting the cost. 10 can be changed for a larger list.

SELECT TOP 10 pp.ProductID, pp.Name, SUM((pp.listprice - pp.standardcost) * ssod.orderqty) Revenue$$
FROM Production.Product pp
LEFT JOIN Sales.SalesOrderDetail ssod 
ON pp.ProductID = ssod.ProductID
WHERE pp.listprice > 0 AND ssod.orderqty > 0
GROUP BY pp.productID, pp.name
ORDER BY revenue$$ desc
;


-- Q4: We need supplier insights. Which vendors supply more than 3 products? Show vendor name and number of products supplied. Davidson Charles
-- A4: This query takes the vendors that supplies more than 3 products and returns their name and the number of products offered.

SELECT pv.Name, COUNT(ppv.productid) AS #ofProducts
FROM Purchasing.ProductVendor ppv
LEFT JOIN Purchasing.Vendor pv 
ON ppv.businessentityid = pv.businessentityid
GROUP BY pv.name
HAVING COUNT(ppv.productid) > 3
ORDER BY #ofProducts DESC
;


-- Q5: List all road bike sales in 2022 with total sales amount by customer region. Use SalesOrderHeader, SalesOrderDetail, Product, and Customer tables. Moses Anafe
-- A5: This lists regions with the amount of order times the price of road bikes in 2022.

SELECT sst.name AS Region, SUM(ssod.orderqty * ssod.UnitPrice) AS Amount$$
FROM Sales.SalesOrderDetail ssod
LEFT JOIN Sales.SalesOrderHeader ssoh 
ON ssod.salesorderid = ssoh.salesorderid
LEFT JOIN Sales.SalesTerritory sst 
ON sst.territoryid = ssoh.territoryid
JOIN Production.Product pp 
ON pp.productid = ssod.productid
JOIN Production.ProductSubcategory pps 
ON pps.productsubcategoryid = pp.productsubcategoryid
WHERE ssoh.orderdate BETWEEN '2022-01-01 00:00:00.000' AND '2022-12-31 23:59:59.000' 
AND pps.ProductsubcategoryID = 2
GROUP BY sst.name
ORDER BY sst.name
;



-- Q6: I want to identify our most loyal customers in the United States. Please generate a list of the top five customers by total life-to-date spending. 
--     Include their name, the total number of orders they have placed, and the date of their most recent purchase to ensure they are still active. Neilen Bester
-- A6: This query returns the first and last name of the top 5 spending customers, along with how much they have spent, the total number of orders, and the most recent date. 

SELECT TOP 5 CONCAT(pp.FirstName, pp.LastName) AS FirstLast, SUM(ssoh.totaldue) AS Spending, COUNT(ssoh.salesorderID) AS #ofOrders, MAX(ssoh.orderdate) AS Recent
FROM Person.Person pp
LEFT JOIN Sales.Customer sc 
ON sc.personid = pp.businessentityid
LEFT JOIN Sales.SalesOrderHeader ssoh 
ON ssoh.customerid = sc.customerID
Group by CONCAT(pp.FirstName, pp.LastName)
Order by SUM(ssoh.totaldue) desc
;


-- Q7:  Identify the tables with the highest number of columns to detect potential 'wide tables' in the database. Provide a list of all tables along with 
--      their total column count, ordered from the most to the least columns. Davidson Charles
-- A7: This utilizes metadata to count the number of columns in each table, and arranges them from most to least. 


SELECT TABLE_NAME, COUNT(COLUMN_NAME) AS #ofColumns
FROM INFORMATION_SCHEMA.COLUMNS
GROUP BY TABLE_NAME
ORDER BY COUNT(COLUMN_NAME) DESC
;


-- Q8: Which tables in AdventureWorks contain a column named ProductID? Moses Anafe
-- A8: This query selects tables that have a column names ProductID, using the information schema column table. 

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME LIKE '%ProductID%'
;


SELECT GETDATE() AS my_date;