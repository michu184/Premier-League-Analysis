SELECT
team,
MAX(goals) AS max_goals
FROM stats
GROUP BY team
ORDER BY max_goals DESC



