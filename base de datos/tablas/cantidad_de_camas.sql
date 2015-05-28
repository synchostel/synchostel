-- Creación tabla Cantidad de Camas
-- Versión 1.0 17/05/2015

CREATE TABLE cantidad_de_camas(
	id serial primary key,
	id_cama serial, 
	id_reserva serial, 
	primary key (id_reserva,id_cama),
	CONSTRAINT FK_cama foreing key (id_cama) references cama(id) ON DELETE CASCADE,
	CONSTRAINT FK_reserva foreing key (id_reserva) references reserva(id) ON DELETE CASCADE
);