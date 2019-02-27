create or replace function cambiar_payment()
returns setof payment 
as
$$
declare
fila payment%rowtype;
begin
    for fila in select * from payment loop
        fila.amount=fila.amount-fila.amount*0.2; --descuento de 20%
        return next fila; --permite retornar fila por fila
    end loop;
end;

$$

language plpgsql;

select * from cambiar_payment()