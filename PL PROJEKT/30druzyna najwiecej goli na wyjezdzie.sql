SELECT
away_team,
SUM(away_goals) AS total_goals
FROM results
GROUP BY away_team
ORDER BY total_goals DESC
LIMIT 1