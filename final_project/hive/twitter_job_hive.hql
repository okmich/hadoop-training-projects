create database if not exists twitterjob ;

alter  database twitterjob 
set dbproperties('table.creator'='Michael Enudi')

use twitterjob;

create external table job_tweets (
  id bigint,   
  ts bigint, 
  twtlang string, 
  created_at string,
  tweet_text string, 
  url string,
  source string, 
  hashtags string, 
  agent_location string, 
  agent_desc string, 
  agent_name string, 
  agent_image_url string,
  follower_count int
)
stored as avro
location '/user/cloudera/output/handson_train/hive/twitterjobs';
tblproperties('avro.schema.url'='/user/okmich20/output/handson_train/hive/twitter_avro_schema/twitter_jobs.avsc');

-- sample query to load all job postings in english
--select * from job_tweets where twtlang = 'en';