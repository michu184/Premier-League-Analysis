SELECT 
season,
ROUND (AVG(home_goals+away_goals) , 2) AS avergae_goals_per_season
FROM results
GROUP BY season
ORDER BY avergae_goals_per_season DESC
LIMIT 1 