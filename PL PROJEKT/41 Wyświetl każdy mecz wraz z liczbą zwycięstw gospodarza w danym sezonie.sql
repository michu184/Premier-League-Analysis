SELECT
r.home_team,
r.away_team,
r.season,
s.wins AS home_wins
FROM results r
JOIN stats s
ON r.home_team = s.team
AND r.season = s.season