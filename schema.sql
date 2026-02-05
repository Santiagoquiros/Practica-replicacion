CREATE DATABASE ventas;
USE ventas;

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10,2),
    stock INT
);

CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME,
    total DECIMAL(10,2)
);

CREATE TABLE ventas_lineas (
    id_linea INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad INT,
    precio DECIMAL(10,2)
);


INSERT INTO productos (nombre, precio, stock) VALUES
('Teclado', 20.00, 50),
('Ratón', 10.00, 100),
('Monitor', 150.00, 25),
('Auriculares', 35.50, 40),
('Memoria USB', 15.00, 75);


INSERT INTO ventas (fecha, total) VALUES
('2026-02-05 10:00:00', 45.00),
('2026-02-05 11:30:00', 185.50);


INSERT INTO ventas_lineas (id_venta, id_producto, cantidad, precio) VALUES
(1, 1, 1, 20.00),   -- 1 Teclado
(1, 2, 2, 10.00),   -- 2 Ratones
(2, 3, 1, 150.00),  -- 1 Monitor
(2, 4, 1, 35.50);   -- 1 Auricular