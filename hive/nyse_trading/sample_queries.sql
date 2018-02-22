use nasdaq;

-- 1) Run the total stock_volume traded for each stock in the entire dataset. Store in a fashion order by total volumn in descending order
select stock_symbol, sum(stock_volume) total_vol from daily_prices_avro group by stock_symbol order by stock_symbol;

-- Find out total volume sale for each stock symbol which has closing price more than $5.
select stock_symbol, sum(stock_volume) total_volume from daily_prices_avro where stock_price_close > 5.0 group by stock_symbol

-- 2) find the record with max volatility for each stock. Volatility is  stock_price_high - stock_price_low
select t.exchange_name, t.stock_symbol, t.tdate, t.stock_price_open, t.stock_price_high,
t.stock_price_low, t.stock_price_close, t.stock_volume, t.stock_price_adj_close, 
(t.stock_price_high - t.stock_price_low) as volatility from daily_prices_avro t 
join (select stock_symbol, max(stock_price_high - stock_price_low) as max_vol from daily_prices_avro group by stock_symbol) v 
on (t.stock_price_high - t.stock_price_low) = v.max_vol and t.stock_symbol = v.stock_symbol;

-- Find out highest price in the history for each stock symbol.
-- assume highest closing price
select stock_symbol, max(stock_price_close) record_closing_price from daily_prices_avro group by stock_symbol

-- Find out highest dividends given for each stock symbol in entire history.
select stock_symbol, max(dividends) record_dividend from nasdaq_dividends group by stock_symbol

-- Find out highest price and highesh dividends for each stock symbol if highest price and highest dividends exist.
-- assume highest closing price
select prices.stock_symbol, prices.record_closing_price, dividends.record_dividend from 
(select stock_symbol, max(stock_price_close) record_closing_price from daily_prices_avro group by stock_symbol) prices 
join
(select stock_symbol, max(dividends) record_dividend from nasdaq_dividends group by stock_symbol) dividends
on prices.stock_symbol = dividends.stock_symbol

-- find all the stocks where volatililty was above the avg volatility for the particular stock
select t.exchange_name, t.stock_symbol, t.tdate, t.stock_price_open, t.stock_price_high,
t.stock_price_low, t.stock_price_close, t.stock_volume, t.stock_price_adj_close, 
(t.stock_price_high - t.stock_price_low) volatility  from daily_prices_pk as t join 
(select i.stock_symbol, avg(i.stock_price_high - i.stock_price_low) avg_volatility from daily_prices_pk i
group by i.stock_symbol) as t1 on t1.stock_symbol = t.stock_symbol 
where (t.stock_price_high - t.stock_price_low) > t1.avg_volatility

-- find the record count where the volatility is greater than the avg volatility for the stock
select count(1) from tbl_nasdaq_daily_prices n join 
	(select t.stock_symbol, avg(t.stock_price_high - t.stock_price_low) avg_vol from 
		daily_prices_avro t group by t.stock_symbol) i on i.stock_symbol = n.stock_symbol
where (n.stock_price_high - n.stock_price_low) > i.avg_vol
-- order by n.stock_symbol

-- Find out highest price and highest dividends for each stock symbol, if one of them does not exist then keep Null values.
select prices.stock_symbol, prices.record_closing_price, dividends.record_dividend from 
(select stock_symbol, max(stock_price_close) record_closing_price from daily_prices_avro group by stock_symbol) prices 
full outer join
(select stock_symbol, max(dividends) record_dividend from nasdaq_dividends group by stock_symbol) dividends
on prices.stock_symbol = dividends.stock_symbol