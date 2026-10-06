SELECT
    team,
    ROUND(
        SUM(goals_conceded) / (COUNT(*) * 38.0),
        2
    ) AS avg_goals_conceded_per_match
FROM stats
GROUP BY team
ORDER BY avg_goals_conceded_per_match ASC;