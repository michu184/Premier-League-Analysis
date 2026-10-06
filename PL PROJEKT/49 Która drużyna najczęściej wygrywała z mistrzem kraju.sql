WITH points_table AS(
SELECT
    team,
    season,
	wins,
    wins * 3 + (38-wins-losses) AS points,
	goals - goals_conceded AS goals_difference
FROM stats
),
ranked_teams AS (
SELECT *,
DENSE_RANK() OVER (
PARTITION BY season
ORDER BY points DESC, goals_difference DESC  
) AS ranking
FROM points_table
),
champions AS (
SELECT *
FROM ranked_teams
WHERE ranking =1
)

SELECT
    CASE
        WHEN c.team = r.home_team THEN r.away_team
        ELSE r.home_team
    END AS winner,
    COUNT(*) AS wins_against_champion
	
FROM champions c
JOIN results r 
ON c.season = r.season
AND (
	c.team = home_team
	OR c.team = away_team
)
WHERE 
	(c.team = r.home_team AND r.result = 'A')
	OR
	(c.team = r.away_team AND r.result = 'H')

GROUP BY winner
ORDER BY wins_against_champion DESC
