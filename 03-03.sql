DROP VIEW IF EXISTS V;
CREATE VIEW V AS
  SELECT ename, job, sal
  FROM emp
  WHERE job = 'CLERK';

SELECT E.empno, E.ename, E.job, E.sal, E.deptno
FROM V
JOIN emp AS E ON V.ename = E.ename AND V.job = E.job AND V.sal = E.sal;

