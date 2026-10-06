
SELECT
season,
ROUND(AVG(home_goals+away_goals),2) AS goals
FROM results
GROUP BY season
ORDER BY season