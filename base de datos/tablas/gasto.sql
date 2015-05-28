-- Creación tabla Gasto
-- Versión 1.0 17/05/2015

CREATE TABLE gasto(
	id serial primary key,
	descripcion varchar(100),
	monto int,
	fecha_gasto timestamp,
	run_hostal references hostal(run)
);