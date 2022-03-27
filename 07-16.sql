WITH A(median) AS (SELECT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY sal) FROM emp),
     B(deviation) AS (SELECT ABS(sal - median) FROM emp CROSS JOIN A),
     C(mad) AS (SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY deviation) FROM B)
SELECT ABS(sal - mad) / mad, sal, ename, job
FROM emp
CROSS JOIN C 
