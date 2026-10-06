WITH league AS (
SELECT
home_team AS team,
1 AS played,
	CASE WHEN result = 'H' THEN 1 ELSE 0 END AS wins,
	CASE WHEN result = 'D' THEN 1 ELSE 0 END AS draws,
	CASE WHEN result = 'A' THEN 1 ELSE 0 END AS losses,
	home_goals AS goals_for,
	away_goals AS goals_against,
	(home_goals - away_goals) AS goal_difference,
	CASE
	WHEN result = 'H' THEN 3
	WHEN result = 'D' THEN 1
	ELSE 0
	END AS points

	FROM results

	UNION ALL

SELECT 
away_team AS team,
1 AS played, 
	CASE WHEN result = 'A' THEN 1 ELSE 0 END AS wins,
	CASE WHEN result = 'D' THEN 1 ELSE 0 END AS draws,
	CASE WHEN result = 'H' THEN 1 ELSE 0 END AS losses,
	away_goals AS goals_for,
	home_goals AS goals_against,
	(home_goals - away_goals) AS goal_difference,
	CASE 
	WHEN result = 'A' THEN 3
	WHEN result = 'D' THEN 1
	ELSE 0
	END AS points

	FROM results
	
	
)

SELECT
   team,
   SUM(played) AS played,
   SUM(wins) AS wins,
   SUM(draws) AS draws,
   SUM(losses) AS losses,
   SUM(goals_for) AS goals_for,
   SUM(goals_against) AS goals_against,
   SUM(goals_for-goals_against) AS goal_difference,
   SUM(points) AS points

FROM league
GROUP BY team
ORDER BY points DESC