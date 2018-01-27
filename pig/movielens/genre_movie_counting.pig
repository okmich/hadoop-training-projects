-- genre stats
-- output 
-- genre, totalNumberofMovies

register '/home/cloudera/classes/hadoop-training-projects/pig/movielens/piggybank-0.16.0.jar';

DEFINE myCSVLoader org.apache.pig.piggybank.storage.CSVLoader();
DEFINE myXlsStorage org.apache.pig.piggybank.storage.CSVExcelStorage();

-- load the movie data
raw_movie_full = LOAD '/user/cloudera/rawdata/handson_train/movielens/latest/movies' USING myCSVLoader() as (movieId:chararray, title:chararray, genres:chararray);
--remove the header
raw_movie = FILTER raw_movie_full BY (movieId != 'movieId');

-- project the movieId and genre
movie_genre = FOREACH raw_movie GENERATE (long)movieId as movieId, FLATTEN(TOKENIZE(genres, '|')) as genre;

grp_movie_genre = GROUP movie_genre BY genre;
agg_data = FOREACH grp_movie_genre GENERATE group as genre, COUNT(movie_genre) as num_movies;
--sorting
sorted = ORDER agg_data BY genre;


STORE sorted INTO '/user/cloudera/output/handson_train/movielens/genre-dist-text' USING  PigStorage('|'); 
STORE sorted INTO '/user/cloudera/output/handson_train/movielens/genre-dist-avro' USING  AvroStorage(); 
STORE sorted INTO '/user/cloudera/output/handson_train/movielens/genre-dist-json' USING  JsonStorage(); 
STORE sorted INTO '/user/cloudera/output/handson_train/movielens/genre-dist-xls' USING  myXlsStorage(); 
