SELECT
r.home_team,
r.away_team,
r.season,
hs.goals_conceded AS home_goals_conceded,
aws.goals_conceded AS away_goals_conceded
FROM results r
JOIN stats hs
ON r.home_team = hs.team
AND r.season = hs.season
JOIN stats aws
ON r.away_team = aws.team
AND r.season = aws.season

