-- 1) Run the total stock_volume traded for each stock in the entire dataset. Store in a fashion order by total volume in descending order

-- if dataset were a table and we were solving this object
-- the solution would have been a simple query
-- select stock_symbol, SUM(stock_volume) total_volume from dataset GROUP BY stock_symbol;

-- exchange,
-- stock_symbol,
-- date,
-- stock_price_open,
-- stock_price_high,
-- stock_price_low,
-- stock_price_close,
-- stock_volume,
-- stock_price_adj_close

-- 1) Run the total stock_volume traded for each stock in the entire dataset. Store in a fashion order by total volumn in descendeing order

	-- 	load the data 							LOAD
	--	remove the header						FILTER
	-- 	get the stock symbol and the volume 	FOR
	--	group the data set by stock system
	-- 	sum the volume property for each group
	--	sort by volumn in desc

--load the data


-- load the dataset
dataset = LOAD 'hadoop-training/rawdata/stock-prices/NASDAQ_daily_prices_subset.csv' USING PigStorage(',') AS (exchange:chararray,stock_symbol:chararray,tdate:chararray,stock_price_open:float,stock_price_high:float,stock_price_low:float,stock_price_close:float,stock_volume:int,stock_price_adj_close:float);

-- remove the header
data = FILTER dataset BY stock_symbol != 'stock_symbol';

-- project the relevant
p_data = FOREACH data GENERATE stock_symbol, stock_volume;

-- group by
stock_grouping = GROUP p_data BY stock_symbol;

-- aggregation
aggregation = FOREACH stock_grouping GENERATE group AS stock_symbol, SUM(p_data.stock_volume) as total_volume;

-- sorting 
sorted_data = ORDER aggregation BY total_volume DESC;

-- store in hdfs
STORE sorted_data INTO '/user/datadev/hadoop-training/output/pig/total_stock_volume' USING PigStorage('|');