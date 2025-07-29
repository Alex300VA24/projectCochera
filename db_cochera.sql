drop database if exists cochera;
create database cochera;
use cochera;

-- 1. Crear las tablas sin dependencias
DROP TABLE IF EXISTS ClaseCliente;
CREATE TABLE ClaseCliente (
    ClaseClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Clase VARCHAR(30) NOT NULL,
    Frecuencia INT NOT NULL,
    Descuento Decimal(4,2)
);

INSERT INTO ClaseCliente (Clase, Frecuencia, Descuento) VALUES
('Común', 1, 0.00),
('Común', 2, 0.00),
('Común', 3, 0.00),
('Bronce', 1, 0.10),
('Bronce', 2, 0.10),
('Bronce', 3, 0.10),
('Bronce', 4, 0.10),
('Plata', 1, 0.15),
('Plata', 2, 0.15),
('Plata', 3, 0.15),
('Plata', 4, 0.15),
('Oro', 1, 0.20);


DROP TABLE IF EXISTS TipoChofer;
CREATE TABLE TipoChofer (
    TipoChoferID INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(30) NOT NULL
);

INSERT INTO TipoChofer (Tipo) VALUES
('Amistad'),
('Familiar'),
('Cónyuge'),
('Trabajo');


DROP TABLE IF EXISTS Puesto;
CREATE TABLE Puesto (
    PuestoID INT PRIMARY KEY AUTO_INCREMENT,
    Puesto VARCHAR(30) NOT NULL
);

INSERT INTO Puesto (Puesto) VALUES
('Administrador'),
('Recepcionista'),
('Mantenimiento');


DROP TABLE IF EXISTS TipoVehiculo;
CREATE TABLE TipoVehiculo (
    TipoVehiculoID INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(30) NOT NULL
);

INSERT INTO TipoVehiculo (Tipo) VALUES
('Motocicleta'),
('Hatchback'),
('Camioneta'),
('Sedán'),
('Station Wagon');


DROP TABLE IF EXISTS TiempoReserva;
CREATE TABLE TiempoReserva (
    TiempoReservaID INT PRIMARY KEY AUTO_INCREMENT,
    Periodo VARCHAR(50) NOT NULL
);

INSERT INTO TiempoReserva (Periodo) VALUES
('Diario'),
('Semanal'),
('Quincenal'),
('Mensual');


DROP TABLE IF EXISTS TipoEspacio;
CREATE TABLE TipoEspacio (
    TipoEspacioID INT PRIMARY KEY AUTO_INCREMENT,
    TipoEspacio VARCHAR(30) NOT NULL
);

INSERT INTO TipoEspacio (TipoEspacio) VALUES
('Estándar'),         
('Extenso'),          
('Motocicleta'),     
('Especial');   /*Para tiempos de reserva mensuales*/


DROP TABLE IF EXISTS EspacioEstacionamiento;
CREATE TABLE EspacioEstacionamiento (
    EspacioID INT PRIMARY KEY AUTO_INCREMENT,
    TipoEspacioID INT,
    Estado VARCHAR(15) NOT NULL,
    FOREIGN KEY (TipoEspacioID) REFERENCES TipoEspacio(TipoEspacioID) ON DELETE CASCADE
);

INSERT INTO EspacioEstacionamiento (TipoEspacioID, Estado) VALUES
(1, 'Disponible'),  
(2, 'Ocupado'),    
(3, 'Disponible'),  
(4, 'Ocupado'),  
(1, 'Disponible'),  
(2, 'Disponible'),  
(3, 'Ocupado'),  
(4, 'Disponible'),  
(1, 'Ocupado'),  
(2, 'Disponible'),  
(3, 'Disponible'),  
(4, 'Ocupado'),  
(1, 'Disponible'),  
(2, 'Ocupado'),  
(3, 'Disponible'),  
(4, 'Ocupado'),  
(1, 'Disponible'),  
(2, 'Disponible'),  
(3, 'Ocupado'),  
(4, 'Disponible'),  
(1, 'Ocupado'),  
(2, 'Disponible'),  
(3, 'Ocupado'),  
(4, 'Disponible'),  
(1, 'Disponible');  


DROP TABLE IF EXISTS MetodoPago;
CREATE TABLE MetodoPago (
    MetodoPagoID INT PRIMARY KEY AUTO_INCREMENT,
    MetodoPago VARCHAR(50) NOT NULL
);

INSERT INTO MetodoPago (MetodoPago) VALUES
('Efectivo'),
('Tarjeta de Crédito'),
('Tarjeta de Débito'),
('Transferencia Bancaria'),
('Pago Móvil');


-- 2. Crear las tablas dependientes en el orden adecuado
DROP TABLE IF EXISTS Cliente;
CREATE TABLE Cliente (
    DniCliente VARCHAR(8) PRIMARY KEY, -- Clave primaria única para identificar al cliente
    Nombres VARCHAR(50) NOT NULL,
    ApePaterno VARCHAR(30) NOT NULL,
    ApeMaterno VARCHAR(30),
    Telefono VARCHAR(12),
    Direccion VARCHAR(60),
    ClaseClienteID INT,
    FOREIGN KEY (ClaseClienteID) REFERENCES ClaseCliente(ClaseClienteID) ON DELETE CASCADE
);


