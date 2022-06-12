-- Oracle
SELECT job, COUNT(*), ROUND(SUM(pct)*100) AS pct_of_all_salaries
FROM (
  SELECT job, RATIO_TO_REPORT(sal) OVER() AS pct
  FROM emp
) X
GROUP BY job
