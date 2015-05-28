-- Creación tabla Tarea
-- Versión 1.0 17/05/2015

CREATE TABLE tarea(
	id serial primary key,
	nombre varchar(50),
	descripcion varchar(300), 
	prioridad varchar(5), --(alta,media,baja)
);