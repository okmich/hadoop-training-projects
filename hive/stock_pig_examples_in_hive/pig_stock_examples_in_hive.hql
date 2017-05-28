--create a table for the  nyse daily price dataset
--dataset is in /user/cloudera/rawdata/handson_train/nasdaq_daily_prices
--exchange,stock_symbol,date,stock_price_open,stock_price_high,stock_price_low,stock_price_close,stock_volume,stock_price_adj_close

create database pig_stock_examples;
use pig_stock_examples;
create external table daily_prices (
`exchange` string,
stock_symbol string,
date string,
stock_price_open float,
stock_price_high float,
stock_price_low float,
stock_price_close float,
stock_volume int,
stock_price_adj_close float
)
row format delimited
fields terminated by ','
location '/user/cloudera/rawdata/handson_train/nasdaq_daily_prices';

-- 1) Run the total stock_volume traded for each stock in the entire dataset. Store in a fashion order by total volumn in descending order

select stock_symbol, sum(stock_volume) total_volume from daily_prices group by stock_symbol order by total_volume desc;

-- 2) find the record with max volatility for each stock. Volatility is  stock_price_high - stock_price_low

select dp.`exchange`, dp.stock_symbol, dp.date, dp.stock_price_open, dp.stock_price_high, dp.stock_price_low, dp.stock_price_close, dp.stock_volume, dp.stock_price_adj_close, (dp.stock_price_high - dp.stock_price_low) as volatility, concat(dp.stock_symbol, '-' ,dp.stock_price_high - dp.stock_price_low) as key 
from daily_prices dp 
join (select concat(stock_symbol, '-' ,max(stock_price_high - stock_price_low)) as key from daily_prices group by stock_symbol) v 
on v.key = concat(dp.stock_symbol, '-' ,dp.stock_price_high - dp.stock_price_low);

-- 3) find the average closing price for each stock in the entire dataset

select stock_symbol, avg(stock_price_close) avg_closing_price from daily_prices group by stock_symbol;

-- 4) find all the stocks where volatililty was above the avg volatility for the particular stock. Volatility is  stock_price_high - stock_price_low
	take home exercize