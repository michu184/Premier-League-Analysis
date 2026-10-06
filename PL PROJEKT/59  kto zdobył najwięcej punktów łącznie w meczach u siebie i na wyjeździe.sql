WITH points AS (
SELECT 
	home_team AS team,
	CASE
	WHEN result = 'H' THEN 3
	WHEN result = 'D' THEN 1
	ELSE 0 
	END AS points

	FROM results

	UNION ALL

	SELECT 
	away_team AS team,
	CASE 
	WHEN result = 'A' THEN 3 
	WHEN result = 'D' THEN 1
	ELSE 0 
	END AS points

	FROM results
)

SELECT
team,
SUM(points) AS total_points
FROM points
GROUP BY team
ORDER BY total_points DESC