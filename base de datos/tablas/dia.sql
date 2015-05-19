-- Creación tabla Día
-- Versión 1.0 17/05/2015

CREATE TABLE dia(
	fecha timestamp primary key,
	id serial references bloque_horario(id),
	rut varchar(9) references hostal(rut) -- 99999999k
;)