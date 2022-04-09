WITH A (yrq) AS (
            SELECT 20221
  UNION ALL SELECT 20222
  UNION ALL SELECT 20223
  UNION ALL SELECT 20224
)
SELECT
  yrq,
  MAKE_TIMESTAMP(yrq/10, 1 + 3*(yrq%10-1), 1, 0, 0, 0) AS q_start,
  MAKE_TIMESTAMP(yrq/10, 1 + 3*(yrq%10-1), 1, 0, 0, 0) + INTERVAL '3 month' - INTERVAL '1 day' AS q_end
FROM A


