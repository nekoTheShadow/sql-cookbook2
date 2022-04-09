WITH RECURSIVE A (start_date, end_date) AS (
    SELECT DATE_TRUNC('month', MIN(hiredate)), MAX(hiredate)
    FROM emp
  UNION ALL
    SELECT start_date + '1 month', end_date
    FROM A
    WHERE start_date < end_date
)
SELECT A.start_date mth, COUNT(hiredate) num_hired
FROM A
LEFT OUTER JOIN emp E ON DATE_TRUNC('month', E.hiredate) = A.start_date
GROUP BY A.start_date
ORDER BY A.start_date

