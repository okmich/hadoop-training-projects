create database ok_airline location '/user/okmich20/hive/warehouse/airline.db';

use ok_airline;

-- create a managed table on airline timing
create table m_airline_timing 
	(year smallint,month tinyint,dayofmonth tinyint,dayofweek tinyint,
	deptime smallint, crsdeptime smallint, arrtime smallint, crsarrtime smallint, 
	uniquecarrier string, flightnum string, tailnum string, actualelapsedtime smallint,
	crselapsedtime smallint, airtime smallint, arrdelay smallint, depdelay smallint, 
	origin string, dest string, distance smallint, taxiin string, taxiout string,
	cancelled string, cancellationcode string, diverted string, carrierdelay smallint,
	weatherdelay smallint, nasdelay smallint, securitydelay smallint, lateaircraftdelay smallint)
row format delimited
fields terminated by ',';


-- creates an external table table on airline timing
create external table airline_timing 
	(year smallint,month tinyint,dayofmonth tinyint,dayofweek tinyint,
	deptime smallint, crsdeptime smallint, arrtime smallint, crsarrtime smallint, 
	uniquecarrier string, flightnum string, tailnum string, actualelapsedtime smallint,
	crselapsedtime smallint, airtime smallint, arrdelay smallint, depdelay smallint, 
	origin string, dest string, distance smallint, taxiin string, taxiout string,
	cancelled string, cancellationcode string, diverted string, carrierdelay smallint,
	weatherdelay smallint, nasdelay smallint, securitydelay smallint, lateaircraftdelay smallint)
row format delimited
fields terminated by ','
location '/user/okmich20/rawdata/handson_train/airline_performance/flights_processed';


-- creates an external table table on airline timing using parquet format
create external table pq_airline_timing 
	(year smallint,month tinyint,dayofmonth tinyint,dayofweek tinyint,
	deptime smallint, crsdeptime smallint, arrtime smallint, crsarrtime smallint, 
	uniquecarrier string, flightnum string, tailnum string, actualelapsedtime smallint,
	crselapsedtime smallint, airtime smallint, arrdelay smallint, depdelay smallint, 
	origin string, dest string, distance smallint, taxiin string, taxiout string,
	cancelled string, cancellationcode string, diverted string, carrierdelay smallint,
	weatherdelay smallint, nasdelay smallint, securitydelay smallint, lateaircraftdelay smallint)
stored as parquet
location '/user/okmich20/rawdata/handson_train/airline_performance/flights_parquet';

-- copy records from airline_timing to pq_airline_timing
insert overwrite table pq_airline_timing select * from airline_timing;

-- creates an external parquet table with partition (by year) on airline timing
create external table pq_airline_timing_part
	(month tinyint,dayofmonth tinyint,dayofweek tinyint,
	deptime smallint, crsdeptime smallint, arrtime smallint, crsarrtime smallint, 
	uniquecarrier string, flightnum string, tailnum string, actualelapsedtime smallint,
	crselapsedtime smallint, airtime smallint, arrdelay smallint, depdelay smallint, 
	origin string, dest string, distance smallint, taxiin string, taxiout string,
	cancelled string, cancellationcode string, diverted string, carrierdelay smallint,
	weatherdelay smallint, nasdelay smallint, securitydelay smallint, lateaircraftdelay smallint)
partitioned by (year smallint)
stored as parquet
location '/user/okmich20/rawdata/handson_train/airline_performance/flights_parquet_partd';

-- STATIC PARTITIONING
-- manual add a partition to the partitoned table
alter table airline_timing_part add partition (year=2007);

-- insert data into a table partition using static partitioning
insert overwrite table airline_timing_part partition(year=2007)
select 
	month,   
	dayofmonth,         
	dayofweek,          
	deptime,            
	crsdeptime ,        
	arrtime,            
	crsarrtime ,        
	uniquecarrier  ,,    
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
	lateaircraftdelay 
from airline_timing where year = 2007;

-- droping a partition
-- not that since this is an external table , the partition will be dropped from the hive metastore but will still be available on the distributed file system
-- so there will have to a hdfs command to drop the file as well
-- hdfs dfs -rm -R /user/cloudera/output/handson_train/pig/airline_time_performance/flight_partitioned_avro/year=2007
alter table airline_timing_part drop partition(year=2007);

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
from airline_timing ;


-- create external table for airports
create external table airports (
    iata string, 
    airport string, 
    city string,
    state string, 
    country string, 
    geolat float, 
    geolong float
)
row format serde 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties (
   "separatorChar" = ",",
   "quoteChar"     = "\"",
   "escapeChar"    = "\\"
)  
stored as textfile
location '/user/okmich20/rawdata/handson_train/airline_performance/airports';


-- create external table for carriers
create external table carriers (
    cdde varchar(4), 
    description varchar(30)
)
row format serde 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties (
   "separatorChar" = ",",
   "quoteChar"     = "\"",
   "escapeChar"    = "\\"
)  
stored as textfile
location '/user/okmich20/rawdata/handson_train/airline_performance/carriers';

-- create external table for plane information
create external table plane_info (
    tailnum varchar(4), 
    type varchar(30),
    manufacturer string,
    issue_date varchar(16), 
    model varchar(10), 
    status varchar(10),
    aircraft_type varchar(30),
    pyear int
)
row format serde 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties (
   "separatorChar" = ",",
   "quoteChar"     = "\"",
   "escapeChar"    = "\\"
)  
stored as textfile
location '/user/okmich20/rawdata/handson_train/airline_performance/plane_data';


-- inserting into hdfs directory as text file with non-default delimiter
insert overwrite directory '/user/cloudera/output/handson_train/hive/insrt_directory'
row format delimited
fields terminated by '::::'
select * from airports limit  100;