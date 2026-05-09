SELECT
    ResultNo,
    COUNT(*) AS Frequency
FROM DrawResults
WHERE strftime('%m-%d', DrawDate) = strftime('%m-%d', 'now')
GROUP BY ResultNo
ORDER BY Frequency DESC, ResultNo;
