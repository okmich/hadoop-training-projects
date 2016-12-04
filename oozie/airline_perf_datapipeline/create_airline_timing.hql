use ok_airline;


-- creates an external table table on airline timing
create external table IF NOT EXISTS ext_airline_timing 
	(year smallint,month tinyint,dayofmonth tinyint,dayofweek tinyint,
	deptime smallint, crsdeptime smallint, arrtime smallint, crsarrtime smallint, 
	uniquecarrier string, flightnum string, tailnum string, actualelapsedtime smallint,
	crselapsedtime smallint, airtime smallint, arrdelay smallint, depdelay smallint, 
	origin string, dest string, distance smallint, taxiin string, taxiout string,
	cancelled string, cancellationcode string, diverted string, carrierdelay smallint,
	weatherdelay smallint, nasdelay smallint, securitydelay smallint, lateaircraftdelay smallint)
row format delimited
fields terminated by ','
location '/user/cloudera/output/handson_train/pig/airline_time_performance/refactored';


-- creates an external avro table with partition (by year) on airline timing
create external table IF NOT EXISTS airline_timing_part
	(month tinyint,dayofmonth tinyint,dayofweek tinyint,
	deptime smallint, crsdeptime smallint, arrtime smallint, crsarrtime smallint, 
	uniquecarrier string, flightnum string, tailnum string, actualelapsedtime smallint,
	crselapsedtime smallint, airtime smallint, arrdelay smallint, depdelay smallint, 
	origin string, dest string, distance smallint, taxiin string, taxiout string,
	cancelled string, cancellationcode string, diverted string, carrierdelay smallint,
	weatherdelay smallint, nasdelay smallint, securitydelay smallint, lateaircraftdelay smallint)
partitioned by (year smallint)
stored as avro
location '/user/cloudera/output/handson_train/pig/airline_time_performance/flight_partitioned_avro';

-- DYNAMIC PARTITIONING

--enabling dynamic partition in a hive database
--setting the dynamic partition mode to non-strict
set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;

-- inserting data into a hive table using dynamic nonstrict partition mode
insert into airline_timing_part partition(year)
select 
	month,   
	dayofmonth,         
	dayofweek,          
	deptime,            
	crsdeptime ,        
	arrtime,            
	crsarrtime ,        
	uniquecarrier  ,    
	flightnum ,         
	tailnum ,           
	actualelapsedtime  ,
	crselapsedtime  ,   
	airtime  ,          
	arrdelay ,          
	depdelay ,          
	origin  ,           
	dest ,              
	distance   ,        
	taxiin ,            
	taxiout   ,         
	cancelled ,         
	cancellationcode  , 
	diverted   ,        
	carrierdelay   ,    
	weatherdelay  ,     
	nasdelay ,          
	securitydelay    ,  
	lateaircraftdelay,
	year
from ext_airline_timing ;
