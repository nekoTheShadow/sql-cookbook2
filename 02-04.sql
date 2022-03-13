CREATE OR REPLACE VIEW V AS SELECT ename || ' ' || deptno AS data FROM emp;

SELECT * FROM V ORDER BY REPLACE(data, REPLACE(TRANSLATE(data, '0123456789', '#########'), '#', ''), '');
SELECT * FROM V ORDER BY REPLACE(TRANSLATE(data, '0123456789', '#########'), '#', '');
