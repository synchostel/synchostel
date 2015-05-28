CREATE TABLE telefonos(
	rut varchar(9) references persona(rut) ON DELETE CASCADE,
	telefono int,
	primary key (rut, telefono)
);