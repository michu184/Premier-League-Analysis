WITH MU AS(
SELECT *,
CASE

WHEN home_team = 'Manchester United' THEN away_team
ELSE home_team 
END AS opponent,

CASE 
WHEN home_team = 'Manchester United' AND result = 'H' then 3
WHEN home_team = 'Manchester United' AND result = 'D' then 1
WHEN away_team = 'Manchester United' AND result = 'A' then 3
WHEN away_team = 'Manchester United' AND result = 'D' then 1
ELSE 0
END AS points

FROM results
WHERE home_team = 'Manchester United'
OR away_team = 'Manchester United'
)
SELECT 
opponent,
SUM(points) AS pts_against
FROM MU
GROUP BY opponent
ORDER BY pts_against DESC
