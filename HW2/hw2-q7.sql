SELECT SUM(capacity) as capacity
  FROM FLIGHTS
 WHERE dest_city in ('Seattle WA', 'San Francisco CA') AND
       origin_city in ('Seattle WA', 'San Francisco CA') AND
       month_id = 7 AND
       day_of_month = 10;

-- Output result: 1 row
-- 680
