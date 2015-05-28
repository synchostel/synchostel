INSERT INTO perfil
(nombre)
VALUES
('Admin');

INSERT INTO perfil
(nombre)
VALUES
('Public');

INSERT INTO hostal
(run, nombre, telefono, sitio_web, email)
VALUES
('18371445-2', 'Hostal Angel', 78653222, 'www.HostalAngel.cl', 'angel@mail.com');

INSERT INTO tarea
(nombre, descripcion, prioridad)
VALUES
('Barrer cocina', 'Barrer toda la cocina del Hostal, incluyendo por detras de los muebles', 'Media');

INSERT INTO tarea
(nombre, descripcion, prioridad)
VALUES
('Sacar basura', 'Sacar la basura lunes y jueves, antes de las 10 AM', 'Alta');

INSERT INTO permiso
(nombre, descripcion)
VALUES
('Basico', 'Funcionalidades minimas al sistema');

INSERT INTO permiso
(nombre, descripcion)
VALUES
('Medio', 'Funcionalidades medias al sistema');

INSERT INTO permiso
(nombre, descripcion)
VALUES
('Completo', 'Todos los permisos asigandos para las funcionalidades del sistema');

INSERT INTO huesped
(pasaporte, nombre,nacionalidad, vegano, celiaco)
VALUES
('0123456789', 'Juan Herrera', 'Chileno', FALSE, TRUE);

INSERT INTO huesped
(pasaporte, nombre,nacionalidad, vegano, celiaco)
VALUES
('987654321', 'Andres Zamorano', 'Chileno', FALSE, FALSE);

INSERT INTO huesped
(pasaporte, nombre,nacionalidad, vegano, celiaco)
VALUES
('0918273645', 'Mike Tyson', 'USA', TRUE, TRUE);

INSERT INTO servicio
(nombre, monto_servicio, descripcion)
VALUES
('Seguridad', 10000, 'Seguridad de la habitacion durante las 24 horas del dia');


INSERT INTO servicio
(nombre, monto_servicio, descripcion)
VALUES
('Lavanderia', 5000, 'Lavanderia durante las 9:00 am hasta las 19:00 PM');

INSERT INTO persona
(run, nombre, email, password,direccion,admin,fecha_nacimiento,fecha_ingreso_hostal,id_perfil,run_hostal)
VALUES
('17993508-2', 'Ivan Antonio Zamorano Cataldo', 'ivan.a.zamorano.c@gmail.com', 'holabebe', 'En la hosta #666', TRUE, TIMESTAMP '2005-05-13',CURRENT_TIMESTAMP,1,'18371445-2' );

INSERT INTO persona
(run, nombre, email, password,direccion,admin,fecha_nacimiento,fecha_ingreso_hostal,id_perfil,run_hostal)
VALUES
('16970737-5', 'Andres Mauricio Vega Yañez', 'andres.vega.y@gmail.com', 'holabebe2', 'CafeLandia', False, TIMESTAMP '2005-05-13',CURRENT_TIMESTAMP,2,'18371445-2' );

INSERT INTO dia
(fecha, run)
VALUES
(CURRENT_TIMESTAMP, '18371445-2');

INSERT INTO dia
(fecha, run)
VALUES
(TIMESTAMP '2005-05-13', '18371445-2');

INSERT INTO bloque_horario
(inicio_bloque, termino_bloque, fecha)
VALUES 
(TIMESTAMP ' 2015-05-28 15:30:00', TIMESTAMP '2015-05-28 22:00:00', TIMESTAMP '"2015-05-28 05:07:36.379"');

INSERT INTO bloque_asignado
(run, id_blq_horario, id_tarea)
VALUES 
('17993508-2', 1, 1);

INSERT INTO bloque_asignado
(run, id_blq_horario, id_tarea)
VALUES 
('16970737-5', 1, 2);

INSERT INTO cantidad_de_permisos
(id_perfil, id_permiso)
VALUES 
(1,1);

INSERT INTO cantidad_de_permisos
(id_perfil, id_permiso)
VALUES 
(1,2);

INSERT INTO cantidad_de_permisos
(id_perfil, id_permiso)
VALUES 
(1,3);

INSERT INTO cantidad_de_permisos
(id_perfil, id_permiso)
VALUES 
(2,1);

INSERT INTO producto
(nombre, cantidad,cantidad_critica, categoria,run)
VALUES 
('BlueBerrys',100, 20,'Alimento','18371445-2');

INSERT INTO producto
(nombre, cantidad,cantidad_critica, categoria,run)
VALUES 
('Naranjas',50, 5,'Alimento','18371445-2');

