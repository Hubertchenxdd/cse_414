SELECT w.day_of_week as day_of_week,
       avg(f.arrival_delay) as delay
  FROM FLIGHTS f, WEEKDAYS w
 WHERE f.day_of_week_id = w.did
 GROUP BY w.day_of_week
 ORDER BY delay DESC
 LIMIT 1;

-- Output result: 1 row
-- Friday|14.4725010477787
