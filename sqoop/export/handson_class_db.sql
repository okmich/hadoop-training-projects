-- create a database schema with an empty table
create database handson_class;
use handson_class;
create table nyse_dividends (exchange varchar(20), stock_symbol varchar(5), datestring varchar(20), value float(10,2));
