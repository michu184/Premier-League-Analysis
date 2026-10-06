SELECT 
team, 
SUM(losses) as l
FROM stats
GROUP BY team
ORDER BY l DESC