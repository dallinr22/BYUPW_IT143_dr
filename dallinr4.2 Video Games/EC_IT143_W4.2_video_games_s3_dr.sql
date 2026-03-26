-- Q: What Xbox video game has sold the most in North America?

-- A: SQL Server says...

SELECT TOP 1 Game, North_America AS NAXboxSales
	FROM dbo.XboxOne_GameSales
	ORDER BY NAXboxSales DESC;