CREATE OR REPLACE FUNCTION descuento(valor REAL)
RETURNS REAL
AS
$$
DECLARE descuento REAL;
BEGIN
    descuento= valor*0.15;
    return descuento;
END
$$

language plpgsql;

select descuento(223.11);

select * , descuento(amount) from payment; --dia de descuento 15%  last column