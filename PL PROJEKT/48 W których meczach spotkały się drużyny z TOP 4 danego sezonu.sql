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
),
top4 AS(
SELECT *
FROM ranked_teams
WHERE ranking <=4
)
SELECT 
r.home_team,
r.away_team,
r.season,
home_goals,
away_goals
FROM results r
JOIN top4 h
ON r.home_team = h.team
AND r.season = h.season
JOIN top4 a 
ON r.away_team = a.team
AND r.season = a.season