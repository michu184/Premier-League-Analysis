SELECT
season,
SUM(home_goals) - SUM(away_goals) AS GD


FROM results
GROUP BY season
ORDER BY season