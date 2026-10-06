SELECT 
team, 
SUM(wins) as w
FROM stats
GROUP BY team
ORDER BY w DESC