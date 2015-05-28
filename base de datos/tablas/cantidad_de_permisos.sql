-- Creación tabla Cantidad de Permisos
-- Versión 1.0 17/05/2015

CREATE TABLE cantidad_de_permisos(
	id serial primary key,
	id_perfil serial,
	id_permiso serial,
	primary key (id_permiso, id_perfil),
	CONSTRAINT FK_perfi foreing key (id_perfil) references perfil(id) ON DELETE CASCADE,
	CONSTRAINT FK_permiso foreing key (id_permiso) references permiso(id) ON DELETE CASCADE
);