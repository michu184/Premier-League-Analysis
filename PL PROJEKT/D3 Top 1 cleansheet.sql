SELECT
   team,
   SUM(clean_sheet) AS clean_shet
FROM stats
GROUP BY team
ORDER BY clean_shet DESC

