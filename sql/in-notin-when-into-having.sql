select * from film where film_id in('133','3','44',2,3,5,2);
select * from film where film_id not in('133','3','44',2,3,5,2);

select title, case when rental_rate > 3.0 then 'mayor que 3 en rate' when rental_rate>2.0 then 
'Mayor que 2 en rate' else 'No info' end as rate from film ;


--select * into temp_tbl from  film where film.title like '%as';
select *from temp_tbl; --tabla temporal

select round(avg(replacement_cost)) from film ;
				 
select distinct (rental_duration), count (rental_duration) from film group by rental_duration;
				 
select distinct (rental_duration), count (*) from film group by rental_duration having count(*)>200; --it works as where on aggregate function