INSERT INTO Cliente (DniCliente, Nombres, ApePaterno, ApeMaterno, Telefono, Direccion, ClaseClienteID) VALUES
('08373214', 'Luis Alberto', 'Torres', 'Mendoza', '941234567', 'Calle Pizarro 123', 3), -- #1
('18212331', 'María Elena', 'Ramírez', 'Salazar', '942345678', 'Av. España 456', 5), -- #2
('41570936', 'Carlos Eduardo', 'Vásquez', 'Lozano', '943456789', 'Jr. Independencia 789', 1), -- #3
('43227158', 'Ana Patricia', 'García', 'Rojas', '944567890', 'Urbanización Primavera', 6), -- #4
('44713721', 'José Antonio', 'Castillo', 'López', '945678901', 'Av. América Sur 321', 4), -- #5
('45784840', 'Rosa Isabel', 'Fernández', 'Cruz', '946789012', 'Calle Unión 456', 8), -- #6
('70221484', 'Miguel Ángel', 'Sánchez', 'Ramírez', '947890123', 'Jr. Bolívar 123', 9), -- #7
('70221486', 'Carmen Julia', 'Reyes', 'Villanueva', '948901234', 'Urbanización San Andrés', 10), -- #8
('15374158', 'Jorge Luis', 'Ortiz', 'Cárdenas', '949012345', 'Calle Zela 567', 11), -- #9
('41335958', 'Valeria Alejandra', 'Cruz', 'Salinas', '957890123', 'Urbanización Vista Hermosa', 12), -- #10
('40318012', 'Ricardo Luis', 'Arias', 'Tello', '958901234', 'Av. Larco 567', 1), -- #11
('05714548', 'Gabriela Isabel', 'Ríos', 'Mejía', '959012345', 'Calle Zela 123', 2), -- #12
('47510903', 'Fernando César', 'Llanos', 'Torres', '940123457', 'Av. Mansiche 456', 3), -- #13
('47646968', 'Patricia Eugenia', 'Ramos', 'Huertas', '941234568', 'Jr. Junín 789', 4), -- #14
('19426402', 'José Manuel', 'Peña', 'Montenegro', '942345679', 'Urbanización Los Jardines', 5), -- #15
('07111614', 'Roxana Beatriz', 'Reyes', 'Vásquez', '943456780', 'Calle Independencia 987', 6), -- #16
('41528041', 'Mario Rafael', 'Fernández', 'Castañeda', '944567891', 'Av. Víctor Larco 123', 7), -- #17
('44355605', 'Julia Vanessa', 'Alarcón', 'Salazar', '945678902', 'Jr. Libertad 456', 2), -- #18
('45619347', 'Luis Enrique', 'Vega', 'Romero', '946789013', 'Urbanización La Rinconada', 9), -- #19
('17950163', 'Carmen Teresa', 'Montoya', 'Campos', '947890124', 'Calle Santa Clara 321', 3), -- #20
('19925903', 'David Alejandro', 'Valverde', 'Paredes', '948901235', 'Av. La Marina 654', 8), -- #21
('46424187', 'Ana Lucía', 'Ramírez', 'Rojas', '949012346', 'Jr. Ayacucho 789', 11), -- #22
('43188601', 'Carlos Emilio', 'Chávez', 'Gómez', '950123457', 'Urbanización La Noria', 12), -- #23
('43955982', 'Laura Cecilia', 'Salinas', 'Espinoza', '951234568', 'Calle Santa Rosa 456', 2), -- #24
('10117485', 'Pedro Antonio', 'Morales', 'Carrasco', '952345679', 'Av. Mansiche 987', 7), -- #25
('15378415', 'Sandra Patricia', 'Aguirre', 'Quispe', '953456780', 'Jr. Almagro 123', 6), -- #26
('41303329', 'Juan Gabriel', 'Hernández', 'Cornejo', '954567891', 'Urbanización El Bosque', 5), -- #27
('48327841', 'Rosa Elena', 'Jiménez', 'Villanueva', '955678902', 'Calle Primavera 456', 2), -- #28
('27684269', 'Oscar Javier', 'Barreto', 'López', '956789013', 'Av. Progreso 321', 7), -- #29
('43042104', 'Claudia Liliana', 'Pérez', 'Cáceres', '957890124', 'Jr. Santa María 654', 10), -- #30
('06588389', 'Luis Alfredo', 'Zavala', 'Galindo', '958901235', 'Calle Unión 789', 11), -- #31
('16137642', 'Verónica Milagros', 'Rojas', 'Núñez', '959012346', 'Urbanización Primavera', 12), -- #32
('16159557', 'Carlos Alberto', 'Castaño', 'Ramírez', '940123457', 'Av. América Norte 123', 1), -- #33
('16159640', 'Paula Margarita', 'Montalvo', 'Quintana', '941234568', 'Jr. Bolívar 456', 2), -- #34
('43273556', 'Andrés David', 'Tovar', 'Gálvez', '942345679', 'Urbanización Palermo', 3), -- #35
('44305851', 'Gabriela Lucía', 'Chirinos', 'Flores', '943456780', 'Calle Zela 987', 4), -- #36
('45909930', 'Mario Augusto', 'Campos', 'Peña', '944567891', 'Jr. Salaverry 654', 5), -- #37
('48318877', 'Cristian Eduardo', 'Pérez', 'Montalvo', '943567890', 'Jr. Almagro 321', 1), -- #38
('62809468', 'Isabel Andrea', 'Delgado', 'Pérez', '944678901', 'Calle Las Hortensias 654', 2), -- #39
('44099915', 'Santiago José', 'Salcedo', 'Valverde', '945789012', 'Av. Federico Villarreal 987', 3), -- #40
('05348615', 'Julia Elena', 'Aguirre', 'Rojas', '946890123', 'Urbanización Palermo', 4), -- #41
('05714749', 'Emilio Martín', 'Castro', 'Muñoz', '947901234', 'Jr. Huánuco 567', 5), -- #42
('44593742', 'Lucía Beatriz', 'Campos', 'Vega', '948012345', 'Calle Manuel Seoane 123', 6), -- #43
('43589926', 'Mario César', 'Barreto', 'Ruiz', '949123456', 'Av. Metropolitana 456', 7), -- #44
('27405193', 'Patricia del Pilar', 'Quintana', 'Hurtado', '940234567', 'Urbanización Vista Alegre', 8), -- #45
('33578935', 'Luis Enrique', 'Fuentes', 'Huerta', '941345678', 'Jr. Salaverry 321', 9), -- #46
('70758789', 'Roxana María', 'Zapata', 'Flores', '942456789', 'Calle Los Laureles 654', 10), -- #47
('27692460', 'José Miguel', 'Guzmán', 'Espinoza', '943567890', 'Av. Mansiche 987', 11), -- #48
('41337246', 'Claudia Maribel', 'López', 'Gálvez', '944678901', 'Jr. Libertad 123', 12), -- #49
('80143386', 'Enrique Javier', 'Carrasco', 'Vargas', '945789012', 'Urbanización Palermo', 1), -- #50
('42562342', 'Valeria Rosario', 'Moreno', 'Valle', '946890123', 'Calle Los Jazmines 456', 2), -- #51
('45461502', 'Sebastián David', 'Correa', 'Campos', '947901234', 'Jr. Almagro 789', 3), -- #52
('73671062', 'Marcela Fernanda', 'Olivares', 'Salas', '948012345', 'Calle Primavera 234', 4), -- #53
('16674297', 'Antonio Rafael', 'Escobar', 'Lara', '949123456', 'Av. América Sur 567', 5), -- #54
('21121578', 'Melina Gabriela', 'Vega', 'Tello', '940234567', 'Urbanización La Merced', 6), -- #55
('48311789', 'Oscar Andrés', 'Montalvo', 'Galindo', '941345678', 'Jr. Gamarra 890', 7), -- #56
('19042017', 'Camila Soledad', 'Villanueva', 'Santos', '942456789', 'Av. Tupac Amaru 123', 8), -- #57
('47853488', 'Héctor Emiliano', 'Alvarado', 'Castañeda', '943567890', 'Calle El Carmen 456', 9), -- #58
('60597705', 'Elisa Margarita', 'Padilla', 'Montes', '944678901', 'Urbanización Santa Rosa', 10), -- #59
('77053012', 'Renato Iván', 'Ramos', 'Chirinos', '945789012', 'Av. Perú 789', 11), -- #60
('21007540', 'Alejandra Cecilia', 'Arroyo', 'Gómez', '946890123', 'Calle Huascar 987', 12), -- #61
('46814262', 'Felipe Joaquín', 'Velarde', 'Zavala', '947901234', 'Urbanización San Salvador', 1), -- #62
('10610445', 'Diana Leticia', 'Llanos', 'Delgado', '948012345', 'Jr. Cahuide 321', 2), -- #63
('47070874', 'Juan Pablo', 'Cabrera', 'Silva', '950123456', 'Av. América Norte 123', 3), -- #64
('40166530', 'María José', 'Navarro', 'Vargas', '951234567', 'Jr. Gamarra 456', 4), -- #65
('40095707', 'Jorge Andrés', 'Valencia', 'Carrillo', '952345678', 'Calle España 789', 5), -- #66
('47786149', 'Ana Teresa', 'Villalobos', 'Gómez', '953456789', 'Urbanización Santa María', 6), -- #67
('77910963', 'Carlos Alberto', 'Palacios', 'Reyes', '954567890', 'Av. Tupac Amaru 987', 7), -- #68
('80305185', 'Elena Cristina', 'Espinoza', 'Montalvo', '955678901', 'Calle Bolognesi 654', 8), -- #69
('43612991', 'Miguel Armando', 'Galvez', 'Castro', '956789012', 'Jr. Grau 321', 9), -- #70
('15350977', 'Diana Victoria', 'Gómez', 'Barreto', '945678902', 'Av. América Sur 321', 10), -- #71
('46541744', 'Alfredo César', 'Cabrera', 'Jiménez', '946789013', 'Urbanización Los Rosales', 11), -- #72
('80317750', 'María Fernanda', 'Villalobos', 'Sánchez', '947890124', 'Calle Grau 456', 12), -- #73
('44876826', 'Jorge Francisco', 'Romero', 'Gómez', '948901235', 'Urbanización Santa María', 1), -- #74
('45138823', 'Lucía Alejandra', 'Castañeda', 'Salas', '949012346', 'Jr. San Martín 123', 2), -- #75
('73464057', 'Emilio Martín', 'Ramírez', 'Delgado', '950123457', 'Av. Larco 654', 3), -- #76
('44726257', 'Elena Patricia', 'Vargas', 'Montes', '951123456', 'Urbanización Las Flores', 4), -- #77
('23531320', 'Fernando Luis', 'Santibáñez', 'Reyes', '952234567', 'Jr. Angamos 321', 5), -- #78
('71308790', 'Gloria Marina', 'Montes', 'Salas', '953345678', 'Calle Arequipa 987', 6), -- #79
('27981503', 'Daniel Francisco', 'Pinedo', 'Gómez', '954456789', 'Av. Los Incas 789', 7), -- #80
('32740943', 'Cecilia Rosario', 'Muñoz', 'Tello', '955567890', 'Jr. Amazonas 654', 8), -- #81
('40879326', 'Luis Eduardo', 'Espinoza', 'Montoya', '956678901', 'Calle Ayacucho 432', 9), -- #82
('05407514', 'Rosa Isabel', 'Ramos', 'Barreto', '957789012', 'Av. Grau 213', 10), -- #83
('40827047', 'Carlos Alberto', 'Rojas', 'Sánchez', '940123456', 'Av. América Sur 789', 5), -- #84
('40890576', 'María Fernanda', 'Gómez', 'Chávez', '941234567', 'Calle Zela 321', 3), -- #85
('72313010', 'Jorge Luis', 'Torres', 'López', '942345678', 'Jr. Larco 123', 7), -- #86
('32304010', 'Ana Patricia', 'Vega', 'Huertas', '943456789', 'Urbanización Primavera', 4), -- #87
('44861146', 'Ricardo Andrés', 'Flores', 'Cruz', '944567890', 'Jr. Grau 987', 12), -- #88
('19966169', 'Carmen Julia', 'Barreto', 'Salazar', '945678901', 'Av. Mansiche 456', 1), -- #89
('27751248', 'Miguel Ángel', 'Montoya', 'Ramírez', '946789012', 'Urbanización Palermo', 6), -- #90
('09505861', 'Valeria Alejandra', 'Campos', 'Gálvez', '947890123', 'Calle Unión 321', 8), -- #91
('44959991', 'Rosa Elena', 'Pérez', 'Villanueva', '948901234', 'Jr. Almagro 456', 9), -- #92
('80390051', 'Jorge Enrique', 'Cruz', 'Vásquez', '949012345', 'Av. Larco 789', 10), -- #93
('20582598', 'Laura Cecilia', 'Ramírez', 'Castañeda', '950123456', 'Urbanización San Andrés', 11), -- #94
('44584430', 'Pedro Antonio', 'Castro', 'Espinoza', '951234567', 'Av. La Marina 987', 2), -- #95
('20978067', 'Julia Isabel', 'Fernández', 'Morales', '952345678', 'Calle Ayacucho 654', 4), -- #96
('42455265', 'Fernando César', 'Salas', 'Delgado', '953456789', 'Urbanización Los Jardines', 6), -- #97
('46873967', 'Patricia Eugenia', 'Ortega', 'Cruz', '954567890', 'Jr. Gamarra 321', 8), -- #98
('42679736', 'Mario Rafael', 'Chávez', 'Sánchez', '955678901', 'Urbanización Vista Hermosa', 7), -- #99
('46548468', 'Gabriela Lucía', 'Rojas', 'Tello', '956789012', 'Calle Santa Clara 654', 12), -- #100
('47566943', 'Luis Alfredo', 'Villanueva', 'Campos', '957890123', 'Jr. Bolívar 789', 3), -- #101
('27667081', 'Elena Patricia', 'Quintana', 'Barreto', '958901234', 'Calle Grau 432', 1), -- #102
('00972144', 'Carlos Emilio', 'Llanos', 'Zavala', '959012345', 'Urbanización La Rinconada', 5), -- #103
('42163555', 'Roxana Beatriz', 'Peña', 'Montalvo', '940234567', 'Calle Las Hortensias 213', 9), -- #104
('42356855', 'Antonio Rafael', 'Valverde', 'Romero', '941345678', 'Jr. Santa María 987', 11), -- #105
('47590142', 'Diana Victoria', 'Reyes', 'Castañeda', '942456789', 'Urbanización Los Rosales', 2), -- #106
('22520068', 'Sebastián David', 'Guzmán', 'Chávez', '943567890', 'Av. Víctor Larco 654', 4), -- #107
('45651208', 'Javier Eduardo', 'Medina', 'Torres', '944678901', 'Calle Independencia 345', 3), -- #108
('15593913', 'Paola Andrea', 'Huamán', 'Villena', '945789012', 'Jr. Gamarra 567', 1), -- #109
('45552364', 'José Miguel', 'Valencia', 'Ortega', '946890123', 'Urbanización Covicorti', 5), -- #110
('40371238', 'Gabriela María', 'Salazar', 'Rojas', '947901234', 'Av. España 234', 8), -- #111
('42588995', 'Ricardo Alonso', 'Vargas', 'Fernández', '948012345', 'Calle Los Claveles 567', 7), -- #112
('21845201', 'Carolina Lucía', 'Mendoza', 'Paredes', '949123456', 'Urbanización Santa Inés', 6), -- #113
('23011781', 'Fernando Julián', 'Alvarado', 'Gómez', '950234567', 'Av. Larco 111', 9), -- #114
('60567662', 'Natalia Alejandra', 'Cruz', 'Palacios', '951345678', 'Jr. Almagro 654', 4), -- #115
('40480884', 'Luis Enrique', 'Campos', 'Zavala', '952456789', 'Urbanización La Merced', 10), -- #116
('33655902', 'Andrea Isabel', 'López', 'Barreto', '953567890', 'Calle Zela 432', 2), -- #117
('42031382', 'Jorge Emilio', 'Pérez', 'Delgado', '954678901', 'Jr. Bolívar 765', 12), -- #118
('42140002', 'María Fernanda', 'Quispe', 'Montes', '955789012', 'Av. Mansiche 321', 11), -- #119
('42999704', 'Carlos Manuel', 'Espinoza', 'Vera', '956890123', 'Urbanización Primavera', 5), -- #120
('47270879', 'Ana Patricia', 'Hurtado', 'Salinas', '957901234', 'Calle Santa Clara 654', 3), -- #121
('43268113', 'Pedro Javier', 'Chávez', 'Núñez', '958012345', 'Urbanización El Bosque', 6), -- #122
('47420166', 'Rosa Amelia', 'Gálvez', 'Ramos', '959123456', 'Jr. Larco 543', 1), -- #123
('70922379', 'Oscar Eduardo', 'Montoya', 'Campos', '940234567', 'Calle Las Begonias 987', 7), -- #124
('05853208', 'Cecilia Lourdes', 'Villanueva', 'Huertas', '941345678', 'Urbanización Palermo', 9), -- #125
('40027974', 'Miguel Ángel', 'Ramírez', 'Zamora', '942456789', 'Jr. Grau 876', 2), -- #126
('05235889', 'Claudia Teresa', 'Zúñiga', 'Pérez', '943567890', 'Av. Víctor Larco 432', 8), -- #127
('48162592', 'Ricardo Andrés', 'Flores', 'Quintana', '944678901', 'Calle Ayacucho 210', 4), -- #128
('04337153', 'Patricia Eugenia', 'Valverde', 'Cruz', '945789012', 'Urbanización Los Jardines', 11), -- #129
('23684906', 'Antonio Rafael', 'Reyes', 'Montalvo', '946890123', 'Urbanización Las Magnolias', 12), -- #130
('33767599', 'Sandra Beatriz', 'Acuña', 'Espinoza', '947001234', 'Av. América Oeste 321', 3), -- #131
('47733751', 'Andrés Martín', 'Carranza', 'Huertas', '948112345', 'Calle Libertad 456', 2), -- #132
('45888267', 'Carmen Teresa', 'Bravo', 'Valencia', '949223456', 'Urbanización San Andrés', 8), -- #133
('18175573', 'Mario Alberto', 'Quintanilla', 'Salas', '950334567', 'Jr. Pizarro 789', 6), -- #134
('44568452', 'Vanessa Milagros', 'Aguilar', 'Castaño', '951445678', 'Av. España 987', 7), -- #135
('80676140', 'Jorge Alejandro', 'Paredes', 'Campos', '952556789', 'Calle Junín 123', 4), -- #136
('20884858', 'Isabel Rocío', 'Díaz', 'Villegas', '953667890', 'Urbanización Las Quintanas', 1), -- #137
('20899911', 'Cristian Gabriel', 'Guzmán', 'Vera', '954778901', 'Av. Larco 210', 9), -- #138
('21536300', 'Ana María', 'Rojas', 'Montenegro', '955889012', 'Urbanización Palermo', 10), -- #139
('45672470', 'Diego Armando', 'Lozano', 'Zapata', '956990123', 'Jr. Bolívar 654', 11), -- #140
('03610346', 'Lucía Estefanía', 'Valverde', 'Quispe', '947001345', 'Calle Ayacucho 876', 12), -- #141
('42478638', 'Miguel Javier', 'Torres', 'Delgado', '948112456', 'Urbanización Primavera', 5), -- #142
('72644786', 'Patricia Gabriela', 'Reynoso', 'Ortega', '949223567', 'Av. Mansiche 987', 2), -- #143
('19039075', 'Hugo Fernando', 'Salazar', 'Pérez', '950334678', 'Jr. Almagro 432', 3), -- #144
('27751618', 'Carla Beatriz', 'Chávez', 'Vargas', '951445789', 'Urbanización Santa María', 7), -- #145
('41860897', 'Luis Alejandro', 'Ramírez', 'Zambrano', '952556890', 'Calle Santa Inés 234', 8), -- #146
('45917029', 'Rosa Lucía', 'Núñez', 'Valera', '953667901', 'Jr. Grau 765', 6), -- #147
('42227342', 'Juan Diego', 'Fernández', 'Hurtado', '954778012', 'Av. América Sur 123', 4), -- #148
('26717220', 'Cecilia Margarita', 'Vega', 'Montes', '955889123', 'Urbanización Covicorti', 1), -- #149+
('48297246', 'Oscar Julio', 'Montenegro', 'Palacios', '956990234', 'Av. España 654', 12), -- #150
('76693877', 'Carlos Eduardo', 'García', 'Ramírez', '943567890', 'Calle Los Rosales 123', 7), -- #151
('43123135', 'María Fernanda', 'López', 'Vega', '987654321', 'Av. Mansiche 456', 2), -- #152
('46590218', 'José Manuel', 'Torres', 'Quispe', '912345678', 'Jr. Independencia 789', 3), -- #153
('80348415', 'Ana Cecilia', 'Rojas', 'Castillo', '951234567', 'Av. Larco 321', 5), -- #154
('19079722', 'Jorge Luis', 'Fernández', 'Delgado', '987123654', 'Calle San Martín 654', 9), -- #155
('32122197', 'Diana Patricia', 'Ruiz', 'Guzmán', '923456789', 'Jr. Grau 987', 1), -- #156
('10498425', 'Luis Enrique', 'Vargas', 'Reyes', '961234578', 'Calle Bolívar 132', 4), -- #157
('45959147', 'Gloria Elizabeth', 'Salazar', 'Chávez', '998765432', 'Av. España 243', 8), -- #158
('15662432', 'Miguel Ángel', 'Guzmán', 'Paredes', '945612378', 'Jr. Zela 789', 6), -- #159
('48097099', 'Carmen Rosa', 'Ortega', 'Arroyo', '931245678', 'Calle Independencia 654', 1), -- #160
('02686563', 'Pablo Ignacio', 'Hernández', 'Cordero', '917843256', 'Av. Progreso 432', 3), -- #161
('44213080', 'Elena Victoria', 'Chávez', 'Morales', '926784521', 'Jr. Huánuco 876', 5), -- #162
('40830141', 'Rafael Javier', 'Cruz', 'Mendoza', '941237856', 'Av. Los Pinos 789', 2), -- #163
('46942418', 'Patricia María', 'Molina', 'Ramos', '932178645', 'Jr. Gamarra 543', 7), -- #164
('80513924', 'Sandra Alejandra', 'Pérez', 'Valverde', '958743216', 'Calle Los Diamantes 654', 8), -- #165
('27718429', 'Mario Alberto', 'Espinoza', 'Caballero', '965478321', 'Av. Grau 321', 4), -- #166
('33654132', 'Adriana Isabel', 'Flores', 'Campos', '921378645', 'Calle Arica 543', 9), -- #167
('00870429', 'Daniel Andrés', 'Mendoza', 'Vera', '913246875', 'Jr. Trujillo 678', 6), -- #168
('40278433', 'Claudia Gabriela', 'Rivas', 'Pineda', '975483216', 'Av. La Marina 987', 2), -- #169
('44832677', 'Ricardo Antonio', 'Palacios', 'Santillán', '942378654', 'Calle Los Eucaliptos 321', 7), -- #170
('47061220', 'Sofía Renata', 'Cornejo', 'Villanueva', '917652834', 'Jr. Colon 432', 5), -- #171
('47951211', 'Victor Hugo', 'Rodríguez', 'Carrasco', '921784356', 'Av. Cesar Vallejo 765', 1), -- #172
('10053995', 'Lucía Amparo', 'Reyes', 'Salinas', '956124378', 'Jr. Los Olivos 654', 8), -- #173
('28841943', 'Alberto Emiliano', 'Aguilar', 'Ríos', '987354216', 'Calle Real 765', 9), -- #174
('07419667', 'Natalia Andrea', 'Valenzuela', 'Espinosa', '964573821', 'Av. Larco 432', 3), -- #175
('73463555', 'Esteban Nicolás', 'Cáceres', 'López', '945672134', 'Av. Pizarro 123', 6), -- #176
('07046118', 'Mónica Beatriz', 'Gómez', 'Saldaña', '952341678', 'Calle Santa Ana 456', 2), -- #177
('21078430', 'Julio César', 'Vera', 'Escobar', '931247856', 'Jr. El Sol 789', 3), -- #178
('16128170', 'Santiago Ignacio', 'Carbajal', 'Miranda', '943218657', 'Av. América Norte 321', 8), -- #179
('16170036', 'Gabriela Luciana', 'Silva', 'Ramos', '927843156', 'Calle Santa María 654', 7), -- #180
('40270257', 'Diego Martín', 'Navarro', 'Quintana', '914578326', 'Jr. Bolognesi 987', 5), -- #181
('44541329', 'Valeria Alejandra', 'Moreno', 'Zavala', '951236478', 'Av. César Vallejo 132', 4), -- #182
('46279379', 'Felipe Andrés', 'Mejía', 'Santamaría', '973215684', 'Calle San Andrés 243', 9), -- #183
('46440673', 'Paola Isabel', 'Ramos', 'Castañeda', '919864753', 'Jr. Ramón Castilla 567', 1), -- #184
('25716089', 'Mario Augusto', 'Blanco', 'Ojeda', '925367148', 'Av. Primavera 789', 2), -- #185
('27987293', 'Verónica Esther', 'Carrillo', 'Palomino', '981654327', 'Calle San Carlos 432', 6), -- #186
('40858087', 'Ignacio Sebastián', 'Cruz', 'Del Valle', '917564823', 'Jr. El Inca 543', 3), -- #187
('46182290', 'Liliana Teresa', 'Reyna', 'Torrico', '912364875', 'Av. Nicolás de Piérola 765', 8), -- #188
('46756088', 'Roberto Javier', 'Quispe', 'Cárdenas', '932145678', 'Calle Grau 132', 7), -- #189
('75469843', 'Marcela Camila', 'Pérez', 'Cruzado', '928476513', 'Jr. Libertad 654', 4), -- #190
('45659252', 'Hugo Leonardo', 'Lara', 'Sánchez', '964312587', 'Av. Húsares de Junín 876', 9), -- #191
('40453760', 'Lorena Patricia', 'Pacheco', 'Barreto', '919763254', 'Calle Tacna 321', 5), -- #192
('44590483', 'Fernando Antonio', 'Arévalo', 'Cabello', '975431286', 'Jr. Ricardo Palma 765', 1), -- #193
('48060122', 'Camila Adriana', 'Méndez', 'Castro', '983214576', 'Av. Mansiche 543', 2), -- #194
('70590685', 'Joaquín Emiliano', 'Ordoñez', 'Villalobos', '918432765', 'Calle Zela 987', 6), -- #195
('19050001', 'Luciana María', 'Benavides', 'Cuellar', '916547328', 'Jr. Ayacucho 432', 8), -- #196
('45755045', 'Fabián Matías', 'Gálvez', 'Tello', '962348715', 'Av. Larco 321', 7), -- #197
('43460501', 'Amparo Delia', 'Huerta', 'Espino', '984713256', 'Calle Los Héroes 876', 3), -- #198
('33569453', 'Ricardo Esteban', 'Campos', 'Guevara', '927314586', 'Jr. Colón 765', 4), -- #199
('46495076', 'Daniela Roxana', 'Fuentes', 'Alarcón', '918734562', 'Av. Santa Rosa 132', 9), -- #200
('85507880', 'José Ángel', 'Asensio', 'Ros', '983308493', 'NULL', 7),
('21784509', 'Vicente', 'Aguirre', 'NULL', '992684864', 'Vial Martirio Barco 4, Huelva, 25541', 1),
('33508748', 'Visitación', 'Fábregas', 'Abella', '950982095', 'NULL', 9),
('82173124', 'Yésica', 'Frías', 'Gallart', '930858346', 'Avenida Concepción Giménez 19, Valencia, 40977', 7),
('42221800', 'Jeremías', 'Montenegro', 'NULL', 'NULL', 'Alameda Evelia Juliá 1, Huelva, 23149', 10),
('53190414', 'Venceslás', 'Perea', 'NULL', 'NULL', 'NULL', 2),
('15149015', 'Jacinta', 'Montenegro', 'Tamarit', 'NULL', 'NULL', 1),
('61730923', 'Felisa', 'Vidal', 'NULL', '983159443', 'Cañada Chita Uriarte 14 Puerta 4 , Melilla, 20508', 3),
('17262195', 'Rita', 'Suárez', 'Colomer', 'NULL', 'NULL', 3),
('31796676', 'Ignacio', 'Gaya', 'Gargallo', '940082829', 'Cañada de Josep Vilanova 86 Apt. 97 , Cádiz, 28709', 2),
('35264303', 'Daniel', 'Seco', 'NULL', '900615228', 'NULL', 5),
('78826091', 'Armida', 'Nadal', 'NULL', 'NULL', 'Callejón de Rita Ropero 26, Ourense, 04753', 1),
('44576437', 'Eustaquio', 'Juliá', 'Pino', '970575662', 'Pasaje Efraín Larrea 72, Soria, 44889', 1),
('48609464', 'Marcela', 'Arnau', 'Mena', 'NULL', 'Callejón Leticia Blanco 16 Puerta 5 , Barcelona, 10058', 11),
('83774128', 'Patricia', 'Goicoechea', 'Tudela', '983108457', 'Alameda Silvestre Robledo 414, Cantabria, 38861', 1),
('75755179', 'Albert', 'Ochoa', 'NULL', '988856286', 'NULL', 7),
('48765966', 'Amada', 'Pablo', 'NULL', '934348770', 'Ronda de Alfredo Vicens 65 Apt. 25 , Teruel, 31147', 12),
('61081959', 'Toño', 'Angulo', 'NULL', '992381473', 'NULL', 11),
('75121331', 'Lucas', 'Alcaraz', 'Maza', 'NULL', 'Avenida Andrés Felipe Aragonés 99 Apt. 10 , Huelva, 32791', 11),
('27571055', 'Maximiliano', 'Llorens', 'Hervia', 'NULL', 'Cuesta Hernando Plaza 3, Ourense, 02730', 1),
('53645467', 'Jesús', 'Torres', 'Roda', 'NULL', 'NULL', 4),
('37027732', 'Renato', 'Tenorio', 'NULL', 'NULL', 'Plaza de Agustín Coll 19 Puerta 7 , Albacete, 30899', 5),
('12156481', 'Maxi', 'Canals', 'Cid', 'NULL', 'NULL', 9),
('43191315', 'Nacho', 'Lago', 'NULL', '972145649', 'C. Paulina Herranz 73, Badajoz, 45247', 9),
('23823159', 'Ani', 'Bolaños', 'NULL', 'NULL', 'Acceso de Borja Haro 70, Lugo, 14424', 10),
('56635646', 'Ángel', 'Arcos', 'NULL', '936090942', 'NULL', 1),
('30556613', 'Ariel', 'Llorente', 'Busquets', '920498073', 'Plaza de Belén Morcillo 6 Piso 6 , Guadalajara, 22354', 4),
('69062783', 'Espiridión', 'Chamorro', 'Pavón', '903969527', 'Via de Nadia Salcedo 9 Piso 9 , La Coruña, 31757', 9),
('14650246', 'Clarisa', 'León', 'NULL', 'NULL', 'Callejón Sarita Canet 38, Huesca, 09959', 8),
('68083084', 'Salud', 'Goñi', 'Rosado', '968758697', 'NULL', 7),
('13498027', 'Sarita', 'Losa', 'Gual', 'NULL', 'Vial Berta Diaz 95 Puerta 7 , Pontevedra, 32979', 2),
('29368775', 'René', 'Torrijos', 'NULL', '953855988', 'NULL', 11),
('59227303', 'Olga', 'Fuentes', 'Aragón', '914734912', 'Alameda de Jonatan Rosado 64 Puerta 0 , Guadalajara, 02070', 9),
('19254938', 'Amado', 'Arévalo', 'NULL', 'NULL', 'NULL', 1),
('62028466', 'Lucio', 'Ángel', 'Cañete', 'NULL', 'NULL', 1),
('40248497', 'Pío', 'Castellanos', 'Bartolomé', 'NULL', 'Pasadizo de Feliciano Paniagua 74, La Rioja, 43690', 6),
('55643884', 'Elba', 'Gallardo', 'NULL', '925356128', 'NULL', 7),
('31330198', 'Edgardo', 'Diéguez', 'Tomás', '926258382', 'NULL', 12),
('47740835', 'Azahar', 'Pagès', 'NULL', '935347658', 'NULL', 8),
('55528577', 'Dionisia', 'Roman', 'NULL', '987957548', 'NULL', 11),
('68634980', 'Marta', 'Blasco', 'Ros', '993512701', 'NULL', 7),
('29919565', 'Régulo', 'Iborra', 'NULL', '991720857', 'NULL', 7),
('18449240', 'Clementina', 'Vilalta', 'Borja', '939746232', 'NULL', 12),
('96179960', 'Jessica', 'Quevedo', 'NULL', 'NULL', 'Pasaje Ricarda Mate 918, Guipúzcoa, 17076', 12),
('89086171', 'Lisandro', 'Cuevas', 'López', '925738920', 'NULL', 12),
('64779600', 'Eustaquio', 'Carranza', 'Múgica', '986416526', 'NULL', 6),
('17893303', 'Javier', 'Vicente', 'Sanmartín', '991512874', 'NULL', 5),
('98703683', 'Hilario', 'Escolano', 'Raya', 'NULL', 'Calle Etelvina Rios 92, Ávila, 31333', 6),
('36924684', 'Eduardo', 'Caballero', 'NULL', 'NULL', 'NULL', 11),
('84573022', 'Melisa', 'Carrillo', 'Blanch', '923305403', 'NULL', 3)
;

