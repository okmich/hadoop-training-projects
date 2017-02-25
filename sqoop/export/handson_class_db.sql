-- create a database schema with an empty table
create database sqoop_handson;
use sqoop_handson;
create table nyse_dividends (exchange varchar(20), stock_symbol varchar(5), datestring varchar(20), value float(10,2));


create table altered_nyse_dividends (stock_symbol varchar(5), value float(10,2), datestring varchar(20), exchange varchar(20));