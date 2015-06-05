CREATE TABLE perfil(
	id serial primary key,
	nombre varchar(50)
);

CREATE TABLE hostal(
	run varchar(10) primary key,
	nombre varchar(50),
	telefono int,
	valor_hora int,
	valor_hora_extra int,
	iva int,
	sitio_web varchar(100),
	email varchar(100)
);

CREATE TABLE tarea(
	id serial primary key,
	nombre varchar(50),
	descripcion varchar(300), 
	prioridad varchar(5) --(alta,media,baja)
);


CREATE TABLE permiso(
	id serial primary key,
	nombre varchar(50),
	descripcion varchar(300)
);

CREATE TABLE huesped(
	pasaporte varchar(50) primary key,
	nombre varchar(100),
	nacionalidad varchar(50),
	vegano boolean,
	celiaco boolean
);

CREATE TABLE servicio(
	id serial primary key,
	nombre varchar(50),
	monto_servicio int,
	descripcion varchar(300)
);

CREATE TABLE persona(
	run varchar(10), -- 99999999k
	CONSTRAINT PK_persona primary key (run),
	nombre varchar(100),
	email varchar(100),
	password varchar(50),
	direccion varchar(300),
	admin boolean,
	fecha_nacimiento timestamp,
	fecha_ingreso_hostal timestamp,
	id_perfil serial references perfil(id) ON DELETE CASCADE,
	run_hostal varchar(10) references hostal(run) ON DELETE CASCADE
);

CREATE TABLE dia(
	fecha timestamp primary key,
	run varchar(10) references hostal(run) ON DELETE CASCADE-- 99999999k
);

CREATE TABLE bloque_horario(
	id serial primary key,
	inicio_bloque timestamp,
	termino_bloque timestamp,
	fecha timestamp references dia(fecha)
);

CREATE TABLE bloque_asignado(
	id serial,
	run varchar(10), -- 99999999k
	id_blq_horario serial,
	id_tarea serial,
	primary key (id,run, id_blq_horario, id_tarea),
	CONSTRAINT FK_persona FOREIGN KEY (run) references persona(run) ON DELETE CASCADE,
	CONSTRAINT FK_bloque_horario FOREIGN KEY (id_blq_horario) references bloque_horario(id) ON DELETE CASCADE,
	CONSTRAINT FK_tarea FOREIGN KEY (id_tarea) references tarea(id) ON DELETE CASCADE
);

CREATE TABLE cantidad_de_permisos(
	id serial,
	id_perfil serial,
	id_permiso serial,
	primary key (id, id_permiso, id_perfil),
	CONSTRAINT FK_perfi FOREIGN KEY (id_perfil) references perfil(id) ON DELETE CASCADE,
	CONSTRAINT FK_permiso FOREIGN KEY (id_permiso) references permiso(id) ON DELETE CASCADE
);

CREATE TABLE producto(
	id serial primary key,
	nombre varchar(100),
	cantidad int,
	cantidad_critica int,
	categoria varchar(50),
	run varchar(10) references hostal(run) ON DELETE CASCADE -- 99999999k
);

CREATE TABLE pieza(
	id serial primary key,
	descripcion varchar(300),
	compartida boolean,
	bano boolean, --baño
	tv boolean,
	locker boolean,
	caja_fuerte boolean,
	copa boolean, --copas de vino
	calefactor boolean,
	run_hostal varchar(10) references hostal(run) ON DELETE CASCADE
);

CREATE TABLE gasto(
	id serial primary key,
	descripcion varchar(300),
	monto int,
	fecha_gasto timestamp,
	run_hostal varchar(10) references hostal(run)
);

CREATE TABLE cama(
	id serial primary key,
	descripcion varchar(300),
	valor int,
	id_pieza serial references pieza(id) ON DELETE CASCADE
);

CREATE TABLE telefonos(
	run varchar(10) references persona(run) ON DELETE CASCADE,
	telefono int,
	primary key (run, telefono)
);

CREATE TABLE reserva(
	id serial primary key,
	fecha_check_in timestamp,
	fecha_check_out timestamp,
	medio_pago varchar(100),
	mapa boolean,
	pasaporte varchar(50) references huesped(pasaporte) ON DELETE CASCADE, 
	run_hostal varchar(10) references hostal(run) ON DELETE CASCADE
);

CREATE TABLE cantidad_de_camas(
	id serial,
	id_cama serial, 
	id_reserva serial, 
	primary key (id, id_reserva,id_cama),
	CONSTRAINT FK_cama FOREIGN KEY (id_cama) references cama(id) ON DELETE CASCADE,
	CONSTRAINT FK_reserva FOREIGN KEY (id_reserva) references reserva(id) ON DELETE CASCADE
);

CREATE TABLE boleta(
	id serial primary key,
	total int,
	estado_de_pago boolean,
	id_reserva serial references reserva(id) ON DELETE CASCADE
);

CREATE TABLE cantidad_de_servicios(
	id serial,
	id_boleta serial,
	id_servicio serial,
	primary key(id, id_servicio, id_boleta),
	CONSTRAINT FK_servicio FOREIGN KEY (id_servicio) references servicio(id) ON DELETE CASCADE,
	CONSTRAINT FK_boleta FOREIGN KEY (id_boleta) references boleta(id) ON DELETE CASCADE
);