SELECT E.ename, D.loc, EB.received
FROM emp AS E
JOIN dept AS D ON E.deptno = D.deptno
LEFT OUTER JOIN emp_bonus AS EB ON E.empno = EB.empno

CREATE TABLE emp_bonus (empno INT, received DATE, type INT);
INSERT INTO emp_bonus(empno, received, type) VALUES (7369, '14-MAR-2015', 1);
INSERT INTO emp_bonus(empno, received, type) VALUES (7900, '14-MAR-2015', 2);
INSERT INTO emp_bonus(empno, received, type) VALUES (7788, '14-MAR-2015', 3);

