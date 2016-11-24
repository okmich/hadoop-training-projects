-- find the top 3 two airports with the shortest distance between them


add jar file:/home/cloudera/Classes/hadoop-training-projects/hive/airline_ontime_perf/HiveSwarm-1.0-SNAPSHOT.jar;

create temporary function gps_distance_from as 'com.livingsocial.hive.udf.gpsDistanceFrom';

--- creating a hive view
create view airport_without_header as
select * from airports where iata <> 'iata';


-- query
select from_airport, to_airport, MIN(dist) minimum_distance from 
	(	select tbl1.airport from_airport, tbl2.airport to_airport, gps_distance_from(tbl1.geolat, tbl1.geolong, tbl2.geolat, tbl2.geolong ) dist from 
		(select  iata, airport, geolong, geolat from airport_without_header) tbl1
		full outer join 
		(select  iata, airport, geolong, geolat from airport_without_header) tbl2
	) v
group by from_airport, to_airport
order by 3 
limit 3;


-- some analytical query with the crime dataset
-- download the dataset from https://drive.google.com/open?id=0B0MdkEsxQHAQU1BIMVJuM2twVW8
-- download the scripts to prepare the hive database and tables from https://drive.google.com/drive/folders/0B0MdkEsxQHAQbjJtOHhMaEpuVUk?usp=sharing

select method, count(1) from crime_incident group by method

select method, shift, count(1) numOccur from crime_incident group by method, shift with rollup

select method, shift, count(1) numOccur from crime_incident group by method, shift with cube

