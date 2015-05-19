-- Creación tabla Pieza
-- Versión 1.0 17/05/2015

CREATE TABLE pieza(
	id serial primary key,
	descripcion varchar(200),
	compartida boolean,
	bano boolean, --baño
	tv boolean,
	locker boolean,
	caja_fuerte boolean,
	copa boolean, --copas de vino
	calefactor boolean,
	id serial references cama(id),
	rut varchar(9) references hostal(rut) -- 
;)