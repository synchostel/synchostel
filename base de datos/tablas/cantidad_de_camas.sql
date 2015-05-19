-- Creación tabla Cantidad de Camas
-- Versión 1.0 17/05/2015

CREATE TABLE cantidad_de_camas(
	id serial primary key,
	total int,
	id serial references cama(id),
	id serial references reserva(id)
;)