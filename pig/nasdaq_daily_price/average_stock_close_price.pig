-- exchange,
-- stock_symbol,
-- date,
-- stock_price_open,
-- stock_price_high,
-- stock_price_low,
-- stock_price_close,
-- stock_volume,
-- stock_price_adj_close

-- 3) find the average closing price for each stock in the entire dataset. Order the results by the stock symbol and store in a pipe delimited file

data = LOAD '/user/cloudera/rawdata/handson_train/feb/nasdaq_daily_prices' USING PigStorage(',') AS (exchange:chararray,stock_symbol:chararray,date:chararray,stock_price_open:float,stock_price_high:float,stock_price_low:float,stock_price_close:float,stock_volume:long,stock_price_adj_close:float);

-- incase the data from sqoop still contains the header, it is important to filter it out
filtered_data = FILTER data BY exchange != 'exchange';

-- project only the stock_symbol and the volumn
proj_data = FOREACH filtered_data GENERATE stock_symbol, stock_price_close;

--group the available records by the symbol
grp_data = GROUP proj_data BY stock_symbol;

--reduce the grouped data by summing the groups
agg_data = FOREACH grp_data GENERATE group AS symbol, SUM(proj_data.stock_price_close) AS avg_closing_price;

sorted_data = ORDER agg_data BY symbol ASC;

-- store records in the ouput location
STORE sorted_data INTO '/user/cloudera/output/handson_train/feb/nasdaq_daily_prices/avg_closing_price' USING PigStorage('|');