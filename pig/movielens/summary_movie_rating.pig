- select movieId, title, count(r.movieId), sum(r.rating), sum(r.rating)/count(r.movieId),
- least_recent(r.timestamp), most_recent(timestamp)  
- from movie m join rating r on r.movieId = m.movieId

register '/home/cloudera/classes/hadoop-training-projects/pig/movielens/piggybank-0.16.0.jar';
register '/home/cloudera/classes/hadoop-training-projects/pig/movielens/datafu-pig-incubating-1.3.1.jar';

DEFINE myCSVLoader org.apache.pig.piggybank.storage.CSVLoader();
DEFINE VAR datafu.pig.stats.VAR();

raw_movie_full = LOAD '/user/cloudera/rawdata/handson_train/movielens/latest/movies' USING myCSVLoader as (movieId: chararray,title: chararray, genres: chararray);

raw_movie = FILTER raw_movie_full BY (movieId != 'movieId');

mv_ds = FOREACH raw_movie GENERATE (long)movieId, title;


raw_rating_full = LOAD '/user/cloudera/rawdata/handson_train/movielens/latest/ratings' USING PigStorage(',') AS (userId: chararray, movieId: chararray, rating: chararray, timestamp: chararray);


raw_rating = FILTER raw_rating_full BY (movieId != 'movieId');

rating_ds = FOREACH raw_rating GENERATE (long)movieId, (float)rating;

rtng_grp = GROUP rating_ds BY movieId;

mv_rtn_ds = FOREACH rtng_grp GENERATE group as movieId, COUNT(rating_ds.movieId) as rating_cnt,  SUM(rating_ds.rating) as rating_total,  AVG(rating_ds.rating) as rating_avg, VAR(rating_ds.rating) as rating_variance;	

join_ds = JOIN mv_ds BY movieId LEFT OUTER, mv_rtn_ds BY movieId;

all_ds = FOREACH join_ds GENERATE mv_ds::movieId AS movieId, mv_ds::title AS title, mv_rtn_ds::rating_cnt AS cnt_rating, mv_rtn_ds::rating_total AS total_rating, mv_rtn_ds::rating_avg AS avg_rating, mv_rtn_ds::rating_variance AS var_rating;

STORE all_ds INTO '/user/cloudera/output/handson_train/movielens/movies_rating_analysis';
