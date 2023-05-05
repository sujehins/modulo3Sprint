

CREATE DATABASE strintmodulo;

CREATE USER 'nombre_de_usuario'@'localhost' IDENTIFIED BY 'contraseña';
GRANT ALL PRIVILEGES ON strintmodulo TO 'nombre_de_usuario'@'localhost';
FLUSH PRIVILEGES;


CREATE TABLE proveedores (
  id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
  nombre_rep_legal VARCHAR(255) NOT NULL,
  nombre_corporativo VARCHAR(255) NOT NULL,
  telefono_1 VARCHAR(15) NOT NULL,
  telefono_2 VARCHAR(15),
  nombre_contacto VARCHAR(255) NOT NULL,
  categoria VARCHAR(255) NOT NULL,
  correo_electronico VARCHAR(255) NOT NULL
);

CREATE TABLE clientes (
  id_clientes INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(25) NOT NULL,
  apellido VARCHAR(25) NOT NULL,
  direccion VARCHAR(25) NOT NULL
);

CREATE TABLE productos (
  id_productos  INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255),
  precio INT,
  categoria VARCHAR(38),
  id_proveedor INT,
  color VARCHAR(50),
  stock INT,
  FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedores)
);

INSERT INTO proveedores (nombre_rep_legal, nombre_corporativo, telefono_1, telefono_2, nombre_contacto, categoria, correo_electronico) VALUES

('Juan Perez', 'ElectroPro', '955683302', '2255683308', 'Ana Gomez', 'Electrónica', 'juan@electropro.com'),
('Maria Rodriguez', 'TecnoMax', '955683301', '228807026', 'Pedro Martinez', 'Electrónica', 'maria@tecnomax.com'),
('Pedro Gomez', 'ElecMundo', '955683305', '2255683303', 'Sofia Perez', 'Hogar', 'pedro@elecmundo.com'),
('Luisa Martinez', 'GadgetCity', '955683304', '228807027', 'Jorge Ramirez', 'Ropa', 'luisa@gadgetcity.com'),
('Carlos Sanchez', 'HighTech', '955683306', '228807029', 'Ana Martinez', 'Ropa', 'carlos@hightech.com');

INSERT INTO clientes (nombre, apellido, direccion) VALUES
('Ana', 'Gomez', 'Ailla 200 pudahuel'),
('Pedro', 'Martinez', 'av.las condes 400 las condes'),
('Sofia', 'Perez', 'teatinos 500 santiago'),
('Jorge', 'Ramirez', 'teatinos 950 santiago'),
('Ana', 'Martinez', 'malal 300 maipu');

INSERT INTO productos (nombre, precio, categoria, id_proveedor, color, stock) VALUES
  ('Smartphone Galaxy S21', 89990, 'Electrónica', 1, 'Negro', 50),
  ('Laptop Inspiron 14', 71990, 'Electrónica', 2, 'Gris', 25),
  ('Smart TV LED 55', 129990, 'Electrónica', 1, 'Negro', 10),
  ('Aspiradora Cyclone', 14990, 'Hogar', 3, 'Rojo', 30),
  ('Horno Eléctrico 10L', 7990, 'Ropa', 4, 'Blanco', 15),
  ('Set de Sábanas King', 5990, 'Ropa', 5, 'Azul', 20),
  ('Camisa Polo Clásica', 2490, 'Ropa', 4, 'Blanco', 50),
  ('Zapatos de Vestir', 12990, 'Ropa', 5, 'Negro', 5),
  ('Parlante Bluetooth', 7990, 'Electrónica', 1, 'Rojo', 40),
  ('Cámara de Seguridad', 19990, 'Electrónica', 2, 'Blanco', 8);

- Cuál es la categoría de productos que más se repite.
SELECT nombre, stock FROM productos ORDER BY stock DESC
LIMIT 2;

- Cuáles son los productos con mayor stock
SELECT nombre, stock FROM productos ORDER BY stock DESC
LIMIT 5;

- Qué color de producto es más común en nuestra tienda.
SELECT color FROM productos GROUP BY color ORDER BY COUNT(*) DESC
LIMIT 3;

- Cuál o cuáles son los proveedores con menor stock de productos.
SELECT p.nombre_rep_legal, pr.stock FROM proveedores p JOIN productos pr ON p.id_proveedor  = pr.id_proveedor ORDER BY pr.stock ASC
LIMIT 2;

- Cambien la categoría de productos más popular por ‘Electrónica y computación’.
UPDATE productos
SET categoria = 'Electrónica y computación'
WHERE categoria = (SELECT categoria_count.categoria FROM ( SELECT categoria, COUNT(*) AS count FROM productos
    GROUP BY categoria ORDER BY COUNT(*) DESC LIMIT 1 ) AS categoria_count
);
select * from productos;