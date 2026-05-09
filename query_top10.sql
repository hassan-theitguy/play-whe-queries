SELECT
    ResultNo,
    COUNT(*) AS ResultCount
FROM DrawResults
GROUP BY ResultNo
ORDER BY ResultCount DESC
LIMIT 10;
