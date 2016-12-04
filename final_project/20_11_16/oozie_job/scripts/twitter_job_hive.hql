create database if not exists twitter_job;

use twitter_job;

create external table job_tweets (
  id bigint,   
  ts bigint, 
  twtLang string, 
  create_at string,
  tweetText string, 
  url string,
  source string, 
  hashtags string, 
  agentLocation string, 
  agentDescription string, 
  agentName string, 
  agentImageUrl string
  )
stored as avro
location '/user/cloudera/output/handson_train/pig/twitterjobs'
tblproperties('avro.schema.url'='/user/cloudera/output/handson_train/pig/twitterjobs_avro_schema/twitter_jobs.avsc');

-- sample query to load all job postings in english
select * from job_tweets where twtlang = 'en';