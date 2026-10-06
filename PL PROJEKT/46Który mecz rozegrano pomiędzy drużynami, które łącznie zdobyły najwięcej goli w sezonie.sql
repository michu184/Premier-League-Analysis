SELECT
r.home_team,
r.away_team,
r.season,
hs.goals AS home_goals,
aws.goals AS away_goals,
hs.goals+aws.goals AS total_goals
FROM results r
JOIN stats hs
ON r.home_team = hs.team
AND r.season = hs.season
JOIN stats aws
ON r.away_team = aws.team
AND r.season = aws.season
ORDER BY total_goals DESC
LIMIT 2