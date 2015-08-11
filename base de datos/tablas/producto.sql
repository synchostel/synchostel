-- Creación tabla Producto
-- Versión 2.0 11/07/2015

CREATE TABLE producto(
	id serial primary key,
	nombre varchar(100),
	cantidad int,
	cantidad_critica int,
	id_categoria int references categoria_producto(id) ON DELETE CASCADE
);