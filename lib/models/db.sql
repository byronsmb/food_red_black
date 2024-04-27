CREATE DATABASE menu_restaurante;

CREATE TABLE comidas(
	id serial PRIMARY KEY,
	nombre VARCHAR(50),
	descripcion VARCHAR(200),
	image_url VARCHAR(50),
	precio FLOAT,
	calorias INT,
	peso INT,
	isFavorite BOOL
);

INSERT INTO comidas (nombre,  descripcion, image_url, precio, calorias, peso, isFavorite)
VALUES ('Patatas asadas', 'Deliciosas papas asadas al horno, tiernas por dentro y crujientes por fuera.', 'https://i.imgur.com/0aiFOju.png', 4.00, 400, 300, false),
('Salmón al limón]', 'Exquisito filete de salmón fresco, marinado en jugo de limón y especias selectas para resaltar su sabor natural.', 'https://i.imgur.com/LmUmNzr.png', 9.50, 200, 200, true);

INSERT INTO comidas (nombre,  descripcion, image_url, precio, calorias, peso, isFavorite)
VALUES ('Linguine all italiana', '', 'https://i.imgur.com/s4jq0M7.png', 15.00, 800, 300, false),
('Spaguetti con Camarón', '', 'https://i.imgur.com/2J81l39.png', 9.50, 200, 200, true);

INSERT INTO comidas (nombre,  descripcion, image_url, precio, calorias, peso, isFavorite)
VALUES ('Pastel de Café y Caramelo', '', 'https://i.imgur.com/taWVlyI.png', 4.00, 400, 300, false),
('Ensalada de pera y rúcula', '', 'https://i.imgur.com/W3cRDgF.png', 9.50, 200, 200, true);

INSERT INTO comidas (nombre,  descripcion, image_url, precio, calorias, peso, isFavorite)
VALUES ('Ensalada de algas wakame', '', 'https://i.imgur.com/l8roQZ2.png', 4.00, 400, 300, false),
('Frutos rojos', '', 'https://i.imgur.com/O6h4dj2.png', 9.50, 200, 200, true);




