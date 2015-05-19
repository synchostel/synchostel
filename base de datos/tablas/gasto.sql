-- Creación tabla Gasto
-- Versión 1.0 17/05/2015

CREATE TABLE gasto(
	id serial primary key,
	descripcion varchar(100),
	monto int,
	rut varchar(9) references hostal(rut) -- 
;)