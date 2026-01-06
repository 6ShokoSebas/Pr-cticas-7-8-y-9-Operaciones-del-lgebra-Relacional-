CREATE DATABASE HospitalIntegrador;
USE HospitalIntegrador;

-- 1. Departamentos
CREATE TABLE Departamentos (
    id_depto INT PRIMARY KEY,
    nombre_depto VARCHAR(50),
    piso INT,
    presupuesto_anual DECIMAL(15,2)
);

-- 2. Medicos
CREATE TABLE Medicos (
    id_medico INT PRIMARY KEY,
    nombre VARCHAR(100),
    especialidad VARCHAR(50),
    id_depto INT,
    salario DECIMAL(10,2),
    FOREIGN KEY (id_depto) REFERENCES Departamentos(id_depto)
);

-- 3. Pacientes
CREATE TABLE Pacientes (
    id_paciente INT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_nacimiento DATE,
    ciudad VARCHAR(50),
    genero CHAR(1)
);

-- 4. Habitaciones
CREATE TABLE Habitaciones (
    num_habitacion INT PRIMARY KEY,
    tipo VARCHAR(20),
    costo_diario DECIMAL(10,2),
    estado VARCHAR(15) -- 'Ocupada', 'Libre'
);

-- 5. Citas
CREATE TABLE Citas (
    id_cita INT PRIMARY KEY,
    id_paciente INT,
    id_medico INT,
    fecha_cita DATETIME,
    motivo VARCHAR(200),
    num_habitacion INT,
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico),
    FOREIGN KEY (num_habitacion) REFERENCES Habitaciones(num_habitacion)
);

-- 6. Tratamientos
CREATE TABLE Tratamientos (
    id_tratamiento INT PRIMARY KEY,
    nombre_tratamiento VARCHAR(100),
    costo_base DECIMAL(10,2)
);

-- 7. Medicamentos
CREATE TABLE Medicamentos (
    id_medicamento INT PRIMARY KEY,
    nombre_comercial VARCHAR(100),
    stock INT,
    categoria VARCHAR(50)
);

-- 8. Prescripciones (Relación Muchos a Muchos)
CREATE TABLE Prescripciones (
    id_prescripcion INT PRIMARY KEY,
    id_cita INT,
    id_medicamento INT,
    dosis VARCHAR(50),
    FOREIGN KEY (id_cita) REFERENCES Citas(id_cita),
    FOREIGN KEY (id_medicamento) REFERENCES Medicamentos(id_medicamento)
);

-- POBLADO DE DATOS (Resumen para alcanzar 100+ tuplas)
INSERT INTO Departamentos VALUES (1, 'Cardiología', 1, 1000000), (2, 'Pediatría', 2, 800000), (3, 'Urgencias', 1, 2000000), (4, 'Neurología', 3, 1200000);
INSERT INTO Medicos VALUES (101, 'Dr. House', 'Nefrología', 4, 15000), (102, 'Dra. Grey', 'Cirugía', 3, 12000), (103, 'Dr. Strange', 'Neurología', 4, 20000), (104, 'Dr. Shaun Murphy', 'Cirugía', 3, 11000);
USE HospitalIntegrador;
-- =============================================
-- 1. DEPARTAMENTOS (6 más, Total: 10)
-- =============================================
INSERT INTO Departamentos VALUES 
(5, 'Oncología', 4, 2500000.00),
(6, 'Ginecología', 2, 950000.00),
(7, 'Dermatología', 3, 600000.00),
(8, 'Psiquiatría', 5, 1100000.00),
(9, 'Radiología', 1, 3000000.00),
(10, 'Rehabilitación', 0, 500000.00);

