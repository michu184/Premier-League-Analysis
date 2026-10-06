WITH points AS (
SELECT
team,
season,
wins*3 + 38-wins-losses AS points,
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
)

SELECT 
team,
COUNT(*) AS top4
FROM ranking
WHERE rankk <= 4
GROUP BY team
ORDER BY top4 DESC

