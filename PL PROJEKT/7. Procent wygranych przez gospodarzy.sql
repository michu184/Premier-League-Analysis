SELECT
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM results),
        2
    ) AS home_win_percentage
FROM results
WHERE result = 'H';