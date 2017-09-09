-- find all the stocks where volatililty was above the avg volatility for the particular stock. Volatility is  stock_price_high - stock_price_low

data = LOAD '/user/cloudera/rawdata/handson_train/nasdaq_daily_prices' USING PigStorage(',') AS (exchange:chararray,stock_symbol:chararray,date:chararray,stock_price_open:float,stock_price_high:float,stock_price_low:float,stock_price_close:float,stock_volume:long,stock_price_adj_close:float);

-- incase the data from sqoop still contains the header, it is important to filter it out
filtered_data = FILTER data BY exchange != 'exchange';

--get the average volatility for each stock
avg_projected = FOREACH filtered_data GENERATE stock_symbol, (stock_price_high - stock_price_low) as volatility;

avg_grouped = GROUP avg_projected BY stock_symbol;

avg_aggregated = FOREACH avg_grouped GENERATE group as stock_symbol, AVG(avg_projected.volatility) as avg_volatility;

--project the main records
main_record = FOREACH filtered_data GENERATE stock_symbol, date, stock_price_open, stock_price_high, stock_price_low, stock_price_close, stock_volume, stock_price_adj_close, (stock_price_high - stock_price_low) as volatility;

--
main_joined_avg = JOIN main_record BY stock_symbol, avg_aggregated BY stock_symbol;

--filter our those trades below avg volatility
main_filtered_join = FILTER main_joined_avg BY main_record::volatility >=  avg_aggregated::avg_volatility;

--project the remaining records
main_results = FOREACH main_filtered_join GENERATE main_record::stock_symbol AS stock_symbol, main_record::date AS tdate, main_record::stock_price_open AS stock_price_open, main_record::stock_price_high AS stock_price_high, main_record::stock_price_low AS stock_price_low, main_record::stock_price_close AS stock_price_close, main_record::stock_volume AS stock_volume, main_record::stock_price_adj_close AS stock_price_adj_close;

--save to hive table 
STORE main_results INTO 'handson_nasdaq.trades_above_avg_volatility' USING org.apache.hive.hcatalog.pig.HCatStorer();