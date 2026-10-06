WITH team_points AS (

SELECT
season,
home_team AS team,
SUM(
CASE
WHEN result = 'H' THEN 3
WHEN result = 'D' THEN 1
ELSE 0
END
) AS points
FROM results
GROUP BY season, home_team

UNION ALL

SELECT
season,
away_team AS team,
SUM(
CASE
WHEN result = 'A' THEN 3
WHEN result = 'D' THEN 1
ELSE 0
END
) AS points
FROM results
GROUP BY season, away_team
),

standings AS (
SELECT
season,
team,
SUM(points) AS total_points
FROM team_points
GROUP BY season, team
),

champions AS (
SELECT
season,
team,
total_points,
RANK() OVER (
PARTITION BY season
ORDER BY total_points DESC
) AS ranking
FROM standings
)

SELECT
team,
COUNT(*) AS championship_titles
FROM champions
WHERE ranking = 1
GROUP BY team
ORDER BY championship_titles DESC