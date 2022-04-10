SELECT 
   ename, 
   sal,
   COALESCE(LEAD(sal) OVER (ORDER BY sal), MIN(sal) OVER()) AS forward,
   COALESCE(LAG(sal)  OVER (ORDER BY sal), MAX(sal) OVER()) AS rewind
FROM emp
