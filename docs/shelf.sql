WITH MaxDate AS (
    SELECT MAX(DrawDate) AS MaxDrawDate
    FROM DrawResults
),
LastDatePerResult AS (
    SELECT
        ResultNo,
        MAX(DrawDate) AS LastDrawDate
    FROM DrawResults
    GROUP BY ResultNo
),
MinTimeOnLastDate AS (
    SELECT
        dr.ResultNo,
        dr.DrawDate,
        MIN(dr.DrawTime) AS MinDrawTime
    FROM DrawResults dr
    JOIN LastDatePerResult ld
        ON dr.ResultNo = ld.ResultNo
       AND dr.DrawDate = ld.LastDrawDate
    GROUP BY dr.ResultNo, dr.DrawDate
)
SELECT
    m.ResultNo,
    m.DrawDate AS LastDrawDate,
    m.MinDrawTime AS LastDrawTime,
    CAST(julianday(md.MaxDrawDate) - julianday(m.DrawDate) AS INTEGER) AS DaysSince
FROM MinTimeOnLastDate m
CROSS JOIN MaxDate md
ORDER BY
    m.DrawDate ASC,
    m.MinDrawTime DESC;
