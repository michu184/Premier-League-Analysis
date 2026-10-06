SELECT
r.home_team,
r.away_team,
r.season,
home_stats.wins,
away_stats.wins,
home_stats.wins + away_stats.wins AS total_wins
FROM results r
JOIN stats home_stats
ON r.home_team = home_stats.team
AND r.season = home_stats.season
JOIN stats away_stats
ON r.away_team = away_stats.team
AND r.season = away_stats.season
ORDER BY total_wins DESC
LIMIT 2