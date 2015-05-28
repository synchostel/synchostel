-- Creación tabla Bloque Asignado
-- Versión 1.0 17/05/2015

CREATE TABLE bloque_asignado(
	id serial primary key,
	run varchar(9), -- 99999999k
	id_blq_horario serial,
	primary key (run, id_blq_horario),
	CONSTRAINT FK_persona foreing key (run) references persona(run) ON DELETE CASCADE,
	CONSTRAINT FK_bloque_horario foreing key (id_blq_horario) references bloque_horario(id) ON DELETE CASCADE
);