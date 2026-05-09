SELECT
    ResultNo,
    COUNT(*) AS Frequency
FROM DrawResults
GROUP BY ResultNo
ORDER BY Frequency DESC, ResultNo ASC;
