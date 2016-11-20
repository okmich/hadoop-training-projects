create database if not exists handson_class;

use handson_class;

create table  twitter_job (
	id bigint primary key, 
	ts bigint, 
	twtLang varchar(5), 
	created_at varchar(50),
	tweetText varchar(255), 
	url varchar(120), 
	hashtags varchar(255), 
	source varchar(255), 
	agentLocation varchar(100),
	agentDescription varchar(200), 
	agentName varchar(100), 
	agentImageUrl varchar(100)
);
