-- Creación tabla Tarea
-- Versión 1.0 17/05/2015

CREATE TABLE tarea(
	id serial primary key,
	nombre varchar(50),
	descripcion varchar(300), 
	prioridad varchar(5), --(alta,media,baja)
	rut varchar(9), references persona(rut) -- 99999999k
	id serial references bloque_horario(id)
);