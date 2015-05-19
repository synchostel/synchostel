-- Creación tabla Cama
-- Versión 1.0 17/05/2015

CREATE TABLE cama(
	id serial primary key,
	descripcion varchar(100),
	valor int,
	id serial references pieza(id),
	id serial references cantidad_de_camas(id)
;)