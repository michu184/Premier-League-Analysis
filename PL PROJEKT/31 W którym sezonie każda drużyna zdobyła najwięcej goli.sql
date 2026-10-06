WITH ranking_table AS (
    SELECT
        team,
        season,
        goals,
        ROW_NUMBER() OVER (
            PARTITION BY team
            ORDER BY goals DESC
        ) AS ranking
    FROM stats
)

SELECT *
FROM ranking_table
WHERE ranking = 1
