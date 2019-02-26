select * from payment where payment_date
between '2007-02-15 22:25:46.996577' and '2007-02-16 01:26:00.996577' ORDER by payment asc; --41

select count(payment_date) from payment 
where payment_date >= '2007-02-15 22:25:46.996577' and
payment_date<= '2007-02-16 01:26:00.996577'; 

select distinct film.rating from film;

select count(distinct film.rating) from film;

select distinct film.rating, count(*) from film GROUP BY rating; --178,194,223,195,210

select distinct on(film.rating) rating, film_id from film;