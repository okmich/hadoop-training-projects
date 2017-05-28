
select year, count(1) from pq_flight group by year;


select year, count(1) from flight group by year;


select month, count(1) from pq_flight where year=2006 group by month;

select month, count(1) from pq_flight_part where year=2006 group by month;


select count(1) from pq_flight-- where year=2006 and month=1;

select count(1) from pq_flight_part --where year=2006 and month=1;

select count(1) from pq_flight_part2 --where year=2006 and month=1;



--avg DepDelay in 2008 by month
select month, avg(depdelay) avg_depdelay from pq_airline_timing where year = 2008 group by month;

select month, avg(depdelay) avg_depdelay from pq_airline_timing_part where year = 2008 group by month;

-- add a partition statically
select a.airport, sum(carrierdelay) carrierdelay , sum(weatherdelay) weatherdelay , sum(nasdelay) nasdelay , sum(securitydelay) securitydelay , sum(lateaircraftdelay) lateaircraftdelay, sum(depdelay) depdelay   from pq_airline_timing_part p 
join airports a on a.iata = p.origin
group by a.airport
order by depdelay desc


-- create a view of the airports table and remove the header in the previous
create view airport as select iata, airport name, city, state, country, cast(geolat as float) geolat, cast(geolong as float) geolong from airports where iata != 'iata';

-- get the top 10 closest airports to a particular location
select name, city, state, country, dist from 
(select name, city, state, country, gps_distance_from(39.7645187,-104.9951983, geolat, geolong) dist from airport) v
order by dist limit 10;