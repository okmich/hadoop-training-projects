-- 2) find the record with max volatility for each stock. Volatility is  stock_price_high - stock_price_low



-- in sql, we will do something like
-- select t.*, (stock_price_high - stock_price_low) volatility, CONCAT(stock_symbol, (stock_price_high - stock_price_low)) as key from dataset t
--      join (select CONCAT(stock_symbol, MAX(stock_price_high - stock_price_low)) key from dataset) v
--			ON t.key = v.key


-- exchange,
-- stock_symbol,
-- date,
-- stock_price_open,
-- stock_price_high,
-- stock_price_low,
-- stock_price_close,
-- stock_volume,
-- stock_price_adj_close

-- load the dataset
dataset = LOAD 'hadoop-training/rawdata/stock-prices/NASDAQ_daily_prices_subset.csv' USING PigStorage(',') AS (exchange:chararray,stock_symbol:chararray,tdate:chararray,stock_price_open:float,stock_price_high:float,stock_price_low:float,stock_price_close:float,stock_volume:int,stock_price_adj_close:float);

-- remove the header
data = FILTER dataset BY stock_symbol != 'stock_symbol';

-- 
processed_dataset = FOREACH data GENERATE exchange, stock_symbol, tdate, stock_price_open, stock_price_high, stock_price_low, stock_price_close, stock_volume, stock_price_adj_close, (stock_price_high - stock_price_low) AS volatility, CONCAT(stock_symbol, (chararray)(stock_price_high - stock_price_low)) AS key;

-- in calculating maximum volatility
project_max_vol = FOREACH processed_dataset GENERATE stock_symbol, volatility;
stock_grouping_max_vol = GROUP project_max_vol BY stock_symbol;
max_vol_aggregation = FOREACH stock_grouping_max_vol GENERATE CONCAT(group, (chararray)MAX(project_max_vol.volatility)) AS key;

-- join the both dataset using their key
joined_dataset = JOIN processed_dataset BY key, max_vol_aggregation BY key;

-- select the required final column from the joined_dataset
projected_result = FOREACH joined_dataset GENERATE processed_dataset::exchange AS exchange, processed_dataset::stock_symbol AS stock_symbol, processed_dataset::tdate AS tdate, processed_dataset::stock_price_open AS stock_price_open, 
processed_dataset::stock_price_low AS stock_price_low, processed_dataset::stock_price_close AS stock_price_close, processed_dataset::stock_volume AS stock_volume, processed_dataset::stock_price_adj_close AS stock_price_adj_close, processed_dataset::volatility AS volatility;

STORE projected_result INTO '/user/datadev/hadoop-training/output/pig/record_with_max_volatility_json' USING JsonStorage();