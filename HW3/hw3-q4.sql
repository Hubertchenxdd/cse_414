Select distinct f2.dest_city city
From Flights f1, Flights f2
Where f1.origin_city = 'Seattle WA' And
	  f1.dest_city = f2.origin_city And
	  f2.dest_city not in (Select dest_city
	  					   From Flights 
						   Where origin_city = 'Seattle WA') And
	  f2.dest_city <> 'Seattle WA'
Order By city asc;

-- 256 rows
-- 13s

/*
city
Aberdeen SD
Abilene TX
Adak Island AK
Aguadilla PR
Akron OH
Albany GA
Albany NY
Alexandria LA
Allentown/Bethlehem/Easton PA
Alpena MI
Amarillo TX
Appleton WI
Arcata/Eureka CA
Asheville NC
Ashland WV
Aspen CO
Atlantic City NJ
Augusta GA
Bakersfield CA
Bangor ME
*/