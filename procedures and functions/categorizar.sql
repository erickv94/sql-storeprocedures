CREATE OR REPLACE FUNCTION categorizar(amount numeric) 
RETURNS character varying
AS
$BODY$
BEGIN
		IF amount > 5 THEN 
			return 'The Amount is up to 5';
		ELSIF amount > 3 THEN
			return 'The Amount is down to 5 and up to 3';
		ELSE
			return 'The amount is down to 3';
		END IF;
END;
$BODY$
LANGUAGE plpgsql;

select *, categorizar(amount) from payment;