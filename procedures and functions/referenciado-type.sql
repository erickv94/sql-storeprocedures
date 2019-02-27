create or replace function referenciado_type()
returns varchar
as
$body$
declare 
variable actor.first_name%type; --the same value as the table
begin
variable='preba normal';
raise notice 'una prueba con variable: %',variable;
return variable;

end
$body$
language plpgsql;

select referenciado_type()