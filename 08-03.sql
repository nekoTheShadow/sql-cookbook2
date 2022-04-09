WITH A AS (
  SELECT 
    MAX(CASE WHEN ename IN ('JONES', 'BLAKE') THEN hiredate END) AS MX,
    MIN(CASE WHEN ename IN ('JONES', 'BLAKE') THEN hiredate END) AS MN
  FROM emp 
)
SELECT SUM(CASE WHEN NOT EXTRACT(DOW FROM A.MN + T.id - 1) IN (0, 6) THEN 1 END)
FROM A
JOIN T500 AS T ON T.id <= A.MX - A.MN + 1