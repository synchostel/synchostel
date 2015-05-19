-- Creación tabla Bloque Asignado
-- Versión 1.0 17/05/2015

CREATE TABLE bloque_asignado(
	id serial primary key,
	rut varchar(9), references persona(rut), -- 99999999k
	id serial references bloque_horario(id)
;)