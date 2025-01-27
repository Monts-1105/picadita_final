CREATE TABLE picadita_jarocha

-- Tabla para razones sociales
DROP TABLE IF EXISTS RazonSocial;
CREATE TABLE RazonSocial (razon_social_id INT AUTO_INCREMENT PRIMARY KEY, nombre VARCHAR(100), rfc_razon_social VARCHAR(13));

INSERT INTO RazonSocial (nombre, rfc_razon_social) VALUES ('Blanca Estela Fernandez Ruiz', 'FERB811126JB3')
    , ('Que Rico Comi, SA De CV', 'GRCS306209S0')
    , ('Asi De Barato, SA De CV', 'ABA1907229B0')
    , ('Delicias al Instante, SA De CV', 'DAI160820PT3')
    , ('El Rincón del Sabor, SA de CV', 'ERS200401XM2')
    , ('Comida Rápida Gourmet, SA de CV', 'CRG180623NY5')
    , ('Come Bien Barato, SA de CV', 'CBB220316RJ7')
    , ('Rico y Listo, SA de CV', 'RYL180520NM3');

CREATE TABLE Sucursal (sucursal_id INT AUTO_INCREMENT PRIMARY KEY, nombre_sucursal VARCHAR(50), ubicacion_sucursal VARCHAR(100), numero_telefonico_sucursal VARCHAR(10), razon_social_id INT
    , CONSTRAINT fk_razon_social FOREIGN KEY (razon_social_id)
    REFERENCES RazonSocial(razon_social_id) ON DELETE CASCADE
);

INSERT INTO Sucursal (nombre_sucursal, ubicacion_sucursal, numero_telefonico_sucursal, razon_social_id) VALUES ('La Picadita Jarocha Sucursal Centro', 'Av. Hidalgo No. 600, Esq. Allende, Col. Centro', '9212121386', 7)
    , ('La Picadita Jarocha Sucursal El Palmar', 'Av. Las Palmas No. 101 Int. Loc. 17, Col. Paraiso', '9212121386', 1)
    , ('La Picadita Jarocha Sucursal Malecon Costero', 'Altamirano No. 2407 Col. Petroquimica', '9212137072', 6)
    , ('La Picadita Jarocha Sucursal Soriana Mercado Coatza', 'Blvd. Juan Osorio Lopez No. 100 Int. Loc. 2, 3 y 4, Col. Héroes de Nacozari', '', 2)
    , ('La Picadita Jarocha Sucursal Gaviotas', 'Av. Jirafas No. 137, esquina con Ceiba, Col. Gaviotas', '9216882551', 3)
    , ('La Picadita Jarocha Sucursal Soriana Cuauhtémoc', 'Plaza Soriana, Col. Cuauhtemoc', '9222239947', 4)
    , ('La Picadita Jarocha Sucursal Centro', 'José Arenas N° 14, Col. Centro ', '9222237340', 5)
    , ('La Picadita Jarocha Sucursal Instituto Tecnológico', 'Instituto Tecnológico, Col. Insurgentes Norte', '9222417821', 8);

-- Tabla días de la semana
DROP TABLE IF EXISTS DiaSemana;
CREATE TABLE DiaSemana (
    dia_id INT AUTO_INCREMENT PRIMARY KEY , nombre_dia VARCHAR(50)
);

INSERT INTO DiaSemana (nombre_dia) VALUES ('Lunes'), ('Martes'), ('Miercoles'), ('Jueves'), ('Viernes'), ('Sabado'), ('Domingo');

-- Tabla de los horarios de sucursales
DROP TABLE IF EXISTS SucursalHorario;
CREATE TABLE SucursalHorario (sucursal_horario_id INT AUTO_INCREMENT PRIMARY KEY, dia_id INT, sucursal_id INT, hora_apertura VARCHAR(5), hora_cierre VARCHAR(5)
    -- se añade la referencia al dia
    , CONSTRAINT fk_dia FOREIGN KEY (dia_id) REFERENCES DiaSemana(dia_id) ON DELETE CASCADE
    -- se añade la referencia a la sucursal
    , CONSTRAINT fk_sucursal FOREIGN KEY (sucursal_id) REFERENCES Sucursal(sucursal_id) ON DELETE CASCADE
);

