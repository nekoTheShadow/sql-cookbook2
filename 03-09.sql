DROP TABLE IF EXISTS emp_bonus;
CREATE TABLE emp_bonus (empno INT, received DATE, type INT);
INSERT INTO emp_bonus(empno, received, type) VALUES (7934, '17-MAR-2015', 1);
INSERT INTO emp_bonus(empno, received, type) VALUES (7934, '15-FEB-2015', 2);
INSERT INTO emp_bonus(empno, received, type) VALUES (7839, '15-FEB-2015', 3);
INSERT INTO emp_bonus(empno, received, type) VALUES (7782, '15-FEB-2015', 1);

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
                         ELSE        0.3 END AS bonus
  FROM emp AS E
  JOIN emp_bonus AS EB ON E.empno = EB.empno
  WHERE E.deptno = 10
) AS T
GROUP BY T.deptno
