SELECT
team,
SUM(goals) AS total_goals
FROM stats
GROUP BY team
ORDER BY total_goals DESC
LIMIT 10