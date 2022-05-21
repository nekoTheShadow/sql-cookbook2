-- SQLServer
WITH T (accounting, research, sales, operations) AS (
  SELECT 3, 5, 6, 0
)
SELECT dname, cnt
FROM T
UNPIVOT (cnt FOR dname IN (accounting, research, sales, operations)) AS pv
