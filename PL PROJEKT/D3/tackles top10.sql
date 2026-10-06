SELECT 
team,
SUM(total_tackle) AS t_cs
FROM stats
GROUP BY team
ORDER BY t_cs DESC
LIMIT 10