DROP TABLE IF EXISTS Vehiculo;
CREATE TABLE Vehiculo (
    Placa VARCHAR(10), -- Identificador del vehículo
    DniCliente VARCHAR(8), -- Referencia al cliente
    TipoVehiculoID INT NOT NULL,
    TarjetaPropiedad VARCHAR(50),
    PRIMARY KEY (Placa, DniCliente), -- Clave primaria compuesta
    FOREIGN KEY (DniCliente) REFERENCES Cliente(DniCliente) ON DELETE CASCADE, -- Relación con Cliente
    FOREIGN KEY (TipoVehiculoID) REFERENCES TipoVehiculo(TipoVehiculoID) ON DELETE CASCADE
);

INSERT INTO Vehiculo (Placa, DniCliente, TipoVehiculoID, TarjetaPropiedad) VALUES
('BAV-547', '08373214', 3, 'TP12345'), -- 1
('A1F-041', '18212331', 5, 'TP23456'), -- 2
('D0D-832', '41570936', 2, 'TP34567'), -- 3
('D6V-204', '43227158', 4, 'TP45678'), -- 4
('A2G-667', '44713721', 1, 'TP56789'), -- 5
('D0M-033', '45784840', 2, 'TP67890'), -- 6
('B3T-790', '70221484', 3, 'TP78901'), -- 7
('ANT-643', '70221486', 5, 'TP89012'), -- 8
('C0N-389', '15374158', 1, 'TP90123'), -- 9
('M2R-565', '41335958', 4, 'TP01234'), -- 10
('ATR-077', '40318012', 5, 'TP12345'), -- 11
('C3R-130', '05714548', 3, 'TP23456'), -- 12
('EO-4031', '47510903', 2, 'TP34567'), -- 13
('ARV-372', '47646968', 1, 'TP45678'), -- 14
('C4O-505', '19426402', 4, 'TP56789'), -- 15
('F6T-925', '07111614', 3, 'TP67890'), -- 16
('ARO-398', '41528041', 5, 'TP78901'), -- 17
('BAQ-287', '44355605', 1, 'TP89012'), -- 18
('B0C-324', '45619347', 4, 'TP90123'), -- 19
('D9M-498', '17950163', 2, 'TP01234'), -- 20
('W2P-284', '19925903', 3, 'TP12345'), -- 21
('BJO-002', '46424187', 1, 'TP23456'), -- 22
('7018-1F', '43188601', 4, 'TP34567'), -- 23
('AER-722', '43955982', 2, 'TP45678'), -- 24
('A2-0891', '10117485', 5, 'TP56789'), -- 25

('B4K-615', '15378415', 3, 'TP67890'), -- 26
('1763-0D', '41303329', 4, 'TP78901'), -- 27
('D5W-484', '48327841', 5, 'TP89012'), -- 28
('F2W-599', '27684269', 2, 'TP90123'), -- 29
('BOR-082', '43042104', 1, 'TP01234'), -- 30
('V7I-941', '06588389', 4, 'TP12345'), -- 31
('A7V-084', '16137642', 3, 'TP23456'), -- 32
('B9M-603', '16159557', 2, 'TP34567'), -- 33
('F8Z-476', '16159640', 5, 'TP45678'), -- 34
('ADN-166', '43273556', 1, 'TP56789'), -- 35
('D6A-610', '44305851', 4, 'TP67890'), -- 36
('NG-40675', '45909930', 3, 'TP78901'), -- 37
('B5V-027', '48318877', 5, 'TP89012'), -- 38
('8773-2A', '62809468', 1, 'TP90123'), -- 39
('D7T-107', '44099915', 4, 'TP01234'), -- 40
('C1R-637', '05348615', 2, 'TP12345'), -- 41
('B3E-448', '05714749', 3, 'TP23456'), -- 42
('BCV-538', '44593742', 4, 'TP34567'), -- 43
('A3N-713', '43589926', 5, 'TP45678'), -- 44
('BHH-277', '27405193', 1, 'TP56789'), -- 45
('V1D-650', '33578935', 4, 'TP11234'), -- 46
('F6R-920', '70758789', 2, 'TP22345'), -- 47
('0678-KA', '27692460', 5, 'TP33456'), -- 48
('C9D-259', '41337246', 3, 'TP44567'), -- 49
('BBA-212', '80143386', 1, 'TP55678'), -- 50

('AJN-365', '42562342', 4, 'TP66789'), -- 51
('4266-9C', '45461502', 5, 'TP77890'), -- 52
('A6J-587', '73671062', 2, 'TP88901'), -- 53
('ASJ-463', '16674297', 1, 'TP99012'), -- 54
('D4J-140', '21121578', 3, 'TP00123'), -- 55
('B8Q-466', '48311789', 5, 'TP11234'), -- 56
('Y1X-723', '19042017', 4, 'TP22345'), -- 57
('C6Q-446', '47853488', 2, 'TP33456'), -- 58
('D7E-665', '60597705', 5, 'TP44567'), -- 59
('F2Q-419', '77053012', 3, 'TP55678'), -- 60
('C6Q-773', '21007540', 1, 'TP66789'), -- 61
('AZD-355', '46814262', 4, 'TP77890'), -- 62
('C6P-662', '10610445', 5, 'TP88901'), -- 63
('C9C-648', '47070874', 2, 'TP99012'), -- 64
('T2B-711', '40166530', 3, 'TP00123'), -- 65
('C2H-864', '40095707', 4, 'TP11234'), -- 66
('ALM-228', '47786149', 1, 'TP22345'), -- 67
('T4G-328', '77910963', 5, 'TP33456'), -- 68
('M2F-277', '80305185', 3, 'TP44567'), -- 69
('D7M-620', '43612991', 2, 'TP55678'), -- 70
('D9E-727', '15350977', 5, 'TP66789'), -- 71
('D3N-981', '46541744', 4, 'TP77890'), -- 72
('BKR-240', '80317750', 1, 'TP88901'), -- 73
('AWS-821', '44876826', 3, 'TP99012'), -- 74
('LGK-132', '45138823', 2, 'TP00123'), -- 75

('B2E-344', '73464057', 5, 'TP11234'), -- 76
('D8H-081', '44726257', 3, 'TP22345'), -- 77
('A3U-889', '23531320', 4, 'TP33456'), -- 78
('C8G-249', '71308790', 1, 'TP44567'), -- 79
('5156-3F', '27981503', 2, 'TP55678'), -- 80
('C9H-241', '32740943', 5, 'TP66789'), -- 81
('A4H-635', '40879326', 1, 'TP77890'), -- 82
('V1C-029', '05407514', 4, 'TP88901'), -- 83
('B9K-678', '40827047', 2, 'TP99012'), -- 84
('B0O-656', '40890576', 3, 'TP00123'), -- 85
('A8R-696', '72313010', 5, 'TP11234'), -- 86
('D5P-894', '32304010', 4, 'TP22345'), -- 87
('A7S-671', '44861146', 1, 'TP33456'), -- 88
('COT-269', '19966169', 2, 'TP44567'), -- 89
('7151-9D', '27751248', 5, 'TP55678'), -- 90
('W2G-839', '09505861', 4, 'TP66789'), -- 91
('AQN-806', '44959991', 1, 'TP77890'), -- 92
('B6K-152', '80390051', 3, 'TP88901'), -- 93
('BJO-226', '20582598', 2, 'TP99012'), -- 94
('C7R-335', '44584430', 5, 'TP00123'), -- 95
('AFG-506', '20978067', 4, 'TP11234'), -- 96
('C6N-624', '42455265', 1, 'TP22345'), -- 97
('F9W-066', '46873967', 3, 'TP33456'), -- 98
('B6A-157', '42679736', 2, 'TP44567'), -- 99
('BFF-505', '46548468', 5, 'TP55678'), -- 100

('B8I-129', '47566943', 4, 'TP66789'), -- 101
('AKM-297', '27667081', 1, 'TP77890'), -- 102
('C2C-159', '00972144', 3, 'TP88901'), -- 103
('F5F-878', '42163555', 2, 'TP99012'), -- 104
('A4F-676', '42356855', 5, 'TP00123'), -- 105
('A1S-815', '47590142', 4, 'TP11234'), -- 106
('B0V-875', '22520068', 1, 'TP22345'), -- 107
('ABF-868', '45651208', 3, 'TP33456'), -- 108
('ACT-509', '15593913', 2, 'TP44567'), -- 109
('AAT-286', '45552364', 5, 'TP55678'), -- 110
('3508-TA', '40371238', 4, 'TP66789'), -- 111
('F5G-299', '42588995', 1, 'TP77890'), -- 112
('C9T-414', '21845201', 3, 'TP88901'), -- 113
('8696-3D', '23011781', 2, 'TP99012'), -- 114
('B1M-776', '60567662', 5, 'TP00123'), -- 115
('4517-8D', '40480884', 4, 'TP11234'), -- 116
('D8P-033', '33655902', 1, 'TP22345'), -- 117
('A6X-486', '42031382', 3, 'TP33456'), -- 118
('ARD-610', '42140002', 2, 'TP44567'), -- 119
('ADI-698', '42999704', 5, 'TP55678'), -- 120
('B8X-665', '47270879', 4, 'TP66789'), -- 121
('B5W-511', '43268113', 1, 'TP77890'), -- 122
('C2K-041', '47420166', 3, 'TP88901'), -- 123
('A1L-648', '70922379', 2, 'TP99012'), -- 124
('B1C-640', '05853208', 5, 'TP00123'), -- 125

('A5Y-580', '40027974', 4, 'TP11234'), -- 126
('C7Y-226', '05235889', 1, 'TP22345'), -- 127
('ABR-306', '48162592', 3, 'TP33456'), -- 128
('4058-QA', '04337153', 2, 'TP44567'), -- 129
('V2Q-390', '23684906', 5, 'TP55678'), -- 130
('AUZ-188', '33767599', 4, 'TP66789'), -- 131
('D3N-029', '47733751', 1, 'TP77890'), -- 132
('C7Y-587', '45888267', 3, 'TP88901'), -- 133
('C0U-932', '18175573', 2, 'TP99012'), -- 134
('M2X-690', '44568452', 5, 'TP00123'), -- 135
('3039-FA', '80676140', 4, 'TP11234'), -- 136
('A2Y-665', '20884858', 1, 'TP22345'), -- 137
('ALS-285', '20899911', 3, 'TP33456'), -- 138
('AOL-224', '21536300', 2, 'TP44567'), -- 139
('ARF-473', '45672470', 5, 'TP55678'), -- 140
('C7D-058', '03610346', 4, 'TP66789'), -- 141
('A4I-254', '42478638', 1, 'TP77890'), -- 142
('AED-248', '72644786', 3, 'TP88901'), -- 143
('C9L-690', '19039075', 2, 'TP99012'), -- 144
('AHÍ-140', '27751618', 5, 'TP00123'), -- 145
('A8B-048', '41860897', 4, 'TP11234'), -- 146
('AHO-743', '45917029', 1, 'TP22345'), -- 147
('B0F-370', '42227342', 3, 'TP33456'), -- 148
('AWH-380', '26717220', 2, 'TP44567'), -- 149
('C0V-658', '48297246', 5, 'TP55678'), -- 150

('AUQ-285', '76693877', 4, 'TP66789'), -- 151
('W1R-844', '43123135', 2, 'TP77890'), -- 152
('CQU-305', '46590218', 1, 'TP88901'), -- 153
('C5I-107', '80348415', 5, 'TP99012'), -- 154
('ANM-243', '19079722', 3, 'TP11223'), -- 155
('D2L-645', '32122197', 4, 'TP22334'), -- 156
('A6X-544', '10498425', 2, 'TP33445'), -- 157
('D1A-614', '45959147', 1, 'TP44556'), -- 158
('AAN-765', '15662432', 5, 'TP55667'), -- 159
('BIY-198', '48097099', 3, 'TP66778'), -- 160
('4T-21137', '02686563', 4, 'TP77889'), -- 161
('D9I-326', '44213080', 1, 'TP88990'), -- 162
('AXO-309', '40830141', 5, 'TP99001'), -- 163
('C8Z-662', '46942418', 2, 'TP10112'), -- 164
('AAD-525', '80513924', 3, 'TP21223'), -- 165
('AZW-099', '27718429', 4, 'TP32334'), -- 166
('CQH-226', '33654132', 1, 'TP43445'), -- 167
('AYR-009', '00870429', 5, 'TP54556'), -- 168
('C0A-621', '40278433', 3, 'TP65667'), -- 169
('3842-UA', '44832677', 2, 'TP76778'), -- 170
('C6J-854', '47061220', 1, 'TP87889'), -- 171
('D3H-079', '47951211', 4, 'TP98990'), -- 172
('F6H-851', '10053995', 5, 'TP09012'), -- 173
('PQQ-926', '28841943', 3, 'TP11234'), -- 174
('W1B-741', '07419667', 2, 'TP22345'), -- 175

