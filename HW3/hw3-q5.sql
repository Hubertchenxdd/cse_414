Select distinct f.dest_city city
From Flights f
Where f.dest_city not in ((Select distinct f2.dest_city
						   From Flights f1, Flights f2
						   Where f1.origin_city = 'Seattle WA' And
								 f1.dest_city = f2.origin_city)
						   Union
						   (Select distinct dest_city
					        From Flights
					  		Where origin_city = 'Seattle WA')) And
	  f.dest_city <> 'Seattle WA'
Order By f.dest_city;

-- 3 rows
-- 47s

/*
city
Devils Lake ND
Hattiesburg/Laurel MS
St. Augustine FL
*/
