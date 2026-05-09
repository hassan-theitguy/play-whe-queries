WITH NumberDraws AS (
    SELECT
        ResultNo,
        DrawDate,
        LAG(DrawDate) OVER (
            PARTITION BY ResultNo
            ORDER BY DrawDate
        ) AS PreviousDrawDate
    FROM DrawResults
),
DateGaps AS (
    SELECT
        ResultNo,
        DrawDate,
        PreviousDrawDate,
        julianday(DrawDate) - julianday(PreviousDrawDate) AS DaysBetween
    FROM NumberDraws
    WHERE PreviousDrawDate IS NOT NULL
)
SELECT
    ResultNo,
    MAX(DaysBetween) AS LongestDaysBetweenDraws
FROM DateGaps
GROUP BY ResultNo
ORDER BY LongestDaysBetweenDraws DESC;
