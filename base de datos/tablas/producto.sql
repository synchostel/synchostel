-- Creación tabla Producto
-- Versión 1.0 17/05/2015

CREATE TABLE producto(
	id serial primary key,
	nombre varchar(100),
	cantidad int,
	cantidad_critica int,
	categoria varchar(50),
	rut varchar(9) references hostal(rut) ON DELETE CASCADE -- 99999999k
);