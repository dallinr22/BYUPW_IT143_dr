DROP TABLE IF EXISTS dbo.t_ca_cities;
GO

CREATE TABLE dbo.t_ca_cities
	(City  VARCHAR(50) NOT NULL
	, Incorportation_date INT NOT NULL
		CONSTRAINT PK_t_ca_cities PRIMARY KEY CLUSTERED(City ASC)
);
GO