WITH RECURSIVE numbers(n) AS (
    SELECT 1
    UNION ALL
    SELECT n + 1
    FROM numbers
    WHERE n < 10000
)
INSERT INTO DrawResults (DrawNo, DrawDate, ResultNo, DrawTime)
SELECT
    n AS DrawNo,

    -- Start at 2010-01-01 and advance 1 day every 4 draws
    date('2010-01-01', '+' || ((n - 1) / 4) || ' days') AS DrawDate,

    -- Random number from 1 to 36
    (abs(random()) % 36) + 1 AS ResultNo,

    -- DrawTime cycles 1 to 4
    ((n - 1) % 4) + 1 AS DrawTime
FROM numbers;
