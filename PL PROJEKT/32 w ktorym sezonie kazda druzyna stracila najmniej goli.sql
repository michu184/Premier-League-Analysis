WITH ranking_table AS (

SELECT
team,
goals_conceded,
season,
ROW_NUMBER() OVER 
	(PARTITION BY team
	ORDER BY goals_conceded) AS ranking
FROM stats
)
SELECT *
FROM ranking_table
WHERE ranking = 1
