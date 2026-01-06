# Base de Datos HospitalIntegrador 🏥

Este repositorio contiene el script SQL para la creación y el poblado de la base de datos **HospitalIntegrador**, diseñada como un proyecto integrador para modelar el funcionamiento básico de un sistema hospitalario.

La base de datos incluye entidades clave como departamentos, médicos, pacientes, citas médicas, medicamentos y prescripciones, así como sus relaciones.

---

## 📌 Descripción General

**HospitalIntegrador** es una base de datos relacional que permite:

- Administrar departamentos hospitalarios
- Registrar médicos y sus especialidades
- Gestionar pacientes
- Controlar citas médicas
- Manejar medicamentos y prescripciones
- Representar relaciones uno a muchos y muchos a muchos

El script incluye tanto la **definición de la estructura (DDL)** como el **poblado de datos (DML)**, con más de 100 tuplas para pruebas y consultas.

---

## 🗂️ Estructura de la Base de Datos

### 1. Departamentos
Almacena la información de los departamentos del hospital.

| Campo | Tipo | Descripción |
|------|------|-------------|
| id_depto | INT (PK) | Identificador del departamento |
| nombre_depto | VARCHAR(50) | Nombre del departamento |
| piso | INT | Piso donde se ubica |
| presupuesto_anual | DECIMAL(15,2) | Presupuesto asignado |

---

### 2. Médicos
Contiene los datos del personal médico.

| Campo | Tipo |
|------|------|
| id_medico | INT (PK) |
| nombre | VARCHAR(100) |
| especialidad | VARCHAR(50) |
| id_depto | INT (FK) |
| salario | DECIMAL(10,2) |
| categoria | VARCHAR(50) |

**Relación:**  
- Un médico pertenece a un departamento.

---

### 3. Pacientes
Registra la información básica de los pacientes.

| Campo | Tipo |
|------|------|
| id_paciente | INT (PK) |
| nombre | VARCHAR(100) |
| edad | INT |
| genero | VARCHAR(20) |
| telefono | VARCHAR(20) |

---

### 4. Citas
Gestiona las citas médicas entre pacientes y médicos.

| Campo | Tipo |
|------|------|
| id_cita | INT (PK) |
| fecha | DATE |
| hora | TIME |
| id_paciente | INT (FK) |
| id_medico | INT (FK) |
| motivo | VARCHAR(100) |

**Relaciones:**  
- Un paciente puede tener muchas citas  
- Un médico puede atender muchas citas  

---

### 5. Medicamentos
Contiene el catálogo de medicamentos disponibles.

| Campo | Tipo |
|------|------|
| id_medicamento | INT (PK) |
| nombre | VARCHAR(100) |
| precio | DECIMAL(10,2) |
| stock | INT |

---

### 6. Prescripciones
Tabla intermedia que representa una relación **muchos a muchos** entre citas y medicamentos.

| Campo | Tipo |
|------|------|
| id_prescripcion | INT (PK) |
| id_cita | INT (FK) |
| id_medicamento | INT (FK) |
| dosis | VARCHAR(50) |

---

