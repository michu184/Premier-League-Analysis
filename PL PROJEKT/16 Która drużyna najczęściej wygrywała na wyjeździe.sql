SELECT 
away_team,
COUNT(*) AS Wins
FROM 
results
WHERE result = 'A'
GROUP BY away_team
ORDER BY Wins DESC