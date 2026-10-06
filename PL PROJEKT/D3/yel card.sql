SELECT 
team,
SUM(total_yel_card) AS t_cs
FROM stats
GROUP BY team
ORDER BY t_cs DESC
