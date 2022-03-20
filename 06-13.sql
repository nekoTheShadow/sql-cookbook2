DROP VIEW IF EXISTS V;
CREATE VIEW V AS
  SELECT REPLACE(mixed, ' ', '') AS mixed
  FROM (
              SELECT SUBSTR(ename, 1, 2) || deptno || SUBSTR(ename, 3, 2) FROM emp WHERE deptno = 10
    UNION ALL SELECT CAST(empno AS CHAR(4))                               FROM emp WHERE deptno = 20
    UNION ALL SELECT ename                                                FROM emp WHERE deptno = 30
  ) AS T(mixed);

SELECT mixed
FROM (SELECT REGEXP_REPLACE(mixed, '[^0-9]', '', 'g') FROM V) AS T (mixed)
WHERE LENGTH(mixed) > 0


