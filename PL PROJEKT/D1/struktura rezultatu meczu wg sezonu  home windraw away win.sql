SELECT
    season,
    ROUND(100.0 * COUNT(*) FILTER (WHERE result = 'H') / COUNT(*), 2) AS home_win,
    ROUND(100.0 * COUNT(*) FILTER (WHERE result = 'D') / COUNT(*), 2) AS draw,
    ROUND(100.0 * COUNT(*) FILTER (WHERE result = 'A') / COUNT(*), 2) AS away_win
FROM results
GROUP BY season
ORDER BY season;