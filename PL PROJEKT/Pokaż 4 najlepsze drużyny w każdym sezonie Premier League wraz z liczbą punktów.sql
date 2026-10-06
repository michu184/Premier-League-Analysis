WITH points_table AS(
SELECT
    team,
    season,
    wins,
    wins * 3 + (38-wins-losses) AS points
FROM stats
),
ranked_teams AS (
SELECT *,
DENSE_RANK() OVER (
PARTITION BY season
ORDER BY points DESC 
) AS ranking
FROM points_table
)
SELECT *
FROM ranked_teams
WHERE ranking <=4
