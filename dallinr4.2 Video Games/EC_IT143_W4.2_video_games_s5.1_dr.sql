-- Q: What Xbox video game has sold the most in North America?

-- A: SQL Server says...

DROP TABLE IF EXISTS t_video_games;

SELECT v.game,
	   v.NAXboxGameSales
	  INTO dbo.t_video_games
	FROM dbo.v_video_games_load as v;