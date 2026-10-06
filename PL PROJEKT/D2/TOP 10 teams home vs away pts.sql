SELECT
team,
SUM(home_points) AS home_points,
SUM(away_points) AS away_points,
SUM(home_points) + SUM(away_points) AS total_points
FROM (
SELECT
home_team AS team,
CASE
WHEN result = 'H' THEN 3
WHEN result = 'D' THEN 1
ELSE 0
END AS home_points,
0 AS away_points
FROM results

UNION ALL

SELECT
away_team AS team,
 0 AS home_points,
CASE
WHEN result = 'A' THEN 3
WHEN result = 'D' THEN 1
ELSE 0
END AS away_points
FROM results
) 
GROUP BY team
ORDER BY total_points DESC
LIMIT 10