-- =============================================
-- 2. MEDICOS (16 más, Total: 20)
-- =============================================
INSERT INTO Medicos VALUES 
(105, 'Dr. Hannibal Lecter', 'Psiquiatría', 8, 18000.00),
(106, 'Dra. Dana Scully', 'Patología', 3, 14000.00),
(107, 'Dr. John Watson', 'Medicina General', 3, 9000.00),
(108, 'Dr. Kenzo Tenma', 'Neurocirugía', 4, 22000.00),
(109, 'Dra. Addison Montgomery', 'Ginecología', 6, 17500.00),
(110, 'Dr. Eric Foreman', 'Neurología', 4, 13000.00),
(111, 'Dr. Robert Chase', 'Cuidados Intensivos', 3, 12500.00),
(112, 'Dra. Allison Cameron', 'Inmunología', 3, 12000.00),
(113, 'Dr. Wilson', 'Oncología', 5, 16000.00),
(114, 'Dra. Cuddy', 'Administración Médica', 1, 19000.00),
(115, 'Dr. Christian Troy', 'Cirugía Plástica', 7, 25000.00),
(116, 'Dr. Sean McNamara', 'Cirugía Plástica', 7, 24000.00),
(117, 'Dr. Doug Ross', 'Urgencias', 3, 11500.00),
(118, 'Dr. Christopher Turk', 'Cirugía', 3, 10500.00),
(119, 'Dr. Perry Cox', 'Medicina Interna', 3, 14500.00),
(120, 'Dr. JD Dorian', 'Medicina Interna', 3, 8500.00);

-- =============================================
-- 3. PACIENTES (30 registros)
-- =============================================
INSERT INTO Pacientes VALUES 
(1, 'Juan Pérez', '1985-05-20', 'CDMX', 'M'),
(2, 'María García', '1992-08-15', 'Guadalajara', 'F'),
(3, 'Luis Rodríguez', '1970-12-01', 'Monterrey', 'M'),
(4, 'Ana Martínez', '2000-01-10', 'Puebla', 'F'),
(5, 'Carlos López', '1995-03-25', 'Cancún', 'M'),
(6, 'Elena Sánchez', '1988-11-30', 'CDMX', 'F'),
(7, 'Roberto Gómez', '1965-07-14', 'Querétaro', 'M'),
(8, 'Lucía Fernández', '2010-02-18', 'Guadalajara', 'F'),
(9, 'Ricardo Toral', '1993-09-09', 'Toluca', 'M'),
(10, 'Sofía Castro', '1980-04-05', 'Mérida', 'F'),
(11, 'Diego Luna', '1991-06-22', 'CDMX', 'M'),
(12, 'Fernanda Islas', '1998-10-12', 'Monterrey', 'F'),
(13, 'Gabriel Sosa', '1975-01-30', 'Pachuca', 'M'),
(14, 'Jimena Ruíz', '2005-05-05', 'Veracruz', 'F'),
(15, 'Hugo Boss', '1982-12-12', 'León', 'M'),
(16, 'Paola Nuñez', '1990-03-03', 'Tijuana', 'F'),
(17, 'Arturo Elías', '1960-08-20', 'CDMX', 'M'),
(18, 'Beatriz Aurora', '1978-11-11', 'Oaxaca', 'F'),
(19, 'Claudio X', '1984-02-28', 'Puebla', 'M'),
(20, 'Daniela Romo', '1996-07-07', 'Zacatecas', 'F'),
(21, 'Esteban Quito', '2001-09-15', 'Chihuahua', 'M'),
(22, 'Fabiola Campomanes', '1989-12-25', 'Morelia', 'F'),
(23, 'Gerardo Ortiz', '1994-10-10', 'Mazatlán', 'M'),
(24, 'Hilda Gaxiola', '1972-04-14', 'Hermosillo', 'F'),
(25, 'Iván Noble', '1981-01-01', 'Aguascalientes', 'M'),
(26, 'Jessica Alba', '1997-05-19', 'CDMX', 'F'),
(27, 'Kevin Arnold', '2003-06-06', 'Guadalajara', 'M'),
(28, 'Laura Bozzo', '1968-03-20', 'CDMX', 'F'),
(29, 'Mario Bros', '1983-11-13', 'Monterrey', 'M'),
(30, 'Norma Palafox', '1999-10-14', 'Sonora', 'F');

