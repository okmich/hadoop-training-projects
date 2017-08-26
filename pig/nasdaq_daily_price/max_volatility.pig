-- exchange,
-- stock_symbol,
-- date,
-- stock_price_open,
-- stock_price_high,
-- stock_price_low,
-- stock_price_close,
-- stock_volume,
-- stock_price_adj_close


--load the data
data = LOAD '/user/okmich20/rawdata/handson_train/nasdaq_daily_prices' USING PigStorage(',') AS (exchange:chararray,stock_symbol:chararray,date:chararray,stock_price_open:float,stock_price_high:float,stock_price_low:float,stock_price_close:float,stock_volume:int,stock_price_adj_close:float);

-- remove the header
clean_data = FILTER data BY date != 'date';

--projection
vol_projection = FOREACH clean_data GENERATE stock_symbol, (stock_price_high - stock_price_low) as volatility;

-- aggregate
vol_aggreation = GROUP vol_projection BY stock_symbol;

-- project a key
vol_key_projection = FOREACH vol_aggreation GENERATE CONCAT(group, '|', (chararray)MAX(vol_projection.volatility)) AS key;

-- clean_data project
clean_data_projection = FOREACH clean_data GENERATE exchange, stock_symbol, date, stock_price_open, stock_price_high, stock_price_low, stock_price_close, stock_volume, stock_price_adj_close, CONCAT(stock_symbol, '|', (chararray)(stock_price_high - stock_price_low)) as key;

-- join both relations
joined_data = JOIN clean_data_projection BY key, vol_key_projection BY key;

-- join_projection
join_projection = FOREACH joined_data GENERATE clean_data_projection::exchange AS exchange, clean_data_projection::stock_symbol as stock_symbol, clean_data_projection::date as date, clean_data_projection::stock_price_open as open_price, clean_data_projection::stock_price_high as high_price, 
clean_data_projection::stock_price_low as low_price, clean_data_projection::stock_price_close as close_price, 
clean_data_projection::stock_volume as stock_volume, clean_data_projection::stock_price_adj_close as adj_close_price;


STORE join_projection INTO '/user/okmich20/output/handsontrain/august/rec_max_volatility' USING PigStorage('|');


