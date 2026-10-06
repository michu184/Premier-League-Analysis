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
),
top2 AS(

SELECT * 
FROM ranking
WHERE rankk <= 2
)
SELECT
a.team AS champion,
b.team AS second_place,
a.season,
a.points,
b.points,
a.points - b.points AS points_diff,
a.goals_diff AS champions_balance,
b.goals_diff AS second_team_balance
FROM top2 a
JOIN top2 b
ON a.season = b.season
AND a.rankk = 1
AND b.rankk = 2
ORDER BY points_diff
LIMIT 1
