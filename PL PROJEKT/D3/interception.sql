SELECT 
team,
SUM(interception) AS t_cs
FROM stats
GROUP BY team
ORDER BY t_cs DESC
