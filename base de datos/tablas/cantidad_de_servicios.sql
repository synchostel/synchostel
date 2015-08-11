-- Creación tabla Cantidad de Servicios
-- Versión 1.0 17/05/2015

CREATE TABLE cantidad_de_servicios(
	id serial primary key,
	id_boleta serial,
	id_servicio serial,
	CONSTRAINT FK_servicio foreing key (id_servicio) references servicio(id) ON DELETE CASCADE,
	CONSTRAINT FK_boleta foreing key (id_boleta) references boleta(id) ON DELETE CASCADE
;)