('C2T-515', '73463555', 4, 'TP33457'), -- 176
('AUD-020', '07046118', 2, 'TP44568'), -- 177
('AWK-614', '21078430', 1, 'TP55679'), -- 178
('AFR-635', '16128170', 3, 'TP66780'), -- 179
('C6C-202', '16170036', 5, 'TP77881'), -- 180
('F3V-364', '40270257', 2, 'TP88902'), -- 181
('D6M-419', '44541329', 4, 'TP99013'), -- 182
('AGX-936', '46279379', 1, 'TP10123'), -- 183
('D7E-081', '46440673', 3, 'TP21234'), -- 184
('ABW-150', '25716089', 5, 'TP32345'), -- 185
('D9T-374', '27987293', 4, 'TP43456'), -- 186
('ANC-650', '40858087', 2, 'TP54567'), -- 187
('C0F-263', '46182290', 3, 'TP65678'), -- 188
('C9F-651', '46756088', 5, 'TP76789'), -- 189
('BFU-094', '75469843', 1, 'TP87890'), -- 190
('F9H-318', '45659252', 4, 'TP98991'), -- 191
('D6A-622', '40453760', 2, 'TP09023'), -- 192
('D4P-823', '44590483', 3, 'TP11235'), -- 193
('AKX-099', '48060122', 5, 'TP22346'), -- 194
('A6X-123', '70590685', 4, 'TP33458'), -- 195
('C5E-518', '19050001', 1, 'TP44569'), -- 196
('0127-JA', '45755045', 3, 'TP55680'), -- 197
('C7G-414', '43460501', 5, 'TP66781'), -- 198
('AUY-299', '33569453', 2, 'TP77882'), -- 199
('F3P-905', '46495076', 4, 'TP88903'), -- 200

('M9C496', '85507880', 5, '0507897778072'), -- #201
('BW2704', '21784509', 4, '0823848117500'), -- #202
('3BC404', '33508748', 4, '0550344323643'), -- #203
('U5H337', '82173124', 1, '0841497215194'), -- #204
('VTR035', '42221800', 5, '0809660414922'), -- #205
('ADW898', '53190414', 5, '0480963820696'), -- #206
('SE3404', '15149015', 1, '0438643595303'), -- #207
('FXF914', '61730923', 2, '0890265334589'), -- #208
('T19128', '17262195', 2, '0624101776474'), -- #209
('NFI856', '31796676', 4, '0515811498219'), -- #210
('N3D767', '35264303', 2, '0755230818661'), -- #211
('DGK163', '78826091', 5, '0671140296416'), -- #212
('PY9787', '44576437', 3, '0499708942056'), -- #213
('FDC868', '48609464', 3, '0547804891360'), -- #214
('HWK554', '83774128', 2, '0883809841329'), -- #215
('9QQ349', '75755179', 2, '0822662361515'), -- #216
('EF6835', '48765966', 2, '0262038940973'), -- #217
('FJF833', '61081959', 4, '0865808985955'), -- #218
('BKD405', '75121331', 5, '0673841965915'), -- #219
('WR0032', '27571055', 5, '0267501079190'), -- #220
('FWT881', '53645467', 4, '0799354681915'), -- #221
('57B721', '37027732', 5, '0699274118482'), -- #222
('X30066', '12156481', 5, '0795147414227'), -- #223
('ABL525', '43191315', 4, '0463050174181'), -- #224
('M8T192', '23823159', 4, '0911761971487'), -- #225

('MZV479', '56635646', 5, '0731591313565'), -- #226
('CLR285', '30556613', 3, '0571216148176'), -- #227
('DFQ039', '69062783', 2, '0731818922161'), -- #228
('JQP724', '14650246', 1, '0456462433938'), -- #229
('W6N858', '68083084', 2, '0138948957126'), -- #230
('PQZ956', '13498027', 3, '0167484382572'), -- #231
('VP1994', '29368775', 1, '0741745194258'), -- #232
('4LC927', '59227303', 1, '0957415770688'), -- #233
('B7X188', '19254938', 3, '0504725988598'), -- #234
('C28892', '62028466', 4, '0761933047631'), -- #235
('2AY999', '40248497', 5, '0505812438566'), -- #236
('RU4220', '55643884', 3, '0678783891789'), -- #237
('PJ8006', '31330198', 3, '0051727539998'), -- #238
('UIB587', '47740835', 4, '0363373665038'), -- #239
('1NE379', '55528577', 2, '0854296444204'), -- #240
('KM8212', '68634980', 4, '0885102267860'), -- #241
('9GY181', '29919565', 4, '0363014039379'), -- #242
('1II006', '18449240', 3, '0694982891978'), -- #243
('9C7016', '96179960', 4, '0087152037980'), -- #244
('VFC071', '89086171', 1, '0753003275669'), -- #245
('S88644', '64779600', 5, '0557575358906'), -- #246
('HQX425', '17893303', 4, '0427198120567'), -- #247
('9F6088', '98703683', 5, '0398867616009'), -- #248
('AXL263', '36924684', 4, '0826806087634'), -- #249
('VCW038', '84573022', 2, '0469823867065'), -- #250
('D1R-267', '84573022', 3, '0458664778899'), -- #251
('A8G-694', '19426402', 1, '0156752233315'), -- #252

('B4Z-682', '07111614', 5, '0557575358906'), -- #253
('Y1V-667', '41528041', 4, '0427198120567'), -- #254
('A5A-695', '44355605', 1, '0398867616009'), -- #255
('C7P-394', '45619347', 2, '0826806087634'), -- #256
('VIM-661', '17950163', 2, '0469823867065'), -- #257
('A1Y-738', '19925903', 3, '0458664778899'), -- #258
('COM-267', '46424187', 1, '0156752233315'), -- #259

('F2R-702', '43955982', 3, '0123245555221'), -- #260
('BIT-346', '10117485', 2, '0156549633598'), -- #261
('A1B-337', '41303329', 4, '0399433548552'), -- #262
('D4B-311', '43042104', 1, '0458789622125'), -- #263
('AVP-619', '06588389', 4, '0232584662059'), -- #264
('C3S-493', '42455265', 2, '0955146546556'), -- #265
('D5K-683', '46548468', 3, '0766223698522'), -- #266
('ADG-639', '27667081', 1, '0648956265554'), -- #267
('D4H-627', '15378415', 5, '0462123365978'), -- #268


('AOC-027', '17950163', 5, '0558826433515'), -- #259
('CQU-732', '42163555', 1, '0233546679872'), -- #270
('C81-192', '22520068', 2, '0326656511848'), -- #271
('B1W-965', '16137642', 3, '0479225658250'), -- #272
('A2Q-547', '48327841', 4, '0761426547631'), -- #273
('W2D-649', '45651208', 3, '0522642438566'), -- #274
('ARS-526', '42588995', 3, '0678783812355') -- #275
;


DROP TABLE IF EXISTS Chofer;
CREATE TABLE Chofer (
    DniChofer CHAR(8) PRIMARY KEY,
    Nombres VARCHAR(50) NOT NULL,
    ApePaterno VARCHAR(30) NOT NULL,
    ApeMaterno VARCHAR(30),
    Telefono VARCHAR(12),
    TipoChoferID INT,
    Placa VARCHAR(10) UNIQUE, -- Asegura relación 1 a 1 con Vehiculo
    DniCliente CHAR(8),       -- Relación de muchos choferes a un cliente
    FOREIGN KEY (TipoChoferID) REFERENCES TipoChofer(TipoChoferID) ON DELETE CASCADE,
    FOREIGN KEY (Placa) REFERENCES Vehiculo(Placa) ON DELETE CASCADE,
    FOREIGN KEY (DniCliente) REFERENCES Cliente(DniCliente) ON DELETE CASCADE
);

insert into chofer (DniChofer,Nombres,ApePaterno,ApeMaterno,Telefono,TipoChoferID,Placa,DniCliente) 
values ('48226985','Carmen','Torres','Vargas','987654301',2,'BAV-547','08373214'),
('44641150','Maria','Castro','Martinez','987654302',1,'A1F-041','18212331'),
('00240905','Fernando','Vasquez','Hernandez','987654303',2,'D0D-832','41570936'),
('46777199','Claudia','Torres','Castro','987654304',1,'D6V-204','43227158'),
('71692566','Rosa','Castillo','Castro','987654305',2,'A2G-667','44713721'),
('19552825','Sara','Quispe','Cruz','987654306',1,'D0M-033','45784840'),
('43209757','Luis','Sanchez','Hernandez','987654307',2,'B3T-790','70221484'),
('07059348','Juan','Torres','Rodriguez','987654308',3,'ANT-643','70221486'),
('21413975','Maria','Ortiz','Vargas','987654309',2,'C0N-389','15374158'),
('41332664','Carlos','Torres','Rodriguez','987654310',3,'M2R-565','41335958'),
('45441159','Diana','Arias','Tello','987654311',2,'ATR-077','40318012'),
('21564900','Carmen','Castro','Rios','987654312',1,'C3R-130','05714548'),
('45026453','Laura','Llanos','Torres','987654313',2,'EO-4031','47510903'),
('18124362','Ricardo','Cruz','Garcia','987654314',1,'ARV-372','47646968'),
('44997966','Fernando','Peña','Montenegro','987654315',2,'C4O-505','19426402'),
('48508621','Ricardo','Rios','Mejia','987654316',1,'F6T-925','07111614'),
('44848576','Laura','Fernandez','Castañeda','987654317',2,'ARO-398','41528041'),
('06661197','Carmen','Castro','Cruz','987654318',1,'BAQ-287','44355605'),
('18157545','Rosa','Mejia','Gomez','987654319',4,'B0C-324','45619347'),
('18197307','Maria','Cruz','Gomez','987654320',1,'D9M-498','17950163'),
('19678047','Sara','Lopez','Martinez','987654321',4,'W2P-284','19925903'),
('20556017','Maria','Cruz','Rodriguez','987654322',1,'BJO-002','46424187'),
('32912399','Juan','Hernandez','Garcia','987654323',4,'7018-1F','43188601'),
('32989853','Juan','Morales','Cruz','987654324',1,'AER-722','43955982'),
('40667433','Ana','Vargas','Vargas','987654325',4,'A2-0891','10117485'),
('42485185','Fernando','Quispe','Garcia','987654326',1,'B4K-615','15378415'),
('43151577','Claudia','Torres','Torres','987654327',4,'1763-0D','41303329'),
('43768204','Ana','Lopez','Perez','987654328',1,'D5W-484','48327841'),
('44078929','Pedro','Lopez','Vargas','987654329',4,'F2W-599','27684269'),
('44844940','Carlos','Quispe','Perez','987654330',1,'BOR-082','43042104'),
('45020441','Ricardo','Martinez','Hernandez','987654331',4,'V7I-941','06588389'),
('46989374','Ana','Martinez','Martinez','987654332',1,'A7V-084','16137642'),
('47250298','Diana','Mejia','Lopez','987654333',4,'B9M-603','16159557'),
('48542312','Laura','Gomez','Torres','987654334',1,'F8Z-476','16159640'),
('48557955','Ana','Rodriguez','Lopez','987654335',4,'ADN-166','43273556'),
('61155793','Rosa','Quispe','Garcia','987654336',1,'D6A-610','44305851'),
('18178519','Juan','Torres','Mejia','987654337',4,'NG-40675','45909930'),
('41914456','Rosa','Quispe','Garcia','987654338',1,'B5V-027','48318877'),
('40743760','Luis','Lopez','Cruz','987654339',4,'8773-2A','62809468'),
('42990649','Pedro','Castro','Morales','987654340',1,'D7T-107','44099915'),
('26700980','Andres','Rios','Martinez','987654341',4,'C1R-637','05348615'),
('41056221','Andres','Martinez','Rios','987654342',1,'B3E-448','05714749'),
('07072738','Ricardo','Rodriguez','Mejia','987654343',4,'BCV-538','44593742'),
('33590209','Luis','Castro','Rodriguez','987654344',1,'A3N-713','43589926'),
('45964039','Carmen','Mejia','Quispe','987654345',4,'BHH-277','27405193'),
('47608508','Andres','Gomez','Rios','987654346',1,'V1D-650','33578935'),
('19196739','Maria','Morales','Garcia','987654347',4,'F6R-920','70758789'),
('46867340','Juan','Rodriguez','Martinez','987654348',1,'0678-KA','27692460'),
('44020963','Andres','Mejia','Castro','987654349',4,'C9D-259','41337246'),
('46991575','Carmen','Morales','Martinez','987654350',1,'BBA-212','80143386'),
('48392100','Carmen','Rios','Lopez','987654351',4,'AJN-365','42562342'),
('45820986','Diana','Vargas','Hernandez','987654352',1,'4266-9C','45461502');


DROP TABLE IF EXISTS Empleado;
CREATE TABLE Empleado (
    DniEmpleado CHAR(8) PRIMARY KEY,
    Nombres VARCHAR(50) NOT NULL,
    ApePaterno VARCHAR(30) NOT NULL,
    ApeMaterno VARCHAR(30),
    Telefono VARCHAR(12),
    Direccion VARCHAR(60),
    PuestoID INT UNIQUE, -- Garantiza que un puesto no sea asignado a más de un empleado
    FOREIGN KEY (PuestoID) REFERENCES Puesto(PuestoID) ON DELETE CASCADE
);

INSERT INTO Empleado (DniEmpleado, Nombres, ApePaterno, ApeMaterno, Telefono, Direccion, PuestoID)
VALUES 
('12345678', 'Augusto', 'Urquiaga', 'Robles', '987654321', 'Av. Siempre Viva 123', 1), -- PuestoID = 1
('23456789', 'Victor', 'Urquiaga', 'Robles', '987654322', 'Jr. Las Flores 456', 2), -- PuestoID = 2
('45678901', 'Pedro', 'Fernández', 'Torres', '987654324', 'Pasaje Nuevo 321', 3); -- PuestoID = 3


DROP TABLE IF EXISTS Verificacion;
CREATE TABLE Verificacion (
    VerificacionID INT PRIMARY KEY AUTO_INCREMENT,
    FechaVerificacion DATE NOT NULL,
    Estado VARCHAR(20),
    Observaciones TEXT,
    Placa VARCHAR(10),
    DniEmpleado CHAR(8),
    FOREIGN KEY (Placa) REFERENCES Vehiculo(Placa) ON DELETE CASCADE,
    FOREIGN KEY (DniEmpleado) REFERENCES Empleado(DniEmpleado) ON DELETE CASCADE
);


DROP TABLE IF EXISTS Tarifa;
CREATE TABLE Tarifa (
    TarifaID INT PRIMARY KEY AUTO_INCREMENT,
    TipoVehiculoID INT,
    TiempoReservaID INT,
    Precio DECIMAL(6, 2) NOT NULL,
    FOREIGN KEY (TipoVehiculoID) REFERENCES TipoVehiculo(TipoVehiculoID) ON DELETE CASCADE,
    FOREIGN KEY (TiempoReservaID) REFERENCES TiempoReserva(TiempoReservaID) ON DELETE CASCADE
);

INSERT INTO Tarifa (TipoVehiculoID, TiempoReservaID, Precio) VALUES
(1, 1, 6.00),
(1, 2, 30.00),
(1, 3, 50.00),
(1, 4, 80.00),
(2, 1, 8.00),
(2, 2, 45.00),
(2, 3, 70.00),
(2, 4, 100.00),
(3, 1, 12.00),
(3, 2, 60.00),
(3, 3, 90.00),
(3, 4, 120.00),
(4, 1, 8.00),
(4, 2, 40.00),
(4, 3, 75.00),
(4, 4, 110.00),
(5, 1, 7.50),
(5, 2, 35.00),
(5, 3, 60.00),
(5, 4, 100.00);


DROP TABLE IF EXISTS CambioTarifa;
CREATE TABLE CambioTarifa (
    CambioTarifaID INT PRIMARY KEY AUTO_INCREMENT,
    FechaCambio DATE NOT NULL,
    PrecioAnterior DECIMAL(6, 2),
    NuevoPrecio DECIMAL(6, 2),
    Nota TEXT,
    TarifaID INT,
    FOREIGN KEY (TarifaID) REFERENCES Tarifa(TarifaID) ON DELETE CASCADE
);



DROP TABLE IF EXISTS Reserva;
CREATE TABLE Reserva (
    ReservaID INT PRIMARY KEY AUTO_INCREMENT,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL,
    DniCliente CHAR(8),
    Placa VARCHAR(10),
    EspacioID INT,
    FOREIGN KEY (DniCliente) REFERENCES Cliente(DniCliente) ON DELETE CASCADE,
    FOREIGN KEY (Placa) REFERENCES Vehiculo(Placa) ON DELETE CASCADE,
    FOREIGN KEY (EspacioID) REFERENCES EspacioEstacionamiento(EspacioID) ON DELETE CASCADE
);

