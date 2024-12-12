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
    ,('La Picadita Jarocha Sucursal Soriana Mercado Coatza', 'Blvd. Juan Osorio Lopez No. 100 Int. Loc. 2, 3 y 4, Col. Héroes de Nacozari', '', 2)
    , ('La Picadita Jarocha Sucursal Gaviotas', 'Av. Jirafas No. 137, esquina con Ceiba, Col. Gaviotas', '9216882551', 3)
    , ('La Picadita Jarocha Sucursal Soriana Cuauhtémoc', 'Plaza Soriana, Col. Cuauhtemoc', '9222239947', 4)
    , ('La Picadita Jarocha Sucursal Centro', 'José Arenas N° 14, Col. Centro ', '9222237340', 5)
    , ('La Picadita Jarocha Sucursal Instituto Tecnológico', 'Instituto Tecnológico, Col. Insurgentes Norte', '9222417821', 8);

-- Tabla días de la semana
DROP TABLE IF EXISTS DiaSemana;
CREATE TABLE DiaSemana (
    dia_id INT AUTO_INCREMENT PRIMARY KEY , nombre_dia VARCHAR(50)
);

-- Tabla de los horarios de sucursales
DROP TABLE IF EXISTS SucursalHorario;
CREATE TABLE SucursalHorario (sucursal_horario_id INT AUTO_INCREMENT PRIMARY KEY, dia_id INT, sucursal_id INT, hora_apertura VARCHAR(5), hora_cierre VARCHAR(5)
    -- se añade la referencia al dia
    , CONSTRAINT fk_dia FOREIGN KEY (dia_id) REFERENCES DiaSemana(dia_id) ON DELETE CASCADE
    -- se añade la referencia a la sucursal
    , CONSTRAINT fk_sucursal FOREIGN KEY (sucursal_id) REFERENCES Sucursal(sucursal_id) ON DELETE CASCADE
);

-- Tabla de mesas
DROP TABLE IF EXISTS Mesa;
CREATE TABLE Mesa (mesa_id INT AUTO_INCREMENT PRIMARY KEY, numero_mesa INT, total_personas INT, sucursal_id INT
    , CONSTRAINT fk_mesa_sucursal FOREIGN KEY (sucursal_id)
    REFERENCES Sucursal(sucursal_id) ON DELETE CASCADE
);
