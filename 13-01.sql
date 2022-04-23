SELECT A.ename || ' works for ' || B.ename
FROM emp A
JOIN emp B ON A.mgr = B.empno
