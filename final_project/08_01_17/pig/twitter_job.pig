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

featured_tweets = FOREACH raw_tweets GENERATE (long)json#'id' As id, (long)json#'timestamp_ms' As ts, (chararray)json#'lang' As twtLang, (chararray)json#'created_at' As created_at, (chararray)json#'text' As tweetText, extractHref((chararray)json#'text') As url, extractHref((chararray)json#'source') As source, getHashTagText(json#'entities'#'hashtags') As hashtags, (chararray)json#'user'#'location' As agentLocation, (chararray)json#'user'#'description' As agentDescription, (chararray)json#'user'#'name' As agentName, (chararray)json#'user'#'profile_image_url' As agentImageUrl;

en_tweets = FILTER featured_tweets BY twtLang == 'en';
fr_tweets = FILTER featured_tweets BY twtLang == 'fr';

filtered_tweets = UNION en_tweets,fr_tweets;

STORE filtered_tweets into 'twitter_job.job_tweets' USING org.apache.hive.hcatalog.pig.HCatStorer();




