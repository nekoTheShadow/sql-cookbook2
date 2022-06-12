-- Oracle

-- 模範解答
SELECT ename, sal, (
  SELECT bin
  FROM DUAL
  MODEL DIMENSION BY (0 attr)
  MEASURES (sal num, CAST(NULL AS VARCHAR2(30)) bin, '0123456789ABCDEF' hex)
  RULES iterate (10000) UNTIL (num[0] <= 0) (
    bin[0] = SUBSTR(hex[cv()], mod(num[cv()], 2)+1, 1) || bin[cv()],
    num[0] = TRUNC(num[cv()]/2)
  )
) sal_binary
FROM emp
ORDER BY ename;

-- 再帰SQLを利用する
WITH R (ename, sal, bin, lvl) AS (
  SELECT ename, sal, 0, 0 FROM emp
  UNION ALL
  SELECT ename, FLOOR(sal/2), MOD(sal, 2), lvl+1 FROM R WHERE sal > 0
)
SELECT ename, MAX(sal), LISTAGG(bin) WITHIN GROUP (ORDER BY lvl DESC)
FROM R
WHERE lvl > 0
GROUP BY ename
ORDER BY ename;

