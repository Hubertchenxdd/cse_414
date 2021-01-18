SELECT distinct f.flight_num as flight_num
  FROM FLIGHTS f, CARRIERS c
 WHERE f.day_of_week_id = 1 AND
       f.origin_city = 'Seattle WA' AND
       f.dest_city = 'Boston MA' AND
       f.carrier_id = c.cid AND
       c.name = 'Alaska Airlines Inc.';

-- Output result: 3 rows
-- 12
-- 24
-- 734
