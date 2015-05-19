-- Creación tabla Huesped
-- Versión 1.0 17/05/2015

CREATE TABLE huesped(
	pasaporte varchar(50) primary key,
	nombre varchar(100),
	nacionalidad varchar(50),
	vegano boolean,
	celiaco boolean,
	id serial references reserva(id),
;)