use default;

create external table rating_analysis(
	movieId string,
	title string,
	rating_cnt int,
	total_rating bigint,
	avg_rating decimal(10,2),
	var_rating decimal(10,2)
)
row format delimited
fields terminated by '\t'
location  '/user/cloudera/output/handson_train/movielens/movies_rating_analysis';

--sample query
select title, rating_cnt, avg_rating from rating_analysis  
where rating_cnt > 1000 
order by avg_rating desc, rating_cnt desc
limit 20;