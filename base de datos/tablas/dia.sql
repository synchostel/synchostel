-- Creación tabla Día
-- Versión 1.0 17/05/2015

CREATE TABLE dia(
	fecha timestamp primary key,
	run varchar(9) references hostal(run) ON DELETE CASCADE-- 99999999k
;)