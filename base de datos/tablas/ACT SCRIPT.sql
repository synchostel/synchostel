CREATE TABLE perfil(
	id serial primary key,
	nombre varchar(50)
);

CREATE TABLE hostal(
	run varchar(10) primary key,
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
	monto_servicio int,
	descripcion varchar(100)
);

CREATE TABLE persona(
	run varchar(10), -- 99999999k
	CONSTRAINT PK_persona primary key (run),
	nombre varchar(100),
	email varchar(100),
	password varchar(20),
	direccion varchar(300),
	admin boolean,
	fecha_nacimiento timestamp,
	fecha_ingreso_hostal timestamp,
	telefono varchar (12),
	id_perfil int references perfil(id) ON DELETE CASCADE
);

CREATE TABLE dia(
	fecha timestamp primary key
);

CREATE TABLE bloque_horario(
	id serial primary key,
	inicio_bloque timestamp,
	termino_bloque timestamp,
	fecha timestamp references dia(fecha)
	);

CREATE TABLE bloque_asignado(
	id serial primary key,
	run varchar(10) references persona(run) ON DELETE CASCADE, -- 99999999k
	id_blq_horario int references bloque_horario(id) ON DELETE CASCADE,
	id_tarea int references tarea(id) ON DELETE CASCADE
);

CREATE TABLE cantidad_de_permisos(
	id serial primary key,
	id_perfil int references perfil(id) ON DELETE CASCADE,
	id_permiso int references permiso(id) ON DELETE CASCADE
);

CREATE TABLE categoria_producto(
	id serial primary key,
	nombre varchar(100),
	descripcion varchar(250)
);

CREATE TABLE producto(
	id serial primary key,
	nombre varchar(100),
	cantidad int,
	cantidad_critica int,
	id_categoria int references categoria_producto(id) ON DELETE CASCADE
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
	calefactor boolean
);

CREATE TABLE gasto(
	id serial primary key,
	descripcion varchar(100),
	monto int,
	fecha_gasto timestamp
);

CREATE TABLE cama(
	id serial primary key,
	descripcion varchar(100),
	valor int,
	id_pieza int references pieza(id) ON DELETE CASCADE
);

CREATE TABLE reserva(
	id serial primary key,
	fecha_check_in timestamp,
	fecha_check_out timestamp,
	medio_pago varchar(100),
	mapa boolean,
	pasaporte varchar(50) references huesped(pasaporte) ON DELETE CASCADE
);

CREATE TABLE cantidad_de_camas(
	id serial primary key,
	id_cama int references cama(id) ON DELETE CASCADE, 
	id_reserva int references reserva(id) ON DELETE CASCADE
);

CREATE TABLE boleta(
	id serial primary key,
	total int,
	estado_de_pago boolean,
	id_reserva int references reserva(id) ON DELETE CASCADE
);

CREATE TABLE cantidad_de_servicios(
	id serial primary key,
	id_boleta int references boleta(id) ON DELETE CASCADE,
	id_servicio int references servicio(id) ON DELETE CASCADE
);

CREATE TABLE link(
	id serial primary key,
	nombre	varchar(20),
	url	varchar(150),
	descripcion varchar(100)
);