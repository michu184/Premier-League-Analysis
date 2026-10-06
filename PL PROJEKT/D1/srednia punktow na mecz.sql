SELECT
ROUND(AVG(
CASE
WHEN result = 'D' THEN 2
ELSE 3
END), 2) AS avg_pts
FROM results