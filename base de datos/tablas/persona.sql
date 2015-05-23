-- Creación tabla Persona
-- Versión 1.0 17/05/2015

CREATE TABLE persona(
	rut varchar(9) primary key, -- 99999999k
	nombre varchar(100),
	email varchar(100),
	password varchar(20),
	telefono int,
	telefono_2 int,
	direccion varchar(300),
	admin boolean,
	fecha_nacimiento timestamp,
	fecha_ingreso_hostal timestamp,
	id serial references bloque_asignado(id),
	id serial references tarea(id),
	id serial references perfil(id),
	rut varchar(9) references hostal(rut)
;)