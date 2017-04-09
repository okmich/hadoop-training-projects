-- genre stats
-- output 
-- genre, totalNumberofMovies

register '/mnt/home/okmich20/Downloads/piggybank-0.15.0.jar'
DEFINE myCSVLoader org.apache.pig.piggybank.storage.CSVLoader();

-- load the movie data
raw_movie_full = LOAD '/user/cloudera/rawdata/handson_train/movielens/latest/movies' USING org.apache.pig.piggybank.storage.CSVLoader() as (movieId:chararray, title:chararray, genres:chararray);
--remove the header
raw_movie = FILTER raw_movie_full BY (movieId != 'movieId');

-- project the movieId and genre
movie_genre = FOREACH raw_movie GENERATE (long)movieId as movieId, FLATTEN(TOKENIZE(genres, '|')) as genre;

grp_movie_genre = GROUP movie_genre BY genre;
agg_data = FOREACH grp_movie_genre GENERATE group as genre, COUNT(movie_genre) as num_movies;
--sorting
sorted_data = ORDER agg_data BY genre;
STORE sorted_data INTO '/user/cloudera/output/handson_train/pig/movielens/genre_movie_count'