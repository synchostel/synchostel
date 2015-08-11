-- Creación tabla Gasto
-- Versión 2.0 11/07/2015

CREATE TABLE gasto(
	id serial primary key,
	descripcion varchar(100),
	monto int,
	fecha_gasto timestamp
);