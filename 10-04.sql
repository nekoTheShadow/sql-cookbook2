
SELECT T.yr, COALESCE(cnt, 0)
FROM (
  SELECT id + 2004 AS yr
  FROM T10
) T
LEFT OUTER JOIN (
  SELECT EXTRACT(YEAR FROM hiredate) AS yr, COUNT(*) AS cnt
  FROM emp
  GROUP BY yr
) S ON T.yr = S.yr
ORDER BY yr
