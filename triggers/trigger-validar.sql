CREATE TABLE productos(
	nombre varchar(20),
	cantidad smallint,
	precio numeric(4,2),
	ultima_modificacion timestamp,
	usuario_bd text
);

create or replace function valida_productos()
returns trigger
as 
$$
begin 
	if NEW.nombre is null or length(NEW.nombre)= 0 then
		raise exception 'El nombre debe contener informacion'; --escapa
	end if;
	
	if new.cantidad < 0 then
		raise exception 'la cantidad no debe ser negativo'; --escapa
	end if;
	if new.precio <0 then 
		raise exception 'El precio no debe ser negativo';
	end if;
	new.ultima_modificacion= now();
	new.usuario_bd = user;
	
	return new;
end;
$$
language plpgsql;


create trigger valida_productos  -- crear con nombre
before insert or update --tiempo y acciones
on productos -- tabla de escucha
for each row execute procedure valida_productos(); --paca cada columna ejectar un proceso almacenado


--poniendo en prueba
select * from productos;

insert into productos(nombre,cantidad,precio) values (null,-2,-12.22); --nombre debe contener informacion
insert into productos(nombre,cantidad,precio) values ('',-2,-12.22); --nombre debe contener informacion
insert into productos(nombre,cantidad,precio) values ('Papa con ajo',-2,-12.22); --cantidad debe ser positivo
insert into productos(nombre,cantidad,precio) values ('Arroz blanco',3,-22.22); --precio no debe ser negativo

insert into productos (nombre, cantidad, precio) values ('Guayaba',22,45.22); --insert ok
select *from productos; --timestamp=now(), usuariobd='postgres'
update productos set cantidad=33 where nombre='Guayaba'	; --it works
select *from productos; --ok
update productos set cantidad=-33 where nombre='Guayaba'	; --it fails
