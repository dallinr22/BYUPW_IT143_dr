SELECT * 
FROM Sales.Customer
WHERE StoreID = 1234


CREATE NONCLUSTERED INDEX IX_Store ON [Sales].[Customer] ([StoreID]) 