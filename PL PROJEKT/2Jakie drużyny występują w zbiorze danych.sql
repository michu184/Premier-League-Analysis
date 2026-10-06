SELECT DISTINCT home_team AS team
FROM results

UNION

SELECT DISTINCT away_team 
FROM results;