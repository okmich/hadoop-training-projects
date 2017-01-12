REGISTER '/home/cloudera/Classes/hadoop-training-projects/final_project/08_01_17/pig/jars/json-simple-1.1.1.jar'
REGISTER '/home/cloudera/Classes/hadoop-training-projects/final_project/08_01_17/pig/jars/elephant-bird-pig-4.14.jar'
REGISTER '/home/cloudera/Classes/hadoop-training-projects/final_project/08_01_17/pig/jars/elephant-bird-hadoop-compat-4.14.jar'
REGISTER '/home/cloudera/Classes/hadoop-training-projects/final_project/08_01_17/pig/jars/avro-1.8.0.jar' 
REGISTER '/home/cloudera/Classes/hadoop-training-projects/final_project/08_01_17/pig/jars/piggybank-0.15.0.jar'
REGISTER '/home/cloudera/Classes/hadoop-training-projects/final_project/08_01_17/pig/jars/jackson-core-asl-1.9.13.redhat-3.jar'
REGISTER '/home/cloudera/Classes/hadoop-training-projects/final_project/08_01_17/pig/jars/jackson-mapper-asl-1.9.13.redhat-3.jar'
REGISTER '/home/cloudera/Classes/hadoop-training-projects/final_project/08_01_17/pig/jars/custome-pig-udf-0.0.1-SNAPSHOT.jar'

DEFINE extractHref com.dezyre.hadooptraining.udf.HrefExtractor();
DEFINE getHashTagText com.dezyre.hadooptraining.udf.HashTextExtractor();
 
raw_tweets = LOAD '$techJobTweetHDFSPath/$year/$month/$day/$hour' USING com.twitter.elephantbird.pig.load.JsonLoader('-nestedLoad') as (json:map[]);

featured_tweets = FOREACH raw_tweets GENERATE (long)json#'id' AS id, (long)json#'timestamp_ms' AS ts, (chararray)json#'lang' AS twtlang, (chararray)json#'created_at' AS created_at, (chararray)json#'text' AS tweet_text, extractHref((chararray)json#'text') AS url, extractHref((chararray)json#'source') AS source, getHashTagText(json#'entities'#'hashtags') AS hashtags, (chararray)json#'user'#'location' AS agent_location, (chararray)json#'user'#'description' AS agent_desc, (chararray)json#'user'#'name' AS agent_name, (chararray)json#'user'#'profile_image_url' AS agent_image_url, (int)json#'user'#'followers_count' AS follower_count;

--en_tweets = FILTER featured_tweets BY twtLang == 'en';
--fr_tweets = FILTER featured_tweets BY twtLang == 'fr';

--filtered_tweets = UNION en_tweets,fr_tweets;

STORE featured_tweets INTO 'twitter_job.job_tweets' USING org.apache.hive.hcatalog.pig.HCatStorer();




