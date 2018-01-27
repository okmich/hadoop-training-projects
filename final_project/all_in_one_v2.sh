pig -p year=2018 -p month=01 -p day=27 -p hour=07 -p techJobTweetHDFSPrefix=/user/cloudera/hadoop-training/flume/jobs-twits -p techTweetPigOutputPrefix=/user/cloudera/hadoop-training/flume/jobs-twits-output -f /home/cloudera/classes/hadoop-training-projects/final_project/pig/twitter_job_v2.pig


beeline -u jdbc:hive2://quickstart.cloudera:10000/twitterdb -n cloudera --hiveconf year=2018 --hiveconf month=01 --hiveconf day=27 --hiveconf hour=07 --hiveconf pathprefix=/user/cloudera/hadoop-training/flume/jobs-twits-output  -f /home/cloudera/classes/hadoop-training-projects/final_project/hive/update_partition_script_v2.hql


sqoop-export --connect jdbc:mysql://quickstart.cloudera:3306/final_project --username root --mapreduce-job-name SqoopExportingTwitterJobs --table twitter_job --password-file /user/cloudera/passwordfile --hcatalog-database twitterdb --hcatalog-table tweets --hcatalog-partition-keys year,month,day,hour --hcatalog-partition-values 2018,01,27,07

