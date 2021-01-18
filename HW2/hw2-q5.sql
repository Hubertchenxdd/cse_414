SELECT c.name,
       f1.cnt1 * 100.0 / f2.cnt2 as percentage
  FROM CARRIERS c,
       (SELECT carrier_id, count(carrier_id) cnt1
          FROM FLIGHTS
         WHERE canceled = 1 AND
               origin_city = 'Seattle WA'
         GROUP BY carrier_id) f1,
       (SELECT carrier_id, count(carrier_id) cnt2
          FROM FLIGHTS
         WHERE origin_city = 'Seattle WA'
         GROUP BY carrier_id) f2
 WHERE c.cid = f1.carrier_id AND
       c.cid = f2.carrier_id AND
       percentage > 0.5;

-- Output result: 6 rows
-- JetBlue Airways|1.00250626566416
-- ExpressJet Airlines Inc.|3.2258064516129
-- Frontier Airlines Inc.|0.840336134453782
-- Northwest Airlines Inc.|1.4336917562724
-- SkyWest Airlines Inc.|0.728291316526611
-- United Air Lines Inc.|0.983767830791933
