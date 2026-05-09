WITH TargetDays AS (
    SELECT
        DrawDate
    FROM DrawResults
    WHERE strftime('%w', DrawDate) = strftime('%w', 'now')
    GROUP BY DrawDate
    ORDER BY DrawDate DESC
    LIMIT 10
)
SELECT
    td.DrawDate,

    MAX(CASE WHEN dr.DrawTime = 1 THEN dr.ResultNo END) AS Draw1,
    MAX(CASE WHEN dr.DrawTime = 2 THEN dr.ResultNo END) AS Draw2,
    MAX(CASE WHEN dr.DrawTime = 3 THEN dr.ResultNo END) AS Draw3,
    MAX(CASE WHEN dr.DrawTime = 4 THEN dr.ResultNo END) AS Draw4

FROM TargetDays td
LEFT JOIN DrawResults dr
    ON dr.DrawDate = td.DrawDate

GROUP BY td.DrawDate
ORDER BY td.DrawDate DESC;