INSERT INTO Reserva (FechaInicio, FechaFin, DniCliente, Placa, EspacioID) VALUES
('2024-09-01', '2024-09-03', '08373214', 'BAV-547', 12), -- #1
('2024-09-05', '2024-09-08', '18212331', 'A1F-041', 7), -- #2
('2024-09-10', '2024-09-15', '41570936', 'D0D-832', 18), -- #3
('2024-09-12', '2024-09-20', '43227158', 'D6V-204', 25), -- #4
('2024-09-22', '2024-09-25', '44713721', 'A2G-667', 9), -- #5
('2024-09-15', '2024-09-18', '45784840', 'D0M-033', 20), -- #6
('2024-09-23', '2024-09-25', '70221484', 'B3T-790', 15), -- #7
('2024-09-27', '2024-09-29', '70221486', 'ANT-643', 6), -- #8
('2024-09-30', '2024-10-01', '15374158', 'C0N-389', 1), -- #9
('2024-10-02', '2024-10-03', '41335958', 'M2R-565', 3), -- #10
('2024-09-05', '2024-09-10', '40318012', 'ATR-077', 21), -- #11
('2024-09-12', '2024-09-14', '05714548', 'C3R-130', 13), -- #12
('2024-10-01', '2024-10-05', '47510903', 'EO-4031', 24), -- #13
('2024-10-07', '2024-10-10', '47646968', 'ARV-372', 2), -- #14
('2024-10-12', '2024-10-15', '19426402', 'C4O-505', 11), -- #15
('2024-09-15', '2024-09-20', '07111614', 'F6T-925', 22), -- #16
('2024-10-22', '2024-10-25', '41528041', 'ARO-398', 5), -- #17
('2024-10-18', '2024-10-19', '44355605', 'BAQ-287', 16), -- #18
('2024-10-15', '2024-10-20', '45619347', 'B0C-324', 8), -- #19
('2024-10-02', '2024-10-08', '17950163', 'D9M-498',23), -- #20
('2024-10-08', '2024-10-12', '19925903', 'W2P-284',14), -- #21
('2024-09-03', '2024-09-06', '46424187', 'BJO-002', 19), -- #22
('2024-09-07', '2024-09-08', '43188601', '7018-1F', 3), -- #23
('2024-09-09', '2024-09-10', '43955982', 'AER-722', 20), -- #24
('2024-09-15', '2024-09-20', '10117485', 'A2-0891', 25), -- #25
('2024-09-21', '2024-09-24', '15378415', 'B4K-615', 5), -- #26
('2024-10-15', '2024-10-18', '41303329', '1763-0D', 22), -- #27
('2024-10-01', '2024-10-05', '48327841', 'D5W-484', 14), -- #28
('2024-10-10', '2024-10-15', '27684269', 'F2W-599', 8), -- #29
('2024-10-08', '2024-10-12', '43042104', 'BOR-082', 10), -- #30
('2024-10-20', '2024-10-23', '06588389', 'V7I-941', 9), -- #31
('2024-09-25', '2024-09-30', '16137642', 'A7V-084', 11), -- #32
('2024-09-02', '2024-09-04', '16159557', 'B9M-603', 17), -- #33
('2024-09-10', '2024-09-14', '16159640', 'F8Z-476', 2), -- #34
('2024-10-01', '2024-10-04', '43273556', 'ADN-166', 6), -- #35
('2024-10-07', '2024-10-10', '44305851', 'D6A-610', 18), -- #36
('2024-10-02', '2024-10-03', '45909930', 'NG-40675', 4), -- #37
('2024-09-20', '2024-09-22', '48318877', 'B5V-027', 15), -- #38
('2024-09-01', '2024-09-05', '62809468', '8773-2A', 1), -- #39
('2024-09-12', '2024-09-13',  '44099915', 'D7T-107', 23), -- #40
('2024-10-05', '2024-10-08',  '05348615', 'C1R-637', 13), -- #41
('2024-09-03', '2024-09-08',  '05714749', 'B3E-448', 21), -- #42
('2024-09-14', '2024-09-16',  '44593742', 'BCV-538', 9), -- #43
('2024-10-12', '2024-10-15',  '43589926', 'A3N-713', 12), -- #44
('2024-10-17', '2024-10-19', '27405193', 'BHH-277', 7), -- #45
('2024-10-22', '2024-10-25',  '33578935', 'V1D-650', 13), -- #46
('2024-09-18', '2024-09-20',  '70758789', 'F6R-920', 10), -- #47
('2024-09-20', '2024-09-22', '27692460', '0678-KA', 4), -- #48
('2024-10-05', '2024-10-08', '41337246', 'C9D-259', 11), -- #49
('2024-09-10', '2024-09-13', '80143386', 'BBA-212', 23), -- #50
('2024-09-08', '2024-09-11', '42562342', 'AJN-365', 1), -- #51
('2024-10-03', '2024-10-07', '45461502', '4266-9C', 5), -- #52
('2024-10-09', '2024-10-14', '73671062', 'A6J-587', 16), -- #53
('2024-09-22', '2024-09-25', '16674297', 'ASJ-463', 24), -- #54
('2024-10-10', '2024-10-15', '21121578', 'D4J-140', 3), -- #55
('2024-09-25', '2024-09-29', '48311789', 'B8Q-466', 25), -- #56
('2024-09-03', '2024-09-08', '19042017', 'Y1X-723', 15), -- #57
('2024-10-18', '2024-10-21', '47853488', 'C6Q-446', 6), -- #58
('2024-09-27', '2024-09-30', '60597705', 'D7E-665', 22), -- #59
('2024-09-15', '2024-09-20', '77053012', 'F2Q-419', 2), -- #60
('2024-09-12', '2024-09-14', '21007540', 'C6Q-773', 8), -- #61
('2024-10-02', '2024-10-07', '46814262', 'AZD-355', 19), -- #62
('2024-09-23', '2024-09-27', '10610445', 'C6P-662', 18), -- #63
('2024-09-19', '2024-09-24', '47070874', 'C9C-648', 14), -- #64
('2024-09-29', '2024-10-03', '40166530', 'T2B-711', 12), -- #65
('2024-09-17', '2024-09-20', '40095707', 'C2H-864', 22), -- #66
('2024-09-22', '2024-09-25', '47786149', 'ALM-228', 11), -- #67
('2024-10-14', '2024-10-18', '77910963', 'T4G-328', 9), -- #68
('2024-09-11', '2024-09-15', '80305185', 'M2F-277', 4), -- #69
('2024-09-05', '2024-09-08', '43612991', 'D7M-620', 14), -- #70
('2024-09-16', '2024-09-19', '15350977', 'D9E-727', 23), -- #71
('2024-09-07', '2024-09-10', '46541744', 'D3N-981', 3), -- #72
('2024-10-12', '2024-10-15', '80317750', 'BKR-240', 13), -- #73
('2024-10-02', '2024-10-06', '44876826', 'AWS-821', 15), -- #74
('2024-09-13', '2024-09-18', '45138823', 'LGK-132', 25), -- #75
('2024-09-11', '2024-09-14', '73464057', 'B2E-344', 8), -- #76
('2024-09-04', '2024-09-07', '44726257', 'D8H-081', 19), -- #77
('2024-10-08', '2024-10-11', '23531320', 'A3U-889', 7), -- #78
('2024-09-01', '2024-09-05', '71308790', 'C8G-249', 17), -- #79
('2024-09-10', '2024-09-14', '27981503', '5156-3F', 21), -- #80
('2024-09-08', '2024-09-13', '32740943', 'C9H-241',  20), -- #81
('2024-10-01', '2024-10-04',  '40879326', 'A4H-635',  18), -- #82
('2024-10-18', '2024-10-20',  '05407514', 'V1C-029',  6), -- #83
('2024-09-09', '2024-09-12', '40827047', 'B9K-678',  5), -- #84
('2024-10-03', '2024-10-06', '40890576', 'B0O-656',  10), -- #85
('2024-09-29', '2024-10-02', '72313010', 'A8R-696',  24), -- #86
('2024-10-13', '2024-10-16', '32304010', 'D5P-894',  9), -- #87
('2024-10-17', '2024-10-20', '44861146', 'A7S-671',  23), -- #88
('2024-09-14', '2024-09-18', '19966169', 'COT-269',  8), -- #89
('2024-09-19', '2024-09-22', '27751248', '7151-9D',  21), -- #90
('2024-09-03', '2024-09-07', '09505861', 'W2G-839', 20), -- #91
('2024-09-13', '2024-09-15', '44959991', 'AQN-806',  7), -- #92
('2024-09-21', '2024-09-23', '80390051', 'B6K-152', 5), -- #93
('2024-09-01', '2024-09-04',  '20582598', 'BJO-226',  4), -- #94
('2024-09-05', '2024-09-08', '44584430', 'C7R-335',  13), -- #95
('2024-09-10', '2024-09-12',  '20978067', 'AFG-506',  3), -- #96
('2024-09-15', '2024-09-20', '42455265', 'C6N-624',  17), -- #97
('2024-09-18', '2024-09-22', '46873967', 'F9W-066',  6), -- #98
('2024-09-25', '2024-09-28', '42679736', 'B6A-157', 19), -- #99
('2024-09-30', '2024-10-03', '46548468', 'BFF-505', 2), -- #100
('2024-10-05', '2024-10-09', '47566943', 'B8I-129', 22), -- #101
('2024-10-08', '2024-10-12', '27667081', 'AKM-297', 10), -- #102
('2024-10-13', '2024-10-17', '00972144', 'C2C-159', 24), -- #103
('2024-10-16', '2024-10-20', '42163555', 'F5F-878',  18), -- #104
('2024-10-19', '2024-10-22', '42356855', 'A4F-676', 11), -- #105
('2024-10-23', '2024-10-27', '47590142', 'A1S-815', 7), -- #106
('2024-10-26', '2024-10-30', '22520068', 'B0V-875', 14), -- #107
('2024-10-29', '2024-11-02', '45651208', 'ABF-868', 1), -- #108
('2024-09-02', '2024-09-05', '15593913', 'ACT-509', 8), -- #109
('2024-09-06', '2024-09-09', '45552364', 'AAT-286', 4), -- #110
('2024-09-11', '2024-09-14', '40371238', '3508-TA', 16), -- #111
('2024-09-13', '2024-09-16', '42588995', 'F5G-299', 20), -- #112
('2024-09-17', '2024-09-21',  '21845201', 'C9T-414', 12), -- #113
('2024-09-23', '2024-09-26', '23011781', '8696-3D',  15), -- #114
('2024-09-28', '2024-10-01',  '60567662', 'B1M-776',  5), -- #115
('2024-10-03', '2024-10-07',  '40480884', '4517-8D', 9), -- #116
('2024-10-10', '2024-10-14', '33655902', 'D8P-033', 21), -- #117
('2024-10-15', '2024-10-19',  '42031382', 'A6X-486',  3), -- #118
('2024-10-20', '2024-10-24',  '42140002', 'ARD-610',  25), -- #119
('2024-10-25', '2024-10-29', '42999704', 'ADI-698', 23), -- #120
('2024-10-30', '2024-11-03', '47270879', 'B8X-665', 13), -- #121
('2024-09-01', '2024-09-04', '43268113', 'B5W-511', 18), -- #122
('2024-09-08', '2024-09-11', '47420166', 'C2K-041',  6), -- #123
('2024-09-10', '2024-09-13', '70922379', 'A1L-648',  2), -- #124
('2024-09-15', '2024-09-19', '05853208', 'B1C-640', 24), -- #125
('2024-09-20', '2024-09-23', '40027974', 'A5Y-580', 9), -- #126
('2024-09-24', '2024-09-28', '05235889', 'C7Y-226',  4), -- #127
('2024-10-01', '2024-10-05', '48162592', 'ABR-306',  19), -- #128
('2024-10-06', '2024-10-09','04337153', '4058-QA', 16), -- #129
('2024-10-11', '2024-10-14', '23684906', 'V2Q-390',  22), -- #130
('2024-10-16', '2024-10-20', '33767599', 'AUZ-188',  10), -- #131
('2024-10-21', '2024-10-24', '47733751', 'D3N-029',  7), -- #132
('2024-10-25', '2024-10-29', '45888267', 'C7Y-587',  14), -- #133
('2024-09-03', '2024-09-07',  '18175573', 'C0U-932',  12), -- #134
('2024-09-09', '2024-09-12',  '44568452', 'M2X-690', 20), -- #135
('2024-09-14', '2024-09-17', '80676140', '3039-FA',  11), -- #136
('2024-09-18', '2024-09-22', '20884858', 'A2Y-665', 8), -- #137
('2024-09-23', '2024-09-26',  '20899911', 'ALS-285',  5), -- #138
('2024-09-29', '2024-10-03', '21536300', 'AOL-224',  21), -- #139
('2024-10-04', '2024-10-08', '45672470', 'ARF-473',  1), -- #140
('2024-10-09', '2024-10-13',  '03610346', 'C7D-058', 15), -- #141
('2024-10-14', '2024-10-17',  '42478638', 'A4I-254',  23), -- #142
('2024-10-18', '2024-10-21',  '72644786', 'AED-248', 9), -- #143
('2024-10-22', '2024-10-26',  '19039075', 'C9L-690',  13), -- #144
('2024-10-27', '2024-10-31', '27751618', 'AHÍ-140',  3), -- #145
('2024-09-01', '2024-09-05', '41860897', 'A8B-048', 19), -- #146
('2024-09-07', '2024-09-11', '45917029', 'AHO-743', 6), -- #147
('2024-09-12', '2024-09-15', '42227342', 'B0F-370',  2), -- #148
('2024-09-17', '2024-09-21',  '26717220', 'AWH-380',  18), -- #149
('2024-09-22', '2024-09-26', '48297246', 'C0V-658',  24), -- #150
('2024-09-27', '2024-10-01', '76693877', 'AUQ-285', 12), -- #151
('2024-10-02', '2024-10-05',  '43123135', 'W1R-844',  15), -- #152
('2024-10-06', '2024-10-10', '46590218', 'CQU-305', 8), -- #153
('2024-10-11', '2024-10-15',  '80348415', 'C5I-107',  21), -- #154
('2024-10-16', '2024-10-20',  '19079722', 'ANM-243',  5), -- #155
('2024-10-21', '2024-10-24', '32122197', 'D2L-645',  9), -- #156
('2024-10-25', '2024-10-29',  '10498425', 'A6X-544',  2), -- #157
('2024-10-30', '2024-11-03',  '45959147', 'D1A-614',  20), -- #158
('2024-11-04', '2024-11-08',  '15662432', 'AAN-765',  25), -- #159
('2024-11-09', '2024-11-12',  '48097099', 'BIY-198', 7), -- #160
('2024-11-13', '2024-11-16', '02686563', '4T-21137',  14), -- #161
('2024-11-17', '2024-11-21', '44213080', 'D9I-326', 18), -- #162
('2024-11-22', '2024-11-25',  '40830141', 'AXO-309',  6), -- #163
('2024-11-26', '2024-11-30', '46942418', 'C8Z-662',  19), -- #164
('2024-09-20', '2024-09-24', '80513924', 'AAD-525',  17), -- #165
('2024-09-25', '2024-09-29',  '27718429', 'AZW-099',  11), -- #166
('2024-09-30', '2024-10-03', '33654132', 'CQH-226',  13), -- #167
('2024-10-04', '2024-10-08',  '00870429', 'AYR-009',  4), -- #168
('2024-10-09', '2024-10-13', '40278433', 'C0A-621',  23), -- #169
('2024-10-14', '2024-10-18',  '44832677', '3842-UA',  3), -- #170
('2024-10-19', '2024-10-23', '47061220', 'C6J-854',  10), -- #171
('2024-10-24', '2024-10-28', '47951211', 'D3H-079',  16), -- #172
('2024-10-29', '2024-11-02', '10053995', 'F6H-851',  22), -- #173
('2024-11-03', '2024-11-07', '28841943', 'PQQ-926',  1), -- #174
('2024-11-08', '2024-11-12', '07419667', 'W1B-741',  24), -- #175
('2024-09-15', '2024-09-19',  '73463555', 'C2T-515',  13), -- #176
('2024-09-20', '2024-09-24', '07046118', 'AUD-020',  8), -- #177
('2024-09-25', '2024-09-28', '21078430', 'AWK-614',  19), -- #178
('2024-09-29', '2024-10-03',  '16128170', 'AFR-635', 6), -- #179
('2024-10-04', '2024-10-08', '16170036', 'C6C-202', 25), -- #180
('2024-10-09', '2024-10-13', '40270257', 'F3V-364', 15), -- #181
('2024-10-14', '2024-10-18', '44541329', 'D6M-419', 10), -- #182
('2024-10-19', '2024-10-23', '46279379', 'AGX-936', 20), -- #183
('2024-10-24', '2024-10-28', '46440673', 'D7E-081', 4), -- #184
('2024-10-29', '2024-11-02', '25716089', 'ABW-150', 11), -- #185
('2024-11-03', '2024-11-07', '27987293', 'D9T-374',  9), -- #186
('2024-11-08', '2024-11-12', '40858087', 'ANC-650', 2), -- #187
('2024-11-13', '2024-11-17', '46182290', 'C0F-263', 22), -- #188
('2024-11-18', '2024-11-22', '46756088', 'C9F-651', 12), -- #189
('2024-09-17', '2024-09-21', '75469843', 'BFU-094', 17), -- #190
('2024-09-22', '2024-09-26', '45659252', 'F9H-318', 7), -- #191
('2024-09-27', '2024-10-01', '40453760', 'D6A-622', 14), -- #192
('2024-10-02', '2024-10-06', '44590483', 'D4P-823', 21), -- #193
('2024-10-07', '2024-10-11', '48060122', 'AKX-099', 3), -- #194
('2024-10-12', '2024-10-16', '70590685', 'A6X-123', 5), -- #195
('2024-10-17', '2024-10-21', '19050001', 'C5E-518', 23), -- #196
('2024-10-22', '2024-10-26', '45755045', '0127-JA', 18), -- #197
('2024-10-27', '2024-10-31', '43460501', 'C7G-414', 24), -- #198
('2024-11-01', '2024-11-05', '33569453', 'AUY-299', 16), -- #199
('2024-11-06', '2024-11-10', '46495076', 'F3P-905', 1), -- #200
('2024-12-27', '2025-02-10', '85507880', 'M9C496', 19),
('2024-12-22', '2025-01-08', '21784509', 'BW2704', 19),
('2024-12-25', '2025-02-23', '33508748', '3BC404', 11),
('2024-12-06', '2025-05-05', '82173124', 'U5H337', 9),
('2024-12-09', '2025-03-24', '42221800', 'VTR035', 11),
('2024-12-07', '2024-12-29', '53190414', 'ADW898', 18),
('2024-12-27', '2025-02-01', '15149015', 'SE3404', 6),
('2024-12-22', '2025-01-09', '61730923', 'FXF914', 20),
('2024-12-19', '2025-02-03', '17262195', 'T19128', 11),
('2024-12-28', '2025-01-29', '31796676', 'NFI856', 18),
('2024-12-11', '2025-01-29', '35264303', 'N3D767', 25),
('2024-12-26', '2025-02-09', '78826091', 'DGK163', 8),
('2024-12-30', '2025-01-22', '44576437', 'PY9787', 1),
('2024-12-14', '2024-12-30', '48609464', 'FDC868', 15),
('2024-12-25', '2024-12-31', '83774128', 'HWK554', 9),
('2024-12-19', '2025-01-01', '75755179', '9QQ349', 7),
('2024-12-19', '2024-12-20', '48765966', 'EF6835', 5),
('2024-12-10', '2025-02-11', '61081959', 'FJF833', 5),
('2024-12-23', '2025-01-01', '75121331', 'BKD405', 5),
('2024-12-12', '2025-01-15', '27571055', 'WR0032', 16),
('2024-12-14', '2025-03-15', '53645467', 'FWT881', 15),
('2024-12-24', '2025-02-18', '37027732', '57B721', 8),
('2024-12-15', '2025-03-04', '12156481', 'X30066', 7),
('2024-12-06', '2025-01-11', '43191315', 'ABL525', 7),
('2024-12-29', '2025-03-09', '23823159', 'M8T192', 13),
('2024-12-15', '2025-02-01', '56635646', 'MZV479', 11),
('2024-12-08', '2025-02-13', '30556613', 'CLR285', 21),
('2024-12-12', '2025-02-25', '69062783', 'DFQ039', 7),
('2024-12-13', '2025-04-12', '14650246', 'JQP724', 13),
('2024-12-11', '2024-12-12', '68083084', 'W6N858', 6),
('2024-12-25', '2025-05-20', '13498027', 'PQZ956', 11),
('2024-12-27', '2025-01-30', '29368775', 'VP1994', 23),
('2025-01-02', '2025-01-20', '59227303', '4LC927', 20),
('2024-12-14', '2025-04-30', '19254938', 'B7X188', 24),
('2024-12-25', '2025-01-01', '62028466', 'C28892', 9),
('2024-12-29', '2025-03-05', '40248497', '2AY999', 9),
('2024-12-09', '2025-04-23', '55643884', 'RU4220', 16),
('2024-12-21', '2025-04-07', '31330198', 'PJ8006', 2),
('2024-12-20', '2025-05-18', '47740835', 'UIB587', 17),
('2024-12-21', '2025-01-30', '55528577', '1NE379', 12),
('2025-01-02', '2025-05-30', '68634980', 'KM8212', 12),
('2024-12-08', '2025-01-31', '29919565', '9GY181', 11),
('2025-01-02', '2025-03-24', '18449240', '1II006', 8),
('2024-12-30', '2025-01-19', '96179960', '9C7016', 20),
('2024-12-22', '2025-04-02', '89086171', 'VFC071', 4),
('2025-01-02', '2025-05-07', '64779600', 'S88644', 23),
('2024-12-23', '2025-04-14', '17893303', 'HQX425', 4),
('2024-12-09', '2025-01-28', '98703683', '9F6088', 10),
('2024-12-30', '2025-02-21', '36924684', 'AXL263', 12),
('2024-12-26', '2025-02-08', '84573022', 'VCW038', 23),

