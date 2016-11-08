-- generate movie rating analyse
-- output 
-- movieId, title, totalRating, ratingCount, averageRating

register '/home/cloudera/Classes/hadoop-training-projects/pig/movielens/datafu-pig-incubating-1.3.1.jar'

-- load the movie data
raw_movie_full = LOAD '/user/cloudera/rawdata/handson_train/movielens/latest/movies' USING PigStorage(',') as (movieId:chararray, title:chararray, genres:chararray);
--remove the header
raw_movie = FILTER raw_movie_full BY (movieId != 'movieId');
-- project the movieId and title
movie = FOREACH raw_movie GENERATE (long)movieId as movieId, title;

-- load the rating data
raw_ratings_full = LOAD '/user/cloudera/rawdata/handson_train/movielens/latest/ratings' USING PigStorage(',') as (userId:chararray, movieId:chararray, rating:float, timestamp:long);
--remove the header
raw_ratings = FILTER raw_ratings_full BY (userId != 'userId');
-- project the movieId and rating
ratings = FOREACH raw_ratings GENERATE (long)movieId as movieId, rating;
-- group the ratings by movieId
grouped_ratings = GROUP ratings BY movieId;
-- for each group, aggregate the rating
movieId_ratings = FOREACH grouped_ratings GENERATE group as movieId, (int)COUNT(ratings) as num_rating, (float)SUM(ratings.rating) as tot_rating, (float)AVG(ratings.rating) as avg_rating;

-- join the collections 
movie_rating_jn = JOIN movieId_ratings BY movieId, movie BY movieId;
movie_rating = FOREACH movie_rating_jn GENERATE movie.movieId as movieId, movie.title, movieId_ratings.tot_rating as total_rating, movieId_ratings.num_rating as num_ratings, movieId_ratings.rating as rate;

STORE movie_rating INTO '/user/cloudera/output/handson_train/pig/movielens/movies_rating_analysis'