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
create external table flight 
	(year smallint,month tinyint,dayofmonth tinyint,dayofweek tinyint,
	deptime smallint, crsdeptime smallint, arrtime smallint, crsarrtime smallint, 
	uniquecarrier string, flightnum string, tailnum string, actualelapsedtime smallint,
	crselapsedtime smallint, airtime smallint, arrdelay smallint, depdelay smallint, 
	origin string, dest string, distance smallint, taxiin string, taxiout string,
	cancelled string, cancellationcode string, diverted string, carrierdelay smallint,
	weatherdelay smallint, nasdelay smallint, securitydelay smallint, lateaircraftdelay smallint)
row format delimited
fields terminated by ','
location '/user/okmich20/rawdata/handson_train/july/airline_performance/flights';


-- creates an external table table on airline timing using parquet format
create external table pq_flight 
	(year smallint,month tinyint,dayofmonth tinyint,dayofweek tinyint,
	deptime smallint, crsdeptime smallint, arrtime smallint, crsarrtime smallint, 
	uniquecarrier string, flightnum string, tailnum string, actualelapsedtime smallint,
	crselapsedtime smallint, airtime smallint, arrdelay smallint, depdelay smallint, 
	origin string, dest string, distance smallint, taxiin string, taxiout string,
	cancelled string, cancellationcode string, diverted string, carrierdelay smallint,
	weatherdelay smallint, nasdelay smallint, securitydelay smallint, lateaircraftdelay smallint)
stored as parquet
location '/user/okmich20/output/handson_train/airline_performance/flights/parquet';

-- copy records from airline_timing to pq_airline_timing
insert overwrite table pq_flight select * from flight where uniquecarrier <> 'UniqueCarrier';

-- discussion on partitioning

-- creates an external parquet table with partition (by year) on airline timing
create external table pq_flight_part
(month tinyint,dayofmonth tinyint,dayofweek tinyint,
deptime smallint, crsdeptime smallint, arrtime smallint, crsarrtime smallint, 
uniquecarrier string, flightnum string, tailnum string, actualelapsedtime smallint,
crselapsedtime smallint, airtime smallint, arrdelay smallint, depdelay smallint, 
origin string, dest string, distance smallint, taxiin string, taxiout string,
cancelled string, cancellationcode string, diverted string, carrierdelay smallint,
weatherdelay smallint, nasdelay smallint, securitydelay smallint, lateaircraftdelay smallint)
partitioned by (year smallint)
stored as parquet
location '/user/okmich20/output/handson_train/airline_performance/flights/parquet_partd';

-- nested partitioning
create external table pq_flight_part2
	(dayofmonth tinyint,dayofweek tinyint,
	deptime smallint, crsdeptime smallint, arrtime smallint, crsarrtime smallint, 
	uniquecarrier string, flightnum string, tailnum string, actualelapsedtime smallint,
	crselapsedtime smallint, airtime smallint, arrdelay smallint, depdelay smallint, 
	origin string, dest string, distance smallint, taxiin string, taxiout string,
	cancelled string, cancellationcode string, diverted string, carrierdelay smallint,
	weatherdelay smallint, nasdelay smallint, securitydelay smallint, lateaircraftdelay smallint)
	partitioned by (year smallint, month tinyint)
	stored as parquet
location '/user/okmich20/output/handson_train/airline_performance/flights/parquet_partd2';


-- STATIC PARTITIONING
-- manual add a partition to the partitoned table
alter table pq_flight_part add partition (year=2007);

alter table pq_flight_part2 add partition (year=2007, month=1);

-- insert data into a table partition using static partitioning
insert overwrite table pq_flight_part partition(year=2007)
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
	lateaircraftdelay 
from airline_timing where year = 2007;


insert overwrite table pq_flight_part2 partition(year=2006, month=1)
	select 
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
	lateaircraftdelay 
from pq_flight where year = 2006 and month=1;

-- droping a partition
-- not that since this is an external table , the partition will be dropped from the hive metastore but will still be available on the distributed file system
-- so there will have to a hdfs command to drop the file as well
-- hdfs dfs -rm -R /user/okmich20/output/handson_train/airline_performance/flights/partitioned_avro/year=2007
alter table pq_flight_part drop partition(year=2007);

-- DYNAMIC PARTITIONING
--enabling dynamic partition in a hive database
--setting the dynamic partition mode to non-strict
set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;

-- inserting data into a hive table using dynamic nonstrict partition mode
insert into pq_flight_part partition(year)
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
from pq_flight ;


insert into pq_flight_part2 partition(year,month)
select  
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
	year,
	month
from pq_flight;

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
location '/user/okmich20/rawdata/handson_train/july/airline_performance/airports';


-- create external table for carriers
create external table carriers (
    code varchar(4), 
    description varchar(30)
)
row format serde 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties (
   "separatorChar" = ",",
   "quoteChar"     = "\"",
   "escapeChar"    = "\\"
)  
stored as textfile
location '/user/okmich20/rawdata/handson_train/july/airline_performance/carriers';

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
location '/user/okmich20/rawdata/handson_train/july/airline_performance/plane_data';


-- inserting into hdfs directory as text file with non-default delimiter
insert overwrite directory '/user/cloudera/output/handson_train/hive/insrt_directory'
row format delimited
fields terminated by '::::'
select * from airports limit  100;