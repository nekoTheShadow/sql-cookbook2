-- Oracle
          SELECT 'Days in 202-: ' || TO_CHAR(ADD_MONTHS(TO_DATE('2020-01-01', 'YYYY-MM-DD'), 12) - 1, 'DDD') FROM DUAL
UNION ALL SELECT 'Days in 2021: ' || TO_CHAR(ADD_MONTHS(TO_DATE('2021-01-01', 'YYYY-MM-DD'), 12) - 1, 'DDD') FROM DUAL
