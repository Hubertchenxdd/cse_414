Select distinct c.name carrier
From Carriers c, Flights f
Where f.origin_city = 'Seattle WA' And
	  f.dest_city = 'San Francisco CA' And
	  c.cid = f.carrier_id
Order By c.name;

-- 4 rows
-- 7s

/*
carrier
Alaska Airlines Inc.
SkyWest Airlines Inc.
United Air Lines Inc.
Virgin America
*/