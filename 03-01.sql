          SELECT ename AS ename_and_dname, deptno FROM emp WHERE deptno = 10
UNION ALL SELECT '----------', NULL
UNION ALL SELECT dname AS ename_and_dname, deptno FROM dept
