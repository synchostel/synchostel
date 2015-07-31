-- Creación tabla Link
-- Versión 1.0 26/07/2015

CREATE TABLE link(
	id serial primary key,
	nombre	varchar(20),
	url	varchar(150),
	descripcion varchar(100)
);