-- Inserts horario sucursales
INSERT INTO SucursalHorario (dia_id, sucursal_id, hora_apertura, hora_cierre) VALUES (2, 1, '08', '22')
    , (3, 1, '08', '22')
    , (4, 1, '08', '22')
    , (5, 1, '08', '22')
    , (6, 1, '08', '22')
    , (7, 1, '08', '22')
    , (1, 2, '08', '22')
    , (2, 2, '08', '22')
    , (3, 2, '08', '22')
    , (4, 2, '08', '22')
    , (5, 2, '08', '22')
    , (6, 2, '08', '22')
    , (7, 2, '08', '22')
    , (1, 3, '08', '22')
    , (2, 3, '08', '22')
    , (4, 3, '08', '22')
    , (5, 3, '08', '22')
    , (6, 3, '08', '22')
    , (7, 3, '08', '22')
    , (1, 4, '08', '22')
    , (2, 4, '08', '22')
    , (3, 4, '08', '22')
    , (4, 4, '08', '22')
    , (5, 4, '08', '22')
    , (6, 4, '08', '22')
    , (7, 4, '08', '22')
    , (1, 5, '08', '22')
    , (3, 5, '08', '22')
    , (4, 5, '08', '22')
    , (5, 5, '08', '22')
    , (6, 5, '08', '22')
    , (7, 5, '08', '22')
    , (1, 6, '08', '22')
    , (2, 6, '08', '22')
    , (3, 6, '08', '22')
    , (4, 6, '08', '22')
    , (5, 6, '08', '22')
    , (6, 6, '08', '22')
    , (7, 6, '08', '22')
    , (1, 7, '08', '18')
    , (2, 7, '08', '18')
    , (3, 7, '08', '18')
    , (4, 7, '08', '18')
    , (5, 7, '08', '18')
    , (6, 7, '08', '18')
    , (7, 7, '08', '15') 
    , (1, 8, '08', '22')
    , (2, 8, '08', '22')
    , (3, 8, '08', '22')
    , (4, 8, '08', '22')
    , (5, 8, '08', '22')
    , (6, 8, '08', '22')
    , (7, 8, '08', '22');

-- Tabla de mesas
DROP TABLE IF EXISTS Mesa;
CREATE TABLE Mesa (mesa_id INT AUTO_INCREMENT PRIMARY KEY, numero_mesa INT, total_personas INT, sucursal_id INT
    , CONSTRAINT fk_mesa_sucursal FOREIGN KEY (sucursal_id)
    REFERENCES Sucursal(sucursal_id) ON DELETE CASCADE
);

