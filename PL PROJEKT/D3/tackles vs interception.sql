SELECT 
team,
SUM(total_tackle) AS tackles,
SUM(interception) AS interception
FROM stats
GROUP BY team 

