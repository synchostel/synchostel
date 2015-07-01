CREATE TABLE perfil(
        id serial PRIMARY KEY,
        nombre VARCHAR(50)
);
 
CREATE TABLE hostal(
        run VARCHAR(10) PRIMARY KEY,
        nombre VARCHAR(50),
        telefono INT,
        valor_hora INT,
        valor_hora_extra INT,
        iva INT,
        sitio_web VARCHAR(100),
        email VARCHAR(100)
);
 
CREATE TABLE tarea(
        id serial PRIMARY KEY,
        nombre VARCHAR(50),
        descripcion VARCHAR(300),
        prioridad VARCHAR(5) --(alta,media,baja)
);
 
 
CREATE TABLE permiso(
        id serial PRIMARY KEY,
        nombre VARCHAR(50),
        descripcion VARCHAR(300)
);
 
CREATE TABLE huesped(
        pasaporte VARCHAR(50) PRIMARY KEY,
        nombre VARCHAR(100),
        nacionalidad VARCHAR(50),
        vegano BOOLEAN,
        celiaco BOOLEAN
);
 
CREATE TABLE servicio(
        id serial PRIMARY KEY,
        nombre VARCHAR(50),
        monto_servicio INT,
        descripcion VARCHAR(300)
);
 
CREATE TABLE persona(
        run VARCHAR(10), -- 99999999k
        CONSTRAINT PK_persona PRIMARY KEY (run),
        nombre VARCHAR(100),
        email VARCHAR(100),
        password VARCHAR(128),
        direccion VARCHAR(300),
        admin BOOLEAN,
        fecha_nacimiento TIMESTAMP,
        fecha_ingreso_hostal TIMESTAMP,
        telefono1 INT,
        telefono2 INT,
        id_perfil serial REFERENCES perfil(id) ON DELETE CASCADE,
        run_hostal VARCHAR(10) REFERENCES hostal(run) ON DELETE CASCADE
);
 
CREATE TABLE dia(
        fecha TIMESTAMP PRIMARY KEY,
        run VARCHAR(10) REFERENCES hostal(run) ON DELETE CASCADE-- 99999999k
);
 
CREATE TABLE bloque_horario(
        id serial PRIMARY KEY,
        inicio_bloque TIMESTAMP,
        termino_bloque TIMESTAMP,
        fecha TIMESTAMP REFERENCES dia(fecha)
);
 
CREATE TABLE bloque_asignado(
        id serial,
        run VARCHAR(10), -- 99999999k
        id_blq_horario serial,
        id_tarea serial,
        PRIMARY KEY (id),
        CONSTRAINT FK_persona FOREIGN KEY (run) REFERENCES persona(run) ON DELETE CASCADE,
        CONSTRAINT FK_bloque_horario FOREIGN KEY (id_blq_horario) REFERENCES bloque_horario(id) ON DELETE CASCADE,
        CONSTRAINT FK_tarea FOREIGN KEY (id_tarea) REFERENCES tarea(id) ON DELETE CASCADE
);
 
CREATE TABLE cantidad_de_permisos(
        id serial,
        id_perfil serial,
        id_permiso serial,
        PRIMARY KEY (id),
        CONSTRAINT FK_perfi FOREIGN KEY (id_perfil) REFERENCES perfil(id) ON DELETE CASCADE,
        CONSTRAINT FK_permiso FOREIGN KEY (id_permiso) REFERENCES permiso(id) ON DELETE CASCADE
);
 
CREATE TABLE producto(
        id serial PRIMARY KEY,
        nombre VARCHAR(100),
        cantidad INT,
        cantidad_critica INT,
        categoria VARCHAR(50),
        run VARCHAR(10) REFERENCES hostal(run) ON DELETE CASCADE -- 99999999k
);
 
CREATE TABLE pieza(
        id serial PRIMARY KEY,
        descripcion VARCHAR(300),
        compartida BOOLEAN,
        bano BOOLEAN, --baño
        tv BOOLEAN,
        locker BOOLEAN,
        caja_fuerte BOOLEAN,
        copa BOOLEAN, --copas de vino
        calefactor BOOLEAN,
        run_hostal VARCHAR(10) REFERENCES hostal(run) ON DELETE CASCADE
);
 
CREATE TABLE gasto(
        id serial PRIMARY KEY,
        descripcion VARCHAR(300),
        monto INT,
        fecha_gasto TIMESTAMP,
        run_hostal VARCHAR(10) REFERENCES hostal(run)
);
 
CREATE TABLE cama(
        id serial PRIMARY KEY,
        descripcion VARCHAR(300),
        valor INT,
        id_pieza serial REFERENCES pieza(id) ON DELETE CASCADE
);
 
CREATE TABLE reserva(
        id serial PRIMARY KEY,
        fecha_check_in TIMESTAMP,
        fecha_check_out TIMESTAMP,
        medio_pago VARCHAR(100),
        mapa BOOLEAN,
        pasaporte VARCHAR(50) REFERENCES huesped(pasaporte) ON DELETE CASCADE,
        run_hostal VARCHAR(10) REFERENCES hostal(run) ON DELETE CASCADE
);
 
CREATE TABLE cantidad_de_camas(
        id serial,
        id_cama serial,
        id_reserva serial,
        PRIMARY KEY (id),
        CONSTRAINT FK_cama FOREIGN KEY (id_cama) REFERENCES cama(id) ON DELETE CASCADE,
        CONSTRAINT FK_reserva FOREIGN KEY (id_reserva) REFERENCES reserva(id) ON DELETE CASCADE
);
 
CREATE TABLE boleta(
        id serial PRIMARY KEY,
        total INT,
        estado_de_pago BOOLEAN,
        id_reserva serial REFERENCES reserva(id) ON DELETE CASCADE
);
 
CREATE TABLE cantidad_de_servicios(
        id serial,
        id_boleta serial,
        id_servicio serial,
        PRIMARY KEY(id),
        CONSTRAINT FK_servicio FOREIGN KEY (id_servicio) REFERENCES servicio(id) ON DELETE CASCADE,
        CONSTRAINT FK_boleta FOREIGN KEY (id_boleta) REFERENCES boleta(id) ON DELETE CASCADE
);