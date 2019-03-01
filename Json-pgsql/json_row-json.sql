create table pruebaNoSQL(
	consecutivo serial,
	informacion json
);

select * from pruebaNoSQL;

insert into pruebaNoSQL (informacion) values ('{"codigo": "001", 
											  "nombre":"Huevos",
											  "cantidad":12,
											  "precio":2.50}');
                                              
insert into pruebaNoSQL (informacion) values ('{"codigo": "002", 
											  "nombre":"Papas",
											  "cantidad":22,
											  "precio":12.11}');

insert into pruebaNoSQL (informacion) values ('{"codigo": "003", 
											  "nombre":"Uvas",
											  "cantidad":55,
											  "precio":4.22}');
											  
											 
select informacion from pruebaNoSQL;
select informacion->'nombre' as nombreJSON from pruebaNoSQL; -- flecha campoJSON->'campoJson', devuelve json
select informacion->>'nombre' as nombreTEXT from pruebaNoSQL; -- doble flecha campoJSON->>'campojson' devuelve el casting 
select informacion->>'cantidad' as cantidadTEXT from pruebaNoSQL; --text :(
--select integer::informacion->>'cantidad' as cantidadInt from pruebaNoSQL; investigar

select informacion->>'nombre' as nombre from pruebaNoSQL where informacion->>'nombre'='Zanahoria'; --find('zanahoria')

create table auditoria{
	consecutivo serial,
	accion varchar,
	fecha timestamp default now(),
	id_usuario smallint,
	tabla varchar,
	antes json,
	despues json
);