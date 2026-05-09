SELECT
    a.DrawDate,
    a.ResultNo AS N,
    a.DrawTime AS N_DrawTime,
    b.ResultNo AS N1,
    b.DrawTime AS N1_DrawTime,
    c.ResultNo AS N2,
    c.DrawTime AS N2_DrawTime
FROM DrawResults a
JOIN DrawResults b
    ON a.DrawDate = b.DrawDate
   AND b.ResultNo = a.ResultNo + 1
JOIN DrawResults c
    ON a.DrawDate = c.DrawDate
   AND c.ResultNo = a.ResultNo + 2
ORDER BY
    a.DrawDate DESC;
