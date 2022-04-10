SELECT ename, sal
FROM (
  SELECT *, MAX(sal) OVER() max_sal, MIN(sal) OVER() min_sal
  FROM emp
) T
WHERE sal IN (max_sal, min_sal);

