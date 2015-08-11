-- Creación tabla Categoría Producto
-- Versión 1.0 11/07/2015

CREATE TABLE categoria_producto(
	id serial primary key,
	nombre varchar(100),
	descripcion varchar(250)
);