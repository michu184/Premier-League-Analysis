SELECT 
season,
ROUND(SUM(CASE WHEN result = 'D' then 1 else 0 end) * 100.0 / COUNT(*) , 2) AS draws
FROM results
GROUP BY season
ORDER BY draws DESC
LIMIT 1