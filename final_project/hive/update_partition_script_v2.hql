use twitterdb;

alter table tweets add partition(year=${hiveconf:year}, month=${hiveconf:month}, day=${hiveconf:day}, hour=${hiveconf:hour}) location '${hiveconf:pathprefix}/${hiveconf:year}/${hiveconf:month}/${hiveconf:day}/${hiveconf:hour}';





-- beeline -u jdbc:hive2://quickstart.cloudera:10000/twitterdb -n cloudera --hiveconf year=2017 --hiveconf month=06 --hiveconf day=04 --hiveconf hour=07 --hiveconf pathprefix= -f /home/cloudera/classes/hadoop-training-projects/final_project/hive/update_partition_script_v2.hql
