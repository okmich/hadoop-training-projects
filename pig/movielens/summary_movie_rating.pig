register '/opt/pig-0.16.0/lib/piggybank.jar'
register '/home/datadev/hadoop-training-projects/pig/movielens/datafu-pig-incubating-1.3.1.jar'

define csvLoader org.apache.pig.piggybank.storage.CSVLoader;
define VAR datafu.pig.stats.VAR();

raw_movies = LOAD '/user/datadev/rawdata/ml-latest/movies' USING csvLoader() as (movieId: long, title:chararray, genres: 
chararray);
filtered_movies = FILTER raw_movies BY title != 'title';
movies = FOREACH filtered_movies GENERATE movieId, title;

raw_ratings = LOAD '/user/datadev/rawdata/ml-latest/ratings' USING PigStorage(',') as (userId: long, movieId: long, rating:float, ts:long);

filtered_ratings = FILTER raw_ratings BY userId is not null;
ratings = FOREACH filtered_ratings GENERATE movieId, rating, ToDate(ts * 1000) AS rating_dt;

grouped_ratings = GROUP ratings BY movieId;
agg_ratings = FOREACH grouped_ratings GENERATE group as movieId, COUNT(ratings.rating) as no_ratings, SUM(ratings.rating) as total_ratings, AVG(ratings.rating) as avg_ratings, VAR(ratings.rating) as var_ratings, MIN(ratings.rating_dt) AS earliest, MAX(ratings.rating_dt) as latest;

j_movie_rating = JOIN movies BY movieId LEFT, agg_ratings BY movieId;

movie_summary = FOREACH j_movie_rating GENERATE movies::movieId AS movieId, movies::title as title, agg_ratings::no_ratings as no_ratings, agg_ratings::total_ratings as total_ratings, agg_ratings::avg_ratings as avg_ratings, agg_ratings::var_ratings as var_ratings, agg_ratings::earliest as earliest, agg_ratings::latest as latest;

STORE movie_summary INTO '/user/datadev/hadoop-training/output/pig/movie_summary_pipe' using PigStorage('|');
STORE movie_summary INTO '/user/datadev/hadoop-training/output/pig/movie_summary_avro' using AvroStorage();
