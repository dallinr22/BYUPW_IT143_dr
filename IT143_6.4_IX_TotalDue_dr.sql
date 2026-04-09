SELECT * 
FROM Sales.SalesOrderHeader
WHERE TotalDue = 23508.3625
;


CREATE NONCLUSTERED INDEX IX_TotalDue ON [Sales].[SalesOrderHeader] ([TotalDue])
;