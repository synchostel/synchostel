-- Creación tabla Servicio
-- Versión 1.0 17/05/2015

CREATE TABLE servicio(
	id serial primary key,
	total_servicios int,
	id serial references servicio(id),
	id serial references boleta(id)
;)