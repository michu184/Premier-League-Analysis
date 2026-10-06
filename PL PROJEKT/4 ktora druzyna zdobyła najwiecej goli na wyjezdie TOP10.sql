
SELECT 
away_team,
SUM (away_goals) AS Goal
FROM results
GROUP BY away_team
ORDER BY Goal DESC 
LIMIT 10


