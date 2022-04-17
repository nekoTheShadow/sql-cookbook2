WITH S AS (
  SELECT 
    deptno, 
    mgr, 
    SUM(sal) AS sal,
    GROUPING(deptno) * 10 + GROUPING(mgr) AS flg
  FROM emp 
  WHERE mgr IS NOT NULL
  GROUP BY ROLLUP(deptno, mgr)
  ORDER BY deptno, mgr
)
SELECT
  mgr,
  SUM(CASE WHEN deptno = 10 THEN sal ELSE 0    END) dept10,
  SUM(CASE WHEN deptno = 20 THEN sal ELSE 0    END) dept20,
  SUM(CASE WHEN deptno = 30 THEN sal ELSE 0    END) dept30,
  SUM(CASE WHEN flg    = 11 THEN sal ELSE NULL END) total
FROM S
GROUP BY mgr
ORDER BY mgr
