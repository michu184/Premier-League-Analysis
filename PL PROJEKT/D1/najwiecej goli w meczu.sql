SELECT
home_team,
away_team,
home_goals + away_goals AS total_goals,
result,
season
FROM results
ORDER BY total_goals DESC
LIMIT 1