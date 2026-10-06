SELECT 
season,
SUM(clean_sheet) AS total_cs
FROM stats
GROUP BY season
ORDER by season

