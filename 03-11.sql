INSERT INTO emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) 
SELECT 1111, 'YODA', 'JEDI', null, hiredate, sal, comm, null
FROM emp
WHERE ename = 'KING';

SELECT D.deptno, D.dname, E.ename
FROM dept AS D
FULL OUTER JOIN emp AS E ON D.deptno = E.deptno;

DELETE FROM emp WHERE empno = 1111;
