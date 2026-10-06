SELECT
r.home_team,
r.away_team,
r.season,
hs.goals - hs.goals_conceded AS home_goals_diff,
aws.goals - aws.goals_conceded AS away_goals_diff,
(hs.goals - hs.goals_conceded) + (aws.goals - aws.goals_conceded) AS goals_diff
FROM results r
JOIN stats hs
ON r.home_team = hs.team
AND r.season = hs.season
JOIN stats aws
ON r.away_team = aws.team
AND r.season = aws.season
ORDER BY goals_diff DESC
LIMIT 2