-- Inserta mesas
INSERT INTO Mesa (numero_mesa, total_personas, sucursal_id) VALUES (10, 4, 1),
    (20, 6, 3),
    (30, 8, 5),
    (40, 4, 7),
    (50, 6, 8),
    (60, 8, 1),
    (70, 4, 3),
    (80, 6, 5),
    (90, 8, 7),
    (100, 4, 8),
    (110, 6, 1),
    (120, 8, 3),
    (130, 4, 5),
    (140, 6, 7),
    (150, 8, 8),
    (160, 4, 1),
    (170, 6, 3),
    (180, 8, 5),
    (190, 4, 7),
    (200, 6, 8),
    (210, 8, 1),
    (220, 4, 3),
    (230, 6, 5),
    (240, 8, 7),
    (250, 4, 8),
    (260, 6, 1),
    (270, 8, 3),
    (280, 4, 5),
    (290, 6, 7),
    (300, 8, 8),
    (310, 4, 1),
    (320, 6, 3),
    (330, 8, 5),
    (340, 4, 7),
    (350, 6, 8),
    (360, 8, 1),
    (370, 4, 3),
    (380, 6, 5),
    (390, 8, 7),
    (400, 4, 8),
    (410, 6, 1),
    (420, 8, 3),
    (430, 4, 5),
    (440, 6, 7),
    (450, 8, 8),
    (460, 4, 1),
    (470, 6, 3),
    (480, 8, 5),
    (490, 4, 7),
    (500, 6, 8),
    (510, 8, 1),
    (520, 4, 3),
    (530, 6, 5),
    (540, 8, 7),
    (550, 4, 8),
    (560, 6, 1),
    (570, 8, 3),
    (580, 4, 5),
    (590, 6, 7),
    (600, 8, 8),
    (610, 4, 1),
    (620, 6, 3),
    (630, 8, 5),
    (640, 4, 7),
    (650, 6, 8),
    (660, 8, 1),
    (670, 4, 3),
    (680, 6, 5),
    (690, 8, 7),
    (700, 4, 8),
    (710, 6, 1),
    (720, 8, 3),
    (730, 4, 5),
    (740, 6, 7),
    (750, 8, 8),
    (760, 4, 1),
    (770, 6, 3),
    (780, 8, 5),
    (790, 4, 7),
    (800, 6, 8),
    (810, 8, 1),
    (820, 4, 3),
    (830, 6, 5),
    (840, 8, 7),
    (850, 4, 8),
    (860, 6, 1),
    (870, 8, 3),
    (880, 4, 5),
    (890, 6, 7),
    (900, 8, 8),
    (910, 4, 1),
    (920, 6, 3),
    (930, 8, 5),
    (940, 4, 7),
    (950, 6, 8),
    (960, 8, 1),
    (970, 4, 3),
    (980, 6, 5),
    (990, 8, 7),
    (1000, 4, 8);

