SELECT 
team,
SUM(clean_sheet) AS t_cs
FROM stats
GROUP BY team
ORDER BY t_cs DESC