WITH AdjacentResults AS (
    SELECT
        r1.ResultNo AS CurrentResultNo,
        r2.ResultNo AS NextResultNo
    FROM DrawResults r1
    JOIN DrawResults r2
        ON r2.DrawNo = r1.DrawNo + 1
),

Counts AS (
    SELECT
        CurrentResultNo,
        NextResultNo,
        COUNT(*) AS AdjacentCount
    FROM AdjacentResults
    GROUP BY
        CurrentResultNo,
        NextResultNo
),

Ranked AS (
    SELECT
        CurrentResultNo,
        NextResultNo,
        AdjacentCount,
        DENSE_RANK() OVER (
            PARTITION BY CurrentResultNo
            ORDER BY AdjacentCount DESC
        ) AS rnk
    FROM Counts
)

SELECT
    CurrentResultNo AS ResultNo,
    NextResultNo AS MostPopularAdjacentResultNo,
    AdjacentCount AS Count
FROM Ranked
WHERE rnk = 1
ORDER BY ResultNo, MostPopularAdjacentResultNo;
