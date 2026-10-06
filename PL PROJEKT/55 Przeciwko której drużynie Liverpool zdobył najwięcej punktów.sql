WITH liverpool_games AS (
SELECT
CASE
WHEN home_team = 'Liverpool' THEN away_team
ELSE home_team
END AS opponent,

CASE
WHEN home_team = 'Liverpool' AND result = 'H' THEN 3
WHEN home_team = 'Liverpool' AND result = 'D' THEN 1
WHEN away_team = 'Liverpool' AND result = 'A' THEN 3
WHEN away_team = 'Liverpool' AND result = 'D' THEN 1
ELSE 0
END AS points

FROM results
WHERE home_team = 'Liverpool'
OR away_team = 'Liverpool'
)

SELECT
    opponent,
    SUM(points) AS total_points
FROM liverpool_games
GROUP BY opponent
ORDER BY total_points DESC
