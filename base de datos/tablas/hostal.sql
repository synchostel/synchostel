-- Creación tabla Hostal
-- Versión 1.0 17/05/2015

CREATE TABLE hostal(
	rut varchar(9) primary key,
	sitio_web varchar(100),
	email varchar(100),
	rut varchar(9) references persona(rut), -- 
	fecha timestamp references dia(fecha),
	id serial references producto(id),
	id serial references reserva(id),
	id serial references gasto(id),
	id serial references pieza(id)
;)