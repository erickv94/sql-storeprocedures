select date(last_update) from rental;
select date_part('MONTH',date(last_update)) from rental;
select date_part('MONTH',date(last_update)) from rental;
select age(date(last_update),now()) from rental; --interval
select date_part('YEAR',age(date(last_update),now())) from rental;
select date_part('MONTH',age(date(last_update),now())) from rental;
select age('2019-12-12','2017-11-23'); -- 2 years 19 days
select age('2019-12-12','2017-05-23'); -- 2 years 6 mons 20 days							 
select date_part('MONTH',age('2019-12-12','2017-11-23')); -- 0
select EXTRACT(months from age('2019-12-12','2017-05-23')); -- 6 mons 							 
select age('2019-12-12','2005-05-22')::varchar --casting varchar
select  age( NOW() - INTERVAL '1000 days'); --some result


--get the number of days from two dates							
select date('2019-12-12')-date('2020-12-11') ;

--if it's a timestamp you'll get a interval in days

select *, now()-payment_date from payment
