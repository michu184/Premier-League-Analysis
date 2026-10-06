SELECT
ROUND(AVG(
CASE
WHEN result = 'D' THEN 2
ELSE 3
END), 2) AS avg_pts,
ROUND(SUM(home_goals + away_goals) / COUNT(*) , 2) AS goals,
season
FROM results
GROUP BY season
ORDER BY season 