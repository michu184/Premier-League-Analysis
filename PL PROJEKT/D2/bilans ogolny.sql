SELECT
team,
SUM(goals) - SUM(goals_conceded) AS total_goals
FROM stats
GROUP BY team
ORDER BY total_goals DESC