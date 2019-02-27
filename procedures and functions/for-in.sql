create or replace function for_example()
returns void
as
$$
declare i integer;
begin 
	for i in 1..100 loop
		raise notice 'Numero en la iteracion %',i;
	end loop;
end;
$$
language plpgsql;

select for_example()