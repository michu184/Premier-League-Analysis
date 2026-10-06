SELECT
    team,
    COUNT(*) AS draws
FROM (
    SELECT home_team AS team
    FROM results
    WHERE result = 'D'

    UNION ALL

    SELECT away_team AS team
    FROM results
    WHERE result = 'D'
) AS draws_table
GROUP BY team
ORDER BY draws DESC