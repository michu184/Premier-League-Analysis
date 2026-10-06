SELECT
team,
SUM(home_goals) - SUM(away_goals) AS goals_diff
FROM(
SELECT
home_team AS team,
home_goals,
0 AS away_goals
FROM results

UNION ALL

SELECT
away_team AS team,
0 AS home_goals,
away_goals
FROM results) 
GROUP BY team
ORDER BY goals_diff DESC 
LIMIT 1