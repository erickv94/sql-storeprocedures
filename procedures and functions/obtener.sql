create or replace function get_me_anumber(numero integer)
returns void
as
$$
begin
	if numero>60 then
		raise notice 'el numero es mayor 60, numero ingresado: %',numero; --console.log('similar')
	elsif numero>30 then
		raise notice 'el numero es mayor 30, numero ingresado: %',numero; --console.log('similar')
	else  
		raise notice 'el numero es menos que 30, numero ingresado: %',numero;
	end if;
end;
$$
language plpgsql;

select get_me_anumber(45);
select get_me_anumber(3000);