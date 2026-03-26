-- Q: What three Xbox video games have sold the most in North America?

-- A: SQL Server says...


-- 1) Reload data

TRUNCATE TABLE dbo.t_video_games;

INSERT INTO dbo.t_video_games
	SELECT v.Game
		, v.NAXboxGameSales
		FROM dbo.v_video_games_load AS v;


-- 2) Review Results

SELECT t.*
	FROM dbo.t_video_games AS t;