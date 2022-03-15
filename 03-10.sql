DROP TABLE IF EXISTS emp_bonus;
CREATE TABLE emp_bonus (empno INT, received DATE, type INT);
INSERT INTO emp_bonus(empno, received, type) VALUES (7934, '17-MAR-2005', 1);
INSERT INTO emp_bonus(empno, received, type) VALUES (7934, '15-FEB-2005', 2);

SELECT 
  T.deptno,
  SUM(DISTINCT T.sal) AS total_sal,
  SUM(T.bonus) AS total_bonus
FROM (
  SELECT 
    E.empno, 
    E.ename, 
    E.sal,
    E.deptno,
    E.sal * CASE EB.type WHEN 1 THEN 0.1 
                         WHEN 2 THEN 0.2 
                         WHEN 3 THEN 0.3 
                         ELSE        0.0 END AS bonus
  FROM emp AS E
  LEFT OUTER JOIN emp_bonus AS EB ON E.empno = EB.empno
  WHERE E.deptno = 10
) AS T
GROUP BY T.deptno
