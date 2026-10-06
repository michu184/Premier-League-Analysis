SELECT 
team,
ROUND((SUM(wins * 3 + (38 - wins - losses))) / COUNT(season),2) AS points
FROM stats
GROUP BY team
ORDER BY points DESC