SELECT
    CASE
        WHEN home_team < away_team THEN home_team
        ELSE away_team
    END AS team1,

    CASE
        WHEN home_team < away_team THEN away_team
        ELSE home_team
    END AS team2,

    COUNT(*) AS draws

FROM results

WHERE result = 'D'

GROUP BY
    CASE
        WHEN home_team < away_team THEN home_team
        ELSE away_team
    END,

    CASE
        WHEN home_team  < away_team THEN away_team
        ELSE home_team
    END

ORDER BY draws DESC

