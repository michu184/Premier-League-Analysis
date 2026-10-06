SELECT
    team,
    ROUND(SUM(wins) * 100.0 / (COUNT(*) * 38), 2) AS win_percentage
FROM stats
GROUP BY team
ORDER BY win_percentage DESC;