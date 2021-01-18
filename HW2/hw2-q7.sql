SELECT SUM(capacity) as capacity
  FROM FLIGHTS
 WHERE ((dest_city = 'Seattle WA' AND
         origin_city = 'San Francisco CA') OR
        (origin_city = 'Seattle WA' AND
         dest_city = 'San Francisco CA')) AND
       month_id = 7 AND
       day_of_month = 10;

-- Output result: 1 row
-- 680
