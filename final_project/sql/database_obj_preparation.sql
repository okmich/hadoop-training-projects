create database if not exists handson_class_project;

use handson_class_project;

create table  twitter_job (
	id bigint primary key, ts bigint, twtlang varchar(5), created_at varchar(50),
	tweet_text varchar(255), url varchar(255), source varchar(255),  
	hashtags varchar(255), agent_location varchar(100),
	agent_desc varchar(200), agent_name varchar(100), agent_image_url varchar(100),
	follower_count int
);


create table  twitter_job_bin (
id bigint primary key, ts bigint, twtlang varchar(5), created_at VARBINARY(50),
tweet_text VARBINARY(255), url VARBINARY(255), source VARBINARY(255),  
hashtags varchar(255), agent_location VARBINARY(100),
agent_desc VARBINARY(200), agent_name VARBINARY(100), agent_image_url varchar(100),
follower_count int
);