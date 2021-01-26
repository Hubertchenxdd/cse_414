Select origin_city city
From Flights
Where canceled <> 1
Group By origin_city
Having max(actual_time) < 180
Order By origin_city asc;

-- 109 rows
-- 6s

/* Results
city
Aberdeen SD
Abilene TX
Alpena MI
Ashland WV
Augusta GA
Barrow AK
Beaumont/Port Arthur TX
Bemidji MN
Bethel AK
Binghamton NY
Brainerd MN
Bristol/Johnson City/Kingsport TN
Butte MT
Carlsbad CA
Casper WY
Cedar City UT
Chico CA
College Station/Bryan TX
Columbia MO
Columbus GA
*/
