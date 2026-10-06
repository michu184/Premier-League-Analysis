SELECT
    (home_goals,  away_goals) AS scoreline,
    COUNT(*) AS matches
FROM results
GROUP BY home_goals, away_goals
ORDER BY matches DESC
LIMIT 5