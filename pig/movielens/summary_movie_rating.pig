- select movieId, title, count(r.movieId), sum(r.rating), sum(r.rating)/count(r.movieId),
- least_recent(r.timestamp), most_recent(timestamp)  
- from movie m join rating r on r.movieId = m.movieId

register '/home/cloudera/classes/hadoop-training-projects/pig/movielens/piggybank-0.16.0.jar'

DEFINE myCSVLoader org.apache.pig.piggybank.storage.CSVLoader();