-- =============================================
-- 4. HABITACIONES (15 registros)
-- =============================================
INSERT INTO Habitaciones VALUES 
(101, 'Individual', 1500.00, 'Ocupada'),
(102, 'Individual', 1500.00, 'Libre'),
(103, 'Compartida', 800.00, 'Ocupada'),
(104, 'Compartida', 800.00, 'Libre'),
(201, 'Suite', 3500.00, 'Ocupada'),
(202, 'Suite', 3500.00, 'Libre'),
(301, 'UCI', 5000.00, 'Ocupada'),
(302, 'UCI', 5000.00, 'Ocupada'),
(401, 'Individual', 1600.00, 'Libre'),
(402, 'Individual', 1600.00, 'Ocupada'),
(501, 'Psiquiátrica', 2000.00, 'Ocupada'),
(502, 'Psiquiátrica', 2000.00, 'Libre'),
(601, 'Recuperación', 1200.00, 'Libre'),
(602, 'Recuperación', 1200.00, 'Ocupada'),
(701, 'VIP', 10000.00, 'Libre');

-- =============================================
-- 5. TRATAMIENTOS (10 registros)
-- =============================================
INSERT INTO Tratamientos VALUES 
(1, 'Quimioterapia Sesión', 5000.00),
(2, 'Diálisis', 3500.00),
(3, 'Fisioterapia', 600.00),
(4, 'Cirugía General', 15000.00),
(5, 'Consulta Especialista', 800.00),
(6, 'Radiografía', 450.00),
(7, 'Resonancia Magnética', 2500.00),
(8, 'Terapia Psicológica', 700.00),
(9, 'Parto Natural', 12000.00),
(10, 'Check-up Completo', 4000.00);

-- =============================================
-- 6. MEDICAMENTOS (10 registros)
-- =============================================
INSERT INTO Medicamentos VALUES 
(801, 'Paracetamol 500mg', 500, 'Analgésico'),
(802, 'Ibuprofeno 400mg', 300, 'Antiinflamatorio'),
(803, 'Amoxicilina 500mg', 200, 'Antibiótico'),
(804, 'Insulina Glargina', 50, 'Diabetes'),
(805, 'Omeprazol 20mg', 400, 'Gastrointestinal'),
(806, 'Losartán 50mg', 250, 'Hipertensión'),
(807, 'Fluoxetina 20mg', 150, 'Antidepresivo'),
(808, 'Atorvastatina 20mg', 180, 'Colesterol'),
(809, 'Salbutamol Spray', 100, 'Respiratorio'),
(810, 'Metformina 850mg', 350, 'Diabetes');

-- =============================================
-- 7. CITAS (20 registros)
-- =============================================
INSERT INTO Citas VALUES 
(501, 1, 101, '2023-10-01 09:00:00', 'Dolor abdominal agudo', 101),
(502, 2, 109, '2023-10-01 10:30:00', 'Control prenatal', NULL),
(503, 3, 103, '2023-10-02 11:00:00', 'Migraña crónica', 201),
(504, 4, 102, '2023-10-02 12:00:00', 'Cirugía de vesícula', 103),
(505, 5, 113, '2023-10-03 08:00:00', 'Seguimiento oncología', 301),
(506, 6, 115, '2023-10-03 16:00:00', 'Evaluación rinoplastia', NULL),
(507, 7, 107, '2023-10-04 09:00:00', 'Gripe severa', NULL),
(508, 8, 102, '2023-10-04 10:00:00', 'Revisión pediátrica', NULL),
(509, 9, 117, '2023-10-05 22:00:00', 'Fractura de brazo', 602),
(510, 10, 105, '2023-10-06 14:00:00', 'Sesión de terapia', NULL),
(511, 11, 108, '2023-10-06 15:00:00', 'Dolor lumbar', 302),
(512, 12, 109, '2023-10-07 09:00:00', 'Check-up femenino', NULL),
(513, 13, 119, '2023-10-07 11:00:00', 'Fatiga crónica', 101),
(514, 14, 112, '2023-10-08 13:00:00', 'Alergia estacional', NULL),
(515, 15, 111, '2023-10-08 17:00:00', 'Dificultad respiratoria', 402),
(516, 16, 104, '2023-10-09 08:30:00', 'Post-operatorio', NULL),
(517, 17, 120, '2023-10-09 10:00:00', 'Examen de sangre', NULL),
(518, 18, 110, '2023-10-10 12:00:00', 'Adormecimiento de manos', NULL),
(519, 19, 103, '2023-10-10 13:00:00', 'Visión borrosa', NULL),
(520, 20, 105, '2023-10-11 11:00:00', 'Trastorno del sueño', 501);

