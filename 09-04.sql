SELECT 
  CAST(first_day AS DATE) AS first_day, 
  CAST(first_day + INTERVAL '1 MONTH' - INTERVAL '1 DAY' AS DATE) AS last_day
FROM (
  SELECT DATE_TRUNC('month', CURRENT_TIMESTAMP) AS first_day
) AS T
