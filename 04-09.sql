DROP TABLE IF EXISTS emp_bonus;
CREATE TABLE emp_bonus (empno INT, ename VARCHAR(10));
INSERT INTO emp_bonus (empno, ename) VALUES (7369, 'SMITH'), (7900, 'JAMES'), (7934, 'MILLER');

SELECT * FROM emp;
UPDATE emp AS E 
SET sal = sal * 1.20 
WHERE EXISTS (
  SELECT *
  FROM emp_bonus AS EB
  WHERE E.empno = EB.empno
);
SELECT * FROM emp;
