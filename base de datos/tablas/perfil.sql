-- Creación tabla Perfil
-- Versión 1.0 17/05/2015

CREATE TABLE perfil(
	id serial primary key,
	nombre varchar(50),
	rut varchar(9), references persona(rut), -- 99999999k
	id serial references cantidad_de_permisos(id)
;)