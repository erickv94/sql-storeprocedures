create table compras (
    consecutivo smallserial,
    fecha date,
    nombre varchar(20),
    cantidad smallint,
    precio numeric(4,2)
);

create table ventas(
    consecutivo smallserial,
    fecha date,
    nombre varchar(20),
    cantidad smallint,
    precio numeric(4,2)
);


create or replace function compra_productos()
returns trigger as
$$
begin
    perform nombre from productos where nombre = new.nombre;
    if found then
        update productos set cantidad = cantidad + new.cantidad, precio=new.precio
        where nombre= new.nombre;
    else
        insert into productos(nombre,cantidad,precio) values (new.nombre,new.cantidad,new.precio);
    end if;
    
    return new;

end;
$$
language plpgsql;



create or replace function venta_productos()
returns trigger as
$$
declare 
    producto productos%rowtype; --mismo tipo fila producto
begin
    select * into producto from productos where nombre= new.nombre;
    if found then -- si select into tiene almenos algun valor found tendra true
        if producto.cantidad  >= new.cantidad then

            update productos set cantidad= cantidad-new.cantidad
            where nombre=new.nombre;
        
        else
            raise exception 'No hay suficiente cantidad para venta: %',producto.cantidad;
        end if;
        return new;
    else
        raise exception 'No existe el producto a vender: %',new.nombre;
    end if;
end;
$$
language plpgsql;


create trigger compra_productos 
after insert    --es una compra segura
on compras 
for each row execute procedure compra_productos();


create trigger venta_productos 
before insert on ventas  --before, porque bien tira una exception
for each row execute procedure venta_productos();

--TESTEANDO LOS TRIGGERS
select * from productos;
select *from auditoria_productos;

select *from compras;
select *from ventas;
--dato prueba
insert into productos(nombre,cantidad,precio) values('Chile verde',20,30.12);
--existente le suma y actualiza
insert into compras(fecha, nombre,cantidad,precio) values(now(),'Chile verde',2,3.4 );
-- producto nuevo
insert into compras(fecha,nombre,cantidad,precio) values (now(),'Papa',34,2.3);
-- vendiendo algo que no existe

insert into ventas(fecha,nombre,cantidad,precio) values (now(),'Peperoni',2,1.2); -- no existe producto a vender 
--vendiendo existente sin suficiente cantidad
insert into ventas(fecha,nombre,cantidad,precio) values (now(),'Papa',33,22); -- no existe producto a vender 
-- vendiendo lo suficiente
insert into ventas(fecha,nombre,cantidad,precio) values (now(),'Chile verde',20,10.2);
