
create table auditoria_productos(
    accion varchar(25),
    fecha timestamp,
    nombre varchar(20),
    cantidad smallint,
    precio numeric (4,2)
);
--funcion trigger lista para auditar
create or replace function auditoria_productos()
returns trigger
as 
$$
begin
 if tg_op = 'INSERT' then
    insert into auditoria_productos(accion,fecha, nombre,cantidad,precio)
     values ('Insertado producto',now(),new.nombre,new.cantidad,new.precio);
     return new;
  elsif tg_op = 'DELETE' then
     insert into auditoria_productos(accion,fecha, nombre,cantidad,precio)
     values ('Borrar producto',now(),old.nombre,old.cantidad,old.precio); --que estaba antes de borrarse
     return null;
  elsif TG_OP = 'UPDATE' then
     insert into auditoria_productos(accion,fecha, nombre,cantidad,precio)
     values ('Actualizar producto antes',now(),old.nombre,old.cantidad,old.precio); --que estaba antes de borrarse

     insert into auditoria_productos(accion,fecha, nombre,cantidad,precio)
     values ('Actualizar producto despues',now(),new.nombre,new.cantidad,new.precio); --la nueva informacion
     
     return new;
     end if;

end;
$$
language plpgsql;

--se ejecuta despues, debido a que se da por hecha la transaccion, ademas tg_op necesita ambos parametros old y new.
create trigger auditoria_productos 
after insert or update or delete
on productos
for each row execute procedure auditoria_productos();

-- pruebas --testing 
select *from productos; --rows
select *from auditoria_productos; --nada

insert into productos(nombre,cantidad,precio) values (null,5,12.3); -- trigger before funciona
--works with new
insert into productos(nombre,cantidad,precio) values ('Zanahoria',2,2.33);
select *from auditoria_productos;
--delete works with old
delete from productos where nombre='Zanahoria';
select *from auditoria_productos;

--update works with old and new
insert into productos(nombre,cantidad,precio) values ('a',2,2.33);
update productos set nombre='Guineo' where nombre='a';  --insert 2 rows of data in auditoria 
