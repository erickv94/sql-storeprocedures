--util en la generacion de reportes en periodos de tiempo

create view actor_termina_pe as 
select first_name || ' '|| last_name as fullname from actor where first_name like '%pe'

select * from actor_termina_pe;

create view country_city_ia_ar_contiene
as
select ci.city,co.country from city as ci inner join country 
as co on ci.country_id=co.country_id where co.country like '%ia%' and ci.city like '%ar%';

select * from country_city_ia_ar_contiene;