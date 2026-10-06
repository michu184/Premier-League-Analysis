WITH points AS (
SELECT
team,
season,
wins*3 + (38-wins-losses) AS points,
goals-goals_conceded AS goals_diff
FROM stats
),
ranking AS (
SELECT * , 
DENSE_RANK() OVER (
PARTITION BY season
ORDER BY points DESC, goals_diff DESC
) AS rankk
FROM points
),
champions AS (
SELECT * 
FROM ranking
WHERE rankk = 1
)
SELECT 
team AS champion,
season, 
points
FROM champions
ORDER BY points DESC
LIMIT 1