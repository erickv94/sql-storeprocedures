create table auditar(
nombre varchar(50),
accion varchar(20),
fecha timestamp default now()
);

create or replace function fn_auditar_funcion(name varchar(50))
returns setof payment
as
$$
begin
    insert into auditar(nombre,accion,fecha) values(name,'Ver Payment', DEFAULT);
    return query select * from payment;
end;
$$
language plpgsql;
														  
select * from fn_auditar_funcion('Jaun');
select * from auditar;