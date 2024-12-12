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