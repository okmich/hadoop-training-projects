raw_data = LOAD '/user/okmich20/rawdata/handson_train/airline_performance/flights' USING PigStorage(',') AS 
	(year:chararray,month:chararray,dayOfMonth:chararray,dayOfWeek:chararray,DepTime:chararray,
	CRSDepTime:chararray,ArrTime:chararray,CRSArrTime:chararray,UniqueCarrier:chararray,FlightNum:chararray,
	TailNum:chararray,ActualElapsedTime:chararray,CRSElapsedTime:chararray,AirTime:chararray,ArrDelay:chararray,
	DepDelay:chararray,Origin:chararray,Dest:chararray,Distance:chararray,TaxiIn:chararray,TaxiOut:chararray,
	Cancelled:chararray,CancellationCode:chararray,Diverted:chararray,CarrierDelay:chararray,WeatherDelay:chararray,
	NASDelay:chararray,SecurityDelay:chararray,LateAircraftDelay:chararray);

headless_data = FILTER raw_data BY (year != 'Year');

rel_data = FOREACH headless_data GENERATE year, month, dayOfMonth, dayOfWeek, 
	(DepTime == 'NA' ? '' : DepTime) AS depTime,
	(CRSDepTime == 'NA' ? '' : CRSDepTime) AS crsDepTime,
	(ArrTime == 'NA' ? '' : ArrTime) AS arrTime,
	(CRSArrTime == 'NA' ? '' : CRSArrTime) AS crsArrTime,
	(UniqueCarrier == 'NA' ? '' : UniqueCarrier) AS UniqueCarrier,
	(FlightNum == 'NA' ? '' : FlightNum) AS FlightNum,
	(TailNum == 'NA' ? '' : TailNum) AS TailNum,
	(ActualElapsedTime == 'NA' ? '' : ActualElapsedTime) AS ActualElapsedTime,
	(CRSElapsedTime == 'NA' ? '' : CRSElapsedTime) AS CRSElapsedTime,
	(AirTime == 'NA' ? '' : AirTime) AS AirTime,
	(ArrDelay == 'NA' ? '' : ArrDelay) AS ArrDelay,
	(DepDelay == 'NA' ? '' : DepDelay) AS DepDelay,
	(Origin == 'NA' ? '' : Origin) AS Origin,
	(Dest == 'NA' ? '' : Dest) AS Dest,
	(Distance == 'NA' ? '' : Distance) AS Distance,
	(TaxiIn == 'NA' ? '' : TaxiIn) AS TaxiIn,
	(TaxiOut == 'NA' ? '' : TaxiOut) AS TaxiOut,
	(Cancelled == 'NA' ? '' : Cancelled) AS Cancelled,
	(CancellationCode == 'NA' ? '' : CancellationCode) AS CancellationCode,
	(Diverted == 'NA' ? '' : Diverted) AS Diverted,
	(CarrierDelay == 'NA' ? '' : CarrierDelay) AS CarrierDelay,
	(WeatherDelay == 'NA' ? '' : WeatherDelay) AS WeatherDelay,
	(NASDelay == 'NA' ? '' : NASDelay) AS NASDelay,
	(SecurityDelay == 'NA' ? '' : SecurityDelay) AS SecurityDelay,
	(LateAircraftDelay == 'NA' ? '' : LateAircraftDelay) AS LateAircraftDelay;

STORE rel_data INTO '/user/okmich20/output/handson_train/airline_performance/flights/processed' Using PigStorage(',');