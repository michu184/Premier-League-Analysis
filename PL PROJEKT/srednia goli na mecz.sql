SELECT
    ROUND(SUM(home_goals + away_goals) / COUNT(*) , 2) AS goals
FROM results
