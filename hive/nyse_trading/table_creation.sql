-- create a database for this project
create database handson_nasdaq --location '/user/okmich20/hive/warehouse/handson_nasdaq';

use handson_nasdaq;

--Create a managed table for NASDAQ daily prices data set.
create table tbl_nasdaq_daily_prices (
	exchange_name string,stock_symbol string, tdate string,stock_price_open float,
	stock_price_high float,stock_price_low float,stock_price_close float,
	stock_volume int, stock_price_adj_close float
)
row format delimited
fields terminated by ',';

--Create a managed table for NASDAQ daily prices data set with parquet data format
create table tbl_nasdaq_daily_prices_parquet (
	exchange_name string,stock_symbol string, tdate string,stock_price_open float,
	stock_price_high float,stock_price_low float,stock_price_close float,
	stock_volume int, stock_price_adj_close float
)
stored as parquet;

--Create an external table for NASDAQ daily prices data set.
create external table nasdaq_daily_prices_ext (
	exchange_name string,stock_symbol string, tdate string,stock_price_open float,
	stock_price_high float,stock_price_low float,stock_price_close float,
	stock_volume int, stock_price_adj_close float
)
row format delimited
fields terminated by ','
location '/user/okmich20/rawdata/handson_train/nasdaq_daily_prices';

--create and load an avro table simultaneously
create table nasdaq_daily_prices_avro
stored as avro
as
select * from tbl_nasdaq_daily_prices;

--alter table to add the data location
alter table nasdaq_dividends_avro
set location '/user/cloudera/rawdata/handson_train/nasdaq_dividend_avro';

-- alter a table to add a table property
alter table nasdaq_dividends_avro set tblproperties('author'='michael enudi')

-- alter table to rename the table
alter table nasdaq_dividends_avro rename to avro_dividend	

-- to recreate the sql statement used to create a table
-- also use the output to view the real details for building a hive table
show create table nasdaq_daily_prices;

-- view details of our new avro table
show create table nasdaq_dividends_avro;