SELECT DISTINCT c.name as name
  FROM CARRIERS c, FLIGHTS f
 WHERE c.cid = f.carrier_id
 GROUP BY f.carrier_id, f.day_of_month, f.day_of_week_id
 HAVING count(*) > 1000;

-- Output result: 12 rows
-- American Airlines Inc.
-- JetBlue Airways
-- Delta Air Lines Inc.
-- ExpressJet Airlines Inc.
-- Envoy Air
-- Northwest Airlines Inc.
-- Comair Inc.
-- SkyWest Airlines Inc.
-- United Air Lines Inc.
-- US Airways Inc.
-- Southwest Airlines Co.
-- ExpressJet Airlines Inc. (1)
