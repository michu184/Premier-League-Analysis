SELECT 
team,
SUM(wins * 3 + (38 - wins - losses)) AS points
FROM stats
GROUP BY team
ORDER BY points DESC
