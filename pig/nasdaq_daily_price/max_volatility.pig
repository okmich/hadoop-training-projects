-- exchange,
-- stock_symbol,
-- date,
-- stock_price_open,
-- stock_price_high,
-- stock_price_low,
-- stock_price_close,
-- stock_volume,
-- stock_price_adj_close


-- 2) find the record with max volatility for each stock. Volatility is  stock_price_high - stock_price_low ordered by stock system

data = LOAD '/user/cloudera/rawdata/handson_train/feb/nasdaq_daily_prices' USING PigStorage(',') AS (exchange:chararray,stock_symbol:chararray,date:chararray,stock_price_open:float,stock_price_high:float,stock_price_low:float,stock_price_close:float,stock_volume:long,stock_price_adj_close:float);

-- incase the data from sqoop still contains the header, it is important to filter it out
filtered_data = FILTER data BY exchange != 'exchange';

-- project the entier fields as well as a key field for join and the volatility field
projected_data = FOREACH filtered_data GENERATE exchange, stock_symbol,date, stock_price_open, stock_price_high, stock_price_low, stock_price_close, stock_volume, stock_price_adj_close, (stock_price_high - stock_price_low) AS volatility, CONCAT(stock_symbol, '-', (chararray)(stock_price_high - stock_price_low)) AS key;

-- project only the stock_symbol and the stock_price_low
proj_vol_data = FOREACH filtered_data GENERATE stock_symbol, (stock_price_high - stock_price_low) AS volatility;

--group the available records by the symbol
grp_vol_data = GROUP proj_vol_data BY stock_symbol;

--reduce the grouped data by summing the groups
max_vol_data = FOREACH grp_vol_data GENERATE CONCAT(group, '-', (chararray)MAX(proj_vol_data.volatility)) AS key;


-- join max_vol_data with filtered_data on two fields
joined_data = JOIN projected_data BY key, max_vol_data BY key;

final_result = FOREACH joined_data GENERATE projected_data::exchange as exchange,projected_data::stock_symbol as stock_symbol,projected_data::date as date,projected_data::stock_price_open as stock_price_open,projected_data::stock_price_high as stock_price_high,projected_data::stock_price_low as stock_price_low,projected_data::stock_price_close as stock_price_close,projected_data::stock_volume as stock_volume,projected_data::stock_price_adj_close as stock_price_adj_close,projected_data::volatility as volatility;

sorted_data = ORDER final_result BY stock_symbol ASC;

-- store records in the ouput location
STORE sorted_data INTO '/user/okmich20/output/handson_train/feb/nasdaq_daily_prices/max_volatility' USING PigStorage();


