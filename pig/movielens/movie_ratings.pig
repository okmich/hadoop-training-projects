-- generate movie rating analyse
-- output 
-- movieId, title, totalRating, ratingCount, averageRating, ratingVariance

register '/mnt/home/okmich20/hadoop-training-projects/pig/movielens/datafu-pig-incubating-1.3.1.jar'
register '/home/cloudera/classes/hadoop-training-projects/pig/movielens/piggybank-0.16.0.jar''

DEFINE VAR datafu.pig.stats.VAR();
DEFINE CSVLoader org.apache.pig.piggybank.storage.CSVLoader();

-- load the movie data
raw_movie_full = LOAD '/user/okmich20/rawdata/handson_train/movielens/latest/movies' USING CSVLoader() as (movieId:chararray, title:chararray, genres:chararray);
--remove the header
raw_movie = FILTER raw_movie_full BY (movieId != 'movieId');
-- project the movieId and title
movie = FOREACH raw_movie GENERATE (long)movieId as movieId, title;

-- load the rating data
raw_ratings_full = LOAD '/user/okmich20/rawdata/handson_train/movielens/latest/ratings' USING PigStorage(',') as (userId:chararray, movieId:chararray, rating:chararray, timestamp:chararray);
--remove the header
raw_ratings = FILTER raw_ratings_full BY (userId != 'userId');
-- project the movieId and rating
ratings = FOREACH raw_ratings GENERATE (long)movieId as movieId, (float)rating as rating;
-- group the ratings by movieId
grouped_ratings = GROUP ratings BY movieId;
-- for each group, aggregate the rating
movieId_ratings = FOREACH grouped_ratings GENERATE group as movieId, (int)COUNT(ratings.movieId) as num_rating, (float)SUM(ratings.rating) as tot_rating, (float)AVG(ratings.rating) as avg_rating, VAR(ratings.rating) as rating_variance;

-- join the collections 
movie_rating_jn = JOIN movieId_ratings BY movieId RIGHT, movie BY movieId;

movie_rating = FOREACH movie_rating_jn GENERATE movie::movieId as movieId, movie::title, movieId_ratings::tot_rating as total_rating, movieId_ratings::num_rating as num_ratings, movieId_ratings::avg_rating as avg_rating, movieId_ratings::rating_variance  as var_rating;

sorted_ratings = ORDER movie_rating BY num_ratings DESC, avg_rating DESC;

STORE movie_rating INTO '/user/okmich20/output/handson_train/pig/movielens/movies_rating_analysis';