
SELECT 
home_team,
SUM (home_goals) AS Goal
FROM results
GROUP BY home_team
ORDER BY Goal DESC 
LIMIT 10


