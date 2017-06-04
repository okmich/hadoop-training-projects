# get tweets for job -
# process these tweets to extract features of interest
# stored them in a data warehouse 
# migrate the tweets to an rdbms




pig -p year=2017 -p month=06 -p day=04 -p hour=09 -f /home/cloudera/classes/hadoop-training-projects/final_project/pig/twitter_job_v2.pig

hive --hiveconf year=2017 --hiveconf month=06 --hiveconf day=04 --hiveconf hour=09 -f /home/cloudera/classes/hadoop-training-projects/final_project/hive/update_partition_script_v2.hql

sqoop-export --connect jdbc:mysql://quickstart.cloudera:3306/final_project --username root --mapreduce-job-name SqoopExportingTwitterJobs --table twitter_job --password-file /user/cloudera/sqoop-passworfile --hcatalog-database twitterjob --hcatalog-table job_tweets --hcatalog-partition-keys year,month,day,hour --hcatalog-partition-values 2017,06,04,09
