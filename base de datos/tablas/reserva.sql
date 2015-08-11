-- Creación tabla Reserva
 -- Versión 2.0 11/07/2015

CREATE TABLE reserva(
	id serial primary key,
	fecha_check_in timestamp,
	fecha_check_out timestamp,
	medio_pago varchar(100),
	mapa boolean,
	pasaporte references huesped(pasaporte) ON DELETE CASCADE
;)