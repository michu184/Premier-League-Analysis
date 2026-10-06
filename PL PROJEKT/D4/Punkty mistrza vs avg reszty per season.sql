WITH team_points AS (
SELECT
season,
team,
SUM(points) AS total_points
FROM (
SELECT
season,
home_team AS team,
CASE
WHEN result = 'H' THEN 3
WHEN result = 'D' THEN 1
ELSE 0
END AS points
FROM results

UNION ALL

SELECT
season,
away_team AS team,
CASE
WHEN result = 'A' THEN 3
WHEN result = 'D' THEN 1
ELSE 0
END AS points
FROM results
) t
GROUP BY season, team
),

champion AS (
SELECT
season,
MAX(total_points) AS champion_points
FROM team_points
GROUP BY season
)

SELECT
    tp.season,
    c.champion_points,
    ROUND(
        AVG(
            CASE
                WHEN tp.total_points < c.champion_points
                THEN tp.total_points
            END
        ), 2
    ) AS average_rest_of_league
FROM team_points tp
JOIN champion c
    ON tp.season = c.season
GROUP BY tp.season, c.champion_points
ORDER BY tp.season;