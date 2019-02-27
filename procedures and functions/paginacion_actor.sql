create or replace function paginacion_actor(cantidad_pagina integer, numero_pagina integer)
returns setof actor
as
$$
declare 
    inicio integer;
begin
    inicio= cantidad_pagina*numero_pagina-cantidad_pagina;
    return query select * from actor limit cantidad_pagina offset inicio;
end;
$$
language plpgsql;

select * from paginacion_actor(20,10);