('2024-12-27', '2025-01-30', '84573022', 'D1R-267', 23),
('2024-11-02', '2025-01-20', '19426402', 'A8G-694', 20),
('2024-10-14', '2025-04-30', '07111614', 'B4Z-682', 24),
('2024-12-25', '2025-01-01', '41528041', 'Y1V-667', 5),
('2024-12-29', '2025-03-05', '44355605', 'A5A-695', 9),
('2024-12-09', '2024-12-23', '45619347', 'C7P-394', 16),
('2024-12-21', '2025-04-07', '17950163', 'VIM-661', 2),
('2024-12-20', '2025-05-18', '19925903', 'A1Y-738', 17),
('2024-12-21', '2025-01-30', '46424187', 'COM-267', 12),
('2024-09-02', '2025-05-30', '43955982', 'F2R-702', 1),
('2024-10-08', '2024-11-30', '10117485', 'BIT-346', 11),
('2024-11-02', '2025-03-24', '41303329', 'A1B-337', 8),
('2024-12-30', '2025-01-19', '43042104', 'D4B-311', 20),
('2024-11-22', '2024-12-02', '06588389', 'AVP-619', 4),
('2024-10-02', '2025-05-07', '42455265', 'C3S-493', 20),
('2024-10-23', '2025-01-14', '46548468', 'D5K-683', 4),
('2024-11-09', '2024-12-20', '27667081', 'ADG-639', 10),
('2024-09-30', '2025-02-21', '15378415', 'D4H-627', 12),
('2024-11-26', '2025-01-08', '17950163', 'AOC-027', 15),
('2024-12-09', '2024-12-23', '42163555', 'CQU-732', 16),
('2024-12-21', '2025-04-07', '22520068', 'C81-192', 2),
('2024-12-20', '2025-05-18', '16137642', 'B1W-965', 17),
('2024-12-21', '2025-01-30', '48327841', 'A2Q-547', 12),
('2024-09-02', '2025-05-30', '45651208', 'W2D-649', 12),
('2024-09-02', '2025-05-30', '42588995', 'ARS-526', 12)
;


DROP TABLE IF EXISTS Pago;
CREATE TABLE Pago (
    PagoID INT PRIMARY KEY AUTO_INCREMENT,
    FechaPago DATE NOT NULL,
    MetodoPagoID INT,
    ReservaID INT UNIQUE,
    TarifaID INT,
    Monto FLOAT,
    FOREIGN KEY (MetodoPagoID) REFERENCES MetodoPago(MetodoPagoID) ON DELETE CASCADE,
    FOREIGN KEY (ReservaID) REFERENCES Reserva(ReservaID) ON DELETE CASCADE,
    FOREIGN KEY (TarifaID) REFERENCES Tarifa(TarifaID) ON DELETE CASCADE
);

INSERT INTO Pago (FechaPago, MetodoPagoID, ReservaID, TarifaID, Monto) VALUES
('2024-07-09', 1, 1, 8, 100.0),
('2024-04-06', 3, 2, 11, 90.0),
('2024-02-14', 5, 3, 10, 60.0),
('2023-12-11', 3, 4, 9, 12.0),
('2024-04-02', 2, 5, 20, 100.0),
('2024-07-19', 3, 6, 9, 12.0),
('2024-09-10', 4, 7, 15, 75.0),
('2024-07-12', 5, 8, 17, 7.5),
('2024-05-08', 5, 9, 3, 50.0),
('2024-10-23', 5, 10, 2, 30.0),
('2024-07-02', 3, 11, 12, 120.0),
('2024-11-10', 3, 12, 13, 8.0),
('2024-04-26', 2, 13, 19, 60.0),
('2024-03-18', 4, 14, 20, 100.0),
('2024-11-23', 1, 15, 9, 12.0),
('2024-10-16', 2, 16, 13, 8.0),
('2024-10-06', 3, 17, 4, 80.0),
('2024-06-06', 1, 18, 1, 6.0),
('2023-12-18', 5, 19, 11, 90.0),
('2024-06-26', 2, 20, 15, 75.0),
('2024-06-02', 4, 21, 20, 100.0),
('2024-09-23', 4, 22, 13, 8.0),
('2024-02-19', 3, 23, 3, 50.0),
('2024-03-13', 5, 24, 8, 100.0),
('2024-03-03', 5, 25, 16, 110.0),
('2024-01-08', 1, 26, 1, 6.0),
('2024-05-09', 2, 27, 3, 50.0),
('2024-01-17', 4, 28, 3, 50.0),
('2024-04-16', 5, 29, 4, 80.0),
('2024-04-22', 1, 30, 11, 90.0),
('2024-07-04', 2, 31, 9, 12.0),
('2024-07-31', 4, 32, 12, 120.0),
('2023-12-25', 5, 33, 17, 7.5),
('2024-10-23', 1, 34, 15, 75.0),
('2024-06-08', 5, 35, 18, 35.0),
('2024-11-26', 2, 36, 7, 70.0),
('2024-09-12', 2, 37, 5, 8.0),
('2024-09-22', 5, 38, 8, 100.0),
('2024-01-15', 4, 39, 20, 100.0),
('2024-01-04', 5, 40, 20, 100.0),
('2024-03-21', 3, 41, 16, 110.0),
('2024-10-25', 4, 42, 19, 60.0),
('2024-09-19', 2, 43, 7, 70.0),
('2023-12-11', 2, 44, 3, 50.0),
('2024-11-13', 2, 45, 19, 60.0),
('2024-05-29', 1, 46, 16, 110.0),
('2024-05-17', 4, 47, 4, 80.0),
('2024-01-14', 3, 48, 13, 8.0),
('2024-07-11', 1, 49, 1, 6.0),
('2024-02-27', 3, 50, 11, 90.0),
('2024-02-16', 3, 51, 20, 100.0),
('2024-09-01', 5, 52, 7, 70.0),
('2024-05-24', 1, 53, 12, 120.0),
('2024-06-13', 1, 54, 2, 30.0),
('2024-09-06', 2, 55, 2, 30.0),
('2024-09-11', 5, 56, 5, 8.0),
('2024-09-05', 1, 57, 2, 30.0),
('2024-04-26', 4, 58, 10, 60.0),
('2024-11-04', 1, 59, 19, 60.0),
('2024-04-08', 2, 60, 5, 8.0),
('2024-01-29', 5, 61, 10, 60.0),
('2024-07-23', 5, 62, 17, 7.5),
('2024-12-01', 3, 63, 16, 110.0),
('2024-07-05', 3, 64, 16, 110.0),
('2024-01-15', 4, 65, 2, 30.0),
('2024-09-08', 2, 66, 15, 75.0),
('2024-04-17', 5, 67, 5, 8.0),
('2024-03-28', 5, 68, 14, 40.0),
('2024-10-11', 3, 69, 3, 50.0),
('2024-11-09', 4, 70, 4, 80.0),
('2024-04-28', 4, 71, 15, 75.0),
('2024-11-04', 3, 72, 17, 7.5),
('2024-04-20', 2, 73, 2, 30.0),
('2024-06-14', 1, 74, 20, 100.0),
('2024-08-24', 2, 75, 1, 6.0),
('2024-11-05', 4, 76, 12, 120.0),
('2024-07-19', 2, 77, 17, 7.5),
('2024-04-25', 4, 78, 17, 7.5),
('2024-10-07', 2, 79, 7, 70.0),
('2024-01-18', 4, 80, 6, 45.0),
('2024-01-09', 1, 81, 10, 60.0),
('2024-01-24', 1, 82, 4, 80.0),
('2024-09-12', 5, 83, 7, 70.0),
('2024-09-25', 3, 84, 19, 60.0),
('2024-11-03', 4, 85, 18, 35.0),
('2024-10-24', 5, 86, 6, 45.0),
('2024-03-14', 2, 87, 3, 50.0),
('2024-03-27', 4, 88, 1, 6.0),
('2024-09-10', 2, 89, 13, 8.0),
('2024-05-06', 3, 90, 17, 7.5),
('2024-03-16', 4, 91, 7, 70.0),
('2024-02-15', 3, 92, 19, 60.0),
('2023-12-08', 1, 93, 16, 110.0),
('2024-11-26', 1, 94, 17, 7.5),
('2024-02-07', 2, 95, 3, 50.0),
('2024-10-04', 5, 96, 19, 60.0),
('2024-06-13', 3, 97, 20, 100.0),
('2024-10-23', 3, 98, 18, 35.0),
('2023-12-09', 5, 99, 11, 90.0),
('2024-09-04', 5, 100, 10, 60.0),
('2024-04-23', 1, 101, 14, 40.0),
('2024-07-22', 4, 102, 4, 80.0),
('2024-02-18', 2, 103, 14, 40.0),
('2024-11-07', 1, 104, 2, 30.0),
('2024-02-03', 2, 105, 20, 100.0),
('2024-02-03', 5, 106, 15, 75.0),
('2024-05-22', 2, 107, 18, 35.0),
('2024-11-07', 2, 108, 20, 100.0),
('2024-11-17', 5, 109, 17, 7.5),
('2024-11-04', 4, 110, 7, 70.0),
('2024-03-14', 2, 111, 10, 60.0),
('2023-12-07', 5, 112, 15, 75.0),
('2024-04-06', 1, 113, 7, 70.0),
('2024-08-14', 3, 114, 6, 45.0),
('2024-08-09', 1, 115, 9, 12.0),
('2024-05-05', 1, 116, 18, 35.0),
('2024-05-26', 1, 117, 1, 6.0),
('2024-02-13', 1, 118, 7, 70.0),
('2024-07-21', 2, 119, 6, 45.0),
('2024-02-22', 1, 120, 4, 80.0),
('2024-11-10', 2, 121, 5, 8.0),
('2024-03-21', 4, 122, 13, 8.0),
('2024-03-31', 4, 123, 1, 6.0),
('2024-06-16', 1, 124, 17, 7.5),
('2024-02-28', 1, 125, 17, 7.5),
('2023-12-16', 5, 126, 10, 60.0),
('2024-07-31', 3, 127, 3, 50.0),
('2024-06-27', 3, 128, 10, 60.0),
('2024-03-26', 2, 129, 16, 110.0),
('2024-04-08', 5, 130, 9, 12.0),
('2024-02-05', 1, 131, 20, 100.0),
('2024-03-17', 5, 132, 4, 80.0),
('2024-10-29', 4, 133, 12, 120.0),
('2024-11-17', 1, 134, 5, 8.0),
('2024-10-27', 1, 135, 12, 120.0),
('2023-12-16', 4, 136, 15, 75.0),
('2023-12-24', 2, 137, 9, 12.0),
('2024-05-10', 5, 138, 19, 60.0),
('2024-01-06', 4, 139, 11, 90.0),
('2023-12-11', 3, 140, 18, 35.0),
('2024-05-10', 3, 141, 16, 110.0),
('2024-10-05', 5, 142, 7, 70.0),
('2024-07-19', 5, 143, 13, 8.0),
('2024-08-30', 4, 144, 19, 60.0),
('2024-06-17', 1, 145, 13, 8.0),
('2024-11-22', 2, 146, 12, 120.0),
('2024-03-30', 1, 147, 19, 60.0),
('2024-09-19', 5, 148, 19, 60.0),
('2024-04-28', 5, 149, 4, 80.0),
('2023-12-14', 2, 150, 5, 8.0),
('2024-10-29', 2, 151, 15, 75.0),
('2024-12-02', 2, 152, 6, 45.0),
('2024-01-07', 3, 153, 19, 60.0),
('2024-11-09', 3, 154, 20, 100.0),
('2024-01-02', 1, 155, 2, 30.0),
('2024-01-31', 2, 156, 19, 60.0),
('2024-03-17', 2, 157, 15, 75.0),
('2024-11-05', 2, 158, 5, 8.0),
('2024-06-02', 3, 159, 11, 90.0),
('2024-02-06', 3, 160, 17, 7.5),
('2024-04-22', 2, 161, 7, 70.0),
('2024-01-23', 5, 162, 1, 6.0),
('2024-07-03', 2, 163, 16, 110.0),
('2024-02-06', 2, 164, 2, 30.0),
('2024-08-05', 3, 165, 9, 12.0),
('2024-07-26', 1, 166, 10, 60.0),
('2024-10-20', 3, 167, 12, 120.0),
('2024-08-21', 3, 168, 13, 8.0),
('2024-02-05', 5, 169, 3, 50.0),
('2024-04-11', 1, 170, 7, 70.0),
('2024-08-31', 3, 171, 13, 8.0),
('2024-08-19', 1, 172, 12, 120.0),
('2024-01-20', 1, 173, 7, 70.0),
('2024-02-14', 1, 174, 7, 70.0),
('2024-04-02', 1, 175, 6, 45.0),
('2024-10-16', 4, 176, 11, 90.0),
('2024-08-12', 1, 177, 9, 12.0),
('2024-07-09', 4, 178, 19, 60.0),
('2024-04-10', 1, 179, 5, 8.0),
('2023-12-14', 1, 180, 14, 40.0),
('2024-05-24', 3, 181, 7, 70.0),
('2024-04-13', 5, 182, 1, 6.0),
('2023-12-05', 3, 183, 18, 35.0),
('2024-10-20', 5, 184, 17, 7.5),
('2024-07-26', 1, 185, 12, 120.0),
('2024-11-27', 5, 186, 4, 80.0),
('2024-04-16', 1, 187, 14, 40.0),
('2024-11-03', 2, 188, 11, 90.0),
('2024-02-13', 5, 189, 20, 100.0),
('2024-06-01', 4, 190, 6, 45.0),
('2024-04-16', 1, 191, 7, 70.0),
('2024-08-18', 3, 192, 18, 35.0),
('2024-03-19', 3, 193, 7, 70.0),
('2024-11-28', 3, 194, 20, 100.0),
('2024-05-14', 5, 195, 6, 45.0),
('2024-08-09', 1, 196, 1, 6.0),
('2024-06-06', 3, 197, 12, 120.0),
('2024-01-07', 1, 198, 9, 12.0),
('2024-10-23', 5, 199, 6, 45.0),
('2023-12-08', 4, 200, 6, 45.0),
('2024-09-11', 4, 201, 6, 45.0),
('2024-05-09', 2, 202, 7, 70.0),
('2023-12-07', 2, 203, 6, 45.0),
('2024-09-20', 5, 204, 12, 120.0),
('2024-07-21', 1, 205, 5, 8.0),
('2024-08-21', 3, 206, 2, 30.0),
('2024-04-03', 1, 207, 3, 50.0),
('2024-08-05', 3, 208, 6, 45.0),
('2024-04-02', 3, 209, 3, 50.0),
('2024-08-26', 5, 210, 7, 70.0),
('2024-05-28', 1, 211, 5, 8.0),
('2024-05-12', 2, 212, 20, 100.0),
('2024-04-28', 1, 213, 1, 6.0),
('2024-05-31', 5, 214, 14, 40.0),
('2024-03-14', 3, 215, 17, 7.5),
('2024-04-19', 2, 216, 12, 120.0),
('2024-04-23', 4, 217, 14, 40.0),
('2024-04-14', 1, 218, 6, 45.0),
('2024-06-05', 4, 219, 10, 60.0),
('2024-08-31', 4, 220, 4, 80.0),
('2024-05-04', 4, 221, 6, 45.0),
('2024-04-11', 3, 222, 5, 8.0),
('2024-08-31', 5, 223, 19, 60.0),
('2024-11-21', 5, 224, 16, 110.0),
('2024-12-04', 4, 225, 5, 8.0),
('2024-03-22', 3, 226, 8, 100.0),
('2023-12-25', 5, 227, 13, 8.0),
('2024-11-27', 5, 228, 12, 120.0),
('2024-10-18', 1, 229, 20, 100.0),
('2024-07-03', 4, 230, 19, 60.0),
('2024-01-08', 1, 231, 18, 35.0),
('2024-06-26', 2, 232, 19, 60.0),
('2024-08-05', 5, 233, 1, 6.0),
('2024-07-12', 4, 234, 5, 8.0),
('2024-05-24', 3, 235, 16, 110.0),
('2024-11-17', 1, 236, 14, 40.0),
('2024-09-01', 1, 237, 8, 100.0),
('2024-03-05', 1, 238, 3, 50.0),
('2024-03-27', 5, 239, 7, 70.0),
('2024-04-01', 2, 240, 1, 6.0),
('2024-11-19', 1, 241, 20, 100.0),
('2024-10-13', 3, 242, 2, 30.0),
('2024-05-14', 5, 243, 6, 45.0),
('2024-09-29', 4, 244, 6, 45.0),
('2024-01-07', 4, 245, 15, 75.0),
('2024-06-30', 3, 246, 11, 90.0),
('2024-09-28', 3, 247, 18, 35.0),
('2024-02-18', 4, 248, 1, 6.0),
('2024-11-01', 5, 249, 4, 80.0),
('2024-01-14', 5, 250, 12, 120.0),
('2024-12-27', 1, 251, 3, 50.0),
('2024-11-02', 3, 252, 6, 45.0),
('2024-10-14', 4, 253, 3, 50.0),
('2024-12-25', 5, 254, 7, 70.0),
('2024-12-29', 1, 255, 5, 8.0),
('2024-12-09', 2, 256, 20, 100.0),
('2024-12-21', 1, 257, 1, 6.0),
('2024-12-20', 5, 258, 14, 40.0),
('2024-12-21', 3, 259, 17, 7.5),
('2024-09-02', 2, 260, 12, 120.0),
('2024-10-08', 4, 261, 14, 40.0),
('2024-11-02', 1, 262, 6, 45.0),
('2024-12-30', 4, 263, 10, 60.0),
('2024-11-22', 5, 264, 4, 80.0),
('2024-10-03', 4, 265, 6, 45.0),
('2024-10-23', 3, 266, 5, 8.0),
('2024-11-09', 5, 267, 19, 60.0),
('2024-09-30', 4, 268, 16, 110.0),
('2024-11-26', 4, 269, 5, 8.0),
('2024-12-09', 3, 270, 8, 100.0),
('2024-12-21', 5, 271, 13, 8.0),
('2024-12-20', 5, 272, 12, 120.0),
('2024-12-21', 1, 273, 20, 100.0),
('2024-09-02', 2, 274, 19, 60.0),
('2024-09-02', 1, 275, 18, 35.0)
;

