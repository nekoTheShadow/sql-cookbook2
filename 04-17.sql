DROP TABLE IF EXISTS dept_accidents;
CREATE TABLE dept_accidents (deptno INTEGER, accident_name VARCHAR(20));

INSERT INTO dept_accidents VALUES (10, 'BROKEN FOOT');
INSERT INTO dept_accidents VALUES (10, 'FLESH WOUND');
INSERT INTO dept_accidents VALUES (20, 'FIRE');
INSERT INTO dept_accidents VALUES (20, 'FIRE');
INSERT INTO dept_accidents VALUES (20, 'FLOOD');
INSERT INTO dept_accidents VALUES (30, 'BRUISED GLUTE');

SELECT * FROM emp;
DELETE FROM emp
WHERE deptno IN (
  SELECT deptno
  FROM dept_accidents
  GROUP BY deptno
  HAVING COUNT(*) >= 3
);
SELECT * FROM emp;
