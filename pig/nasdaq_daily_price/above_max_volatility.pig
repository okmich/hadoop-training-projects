-- 4) find all the stocks where volatililty was above the avg volatility for the particular stock. Volatility is  stock_price_high - stock_price_low


-- if we were working in sql, it would be
-- SELECT t.*, (t.stock_price_high - t.stock_price_low) as volatility FROM dataset t 
--		JOIN (SELECT stock_symbol, AVG(t.stock_price_high - t.stock_price_low()) avg_volatility 
--				FROM dataset) v 
--		ON v.stock_symbol = T.stock_symbol
--   WHERE t.volatility > v.avg_volatility


-- stock_symbol,
-- date,
-- stock_price_open,
-- stock_price_high,
-- stock_price_low,
-- stock_price_close,
-- stock_volume,
-- stock_price_adj_close
-- volatility
-- average_volatility


-- load the dataset
dataset = LOAD 'hadoop-training/rawdata/stock-prices/NASDAQ_daily_prices_subset.csv' USING PigStorage(',') AS (exchange:chararray,stock_symbol:chararray,tdate:chararray,stock_price_open:float,stock_price_high:float,stock_price_low:float,stock_price_close:float,stock_volume:int,stock_price_adj_close:float);

-- remove the header
data = FILTER dataset BY stock_symbol != 'stock_symbol';


-- project required columns
processed_dataset = FOREACH data GENERATE exchange, stock_symbol, tdate, stock_price_open, stock_price_high, stock_price_low, stock_price_close, stock_volume, stock_price_adj_close, (stock_price_high - stock_price_low) AS volatility;

-- in calculating maximum volatility
project_avg_vol = FOREACH processed_dataset GENERATE stock_symbol, volatility;
stock_grouping_avg_vol = GROUP project_avg_vol BY stock_symbol;
avg_vol_aggregation = FOREACH stock_grouping_avg_vol GENERATE group as key, AVG(project_avg_vol.volatility) AS avg_vol;

-- join the both dataset using their key
joined_dataset = JOIN processed_dataset BY stock_symbol, avg_vol_aggregation BY key;


--
projected_result = FOREACH joined_dataset GENERATE processed_dataset::exchange AS exchange, processed_dataset::stock_symbol AS stock_symbol, processed_dataset::tdate AS tdate, processed_dataset::stock_price_open AS stock_price_open, 
processed_dataset::stock_price_low AS stock_price_low, processed_dataset::stock_price_close AS stock_price_close, processed_dataset::stock_volume AS stock_volume, processed_dataset::stock_price_adj_close AS stock_price_adj_close, processed_dataset::volatility AS volatility, avg_vol_aggregation::avg_vol AS avg_volatility;

--
filtered_projection = FILTER projected_result BY volatility > avg_volatility;


STORE filtered_projection INTO '/user/datadev/hadoop-training/output/pig/record_with_above_avg_volatility_avro' USING AvroStorage();
