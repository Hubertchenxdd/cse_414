Select origin_city, cast(round(100.0 * sum(case when actual_time < 180 then 1 else 0 end)/count(*), 2) as numeric(10, 2)) percentage
From Flights
Where canceled <> 1
Group By origin_city
Order By percentage asc, origin_city asc;

-- 327 rows
-- 5s

/*
origin_city	percentage
origin_city	percentage
Guam TT	0.00
Pago Pago TT	0.00
Aguadilla PR	28.90
Anchorage AK	31.81
San Juan PR	33.66
Charlotte Amalie VI	39.56
Ponce PR	40.98
Fairbanks AK	50.12
Kahului HI	53.51
Honolulu HI	54.74
San Francisco CA	55.83
Los Angeles CA	56.08
Seattle WA	57.61
Long Beach CA	62.18
New York NY	62.37
Kona HI	63.16
Las Vegas NV	64.92
Christiansted VI	65.10
Newark NJ	65.85
Plattsburgh NY	66.67
*/