DROP TABLE IF EXISTS Reembolso;
CREATE TABLE Reembolso (
    ReembolsoID INT PRIMARY KEY AUTO_INCREMENT,
    FechaReembolso DATE NOT NULL,
    MontoReembolso DECIMAL(4, 2) NOT NULL,
    PagoID INT UNIQUE,
    FOREIGN KEY (PagoID) REFERENCES Pago(PagoID) ON DELETE CASCADE
);

INSERT INTO Reembolso (FechaReembolso, MontoReembolso, PagoID) VALUES 
('2024-01-15', 15.50, 1),
('2024-02-20', 25.00, 5),
('2024-03-10', 18.75, 10),
('2024-04-05', 12.30, 15),
('2024-05-12', 20.00, 20),
('2024-06-18', 22.50, 25),
('2024-07-22', 19.95, 30),
('2024-08-11', 24.40, 35),
('2024-09-07', 13.70, 40),
('2024-10-01', 21.00, 45),
('2024-10-25', 16.80, 50),
('2024-11-30', 27.50, 55),
('2024-12-10', 15.00, 60),
('2025-01-02', 23.20, 65),
('2025-02-14', 14.95, 70),
('2025-03-22', 18.25, 75),
('2025-04-18', 19.30, 80),
('2025-05-11', 26.00, 85),
('2025-06-01', 22.15, 90),
('2025-07-04', 17.80, 95);


DROP TABLE IF EXISTS Devolucion;
CREATE TABLE Devolucion (
    DevolucionID INT PRIMARY KEY AUTO_INCREMENT,
    FechaDevolucion DATE NOT NULL,
    MontoDevolucion DECIMAL(4, 2) NOT NULL,
    PagoID INT UNIQUE,
    FOREIGN KEY (PagoID) REFERENCES Pago(PagoID) ON DELETE CASCADE
);

INSERT INTO Devolucion (FechaDevolucion, MontoDevolucion, PagoID) VALUES 
('2024-01-10', 10.50, 2),
('2024-02-18', 12.30, 6),
('2024-03-12', 15.00, 11),
('2024-04-09', 20.45, 16),
('2024-05-15', 25.60, 21),
('2024-06-22', 18.40, 26),
('2024-07-18', 14.75, 31),
('2024-08-15', 19.25, 36),
('2024-09-10', 21.30, 41),
('2024-10-08', 16.50, 46),
('2024-11-01', 13.80, 51),
('2024-12-25', 17.60, 56),
('2025-01-03', 22.45, 61),
('2025-02-17', 20.00, 66),
('2025-03-24', 15.90, 71),
('2025-04-29', 19.00, 76),
('2025-05-20', 24.80, 81),
('2025-06-14', 23.00, 86),
('2025-07-05', 18.65, 91),
('2025-08-03', 27.10, 96);

DROP TABLE IF EXISTS HistorialVehiculo;
CREATE TABLE HistorialVehiculo (
    HistorialID INT PRIMARY KEY AUTO_INCREMENT,
    FechaSalida DATETIME NOT NULL,
    FechaIngreso DATETIME,
    Placa VARCHAR(10),
    FOREIGN KEY (Placa) REFERENCES Vehiculo(Placa) ON DELETE CASCADE
);

UPDATE Reserva
SET FechaInicio = '2023-12-10', FechaFin = '2024-03-15'
WHERE ReservaID IN (209, 218, 221, 223);  

UPDATE Reserva
SET FechaInicio = '2024-01-10', FechaFin = '2024-01-21'
WHERE ReservaID IN (224, 226); 

UPDATE Reserva
SET FechaInicio = '2024-07-10', FechaFin = '2024-09-21'
WHERE ReservaID IN (228, 237, 242);   


SET SQL_SAFE_UPDATES = 0;

UPDATE Pago p
JOIN Reserva r ON p.ReservaID = r.ReservaID
SET p.FechaPago = r.FechaInicio;

UPDATE EspacioEstacionamiento ee
SET ee.Estado = 'Ocupado'
WHERE ee.EspacioID IN (
    SELECT r.EspacioID
    FROM Reserva r
    WHERE r.FechaFin >= '2024-12-20'
      AND r.FechaInicio <= '2024-12-19'
);
SET SQL_SAFE_UPDATES = 1;

INSERT INTO HistorialVehiculo (FechaIngreso, FechaSalida, Placa)
SELECT FechaInicio, FechaFin, Placa
FROM Reserva;






select * from historialvehiculo;
--    CONSULTAS SQL  ---

select count(*) from cliente;
select count(*) from reserva;
select count(*) from vehiculo;


-- CONSULTA 1
-- -----------------------------------------

-- PROCEDIMIENTO

DROP PROCEDURE IF EXISTS ObtenerEspaciosDisponibles;
DELIMITER //

CREATE PROCEDURE ObtenerEspaciosDisponibles(
    IN fecha_consulta DATE
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        -- Si ocurre un error, se revierte la transacción
        ROLLBACK;
    END;
    START TRANSACTION;
    SELECT 
        ee.EspacioID AS espacio_id,
        te.TipoEspacio AS tipo_espacio,
        CASE 
            WHEN te.TipoEspacio = 'Estandar' THEN 'Hatchback, Camioneta, Sedan, Station Wagon'
            WHEN te.TipoEspacio = 'Motocicleta' THEN 'Motocicleta'
            WHEN te.TipoEspacio = 'Especial' THEN 'Hatchback, Camioneta, Sedan, Station Wagon, Motocicleta'
            ELSE 'No especificado'
        END AS descripcion_vehiculo
    FROM 
        EspacioEstacionamiento ee
    INNER JOIN 
        TipoEspacio te ON ee.TipoEspacioID = te.TipoEspacioID
    LEFT JOIN 
        Reserva r ON ee.EspacioID = r.EspacioID 
                   AND fecha_consulta BETWEEN r.FechaInicio AND r.FechaFin 
    WHERE 
        ee.Estado = 'Disponible' 
        AND r.ReservaID IS NULL; 
END //

DELIMITER ;

CALL ObtenerEspaciosDisponibles('2024-11-07');



-- 2) CONSULTA
-- -----------------------------------------------
-- PROCEDIMIENTO
DROP PROCEDURE IF EXISTS ObtenerReservasPorCliente;

DELIMITER //

CREATE PROCEDURE ObtenerReservasPorCliente(
    IN fecha_inicio DATE,
    IN fecha_fin DATE
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        -- Si ocurre un error, se revierte la transacción
        ROLLBACK;
    END;
    START TRANSACTION;
    SELECT 
        V.Placa AS PlacaVehiculo,
        C.Nombres AS NombreCliente,
        C.ApePaterno AS ApellidoPaterno,
        C.ApeMaterno AS ApellidoMaterno,
        CC.Clase AS ClaseCliente,
        TV.Tipo AS TipoVehiculo,
        SUM(DATEDIFF(R.FechaFin, R.FechaInicio)) + 1 AS DiasTotalesReserva,
        R.FechaInicio AS FechaInicioReserva,
        R.FechaFin AS FechaFinReserva
    FROM 
        Reserva R
    INNER JOIN Vehiculo V ON R.Placa = V.Placa
    INNER JOIN TipoVehiculo TV ON V.TipoVehiculoID = TV.TipoVehiculoID
    INNER JOIN Cliente C ON R.DniCliente = C.DniCliente
    INNER JOIN ClaseCliente CC ON C.ClaseClienteID = CC.ClaseClienteID
    WHERE 
        R.FechaInicio >= fecha_inicio AND R.FechaFin <= fecha_fin
    GROUP BY 
        V.Placa, C.Nombres, C.ApePaterno, C.ApeMaterno, CC.Clase, TV.Tipo, R.FechaInicio, R.FechaFin
    ORDER BY 
        V.Placa, R.FechaInicio;

    COMMIT;
END //

DELIMITER ;

-- Llamada al procedimiento
CALL ObtenerReservasPorCliente('2024-01-01', '2024-12-31');





-- 3) CONSULTA
-- ----------------------------

-- PROCEDIMIENTO
DROP PROCEDURE IF EXISTS ObtenerReservasOcupadas;

DELIMITER //

CREATE PROCEDURE ObtenerReservasOcupadas(
    IN fecha_inicio DATE
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        -- Si ocurre un error, se revierte la transacción
        ROLLBACK;
    END;

    START TRANSACTION;

    SELECT 
        C.Nombres AS NombreCliente,
        C.ApePaterno AS ApellidoPaterno,
        C.ApeMaterno AS ApellidoMaterno,
        CC.Clase AS ClaseCliente,
        V.Placa AS PlacaVehiculo,
        R.FechaInicio AS FechaInicioReserva,
        R.FechaFin AS FechaFinReserva,
        -- Cálculo de los días totales de reserva
        DATEDIFF(R.FechaFin, R.FechaInicio) + 1 AS DiasTotalesReserva,
        -- Cálculo de la tarifa total sin descuento
        (T.Precio * DATEDIFF(R.FechaFin, R.FechaInicio)) AS TarifaTotal,
        -- Cálculo de Ingreso Total con descuento aplicado
        ROUND((T.Precio * DATEDIFF(R.FechaFin, R.FechaInicio)) * (1 - CC.Descuento), 2) AS IngresoTotal,
        
        -- Control de la clase según los días totales de reserva
        CASE 
            WHEN DATEDIFF(R.FechaFin, R.FechaInicio) > 60 THEN
                CASE 
                    WHEN CC.Clase = 'Oro' THEN 'Mantiene'
                    ELSE 'Sube'
                END
            WHEN DATEDIFF(R.FechaFin, R.FechaInicio) BETWEEN 30 AND 60 THEN
                'Mantiene'
            WHEN DATEDIFF(R.FechaFin, R.FechaInicio) < 30 THEN
                CASE 
                    WHEN CC.Clase = 'Oro' THEN 'Baja'
                    WHEN CC.Clase = 'Plata' THEN 'Baja'
                    WHEN CC.Clase = 'Bronce' THEN 'Baja'
                    ELSE 'Baja'
                END
        END AS ControlClaseCliente

    FROM 
        Reserva R
    INNER JOIN EspacioEstacionamiento EE ON R.EspacioID = EE.EspacioID
    INNER JOIN Cliente C ON R.DniCliente = C.DniCliente
    INNER JOIN ClaseCliente CC ON C.ClaseClienteID = CC.ClaseClienteID
    INNER JOIN Vehiculo V ON R.Placa = V.Placa
    INNER JOIN TipoVehiculo TV ON V.TipoVehiculoID = TV.TipoVehiculoID
    INNER JOIN Tarifa T ON T.TipoVehiculoID = TV.TipoVehiculoID
    INNER JOIN TiempoReserva TR ON T.TiempoReservaID = TR.TiempoReservaID
    WHERE 
        CC.Clase IN ('Oro', 'Plata') 
        AND EE.Estado = 'Ocupado'
        AND TR.TiempoReservaID = 1 -- Solo tarifas diarias
        AND R.FechaInicio >= fecha_inicio  -- Filtrar solo reservas desde la fecha de inicio pasada como parámetro
    GROUP BY 
        C.Nombres, C.ApePaterno, C.ApeMaterno, CC.Clase, V.Placa, R.FechaInicio, R.FechaFin, T.Precio, CC.Descuento
    ORDER BY 
        V.Placa, R.FechaInicio;

    COMMIT;
END //

DELIMITER ;


CALL ObtenerReservasOcupadas('2024-12-01');



-- 4) CONSULTA
-- ----------------------------------------

DROP PROCEDURE IF EXISTS MostrarGananciasYReservas;

DELIMITER $$

CREATE PROCEDURE MostrarGananciasYReservas(
    IN fecha DATE
)
BEGIN
    -- Consulta que muestra solo los espacios con reservas en diciembre del año de la fecha pasada como parámetro
    SELECT 
        EE.EspacioID AS EspacioEstacionamiento,
        TE.TipoEspacio,
        COUNT(R.ReservaID) AS TotalReservas,
        SUM(P.Monto) AS GananciaGeneradaPorDia
    FROM 
        Reserva R
    INNER JOIN Pago P ON R.ReservaID = P.ReservaID
    INNER JOIN EspacioEstacionamiento EE ON R.EspacioID = EE.EspacioID
    INNER JOIN TipoEspacio TE ON EE.TipoEspacioID = TE.TipoEspacioID
    WHERE 
        MONTH(R.FechaInicio) = 12  -- Filtra solo las reservas del mes de diciembre
        AND YEAR(R.FechaInicio) = YEAR(fecha)  -- Filtra por el año de la fecha pasada como parámetro
    GROUP BY 
        EE.EspacioID, TE.TipoEspacio
    ORDER BY 
        GananciaGeneradaPorDia DESC;

    -- Consulta que muestra los espacios de estacionamiento, incluyendo los que no tuvieron pago registrado
    SELECT 
        EE.EspacioID AS EspacioEstacionamiento,
        TE.TipoEspacio,
        COUNT(R.ReservaID) AS TotalReservas,
        SUM(P.Monto) AS GananciaGeneradaPorDia
    FROM 
        Reserva R
    LEFT JOIN Pago P ON R.ReservaID = P.ReservaID  -- Cambio a LEFT JOIN para incluir reservas sin pago
    INNER JOIN EspacioEstacionamiento EE ON R.EspacioID = EE.EspacioID
    INNER JOIN TipoEspacio TE ON EE.TipoEspacioID = TE.TipoEspacioID
    WHERE 
        MONTH(R.FechaInicio) = 12  -- Filtra solo las reservas del mes de diciembre
        AND YEAR(R.FechaInicio) = YEAR(fecha)  -- Filtra por el año de la fecha pasada como parámetro
    GROUP BY 
        EE.EspacioID, TE.TipoEspacio
    ORDER BY 
        GananciaGeneradaPorDia DESC;
