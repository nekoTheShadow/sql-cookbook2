SELECT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY sal)
FROM emp
WHERE deptno = 20