SELECT 
team, 
38 * COUNT(season) - SUM(losses) - SUM(wins) AS draws
FROM stats
GROUP BY team
ORDER BY draws DESC