END $$

DELIMITER ;

-- Llamada al procedimiento con fecha especificada
CALL MostrarGananciasYReservas('2024-12-01');



select * from reserva;


-- 5) CONSUOTA
-- ----------------------------------------
-- Procedimiento

DROP PROCEDURE IF EXISTS CalcularEspaciosYPerdidas;
DELIMITER $$

CREATE PROCEDURE CalcularEspaciosYPerdidas(
    IN FechaInicio DATE,
    IN FechaFin DATE
)
BEGIN
    SELECT 
        TV.Tipo AS TipoVehiculo,
        TE.TipoEspacio AS TipoEspacio,
        ROUND(COUNT(DISTINCT R.ReservaID) / COUNT(DISTINCT EE.EspacioID), 2) AS PromedioEspaciosOcupados,  -- Redondeado a 2 decimales
        ROUND(SUM(P.Monto), 2) AS IngresoTotalGenerado,  -- Redondeamos el IngresoTotalGenerado
        CASE
            WHEN ROUND(SUM(P.Monto), 2) >= 2600 THEN 'Rentable'
            ELSE 'Supervision'
        END AS Rentabilidad  -- Nueva columna con la subconsulta para la rentabilidad
    FROM 
        EspacioEstacionamiento EE
    JOIN 
        TipoEspacio TE ON EE.TipoEspacioID = TE.TipoEspacioID
    LEFT JOIN 
        Reserva R ON EE.EspacioID = R.EspacioID AND R.FechaInicio BETWEEN FechaInicio AND FechaFin
    LEFT JOIN 
        Vehiculo V ON R.Placa = V.Placa
    LEFT JOIN 
        TipoVehiculo TV ON V.TipoVehiculoID = TV.TipoVehiculoID
    LEFT JOIN 
        Tarifa T ON TV.TipoVehiculoID = T.TipoVehiculoID
    LEFT JOIN 
        Pago P ON R.ReservaID = P.ReservaID
    GROUP BY 
        TV.Tipo, TE.TipoEspacio
    ORDER BY 
        TV.Tipo, TE.TipoEspacio;
END $$

DELIMITER ;

-- Llamada al procedimiento con fechas especificadas
CALL CalcularEspaciosYPerdidas('2024-01-01', '2024-12-28');


    
-- CONSULTA 6
-- --------------------------------------------------

SELECT 
    c.DniCliente AS cliente_id,
    CONCAT(c.Nombres, ' ', c.ApePaterno, ' ', c.ApeMaterno) AS cliente_nombre,
    cc.Clase AS clase_cliente,
    COUNT(r.ReservaID) AS reservas_realizadas,
    SUM(t.Precio) AS monto_total_sin_descuento,
    CASE 
        WHEN cc.Clase = 'Bronce' THEN 10
        WHEN cc.Clase = 'Plata' THEN 20
        WHEN cc.Clase = 'Oro' THEN 25
        ELSE 0
    END AS descuento_aplicado,
    SUM(t.Precio * (1 - 
        CASE 
            WHEN cc.Clase = 'Bronce' THEN 0.10
            WHEN cc.Clase = 'Plata' THEN 0.20
            WHEN cc.Clase = 'Oro' THEN 0.25
            ELSE 0
        END)) AS monto_facturado
FROM 
    Reserva r
INNER JOIN 
    Cliente c ON r.DniCliente = c.DniCliente
LEFT JOIN 
    ClaseCliente cc ON c.ClaseClienteID = cc.ClaseClienteID
INNER JOIN 
    Pago p ON r.ReservaID = p.ReservaID
INNER JOIN 
    Tarifa t ON p.TarifaID = t.TarifaID
WHERE 
    r.FechaInicio BETWEEN 
        DATE_FORMAT(NOW() - INTERVAL 3 MONTH, '%Y-%m-01') AND CURDATE() -- Último trimestre
GROUP BY 
    c.DniCliente, c.Nombres, c.ApePaterno, c.ApeMaterno, cc.Clase
ORDER BY 
    monto_facturado DESC;


    
    
-- Procedimiento

DELIMITER $$

CREATE PROCEDURE RentabilidadClienteUltimoTrimestre()
BEGIN
    SELECT 
        c.DniCliente AS cliente_id,
        CONCAT(c.Nombres, ' ', c.ApePaterno, ' ', c.ApeMaterno) AS cliente_nombre,
        cc.Clase AS clase_cliente,
        COUNT(r.ReservaID) AS reservas_realizadas,
        SUM(t.Precio) AS monto_total_sin_descuento,
        CASE 
            WHEN cc.Clase = 'Bronce' THEN 10
            WHEN cc.Clase = 'Plata' THEN 20
            WHEN cc.Clase = 'Oro' THEN 25
            ELSE 0
        END AS descuento_aplicado,
        SUM(t.Precio * (1 - 
            CASE 
                WHEN cc.Clase = 'Bronce' THEN 0.10
                WHEN cc.Clase = 'Plata' THEN 0.20
                WHEN cc.Clase = 'Oro' THEN 0.25
                ELSE 0
            END)) AS monto_facturado
    FROM 
        Reserva r
    INNER JOIN 
        Cliente c ON r.DniCliente = c.DniCliente
    LEFT JOIN 
        ClaseCliente cc ON c.ClaseClienteID = cc.ClaseClienteID
    INNER JOIN 
        Pago p ON r.ReservaID = p.ReservaID
    INNER JOIN 
        Tarifa t ON p.TarifaID = t.TarifaID
    WHERE 
        r.FechaInicio BETWEEN 
            DATE_FORMAT(NOW() - INTERVAL 3 MONTH, '%Y-%m-01') AND CURDATE() -- Último trimestre
    GROUP BY 
        c.DniCliente, c.Nombres, c.ApePaterno, c.ApeMaterno, cc.Clase
    ORDER BY 
        monto_facturado DESC;
END $$

DELIMITER ;

CALL RentabilidadClienteUltimoTrimestre();

    
-- CONSULTA 7
-- -----------------------------------------------------------
SELECT  
    tv.Tipo AS tipo_vehiculo,  
    CASE  
        WHEN HOUR(hv.FechaIngreso) BETWEEN 0 AND 5 THEN 'Madrugada (00:00-05:59)'  
        WHEN HOUR(hv.FechaIngreso) BETWEEN 6 AND 11 THEN 'Mañana (06:00-11:59)'  
        WHEN HOUR(hv.FechaIngreso) BETWEEN 12 AND 17 THEN 'Tarde (12:00-17:59)'  
        ELSE 'Noche (18:00-23:59)'  
    END AS horario,  
    COUNT(DISTINCT r.ReservaID) AS numero_reservas,  
    COUNT(DISTINCT ee.EspacioID) AS espacios_utilizados,  
    ROUND(COUNT(DISTINCT r.ReservaID) / COUNT(DISTINCT ee.EspacioID) * 100, 2) AS tasa_ocupacion_promedio  
FROM  
    EspacioEstacionamiento ee  
JOIN  
    TipoEspacio te ON ee.TipoEspacioID = te.TipoEspacioID  
LEFT JOIN  
    Reserva r ON ee.EspacioID = r.EspacioID AND r.FechaInicio BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 1 DAY)  
JOIN  
    Vehiculo v ON r.Placa = v.Placa  
JOIN  
    TipoVehiculo tv ON v.TipoVehiculoID = tv.TipoVehiculoID  
LEFT JOIN  
    HistorialVehiculo hv ON r.Placa = hv.Placa  -- Removed condition on FechaIngreso/FechaSalida  
WHERE  
    r.FechaInicio BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 1 DAY)  
GROUP BY  
    tipo_vehiculo, horario  
ORDER BY  
    tipo_vehiculo, horario;
    

DELIMITER //

CREATE PROCEDURE ObtenerTasaOcupacion()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Rollback en caso de error
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ocurrió un error durante la transacción';
    END;

    -- Inicia la transacción
    START TRANSACTION;

    -- Inserta los resultados de la consulta en una tabla temporal o devuelve los datos directamente
    SELECT  
        tv.Tipo AS tipo_vehiculo,  
        CASE  
            WHEN HOUR(hv.FechaIngreso) BETWEEN 0 AND 5 THEN 'Madrugada (00:00-05:59)'  
            WHEN HOUR(hv.FechaIngreso) BETWEEN 6 AND 11 THEN 'Mañana (06:00-11:59)'  
            WHEN HOUR(hv.FechaIngreso) BETWEEN 12 AND 17 THEN 'Tarde (12:00-17:59)'  
            ELSE 'Noche (18:00-23:59)'  
        END AS horario,  
        COUNT(DISTINCT r.ReservaID) AS numero_reservas,  
        COUNT(DISTINCT ee.EspacioID) AS espacios_utilizados,  
        ROUND(COUNT(DISTINCT r.ReservaID) / COUNT(DISTINCT ee.EspacioID) * 100, 2) AS tasa_ocupacion_promedio  
    FROM  
        EspacioEstacionamiento ee  
    JOIN  
        TipoEspacio te ON ee.TipoEspacioID = te.TipoEspacioID  
    LEFT JOIN  
        Reserva r ON ee.EspacioID = r.EspacioID AND r.FechaInicio BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 1 DAY)  
    JOIN  
        Vehiculo v ON r.Placa = v.Placa  
    JOIN  
        TipoVehiculo tv ON v.TipoVehiculoID = tv.TipoVehiculoID  
    LEFT JOIN  
        HistorialVehiculo hv ON r.Placa = hv.Placa  
    WHERE  
        r.FechaInicio BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 1 DAY)  
    GROUP BY  
        tipo_vehiculo, horario  
    ORDER BY  
        tipo_vehiculo, horario;

    -- Commit la transacción si todo fue exitoso
    COMMIT;
END //

DELIMITER ;

CALL ObtenerTasaOcupacion();




-- CONSULTA 8
-- ----------------------------------------------------------
DELIMITER //

CREATE PROCEDURE ObtenerReservasPendientes()
BEGIN
    SELECT 
        C.DniCliente,
        C.Nombres,
        C.ApePaterno,
        C.ApeMaterno,
        R.ReservaID,
        R.FechaInicio,
        R.FechaFin,
        T.Precio AS Tarifa,
        P.Monto AS PagoRealizado
    FROM 
        Reserva R
    JOIN 
        Cliente C ON R.DniCliente = C.DniCliente
    LEFT JOIN 
        Pago P ON R.ReservaID = P.ReservaID
    LEFT JOIN 
        Tarifa T ON P.TarifaID = T.TarifaID
    WHERE 
        R.FechaInicio >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH) 
        AND (P.Monto IS NULL OR P.Monto < T.Precio);
END //

DELIMITER ;


drop procedure ObtenerReservasPendientes;

DELIMITER //

CREATE PROCEDURE ObtenerReservasPendientes()
BEGIN
    DECLARE done INT DEFAULT 0;

    START TRANSACTION;

    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
            ROLLBACK;

        SELECT 
            C.DniCliente,
            C.Nombres,
            C.ApePaterno,
            C.ApeMaterno,
            R.ReservaID,
            R.FechaInicio,
            R.FechaFin,
            T.Precio AS Tarifa,
            IFNULL(P.Monto, 0) AS PagoRealizado
        FROM 
            Reserva R
        JOIN 
            Cliente C ON R.DniCliente = C.DniCliente
        LEFT JOIN 
            Pago P ON R.ReservaID = P.ReservaID
        LEFT JOIN 
            Tarifa T ON P.TarifaID = T.TarifaID
        WHERE 
            R.FechaInicio >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH) 
            AND (P.Monto IS NULL OR P.Monto < T.Precio);

        COMMIT;
    END;

    IF done = 0 THEN
        ROLLBACK;
    END IF;
END //

DELIMITER ;



CALL ObtenerReservasPendientes();


    
-- CONSULTA 9
--  ----------------------------------------------

SET @FechaInicio = '2024-01-01';
SET @FechaFin = '2024-12-28';

SELECT 
    TE.TipoEspacio AS TipoEspacio,
    EE.EspacioID AS ID_Espacio,
    COUNT(R.ReservaID) AS NumeroReservas,
    ROUND(SUM(TIMESTAMPDIFF(HOUR, R.FechaInicio, R.FechaFin)) / 
          (TIMESTAMPDIFF(HOUR, @FechaInicio, @FechaFin) * COUNT(DISTINCT EE.EspacioID)) * 100, 2) AS TasaOcupacionPorcentaje,
    ROUND(SUM(P.Monto), 2) AS IngresoPromedio
FROM 
    EspacioEstacionamiento EE
JOIN 
    TipoEspacio TE ON EE.TipoEspacioID = TE.TipoEspacioID
LEFT JOIN 
    Reserva R ON EE.EspacioID = R.EspacioID AND R.FechaInicio BETWEEN @FechaInicio AND @FechaFin
LEFT JOIN 
    Pago P ON R.ReservaID = P.ReservaID
WHERE 
    R.FechaInicio BETWEEN @FechaInicio AND @FechaFin
GROUP BY 
    EE.EspacioID, TE.TipoEspacio
ORDER BY 
    TE.TipoEspacio, ID_Espacio;


-- Procedimiento almacenado
DELIMITER $$

CREATE PROCEDURE CalcularTasaOcupacionYIngresos(
    IN FechaInicio DATE,
    IN FechaFin DATE
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        -- Si ocurre un error, se revierte la transacción
        ROLLBACK;
    END;
    START TRANSACTION;
    SELECT
        TE.TipoEspacio AS TipoEspacio,
        EE.EspacioID AS ID_Espacio,
        COUNT(R.ReservaID) AS NumeroReservas,
        ROUND(SUM(TIMESTAMPDIFF(HOUR, R.FechaInicio, R.FechaFin)) / 
              (TIMESTAMPDIFF(HOUR, FechaInicio, FechaFin) * COUNT(DISTINCT EE.EspacioID)) * 100, 2) AS TasaOcupacionPorcentaje,
        ROUND(SUM(P.Monto), 2) AS IngresoPromedio
    FROM 
        EspacioEstacionamiento EE
    JOIN 
        TipoEspacio TE ON EE.TipoEspacioID = TE.TipoEspacioID
    LEFT JOIN 
        Reserva R ON EE.EspacioID = R.EspacioID AND R.FechaInicio BETWEEN FechaInicio AND FechaFin
    LEFT JOIN 
        Pago P ON R.ReservaID = P.ReservaID
    WHERE 
        R.FechaInicio BETWEEN FechaInicio AND FechaFin
    GROUP BY 
        EE.EspacioID, TE.TipoEspacio
    ORDER BY 
        TE.TipoEspacio, ID_Espacio;
END $$

DELIMITER ;

CALL CalcularTasaOcupacionYIngresos('2024-01-01', '2024-12-28');



-- CONSULTA 10
-- ----------------------------

DROP PROCEDURE IF EXISTS ObtenerVehiculosSalidaNoviembre;
DELIMITER $$

CREATE PROCEDURE ObtenerVehiculosSalidaNoviembre(
    IN TipoVehiculoNombre VARCHAR(30),
    IN Mes INT,
    IN Anio INT
)
BEGIN
    SELECT 
        V.Placa,
        TV.Tipo,
        HV.FechaIngreso,
        HV.FechaSalida
    FROM 
        Vehiculo V
    JOIN 
        TipoVehiculo TV ON V.TipoVehiculoID = TV.TipoVehiculoID
    JOIN 
        HistorialVehiculo HV ON V.Placa = HV.Placa
    WHERE 
        TV.Tipo = TipoVehiculoNombre
        AND MONTH(HV.FechaSalida) = Mes
        AND YEAR(HV.FechaSalida) = Anio;
END$$

DELIMITER ;

CALL ObtenerVehiculosSalidaNoviembre('Camioneta', 11, 2024);



select count(*) from reserva;
select count(*) from cliente;
select count(*) from vehiculo;



    
-- INSERT INTO EspacioEstacionamiento (TipoEspacioID, Estado) VALUES (1, 'Ocupado');
-- INSERT INTO Reserva (FechaInicio, FechaFin,DniCliente, EspacioID) VALUES ('2024-11-01', '2024-12-01', '42436474',1);
-- INSERT INTO Tarifa (TipoVehiculoID, TiempoReservaID, Precio) VALUES (1, 1, 50.00);
-- INSERT INTO Pago (FechaPago, MetodoPagoID, ReservaID, TarifaID, Monto) VALUES ('2024-12-02', 1, 1, 1, 30.00);
    
 -- Logeo


DELIMITER //

CREATE PROCEDURE Login(
    IN dni CHAR(8),
    IN nombre VARCHAR(30),
    OUT result BOOLEAN
)
BEGIN
    DECLARE puesto VARCHAR(30);

    START TRANSACTION;

    -- Verificar si existe un empleado con los datos proporcionados
    SELECT Puesto.Puesto
    INTO puesto
    FROM Empleado
    JOIN Puesto ON Empleado.PuestoID = Puesto.PuestoID
    WHERE Empleado.DniEmpleado = dni AND Empleado.nombres= nombre;

    IF puesto IS NOT NULL THEN
        -- DEBUG: Confirmar qué valor encontró
        SELECT 'Puesto encontrado:', puesto;
        SET result = TRUE;
        COMMIT;
    ELSE
        -- DEBUG: Indicar que no encontró un resultado
        SELECT 'No se encontró coincidencia';
        SET result = FALSE;
        ROLLBACK;
    END IF;
END //

DELIMITER ;



    

    