-- =============================================
-- 8. PRESCRIPCIONES (15 registros)
-- =============================================
INSERT INTO Prescripciones VALUES 
(901, 501, 805, '1 cada 24 horas por 10 días'),
(902, 501, 801, '1 cada 8 horas si hay dolor'),
(903, 503, 801, '500mg cada 6 horas'),
(904, 505, 803, '500mg cada 12 horas por 7 días'),
(905, 507, 801, 'Cada 8 horas por 3 días'),
(906, 509, 802, '400mg cada 8 horas'),
(907, 510, 807, '1 tableta al día'),
(908, 513, 810, '1 con el desayuno'),
(909, 514, 809, '2 disparos cada 8 horas'),
(910, 515, 804, '10 unidades antes de dormir'),
(911, 518, 806, '1 tableta al día'),
(912, 520, 807, '1 tableta noche'),
(913, 504, 802, 'Para inflamación post-op'),
(914, 502, 801, 'Solo si hay molestia'),
(915, 511, 808, '1 tableta noche');

USE HospitalIntegrador;

-- ==========================================================
-- 1. OPERADORES BÁSICOS (Selección, Proyección, Unión)
-- ==========================================================

-- Q1: Nombres de pacientes que viven en 'CDMX'
SELECT nombre FROM Pacientes WHERE ciudad = 'CDMX';

-- Q2: IDs de médicos que trabajan en el depto 3 o 4 (UNION es soportado)
SELECT id_medico FROM Medicos WHERE id_depto = 3 
UNION 
SELECT id_medico FROM Medicos WHERE id_depto = 4;

-- Q3: Ciudades donde viven pacientes pero no hay departamentos con ese nombre (Simulación de EXCEPT)
SELECT DISTINCT ciudad FROM Pacientes 
WHERE ciudad NOT IN (SELECT nombre_depto FROM Departamentos);

-- Q4: Médicos especialistas en 'Cirugía' con salario > 12000 (Simulación de INTERSECT)
SELECT * FROM Medicos 
WHERE especialidad = 'Cirugía' AND salario > 12000;

-- Q5: Nombres de medicamentos de la categoría 'Analgésico'
SELECT nombre_comercial FROM Medicamentos WHERE categoria = 'Analgésico';


-- ==========================================================
-- 2. REUNIONES (JOINs)
-- ==========================================================

-- Q6: Nombre del médico y nombre de su departamento
SELECT M.nombre, D.nombre_depto 
FROM Medicos M 
INNER JOIN Departamentos D ON M.id_depto = D.id_depto;

-- Q7: Todos los departamentos y sus médicos (Left Join)
SELECT D.nombre_depto, M.nombre AS nombre_medico 
FROM Departamentos D 
LEFT JOIN Medicos M ON D.id_depto = M.id_depto;

-- Q8: Todas las habitaciones y las citas asociadas (Right Join)
SELECT H.num_habitacion, C.id_cita, C.motivo 
FROM Citas C 
RIGHT JOIN Habitaciones H ON C.num_habitacion = H.num_habitacion;

