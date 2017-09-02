-- exchange,
-- stock_symbol,
-- date,
-- stock_price_open,
-- stock_price_high,
-- stock_price_low,
-- stock_price_close,
-- stock_volume,
-- stock_price_adj_close

-- 4) find all the stocks where volatililty was above the avg volatility for the particular stock. Volatility is  stock_price_high - stock_price_low

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


--load data
data = LOAD '/user/cloudera/rawdata/handson_train/nasdaq_daily_prices' USING PigStorage(',') AS (exchange:chararray,stock_symbol:chararray,date:chararray,stock_price_open:float,stock_price_high:float,stock_price_low:float,stock_price_close:float,stock_volume:int,stock_price_adj_close:float);

-- remove the header
clean_data = FILTER data BY date != 'date';

--project stock and volatility
vol_projection = FOREACH clean_data GENERATE stock_symbol, (stock_price_high - stock_price_low) as volatility;

-- aggregate
vol_aggreation = GROUP vol_projection BY stock_symbol;

-- project a key
stock_avg_vol_projection = FOREACH vol_aggreation GENERATE group as stock_symbol, AVG(vol_projection.volatility) AS avg_volatility;

-- join clean_data to stock_avg_vol_projection
joined_data = JOIN clean_data BY stock_symbol, stock_avg_vol_projection BY stock_symbol;

--filter all records where volatililty is above the avg volatility for the particular stock
filtered_joined_data = FILTER joined_data BY (clean_data::stock_price_high - clean_data::stock_price_low) > stock_avg_vol_projection::avg_volatility;

final_output = FOREACH filtered_joined_data GENERATE clean_data::stock_symbol AS stock_symbol, clean_data::date AS trading_date, clean_data::stock_price_open as stock_price_open, clean_data::stock_price_high as stock_price_high, clean_data::stock_price_low as stock_price_low, clean_data::stock_price_close as stock_price_close, clean_data::stock_volume as stock_volume, clean_data::stock_price_adj_close as stock_price_adj_close, (clean_data::stock_price_high  - clean_data::stock_price_low) AS volatility,  stock_avg_vol_projection::avg_volatility
 as avg_volatility;

--store the final output
store final_output INTO '/user/cloudera/output/handsontrain/august/above_avg_volatility_avro' USING AvroStorage();
store final_output INTO '/user/cloudera/output/handsontrain/august/above_avg_volatility_json' USING JsonStorage();