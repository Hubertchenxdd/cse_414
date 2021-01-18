SELECT c.name,
       f1.flight_num as f1_flight_num​,
       f1.origin_city as f1_origin_city​,
       f1.dest_city as ​f1_dest_city​,
       f1.dest_city as ​f1_dest_city​,
       f1.actual_time as f1_actual_time​,
       f2.flight_num as f2_flight_num​,
       f2.origin_city as f2_origin_city​,
       f2.dest_city as f2_dest_city​,
       f2.actual_time as f2_actual_time​,
       f1.actual_time + f2.actual_time as actual_time​
  FROM CARRIERS c, FLIGHTS f1, FLIGHTS f2
 WHERE f1.carrier_id = c.cid AND
       f1.carrier_id = f2.carrier_id AND
       f1.origin_city = 'Seattle WA' AND
       f1.dest_city = f2.origin_city AND
       f2.dest_city = 'Boston MA' AND
       f1.month_id = 7 AND
       f2.month_id = 7 AND
       f1.day_of_month = 15 AND
       f2.day_of_month = 15 AND
       f1.actual_time + f2.actual_time < 420;

-- Output result: 1472 rows
