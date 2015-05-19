-- Creación tabla Bloque Horario
-- Versión 1.0 17/05/2015

CREATE TABLE bloque_horario(
	id serial primary key,
	inicio_bloque timestamp,
	termino_bloque timestamp,
	id serial references tarea(id),
	fecha timestamp references dia(fecha),
	id serial references bloque_asignado(id)
;)