SELECT 
team,
ROUND(SUM(wins) / SUM (losses) , 2) AS balance
FROM stats
GROUP BY team
ORDER BY balance DESC
LIMIT 1 