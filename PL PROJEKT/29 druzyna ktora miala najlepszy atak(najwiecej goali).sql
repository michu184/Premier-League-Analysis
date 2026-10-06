SELECT
home_team,
SUM(home_goals) AS total_goals
FROM results
GROUP BY home_team
ORDER BY total_goals DESC
LIMIT 1