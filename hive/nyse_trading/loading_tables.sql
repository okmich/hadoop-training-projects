use handson_nasdaq;

--load data into the managed table tbl_nasdaq_daily_prices
load data inpath '' overwrite into tbl_nasdaq_daily_prices;

--load data into the managed parquet table tbl_nasdaq_daily_prices 
insert overwrite table tbl_nasdaq_daily_prices_parquet
select * from tbl_nasdaq_daily_prices;

---- to load data into our new avro table from another previous table or the same column specification
insert overwrite table nasdaq_dividends_avro select * from nasdaq_dividends;