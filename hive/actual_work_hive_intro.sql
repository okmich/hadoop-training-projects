create table daily_prices (
exchange_name string,
stock_symbol string, 
tdate string,
stock_price_open float,
stock_price_high float,
stock_price_low float,
stock_price_close float,
stock_volume int, 
stock_price_adj_close float
)
row format delimited
fields terminated by ',';

create table daily_prices_avro (
exchange_name string,
stock_symbol string, 
tdate string,
stock_price_open float,
stock_price_high float,
stock_price_low float,
stock_price_close float,
stock_volume int, 
stock_price_adj_close float
)
stored as avro;

create external table daily_prices_1 (
exchange_name string,
stock_symbol string, 
tdate string,
stock_price_open float,
stock_price_high float,
stock_price_low float,
stock_price_close float,
stock_volume int, 
stock_price_adj_close float
)
row format delimited
fields terminated by ','
stored as textfile
location '/user/datadev/hadoop-training/rawdata/stock-prices';



--test the effect of dropping a table on managed and external table

drop table daily_prices;
drop table daily_prices_1;



create table daily_prices_pk 
stored as parquet
as
select * from daily_prices_1 where tdate != 'date';


!sh hdfs dfs -rm -R /user/datadev/hadoop-training/output/pig/total_stock_volume
insert overwrite directory '/user/datadev/hadoop-training/output/pig/total_stock_volume'
row format delimited 
fields terminated by '\001'
select stock_symbol, SUM(stock_volume) total_vol from daily_prices_avro  group by stock_symbol order by total_vol desc;