SELECT
team,
COUNT(*) AS losses
FROM
(
SELECT home_team AS team
FROM results
WHERE result = 'A'

UNION ALL

SELECT away_team AS team
FROM results
WHERE result = 'H') AS loss_table
GROUP BY team
ORDER BY losses DESC
