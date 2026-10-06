SELECT
    ROUND(COUNT(*) FILTER (WHERE result = 'H') * 100.0 / COUNT(*), 2) AS home_win_percentage
FROM results;