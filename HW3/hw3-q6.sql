Select distinct c.name carrier
From Carriers c, 
	 (Select carrier_id 
	  From Flights
	  Where origin_city = 'Seattle WA' And
	  		dest_city = 'San Francisco CA') f
Where c.cid = f.carrier_id
Order By c.name;

-- 4 rows
-- 5s

/*
carrier
Alaska Airlines Inc.
SkyWest Airlines Inc.
United Air Lines Inc.
Virgin America
*/