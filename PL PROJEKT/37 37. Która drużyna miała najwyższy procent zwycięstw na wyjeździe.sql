SELECT 
away_team,
ROUND (SUM(CASE WHEN result = 'A' then 1 else 0 end) * 100.0 / COUNT(*) , 2) AS away_win_percentage
FROM results
GROUP BY away_team
ORDER BY away_win_percentage DESC