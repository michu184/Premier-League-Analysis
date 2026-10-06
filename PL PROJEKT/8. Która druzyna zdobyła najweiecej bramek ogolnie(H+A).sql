SELECT 
team,
SUM(goals) AS goals
FROM
(
SELECT
home_team AS team,
home_goals AS goals
FROM results
UNION ALL
SELECT
away_team,
away_goals
FROM results
)

GROUP BY team
ORDER BY goals DESC
