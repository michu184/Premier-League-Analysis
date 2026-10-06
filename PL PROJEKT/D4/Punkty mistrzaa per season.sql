SELECT
season,
MAX(total_points) AS champions_points
FROM (
SELECT
season,
team,
SUM(points) AS total_points
FROM (
SELECT
season,
home_team AS team,
CASE
WHEN result = 'H' THEN 3
WHEN result = 'D' THEN 1
ELSE 0
END AS points
FROM results

UNION ALL

SELECT
season,
away_team AS team,
CASE
WHEN result = 'A' THEN 3
WHEN result = 'D' THEN 1
ELSE 0
END AS points
FROM results
) t
GROUP BY season, team
) x
GROUP BY season
ORDER BY season