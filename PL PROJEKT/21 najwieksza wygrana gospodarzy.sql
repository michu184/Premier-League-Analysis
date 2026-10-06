SELECT
season,
home_team,
away_team,
home_goals,
away_goals,
(home_goals - away_goals) AS goals_diff
FROM results
WHERE result = 'H'
ORDER BY goals_diff DESC
LIMIT 4