# Base de Datos HospitalIntegrador 🏥

Por: Jimenez Serrano & Bonilla Ojeda

Este repositorio contiene el script SQL para la creación y el poblado de la base de datos **HospitalIntegrador**, diseñada como un proyecto integrador para modelar el funcionamiento básico de un sistema hospitalario.

La base de datos permite gestionar pacientes, médicos, departamentos, citas médicas, tratamientos, medicamentos, habitaciones y prescripciones, manteniendo integridad referencial entre todas las entidades.

---

## 📌 Descripción General

**HospitalIntegrador** es una base de datos relacional orientada a un entorno hospitalario académico que permite:

- Administrar departamentos y personal médico
- Registrar pacientes
- Gestionar citas médicas
- Controlar tratamientos y prescripciones
- Administrar medicamentos y stock
- Llevar control de habitaciones hospitalarias

El script incluye:
- **DDL**: creación de base de datos, tablas y relaciones
- **DML**: inserción de datos de prueba (más de 100 registros)

---

## 🗂️ Estructura de la Base de Datos

### 1. Departamentos

| Campo | Tipo | Descripción |
|------|------|-------------|
| id_depto | INT (PK) | Identificador del departamento |
| nombre_depto | VARCHAR(50) | Nombre del departamento |
| piso | INT | Piso donde se ubica |
| presupuesto_anual | DECIMAL(15,2) | Presupuesto asignado |

---

### 2. Medicos

| Campo | Tipo |
|------|------|
| id_medico | INT (PK) |
| nombre | VARCHAR(100) |
| especialidad | VARCHAR(50) |
| salario | DECIMAL(10,2) |
| categoria | VARCHAR(50) |
| id_depto | INT (FK) |

**Relación:**  
Un departamento puede tener varios médicos.

---

### 3. Pacientes

| Campo | Tipo |
|------|------|
| id_paciente | INT (PK) |
| nombre | VARCHAR(100) |
| edad | INT |
| genero | VARCHAR(20) |
| telefono | VARCHAR(20) |

---

### 4. Habitaciones

Almacena la información de las habitaciones disponibles en el hospital.

| Campo | Tipo |
|------|------|
| id_habitacion | INT (PK) |
| tipo | VARCHAR(50) |
| piso | INT |
| disponible | BOOLEAN |

**Función:**  
Controlar la disponibilidad y tipo de habitaciones hospitalarias.

---

### 5. Citas

Gestiona las citas médicas entre pacientes y médicos.

| Campo | Tipo |
|------|------|
| id_cita | INT (PK) |
| fecha | DATE |
| hora | TIME |
| motivo | VARCHAR(100) |
| id_paciente | INT (FK) |
| id_medico | INT (FK) |

**Relaciones:**  
- Un paciente puede tener múltiples citas  
- Un médico puede atender múltiples citas  

---

### 6. Tratamientos

Registra los tratamientos asignados a los pacientes tras una cita médica.

| Campo | Tipo |
|------|------|
| id_tratamiento | INT (PK) |
| descripcion | VARCHAR(200) |
| duracion_dias | INT |
| id_cita | INT (FK) |

---

### 7. Medicamentos

Contiene el catálogo de medicamentos disponibles en el hospital.

| Campo | Tipo |
|------|------|
| id_medicamento | INT (PK) |
| nombre | VARCHAR(100) |
| precio | DECIMAL(10,2) |
| stock | INT |

---

### 8. Prescripciones

Tabla intermedia que implementa una relación **muchos a muchos** entre citas y medicamentos.

| Campo | Tipo |
|------|------|
| id_prescripcion | INT (PK) |
| id_cita | INT (FK) |
| id_medicamento | INT (FK) |
| dosis | VARCHAR(50) |

---

## 🔗 Relaciones Principales

- **Uno a muchos**
  - Departamentos → Médicos
  - Pacientes → Citas
  - Médicos → Citas
  - Citas → Tratamientos

---

## ⚡ Ejecución del Script

  - Puede ejecutarse completamente en una sola ejecución
  - No requiere archivos adicionales
  - Poblado inicial con datos realistas
  - Más de 100 registros
  - Permite pruebas sin carga manual adicional

---

## 🗺️ Diagramas Relacionales

### 🔶 Diagrama relacional

  - DEPARTAMENTOS 1 ────────< N MEDICOS
  - MEDICOS       1 ────────< N CITAS
  - PACIENTES     1 ────────< N CITAS
  - CITAS         1 ────────< N TRATAMIENTOS
  - CITAS         N ────────< PRESCRIPCIONES >─────── N MEDICAMENTOS

### 🔷 Diagrama Entidad Relacion Extendido

<img width="970" height="688" alt="Screenshot 2026-01-05 223410" src="https://github.com/user-attachments/assets/d69845fe-e5f8-4a42-86e4-80f74913e642" />

