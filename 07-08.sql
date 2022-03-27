DROP TABLE IF EXISTS sales;
CREATE TABLE sales (date1 DATE, sales int);
INSERT INTO sales VALUES (TO_DATE('2020-01-01', 'YYYY-MM-DD'), 647);
INSERT INTO sales VALUES (TO_DATE('2020-01-02', 'YYYY-MM-DD'), 561);
INSERT INTO sales VALUES (TO_DATE('2020-01-03', 'YYYY-MM-DD'), 741);
INSERT INTO sales VALUES (TO_DATE('2020-01-04', 'YYYY-MM-DD'), 978);
INSERT INTO sales VALUES (TO_DATE('2020-01-05', 'YYYY-MM-DD'), 1062);
INSERT INTO sales VALUES (TO_DATE('2020-01-06', 'YYYY-MM-DD'), 1072);
INSERT INTO sales VALUES (TO_DATE('2020-01-07', 'YYYY-MM-DD'), 805);
INSERT INTO sales VALUES (TO_DATE('2020-01-08', 'YYYY-MM-DD'), 662);
INSERT INTO sales VALUES (TO_DATE('2020-01-09', 'YYYY-MM-DD'), 1083);
INSERT INTO sales VALUES (TO_DATE('2020-01-10', 'YYYY-MM-DD'), 970);

SELECT *, (sales + salesLagOne + salesLagTwo) / 3.0 AS MovingAverage
FROM (
  SELECT
    date1,
    sales,
    LAG(sales) OVER (ORDER BY date1) AS salesLagOne,
    LAG(sales, 2) OVER (ORDER BY date1) AS salesLagTwo
  FROM sales
) AS T
