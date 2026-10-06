SELECT
r.home_team,
r.away_team,
r.season,
s.wins AS away_wins
FROM results r
JOIN stats s
ON r.away_team = s.team
AND r.season = s.season