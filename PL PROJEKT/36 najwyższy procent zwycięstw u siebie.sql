SELECT 
home_team,
ROUND (SUM(CASE WHEN result = 'H' then 1 else 0 end) * 100.0 / COUNT(*) ,2) AS home_win_percentage
FROM results
GROUP BY home_team
ORDER BY home_win_percentage DESC


