-- Oracle
SELECT MAX(d10) AS d10, MAX(d20) AS d20, MAX(d30) AS d30
FROM (
  SELECT *
  FROM (
              SELECT 10 AS deptno, 3 AS cnt FROM DUAL
    UNION ALL SELECT 20 AS deptno, 5 AS cnt FROM DUAL
    UNION ALL SELECT 30 AS deptno, 6 AS cnt FROM DUAL
  ) T
  MODEL 
  DIMENSION BY (deptno d)
  MEASURES (deptno, cnt d10, cnt d20, cnt d30)
  RULES (
    d10[any] = CASE WHEN deptno[cv()] = 10 THEN d10[cv()] ELSE 0 END,
    d20[any] = CASE WHEN deptno[cv()] = 20 THEN d20[cv()] ELSE 0 END,
    d30[any] = CASE WHEN deptno[cv()] = 30 THEN d30[cv()] ELSE 0 END
  )
) S