-- Q9: Nombre del paciente y motivo de su cita (JOIN explícito)
SELECT P.nombre, C.motivo 
FROM Pacientes P 
INNER JOIN Citas C ON P.id_paciente = C.id_paciente;

-- Q10: Medicamentos recetados en cada cita con su dosis
SELECT M.nombre_comercial, P.dosis 
FROM Medicamentos M 
INNER JOIN Prescripciones P ON M.id_medicamento = P.id_medicamento;


-- ==========================================================
-- 3. AGRUPACIÓN Y AGREGACIÓN
-- ==========================================================

-- Q11: Salario total pagado por departamento
SELECT id_depto, SUM(salario) AS nomina_total 
FROM Medicos 
GROUP BY id_depto;

-- Q12: Cantidad de pacientes por ciudad
SELECT ciudad, COUNT(*) AS total_pacientes 
FROM Pacientes 
GROUP BY ciudad;

-- Q13: Salario máximo en el hospital
SELECT MAX(salario) AS salario_mas_alto FROM Medicos;

-- Q14: Presupuesto total de todos los departamentos
SELECT SUM(presupuesto_anual) AS presupuesto_global FROM Departamentos;

-- Q15: Promedio de costo base de los tratamientos
SELECT AVG(costo_base) AS costo_promedio_tratamiento FROM Tratamientos;


-- ==========================================================
-- 4. DIVISIÓN (Lógica para MySQL con Doble Negación)
-- ==========================================================

-- Q16: Pacientes que han tenido citas con TODOS los médicos del depto 4
SELECT P.id_paciente, P.nombre 
FROM Pacientes P 
WHERE NOT EXISTS (
    SELECT M.id_medico FROM Medicos M WHERE M.id_depto = 4
    AND M.id_medico NOT IN (
        SELECT C.id_medico FROM Citas C WHERE C.id_paciente = P.id_paciente
    )
);

-- Q17: Médicos que han recetado TODOS los medicamentos de la categoría 'Diabetes'
SELECT M.id_medico, M.nombre 
FROM Medicos M 
WHERE NOT EXISTS (
    SELECT Med.id_medicamento FROM Medicamentos Med WHERE Med.categoria = 'Diabetes'
    AND Med.id_medicamento NOT IN (
        SELECT Pr.id_medicamento FROM Prescripciones Pr 
        INNER JOIN Citas C ON Pr.id_cita = C.id_cita 
        WHERE C.id_medico = M.id_medico
    )
);

-- Q18: Pacientes que se han hospedado en TODAS las habitaciones tipo 'Suite'
SELECT P.id_paciente, P.nombre 
FROM Pacientes P 
WHERE NOT EXISTS (
    SELECT H.num_habitacion FROM Habitaciones H WHERE H.tipo = 'Suite'
    AND H.num_habitacion NOT IN (
        SELECT C.num_habitacion FROM Citas C WHERE C.id_paciente = P.id_paciente AND C.num_habitacion IS NOT NULL
    )
);


-- ==========================================================
-- 5. CUANTIFICADORES UNIVERSALES
-- ==========================================================

-- Q19: Departamentos donde TODOS sus médicos ganan más de 10,000
SELECT * FROM Departamentos D 
WHERE D.id_depto IN (SELECT id_depto FROM Medicos) -- Que tengan al menos un médico
AND NOT EXISTS (
    SELECT * FROM Medicos M 
    WHERE M.id_depto = D.id_depto AND M.salario <= 10000
);

-- Q20: Médicos cuyas citas han sido TODAS en el piso 1 (Habitaciones 100-199)
SELECT * FROM Medicos M 
WHERE id_medico IN (SELECT id_medico FROM Citas) -- Que tengan al menos una cita
AND NOT EXISTS (
    SELECT * FROM Citas C 
    JOIN Habitaciones H ON C.num_habitacion = H.num_habitacion
    WHERE C.id_medico = M.id_medico 
    AND (H.num_habitacion < 100 OR H.num_habitacion >= 200)
);