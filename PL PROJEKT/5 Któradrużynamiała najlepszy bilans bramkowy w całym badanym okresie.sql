SELECT 
    team,
    SUM(goals) - SUM(goals_conceded) AS balance
FROM stats
GROUP BY team
ORDER BY balance DESC
LIMIT 10;