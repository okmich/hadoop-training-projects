use twitterjob;

alter table job_tweets add partition(year=${hiveconf:year}, month=${hiveconf:month}, day=${hiveconf:day}, hour=${hiveconf:hour}) location '/user/cloudera/output/handson_train/hive/javaJobTweet/${hiveconf:year}/${hiveconf:month}/${hiveconf:day}/${hiveconf:hour}';





-- hive --hiveconf year=2017 --hiveconf month=06 --hiveconf day=04 --hiveconf hour=07 -f /home/cloudera/classes/hadoop-training-projects/final_project/hive/update_partition_script_v2.hql