DROP TABLE IF EXISTS Submesa;
CREATE TABLE SubMesa (
    submesa_id INT AUTO_INCREMENT PRIMARY KEY, nombre_cliente VARCHAR(50), numero_personas INT, fecha DATETIME
    , mesa_id INT
    , CONSTRAINT fk_mesa FOREIGN KEY (mesa_id)
    REFERENCES Mesa(mesa_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Orden;
CREATE TABLE Orden (
   orden_id INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,  
   folio VARCHAR(5) NOT NULL,                             
   tipo VARCHAR(10) NOT NULL,                             
   forma_pago CHAR(10) NOT NULL,                          
   fecha DATETIME NOT NULL,                               
   cambio DECIMAL(10, 2) NOT NULL,                        
   entregado DECIMAL(10, 2) NOT NULL,                    
   submesa_id INT,                                      
   subtotal DECIMAL(10, 2) GENERATED ALWAYS AS (entregado - cambio) STORED, 
   total DECIMAL(10, 2) GENERATED ALWAYS AS (subtotal * 1.16) STORED,       
   no_orden_diario INT                               
   , CONSTRAINT fk_submesa FOREIGN KEY (submesa_id)
    REFERENCES Submesa(submesa_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Caja;
CREATE TABLE Caja (
    caja_id INT
    , saldo_caja FLOAT DEFAULT 0
);

DROP TABLE IF EXISTS OrdenCaja;
CREATE TABLE OrdenCaja (
    orden_id INT
    , caja_id INT
    , importe FLOAT
    , CONSTRAINT fk_orden FOREIGN KEY (orden_id)
    REFERENCES Orden(orden_id) ON DELETE CASCADE
    , CONSTRAINT fk_caja FOREIGN KEY (caja_id)
    REFERENCES Caja(caja_id) ON DELETE CASCADE 
);

DROP TABLE IF EXISTS Empleado;
CREATE TABLE Empleado (
    empleado_id INT
    , apellido_paterno VARCHAR(100)
    , apellido_materno VARCHAR(100)
    , nombres VARCHAR(100)
    , rfc VARCHAR(13)
    , telefono VARCHAR(10)
    , turno VARCHAR(50)
    , salario FLOAT
    , curp VARCHAR(18)
);

DROP TABLE IF EXISTS Cajero;
CREATE TABLE Empleado (
    empleado_id INT
    , total_transacciones INT
    , CONSTRAINT fk_empleado FOREIGN KEY (empleado_id)
    REFERENCES Empleado(empleado_id) ON DELETE CASCADE    
);

DROP TABLE IF EXISTS CajeroCaja;
CREATE TABLE CajeroCaja (
    caja_id INT
    , empleado_id INT
    , CONSTRAINT fk_caja FOREIGN KEY (caja_id)
    REFERENCES Caja(caja_id) ON DELETE CASCADE    
    , CONSTRAINT fk_empleado FOREIGN KEY (empleado_id)
    REFERENCES Empleado(empleado_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Repartidor;
CREATE TABLE Empleado (
    empleado_id INT
    , matricula_vehiculo VARCHAR(8)
    , no_licencia VARCHAR(12)
    , CONSTRAINT fk_empleado FOREIGN KEY (empleado_id)
    REFERENCES Empleado(empleado_id) ON DELETE CASCADE    
);


DROP TABLE IF EXISTS OrdenDomicilio;
CREATE TABLE OrdenDomicilio (
    orden_id INT
    , direccion VARCHAR(100)
    , coste FLOAT
    , empleado_id INT
    , CONSTRAINT fk_orden FOREIGN KEY (orden_id)
    REFERENCES Orden(orden_id) ON DELETE CASCADE 
    , CONSTRAINT fk_empleado FOREIGN KEY (empleado_id)
    REFERENCES Empleado(empleado_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Promocion;
CREATE TABLE Promocion (
    promocion_id INT AUTO_INCREMENT PRIMARY KEY
    , nombre VARCHAR(200)
    , descripcion VARCHAR(200)
    , condicion VARCHAR(200)
    , dia_aplicable VARCHAR(20)
    , fecha_registro DATETIME DEFAULT CURRENT_DATE
    , fecha_inicio DATETIME DEFAULT CURRENT_DATE
    , fecha_fin DATETIME DEFAULT NULL
    , promocion_activa BOOLEAN DEFAULT TRUE
);

INSERT INTO Promocion (nombre, descripcion, condicion, dia_aplicable) VALUES
    ('Lunes de atascon', 'Promo memelas y huaraches', '2x1 en memelas y huaraches', 'Lunes')
    , ('Martes Tradicional', 'Promo picadas', '2 x 1 en picadas sencillas', 'Martes')
    , ('Miercoles de tamales', 'Promo tamales', '2 x 1 en tamales rancheros', 'Miercoles')
    , ('Jueves de huevos', 'Promo huevos', '2 x 1 1/2 en productos de huevos', 'Jueves')
    , ('Viernes de bebidas', 'Promo bebidas', '2 x 1 en todas las aguas frescas', 'Viernes'); 

DROP TABLE IF EXISTS Producto; 
CREATE TABLE Producto (
   producto_id INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
   precio_unitario DECIMAL(10,2) NOT NULL,
   nombre_producto VARCHAR(50) NOT NULL,
   categoria_id INT, promocion_id INT
   ,  CONSTRAINT fk_categoria FOREIGN KEY(categoria_id)
    REFERENCES Categoria(categoria_id) ON DELETE CASCADE
   ,  CONSTRAINT fk_promocion FOREIGN KEY(promocion_id)
    REFERENCES Promocion(promocion_id) ON DELETE CASCADE

);

INSERT INTO producto (precio_unitario, nombre_producto, categoria_id, promocion_id) VALUES				
(13.00, 'Picada de Salsa roja con Chile', 1, 2),				
(13.00, 'Picada de Salsa roja sin Chile', 1, 2),				
(13.00, 'Picada de Salsa Verde', 1, 2),				
(13.00, 'Picada de Salsa Chipotle', 1, 2),				
(13.00, 'Picada de Salsa Ranchera', 1, 2),				
(13.00, 'Picada de Frijoles', 1, 2),				
(15.00, 'Picada de Salsa y Frijoles', 1, NULL),				
(16.00, 'Picada de Mole', 1, 2),				
(17.00, 'Picada de Asientos de Chicharrón', 1, NULL),				
(19.00, 'Picada de Papa con Nopales', 1, NULL),				
(19.00, 'Picada de Huevo Revuelto', 1, NULL),				
(19.00, 'Picada de Huevo Estrellado', 1, NULL),				
(19.00, 'Picada de Chicharrón Prensado', 1, NULL),				
(19.00, 'Picada de Cáscara de Chicharrón', 1, NULL),				
(19.00, 'Picada de Salsa de Chicharrón', 1, NULL),				
(19.00, 'Picada de Pollo', 1, NULL),				
(19.00, 'Picada de Cochinita', 1, NULL),				
(19.00, 'Picada de Longaniza', 1, NULL),				
(19.00, 'Picada de Picadillo', 1, NULL),				
(19.00, 'Picada de Carne Asada', 1, NULL),				
(19.00, 'Picada de Cecina', 1, NULL),				
(19.00, 'Picada de Chinameca', 1, NULL),				
(19.00, 'Picada de Tripa', 1, NULL),				
(24.50, 'Picada de Campechana', 1, NULL),				
(20.00, 'Tostada de Cochinita', 2, NULL),				
(20.00, 'Tostada de Pollo', 2, NULL),				
(20.00, 'Tostada de Picadillo', 2, NULL),				
(13.50, 'Gordita Negra', 3, NULL),				
(13.50, 'Gordita Blanca', 3, NULL),				
(13.50, 'Gordita de Dulce', 3, NULL),				
(15.50, 'Gordita con Mole', 3, NULL),				
(22.00, 'Gordita Especial', 3, NULL),				
(25.50, 'Gordita Montada sencilla', 3, NULL),				
(31.00, 'Gordita Montada especial', 3, NULL),				
(74.00, 'Memela de Papa con Nopales', 4, 1),				
(74.00, 'Memela de Huevo Revuelto', 4, 1),				
(74.00, 'Memela de Asientos de Chicharrón', 4, 1),				
(74.00, 'Memela de Chicharrón Prensado', 4, 1),				
(74.00, 'Memela de Cáscara de Chicharrón', 4, 1),				
(74.00, 'Memela de Salsa de Chicharrón', 4, 1),				
(74.00, 'Memela de Pollo', 4, 1),				
(74.00, 'Memela de Cochinita', 4, 1),				
(74.00, 'Memela de Longaniza', 4, 1),				
(74.00, 'Memela de Picadillo', 4, 1),				
(74.00, 'Memela de Carne Asada', 4, 1),				
(74.00, 'Memela de Cecina', 4, 1),				
(74.00, 'Memela de Chinameca', 4, 1),				
(74.00, 'Memela de Tripa', 4, 1),				
(74.00, 'Memela de Tradicional', 4, 1),				
(90.50, 'Memela de Campechana', 4, 1),				
(74.00, 'Huarache de Papa con Nopales', 5, 1),				
(74.00, 'Huarache de Huevo Revuelto', 5, 1),				
(74.00, 'Huarache de Asientos de Chicharrón', 5, 1),				
(74.00, 'Huarache de Chicharrón Prensado', 5, 1),				
(74.00, 'Huarache de Cáscara de Chicharrón', 5, 1),				
(74.00, 'Huarache de Salsa de Chicharrón', 5, 1),				
(74.00, 'Huarache de Pollo', 5, 1),				
(74.00, 'Huarache de Cochinita', 5, 1),				
(74.00, 'Huarache de Longaniza', 5, 1),				
(74.00, 'Huarache de Picadillo', 5, 1),				
(74.00, 'Huarache de Carne Asada', 5, 1),				
(74.00, 'Huarache de Cecina', 5, 1),				
(74.00, 'Huarache de Chinameca', 5, 1),				
(74.00, 'Huarache de Tripa', 5, 1),				
(90.50, 'Huarache de Campechano', 5, 1),				
(38.50, 'Torta de Cochinita', 6, NULL),				
(38.50, 'Torta de Pollo', 6, NULL),				
(38.50, 'Torta de Longaniza', 6, NULL),				
(38.50, 'Torta de Chinameca', 6, NULL),				
(38.50, 'Torta de Carne asada', 6, NULL),				
(50.00, 'Torta de Combinada', 6, NULL),				
(21.50, 'Salbute de Cochinita', 7, NULL),				
(21.50, 'Salbute de Pollo', 7, NULL),				
(14.00, 'Empanadas de Queso', 8, NULL),				
(14.00, 'Empanadas de Jamón', 8, NULL),				
(14.00, 'Empanadas de Pollo', 8, NULL),				
(14.00, 'Empanadas de Prensado', 8, NULL),				
(14.00, 'Empanadas de Cochinita', 8, NULL),				
(14.00, 'Empanadas de Picadillo', 8, NULL),				
(14.00, 'Empanadas de Longaniza', 8, NULL),				
(14.00, 'Empanadas de Asientos', 8, NULL),				
(14.00, 'Empanadas de Tripa', 8, NULL),				
(18.00, 'Empanadas Campechanas', 8, NULL),				
(56.50, 'Dobladas Entomatadas con Pollo/Huevo', 9, NULL),				
(56.50, 'Dobladas Enfrijoladas con Pollo/Huevo', 9, NULL),				
(61.00, 'Dobladas Enmoladas con Pollo/Huevo', 9, NULL),				
(65.00, 'Huevos a la Mexicana', 10, 4),				
(65.00, 'Huevos Tirados', 10, 4),				
(65.00, 'Huevos con Jamón', 10, 4),				
(65.00, 'Huevos con Longaniza', 10, 4),				
(65.00, 'Huevos en Salsa', 10, 4),				
(77.00, 'Huevos Motuleños', 10, 4),				
(77.00, 'Huevos Rancheros', 10, 4),				
(77.00, 'Huevos Divorciados', 10, 4),				
(56.50, 'Consomé de Pollo', 11, NULL),				
(79.00, 'Caldo de Pozole', 11, NULL),				
(79.00, 'Caldo de Mondongo', 11, NULL),				
(15.00, 'Tacos de Carne Asada', 12, NULL),				
(15.00, 'Tacos de Cochinita', 12, NULL),				
(15.00, 'Tacos de Tripa', 12, NULL),				
(15.00, 'Tacos de Prensado', 12, NULL),				
(15.00, 'Tacos de Longaniza', 12, NULL),				
(19.50, 'Tacos de Campechano', 12, NULL),				
(48.00, 'Tacos Dorados de Pollo', 12, NULL),				
(67.00, 'Ensalada rusa con Pollo', 13, NULL),				
(67.00, 'Ensalada rusa con Atún', 13, NULL),				
(55.00, 'Cocktel de frutas', 14, NULL),				
(23.50, 'Plátanos fritos con crema y queso', 15, NULL),				
(23.50, 'Tamal Ranchero', 16, 3),				
(69.50, 'Chilaquiles con Pollo', 16, NULL),				
(89.50, 'Chilaquiles con Pollo y Bistec', 16, NULL),				
(84.50, 'Carne de Chinameca', 16, NULL),				
(138.50, 'Chinameca a la Tampiqueña', 16, NULL),				
(95.50, 'Chilaquiles con Pollo y Chinameca', 16, NULL),				
(138.50, 'Filete a la Tampiqueña', 16, NULL),				
(122.50, 'Cecina Huasteca', 16, NULL),				
(122.50, 'Chinameca Huasteca', 16, NULL),				
(69.50, 'Chiles Rellenos', 16, NULL),				
(25.00, 'Bomba Veracruzana', 16, NULL),				
(29.00, 'Refresco de 600ml', 17, NULL),				
(29.00, 'Refresco de lata', 17, NULL),				
(29.00, 'Coca-Cola light de lata', 17, NULL),				
(29.00, 'Fuze Tea 600ml', 17, NULL),				
(22.00, 'Agua Ciel', 17, NULL),				
(22.00, 'Agua de Horchata', 18, 5),				
(22.00, 'Agua de Jamaica', 18, 5),				
(22.00, 'Agua de Naranja', 18, 5),				
(88.00, 'Jarra de Horchata', 18, 5),				
(88.00, 'Jarra de Jamaica', 18, 5),				
(88.00, 'Jarra de Naranja', 18, 5),				
(35.00, 'Jugo de Naranja', 19, NULL),				
(39.00, 'Jugo Verde', 19, NULL),				
(39.00, 'Jugo de Zanahoria', 19, NULL),				
(39.00, 'Jugo de Toronja', 19, NULL),				
(39.00, 'Jugo de Naranja c/Zanahoria', 19, NULL),				
(39.00, 'Jugo de Piña', 19, NULL),				
(39.00, 'Jugo de Naranja c/Piña', 19, NULL),				
(138.00, 'Jarra de Jugo de Naranja', 19, NULL),				
(39.00, 'Licuado de Plátano', 20, NULL),				
(39.00, 'Licuado de Papaya', 20, NULL),				
(39.00, 'Licuado de Melón', 20, NULL),				
(39.00, 'Licuado de Fresa', 20, NULL),				
(39.00, 'Chocomilk', 20, NULL),				
(17.00, 'Café Chico', 21, NULL),				
(22.50, 'Café Grande', 21, NULL),				
(22.50, 'Café con Leche Chico', 21, NULL),				
(28.50, 'Café con Leche Grande', 21, NULL),				
(25.00, 'Champurrado Chico', 21, NULL),				
(31.50, 'Champurrado Grande', 21, NULL),				
(40.50, 'Pay de Limón', 22, NULL),				
(40.50, 'Pay de Queso', 22, NULL),				
(39.50, 'Flan Napolitano', 22, NULL),				
(34.50, 'Pan de Elote', 22, NULL),				
(14.00, 'Pan Dulce', 22, NULL),				
(95.00, 'Paquete Quemes', 23, NULL),				
(100.00, 'Paquete Regional', 23, NULL),				
(100.00, 'Paquete Desayunes', 23, NULL),				
(105.00, 'Paquete Llenes', 23, NULL),				
(150.00, 'Paquete Norteño', 23, NULL),				
(90.00, 'Paquete Rico', 23, NULL),				
(135.00, 'Paquete Guste', 23, NULL),				
(60.00, 'Paquete Alcance', 23, NULL),				
(75.00, 'Paquete Piques', 23, NULL),				
(75.00, 'Paquete Dobles', 23, NULL),				
(80.00, 'Paquete Nutras', 23, NULL),				
(34.00, 'Cerveza Corona Media', 24, NULL),				
(34.00, 'Cerveza Victoria', 24, NULL),				
(37.50, 'Cerveza Negra Modelo', 24, NULL),				
(37.50, 'Cerveza Modelo Especial', 24, NULL);	

DROP TABLE IF EXISTS DetalleOrden;
CREATE TABLE DetalleOrden (
    detalle_orden_id INT AUTO_INCREMENT PRIMARY KEY
    , cantidad INT
    , precio_unitario DECIMAL(10, 2) NOT NULL
    , importe DECIMAL(10, 2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED
    , orden_id INT
    , producto_id INT
    , CONSTRAINT fk_orden FOREIGN KEY(orden_id)
    REFERENCES Orden(orden_id) ON DELETE CASCADE
    , CONSTRAINT fk_producto FOREIGN KEY(producto_id)
    REFERENCES Producto(producto_id) ON DELETE CASCADE
);


DROP TABLE IF EXISTS DetalleOrdenPromocion;
CREATE TABLE DetalleOrdenPromocion  (
    detalle_orden_id INT
    , promocion_id INT
     , CONSTRAINT fk_detalle_orden FOREIGN KEY(detalle_orden_id)
    REFERENCES DetalleOrden(detalle_orden_id) ON DELETE CASCADE
    , CONSTRAINT fk_promocion FOREIGN KEY(promocion_id)
    REFERENCES Promocion(promocion_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Categoria;
CREATE TABLE Categoria (
   categoria_id INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
   nombre_categoria VARCHAR(30) NOT NULL);

INSERT INTO categoria (nombre_categoria) VALUES		
('Picadas'),		
('Tostadas'),		
('Gorditas'),		
('Memelas'),		
('Huaraches'),		
('Tortas'),		
('Salbutes'),		
('Empanadas'),		
('Dobladas'),		
('Huevos'),		
('Caldo'),		
('Tacos'),		
('Ensaladas'),		
('Cockteles'),		
('Platano frito'),		
('Platillos Regionales'),		
('Refrescos'),		
('Aguas Frescas'),		
('Jugos'),		
('Licuados'),		
('Calientes'),		
('Postres'),		
('Paquetes'),		
('Cervezas');	

DROP TABLE IF EXISTS Factura;
CREATE TABLE Factura (
    factura_id INT AUTO_INCREMENT PRIMARY KEY, uso_cfdi INT, rfc VARCHAR(13), regimen_fiscal VARCHAR(6)
    , domicilio_fiscal VARCHAR(60), referencia VARCHAR(20), nombre_sat VARCHAR(60), fecha_emision_factura DATETIME 
    , orden_id INT UNIQUE, CONSTRAINT fk_orden FOREIGN KEY (orden_id)
    REFERENCES Orden(orden_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Inventario;
CREATE TABLE Inventario (
    objeto_inventario_id INT AUTO_INCREMENT PRIMARY KEY
    , cantidad_en_inventario INT
    , unidad_medida INT
    , sucursal_id INT
    , ingrediente_id INT
    ,   CONSTRAINT fk_sucursal FOREIGN KEY (sucursal_id)
    REFERENCES Sucursal(sucursal_id) ON DELETE CASCADE
    , CONSTRAINT fk_ingrediente FOREIGN KEY (ingrediente_id)
    REFERENCES Ingrediente(ingrediente_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Ingrediente;
CREATE TABLE Ingrediente (
    ingrediente_id INT AUTO_INCREMENT PRIMARY KEY
    , nombre VARCHAR(100)
);


DROP TABLE IF EXISTS Proveedor;
CREATE TABLE Proveedor (
    proveedor_id INT AUTO_INCREMENT PRIMARY KEY
    , nombre VARCHAR(200)
    , telefono VARCHAR(10)
    , correo VARCHAR(100)
    , direccion VARCHAR(150)
);

DROP TABLE IF EXISTS ProveedorIngrediente;
CREATE TABLE ProveedorIngrediente (
    proveedor_ingrediente_id INT AUTO_INCREMENT PRIMARY KEY
    , fecha_entrega DATETIME
    , importe FLOAT
    , proveedor_id INT
    , ingrediente_id
    , CONSTRAINT fk_proveedor FOREIGN KEY (proveedor_id)
    REFERENCES Proveedor(proveedor_id) ON DELETE CASCADE
    , CONSTRAINT fk_ingrediente FOREIGN KEY (ingrediente_id)
    REFERENCES Ingrediente(ingrediente_id) ON DELETE CASCADE
)

DROP TABLE IF EXISTS Transaccion;
CREATE TABLE Transaccion (
    transaccion_id INT AUTO_INCREMENT PRIMARY KEY
    , cantidad FLOAT
    , fecha_transaccion DATETIME
    , orden_id INT
    , CONSTRAINT fk_orden FOREIGN KEY (orden_id)
    REFERENCES Orden(orden_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Monedero;
CREATE TABLE Monedero (
    monedero_id INT AUTO_INCREMENT PRIMARY KEY
    , fecha_registro DATETIME DEFAULT CURRENT_DATE
    , nombre_cliente VARCHAR(100)
    , apellido_paterno_cliente VARCHAR(100)
    , apellido_materno_cliente VARCHAR(100)
    , fecha_nacimiento_cliente DATETIME
    , saldo FLOAT
);

DROP TABLE IF EXISTS TransaccionMonedero;
CREATE TABLE TransaccionMonedero (
    transaccion_id INT
    , monedero_id INT
    , CONSTRAINT fk_transaccion FOREIGN KEY (transaccion_id)
    REFERENCES Transaccion(transaccion_id) ON DELETE CASCADE
    , CONSTRAINT fk_monedero FOREIGN KEY (monedero_id)
    REFERENCES Monedero(monedero_id) ON DELETE CASCADE
);
