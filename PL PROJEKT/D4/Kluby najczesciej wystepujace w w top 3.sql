WITH team_points AS (
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
),

ranked AS (
SELECT
season,
team,
total_points,
RANK() OVER (
PARTITION BY season
 ORDER BY total_points DESC
) AS position
FROM team_points
)

SELECT
team,
COUNT(*) AS top_3_appearances
FROM ranked
WHERE position <= 3
GROUP BY team
ORDER BY top_3_appearances DESC