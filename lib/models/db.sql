CREATE DATABASE menu_restaurante;

CREATE TABLE comidas(
	id serial PRIMARY KEY,
	nombre VARCHAR(50),
	descripcion VARCHAR(200),
	image_url VARCHAR(50),
	precio FLOAT,
	calorias INT,
	peso INT
);