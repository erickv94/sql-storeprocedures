--cantidad: registros por pagina
--pagina: numero de la pagina visitada
create or replace function paginacion_films(cantidad integer, pagina integer)
returns setof film
as
$$
	declare
		inicio integer;
	begin 
		inicio=cantidad*pagina-cantidad;
		if inicio > 0 and cantidad >0 then
			raise notice 'La consulta no puede ser ejecutado algun parametro es negativo, 
            se ejecuta consulta de manera general';
			return Query select * from film;
		else 
			return Query select * from film limit cantidad offset inicio;
		end if;
	end;
$$
language plpgsql;

select * from paginacion_films(5,1);
select title, rental_duration from paginacion_films(10,10);