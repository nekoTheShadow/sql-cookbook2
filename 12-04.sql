WITH A (seq, empno, emps) AS (
            SELECT 1, empno, ename                FROM emp WHERE deptno = 10
  UNION ALL SELECT 2, empno, job                  FROM emp WHERE deptno = 10
  UNION ALL SELECT 3, empno, CAST(sal AS VARCHAR) FROM emp WHERE deptno = 10
  UNION ALL SELECT 4, empno, ''                   FROM emp WHERE deptno = 10
)
SELECT emps
FROM A
ORDER BY empno, seq
