SELECT CASE WHEN EXTRACT(DAY FROM TO_DATE(EXTRACT(YEAR FROM CURRENT_DATE) || '-03-01', 'YYYY-MM-DD') - 1) = 29 THEN 'LEAP YEAR' ELSE 'NOT LEAP YEAR' END