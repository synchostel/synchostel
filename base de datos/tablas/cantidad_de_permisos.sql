-- Creación tabla Cantidad de Permisos
-- Versión 1.0 17/05/2015

CREATE TABLE cantidad_de_permisos(
	id serial primary key,
	id serial references perfil(id),
	id serial references permiso(id)
;)