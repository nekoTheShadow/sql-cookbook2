DROP TABLE IF EXISTS new_sal;
CREATE TABLE new_sal (deptno INT, sal INT);
INSERT INTO new_sal (deptno, sal) VALUES (10, 4000);

UPDATE emp
SET sal = NS.sal, comm = NS.sal * 0.5
FROM new_sal AS NS
WHERE emp.deptno = NS.deptno;

SELECT * FROM emp ORDER BY deptno;
