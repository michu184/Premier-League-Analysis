SELECT 
ROUND(
	SUM(CASE WHEN result = 'A' then 1 else 0 end) * 100.0 / COUNT(*) , 2) AS away_win_percentege
FROM results