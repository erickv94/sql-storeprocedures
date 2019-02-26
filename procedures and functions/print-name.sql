CREATE OR REPLACE FUNCTION salutation_ejemplo(nombre character varying, saludo character varying)
RETURNS character varying
AS
$$
BEGIN
RETURN saludo ||' '|| nombre;
END;
$$
LANGUAGE plpgsql;

--select salutation_ejemplo('Juan Jose de La O', 'Good evening')