CREATE TABLE perfil(
	id serial primary key,
	nombre varchar(50)
);

CREATE TABLE hostal(
	run varchar(9) primary key,
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
	celiaco boolean,
);

CREATE TABLE servicio(
	id serial primary key,
	monto_servicio int,
	descripcion varchar(100)
);

CREATE TABLE persona(
	run varchar(9), -- 99999999k
	CONSTRAINT PK_persona primary key (run),
	nombre varchar(100),
	email varchar(100),
	password varchar(20),
	direccion varchar(300),
	admin boolean,
	fecha_nacimiento timestamp,
	fecha_ingreso_hostal timestamp,
	id_perfil serial references perfil(id) ON DELETE CASCADE,
	run_hostal varchar(9) references hostal(run) ON DELETE CASCADE
);

CREATE TABLE dia(
	fecha timestamp primary key,
	run varchar(9) references hostal(run) ON DELETE CASCADE-- 99999999k
);

CREATE TABLE bloque_horario(
	id serial primary key,
	inicio_bloque timestamp,
	termino_bloque timestamp,
	fecha timestamp references dia(fecha),
);

CREATE TABLE bloque_asignado(
	id serial primary key,
	run varchar(9), -- 99999999k
	id_blq_horario serial,
	primary key (run, id_blq_horario),
	CONSTRAINT FK_persona foreing key (run) references persona(run) ON DELETE CASCADE,
	CONSTRAINT FK_bloque_horario foreing key (id_blq_horario) references bloque_horario(id) ON DELETE CASCADE
);

CREATE TABLE cantidad_de_permisos(
	id serial primary key,
	id_perfil serial,
	id_permiso serial,
	primary key (id_permiso, id_perfil),
	CONSTRAINT FK_perfi foreing key (id_perfil) references perfil(id) ON DELETE CASCADE,
	CONSTRAINT FK_permiso foreing key (id_permiso) references permiso(id) ON DELETE CASCADE
);

CREATE TABLE producto(
	id serial primary key,
	nombre varchar(100),
	cantidad int,
	cantidad_critica int,
	categoria varchar(50),
	rut varchar(9) references hostal(rut) ON DELETE CASCADE -- 99999999k
);

CREATE TABLE pieza(
	id serial primary key,
	descripcion varchar(200),
	compartida boolean,
	bano boolean, --baño
	tv boolean,
	locker boolean,
	caja_fuerte boolean,
	copa boolean, --copas de vino
	calefactor boolean,
	id_hostal id serial references hostal(id) ON DELETE CASCADE
);

CREATE TABLE gasto(
	id serial primary key,
	descripcion varchar(100),
	monto int,
	fecha_gasto timestamp,
	run_hostal references hostal(run)
);

CREATE TABLE cama(
	id serial primary key,
	descripcion varchar(100),
	valor int,
	id serial references pieza(id) ON DELETE CASCADE
);

CREATE TABLE telefonos(
	rut varchar(9) references persona(rut) ON DELETE CASCADE,
	telefono int,
	primary key (rut, telefono)
);

CREATE TABLE reserva(
	id serial primary key,
	fecha_check_in timestamp,
	fecha_check_out timestamp,
	medio_pago varchar(100),
	mapa boolean,
	pasaporte references huesped(pasaporte) ON DELETE CASCADE, 
	id_hostal references hostal(id) ON DELETE CASCADE
);

CREATE TABLE cantidad_de_camas(
	id serial primary key,
	id_cama serial, 
	id_reserva serial, 
	primary key (id_reserva,id_cama),
	CONSTRAINT FK_cama foreing key (id_cama) references cama(id) ON DELETE CASCADE,
	CONSTRAINT FK_reserva foreing key (id_reserva) references reserva(id) ON DELETE CASCADE
);

CREATE TABLE boleta(
	id serial primary key,
	total int,
	estado_de_pago boolean,
	id serial references reserva(id) ON DELETE CASCADE
);

CREATE TABLE cantidad_de_servicios(
	id serial primary key,
	id_boleta serial,
	id_servicio serial,
	primary key(id_servicio, id_boleta),
	CONSTRAINT FK_servicio foreing key (id_servicio) references servicio(id) ON DELETE CASCADE,
	CONSTRAINT FK_boleta foreing key (id_boleta) references boleta(id) ON DELETE CASCADE
);