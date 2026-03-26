DROP TABLE IF EXISTS dbo.t_video_games
GO

CREATE TABLE dbo.t_video_games (
	NAXboxGameSales  DECIMAL NOT NULL

	CONSTRAINT PK_t_video_games PRIMARY KEY CLUSTERED(NAXboxGameSales ASC)
);
GO