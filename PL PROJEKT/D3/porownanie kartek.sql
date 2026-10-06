SELECT 
team,
SUM(total_red_card) AS red_card,
SUM(total_yel_card) AS yel_card
FROM stats
GROUP BY team
ORDER By yel_card DESC

