SELECT c.name as carrier,
       max(f.price) as max_price
  FROM CARRIERS c, FLIGHTS f
 WHERE c.cid = f.carrier_id AND
       f.dest_city in ('Seattle WA', 'New York NY') AND
       f.origin_city in ('Seattle WA', 'New York NY')
 GROUP BY c.name;

-- Output result: 3 rows
-- American Airlines Inc.|991
-- Delta Air Lines Inc.|999
-- JetBlue Airways|996
