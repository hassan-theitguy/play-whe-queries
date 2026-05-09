SELECT
    DrawDate,
    ResultNo,
    COUNT(*) AS Occurrences,
    GROUP_CONCAT(DrawNo) AS DrawNos
FROM DrawResults
GROUP BY DrawDate, ResultNo
HAVING COUNT(*) >= 3
ORDER BY DrawDate DESC;
