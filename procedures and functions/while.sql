create or replace function while_example()
returns void
as
$$
    declare 
    i integer;

    begin
        i=1;
        while i<=10 loop
        raise notice 'Numero en while : %', i;
        i=i+1;
        end loop;
    end;
$$
language plpgsql;

select while_example()