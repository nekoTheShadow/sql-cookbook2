-- SQLServer
SELECT 
  [10] AS deptno_10, 
  [20] AS deptno_20, 
  [30] AS deptno_30, 
  [40] AS deptno_40
FROM (SELECT deptno, empno FROM emp) E
PIVOT (COUNT(empno) FOR deptno IN ([10], [20], [30], [40])) AS pv
