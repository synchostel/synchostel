-- Creación tabla Boleta
-- Versión 1.0 17/05/2015

CREATE TABLE boleta(
	id serial primary key,
	total int,
	estado_de_pago boolean,
	id serial references cantidad_de_servicios(id),
	id serial references reserva(id)
;)