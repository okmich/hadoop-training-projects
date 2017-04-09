- select movieId, title, count(r.movieId), sum(r.rating), sum(r.rating)/count(r.movieId),
- least_recent(r.timestamp), most_recent(timestamp)  
- from movie m join rating r on r.movieId = m.movieId

register /mnt/home/okmich20/hadoop-training-projects/pig/movielens/piggybank-0.15.0.jar

DEFINE myCSVLoader org.apache.pig.piggybank.storage.CSVLoader();

allMoviedata = LOAD '/user/okmich20/rawdata/handson_train/movielens/latest/movies' using myCSVLoader() AS (movieId:chararray,title:chararray,genres:chararray);
headlessMovieData = FILTER allMoviedata BY movieId != 'movieId';
pMovieData = FOREACH headlessMovieData GENERATE (long)movieId as movieId, title;

allRatingdata = LOAD '/user/okmich20/rawdata/handson_train/movielens/latest/ratings' using myCSVLoader() AS (userId:chararray, movieId:chararray,rating:chararray,timestamp:chararray);
headlessRatingsData = FILTER allRatingdata BY userId != 'userId';
pRatingData = FOREACH headlessRatingsData GENERATE (long)movieId as movieId, (float)rating as rating;

mergedMovieRatingData = JOIN pMovieData BY movieId RIGHT, pRatingData BY movieId;

-- mergedMovieRatingData: {pMovieData::movieId: long,pMovieData::title: chararray,pRatingData::movieId: long,pRatingData::rating: float}

movieRatingData = FOREACH mergedMovieRatingData GENERATE pMovieData::movieId as movieId, pMovieData::title as title, pRatingData::rating as rating;

groupedMovieRatingData = GROUP movieRatingData BY movieId;
-- groupedMovieRatingData: {group: long,movieRatingData: {(pMovieData::movieId: long,pMovieData::title: chararray,pRatingData::rating: float)}}

aggMovieRatingData = FOREACH groupedMovieRatingData GENERATE group as movieId, movieRatingData.title as title, COUNT(movieRatingData) AS num_rating, SUM(movieRatingData.rating) AS total_ratings, AVG(movieRatingData.rating) AS avg_rating;

STORE aggMovieRatingData INTO '/user/okmich20/output/handson_train/movielens/summary_rating' USING AvroStorage();
