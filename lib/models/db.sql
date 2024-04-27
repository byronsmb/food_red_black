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
VALUES ('Linguine all italiana', 'Pasta al dente bañada en una exquisita salsa de tomate fresco, ajo aromático y hierbas mediterráneas', 'https://i.imgur.com/s4jq0M7.png', 15.00, 800, 300, false),
('Spaguetti con Camarón', 'Espaguetis de tinta de calamar perfectamente cocidos, envueltos en una cremosa salsa de mariscos y coronados con camarones jugosos y tiernos', 'https://i.imgur.com/2J81l39.png', 19.99, 900, 250, false);

INSERT INTO comidas (nombre,  descripcion, image_url, precio, calorias, peso, isFavorite)
VALUES ('Pastel de Café y Caramelo', 'Bizcocho de café y dulzura de caramelo, todo en una porción', 'https://i.imgur.com/taWVlyI.png', 2.00, 200, 100, false),
('Ensalada de pera y rúcula', 'Peras frescas, rúcula tierna y mas, todo ello aderezado con una vinagreta de miel', 'https://i.imgur.com/W3cRDgF.png', 4.99, 200, 150, false);

INSERT INTO comidas (nombre,  descripcion, image_url, precio, calorias, peso, isFavorite)
VALUES ('Ensalada de algas wakame', 'Algas suaves wakame sazonadas con un toque de vinagre de arroz y semillas de sésamo', 'https://i.imgur.com/l8roQZ2.png', 8.00, 100, 150, false),
('Frutos rojos', 'Una combinación perfecta de uvas, moras y cerezas para deleitar tu paladar de manera saludable y deliciosa', 'https://i.imgur.com/O6h4dj2.png', 3.50, 150, 200, true);




