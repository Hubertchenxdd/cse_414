SELECT c.name,
       SUM(f.canceled = 1) * 100.0 / COUNT(*) as percentage
  FROM CARRIERS c, FLIGHTS f
 WHERE c.cid = f.carrier_id AND
       f.origin_city = 'Seattle WA'
 GROUP BY c.cid
HAVING percentage > 0.5
 ORDER BY percentage ASC;

-- Output result: 6 rows
-- SkyWest Airlines Inc.|0.728291316526611
-- Frontier Airlines Inc.|0.840336134453782
-- United Air Lines Inc.|0.983767830791933
-- JetBlue Airways|1.00250626566416
-- Northwest Airlines Inc.|1.4336917562724
-- ExpressJet Airlines Inc.|3.2258064516129
