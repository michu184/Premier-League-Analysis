SELECT
    home_team,
	away_team,
	home_goals,
	away_goals,
    home_goals + away_goals AS goals,
	season
FROM results
ORDER BY goals DESC 
LIMIT 5
