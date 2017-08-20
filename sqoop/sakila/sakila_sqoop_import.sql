--query to create a view for film display. Later used as a table by hive
create view v_film as
select f.film_id, title, description, release_year, f.language_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, rating, replace(special_features, ',','|') special_features, f.last_update, l.name language,
cast(concat(fc.category_id, '=',c.name) as char(100)) category, cast(group_concat(distinct concat(a.actor_id, '=',a.first_name, ' ', a.last_name) order by a.first_name, a.last_name separator '|') as char(255)) actors
from film f join language l on l.language_id = f.language_id
join film_category fc on fc.film_id = f.film_id
join category c on c.category_id = fc.category_id
left join film_actor fa on fa.film_id = f.film_id
left join actor a on a.actor_id = fa.actor_id
group by f.film_id

-- a query to be used as is by sqoop
SELECT p.payment_id, p.rental_id, p.amount, p.payment_date, p.last_update, 
c.customer_id, concat(c.first_name, ' ', c.last_name) customer_name, s.staff_id, 
concat(s.first_name, ' ', s.last_name) staff_name, r.rental_date, r.return_date, 
f.title film_title, f.description film_desc, f.release_year file_release_year 
FROM payment p  join customer c on c.customer_id = p.customer_id  
join staff s on s.staff_id = p.staff_id 
left join rental r on r.rental_id = p.rental_id 
left join inventory inv on r.inventory_id = inv.inventory_id 
left join film f on inv.film_id = f.film_id