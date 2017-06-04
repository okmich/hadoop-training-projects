create database if not exists final_project;

use final_project;

create table  twitter_job (
id bigint primary key, ts bigint, twtlang varchar(5), created_at varchar(50),
tweet_text varchar(255), url varchar(255), source varchar(255),  
hashtags varchar(255), agent_location varchar(100),
agent_desc varchar(200), agent_name varchar(100), agent_image_url varchar(100),
follower_count int, year varchar(4), month varchar(2), day varchar(2), hour varchar(2)
);
