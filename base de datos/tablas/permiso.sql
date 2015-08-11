-- Creación tabla Permiso
-- Versión 2.0 11/07/2015

CREATE TABLE permiso(
	id serial primary key,
	nombre varchar(50),
	descripcion varchar(300)
);