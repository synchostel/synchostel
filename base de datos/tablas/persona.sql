-- Creación tabla Persona
-- Versión 1.0 17/05/2015

CREATE TABLE persona(
	run varchar(9), -- 99999999k
	CONSTRAINT PK_persona primary key (run),
	nombre varchar(100),
	email varchar(100),
	password varchar(20),
	direccion varchar(300),
	admin boolean,
	fecha_nacimiento timestamp,
	fecha_ingreso_hostal timestamp,
	id_perfil serial references perfil(id) ON DELETE CASCADE,
	run_hostal varchar(9) references hostal(run) ON DELETE CASCADE
);