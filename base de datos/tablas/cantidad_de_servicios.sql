-- Creación tabla Cantidad de Servicios
-- Versión 1.0 17/05/2015

CREATE TABLE cantidad_de_servicios(
	id serial primary key,
	id serial references boleta(id),
	id serial references servicio(id)
;)