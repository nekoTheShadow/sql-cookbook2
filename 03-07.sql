DROP VIEW IF EXISTS V;
CREATE VIEW V AS 
  SELECT * FROM emp WHERE deptno <> 10
  UNION ALL
  SELECT * FROM emp WHERE ename = 'WARD';
  
WITH 
A AS (
  SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno, COUNT(*) AS cnt FROM emp GROUP BY empno, ename, job, mgr, hiredate, sal, comm, deptno
  EXCEPT
  SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno, COUNT(*) AS cnt FROM V   GROUP BY empno, ename, job, mgr, hiredate, sal, comm, deptno
),
B AS (
  SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno, COUNT(*) AS cnt FROM V   GROUP BY empno, ename, job, mgr, hiredate, sal, comm, deptno
  EXCEPT
  SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno, COUNT(*) AS cnt FROM emp GROUP BY empno, ename, job, mgr, hiredate, sal, comm, deptno
)
SELECT * FROM A
UNION ALL
SELECT * FROM B

