WITH RECURSIVE R AS (
    SELECT empno, ename
    FROM emp 
    WHERE ename = 'JONES'
  UNION ALL
    SELECT S.empno, S.ename
    FROM emp AS S
    JOIN R ON R.empno = S.mgr
)
SELECT ename FROM R
