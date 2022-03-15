DROP VIEW IF EXISTS new_emp;
CREATE VIEW new_emp AS SELECT empno, ename, job FROM emp;

INSERT INTO new_emp (empno, ename, job) VALUES (1, 'Jonathan', 'Editor');
SELECT * FROM emp;
DELETE FROM emp WHERE empno = 1;
