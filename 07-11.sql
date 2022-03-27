SELECT (SUM(CASE WHEN deptno = 10 THEN sal END) / (SUM(sal)*1.0)) * 100.0
FROM emp;
