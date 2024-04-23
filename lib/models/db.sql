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

INSERT INTO comidas (nombre,  descripcion, precio, calorias, peso, image_url)
VALUES ('Patatas asadas', 'Deliciosas papas asadas al horno, tiernas por dentro y crujientes por fuera.', 4.00, 400, 300, 'https://i.imgur.com/0aiFOju.png'),
('Salmón al limón]', 'Exquisito filete de salmón fresco, marinado en jugo de limón y especias selectas para resaltar su sabor natural.', 9.50, 200, 200, 'https://i.imgur.com/LmUmNzr.png');