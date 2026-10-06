SELECT 
home_team,
COUNT(*) AS Wins
FROM 
results
WHERE result = 'H'
GROUP BY home_team
ORDER BY Wins DESC