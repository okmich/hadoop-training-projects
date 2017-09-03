-- simple multiple join
select flightnum, year, month, dayofmonth, dayofweek, c.description, f.tailnum, p.aircraft_type,
	CONCAT(a.airport, ' ', a.city, ', ', a.state, ', ', a.country ) origin, 
	CONCAT(b.airport, ' ', b.city, ', ', b.state, ', ', b.country ) dest 
from flight f 
	left join carriers c on f.uniquecarrier = c.code
	left join airports a on f.origin = a.iata
	left join airports b on f.dest = b.iata
	left join plane_info p on p.tailnum = f.tailnum;

--- creating a hive view
create view v_airports as select iata, concat(airport, ', ', city, ', ', state, ', ', country) address, airport, city, state, country, geolat, geolong from airports where iata <> 'iata';

-- copy the HiveSwarm jar to a hdfs folder
add jar hdfs://iop-bi-master.imdemocloud.com:8020/user/okmich20/HiveSwarm-1.0-SNAPSHOT.jar;
-- create function
create temporary function gps_distance_from as 'com.livingsocial.hive.udf.gpsDistanceFrom';


-- create a view of airports and the distance between them
create view v_inter_airport_dist as 
select tbl1.iata from_iata, tbl1.address from_airport, tbl2.iata to_iata, tbl2.address to_airport, gps_distance_from(tbl1.geolat, tbl1.geolong, tbl2.geolat, tbl2.geolong, 'km') dist from 
			(select  iata, address, geolong, geolat from v_airports) tbl1
		full outer join 
			(select  iata, address, geolong, geolat from v_airports) tbl2
	where tbl1.iata <> tbl2.iata

-- find the top 3 airports pairs with the shortest distance between them
















-- alter a view 
alter view v_airports as select iata, concat(airport, ', ', city, ', ', state, ', ', country) address, airport, city, state, country, geolat, geolong from airports where iata <> 'iata';

-- to drop a view 
drop view v_airports;




-- retrieve the two airport with minimum distance between them
select from_airport, to_airport, MIN(dist) minimum_distance from v_inter_airport_dist v
group by from_airport, to_airport
order by minimum_distance 
limit 10;



add jar /home/cloudera/classes/hadoop-training-projects/hive/airline_ontime_perf/HiveSwarm-1.0-SNAPSHOT.jar

create temporary function gps_distance_from as 'com.livingsocial.hive.udf.gpsDistanceFrom'

create view v_inter_airports as
select concat(t1.iata,t2.iata) dist_key, t1.iata from_iata, t1.airport from_airport, t1.city from_city, 
t1.state from_state, t2.iata to_iata, t2.airport to_airport, t2.city to_city, t2.state  to_state,
gps_distance_from(t1.geolat, t1.geolong, t2.geolat, t2.geolong, 'km') dist_km
from airports t1 
cross join 
(select iata, airport, city, state, country, geolat, geolong from airports where iata != 'iata') t2
where t1.iata != 'iata' and t1.iata != t2.iata

select month, dayofmonth, dayofweek, v.dist_km, arrdelay, depdelay, f.cancelled, f.cancellation_code,
f.diverted, f.carrierdelay, f.weatherdelay, f.nasdelay, f.securitydelay, f.lateaircraftdelay
v.from_airport, v.from_city, v.from_state, v.to_airport, v.to_city, v.to_state
from flight_part f join v_inter_airports v 
on v.dist_key = concat(f.origin, f.dest)
where year = 2008


insert into directory '/user/cloudera/export'
row format delimited
fields terminated by '\t'
select month, dayofmonth, dayofweek, v.dist_km, arrdelay, depdelay, f.cancelled, f.cancellation_code,
f.diverted, f.carrierdelay, f.weatherdelay, f.nasdelay, f.securitydelay, f.lateaircraftdelay
v.from_airport, v.from_city, v.from_state, v.to_airport, v.to_city, v.to_state
from flight_part f join v_inter_airports v 
on v.dist_key = concat(f.origin, f.dest)
where year = 2008


