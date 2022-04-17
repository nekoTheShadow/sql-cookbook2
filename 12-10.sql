
SELECT MAX(d10) d10, MAX(d20) d20, MAX(d30) d30
FROM (
  SELECT 
    ROW_NUMBER() OVER (PARTITION BY deptno),
    CASE WHEN deptno = 10 THEN '*' END,
    CASE WHEN deptno = 20 THEN '*' END,
    CASE WHEN deptno = 30 THEN '*' END
  FROM emp
) T (rn, d10, d20, d30)
GROUP BY rn
ORDER BY rn DESC
