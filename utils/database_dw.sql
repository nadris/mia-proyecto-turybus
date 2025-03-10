CREATE DATABASE turybus_dw;
GO
USE turybus_dw;
GO

-- Creación de esquema para Data Warehouse
CREATE SCHEMA dwh;
GO

-- Tabla de Dimensión: Pasajeros
CREATE TABLE dwh.dim_pasajeros (
    id_pasajero INT IDENTITY(1,1) PRIMARY KEY,
    dni NVARCHAR(20) UNIQUE NOT NULL,
    nombre NVARCHAR(255) NOT NULL,
    telefono NVARCHAR(20) NOT NULL
);

-- Tabla de Dimensión: Rutas
CREATE TABLE dwh.dim_rutas (
    id_ruta INT PRIMARY KEY,
    nombre NVARCHAR(255) NOT NULL,
    importe DECIMAL(10,2) NOT NULL
);

-- Tabla de Dimensión: Tiempo
CREATE TABLE dwh.dim_tiempo (
    id_tiempo INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATE NOT NULL,
    año INT NOT NULL,
    mes INT NOT NULL,
    dia INT NOT NULL,
    dia_semana NVARCHAR(20) NOT NULL
);

-- Tabla de Dimensión: Autobuses
CREATE TABLE dwh.dim_autobuses (
    id_autobus INT IDENTITY(1,1) PRIMARY KEY,
    matricula NVARCHAR(20) UNIQUE NOT NULL,
    modelo NVARCHAR(255) NOT NULL,
    fabricante NVARCHAR(255) NOT NULL,
    num_plazas INT NOT NULL
);

-- Tabla de Dimensión: Conductores
CREATE TABLE dwh.dim_conductores (
    id_conductor INT IDENTITY(1,1) PRIMARY KEY,
    dni NVARCHAR(20) UNIQUE NOT NULL,
    nombre NVARCHAR(255) NOT NULL,
    telefono NVARCHAR(20) NOT NULL
);

-- Tabla de Hechos: Viajes Realizados
CREATE TABLE dwh.hechos_viajes (
    id_viaje INT IDENTITY(1,1) PRIMARY KEY,
    id_pasajero INT NOT NULL,
    id_ruta INT NOT NULL,
    id_tiempo INT NOT NULL,
    id_autobus INT NOT NULL,
    id_conductor INT NOT NULL,
    km_recorridos DECIMAL(10,2) NOT NULL,
    horas_viaje DECIMAL(10,2) NOT NULL,
    importe DECIMAL(10,2) NOT NULL,

    -- Llaves foráneas
    CONSTRAINT fk_hechos_pasajeros FOREIGN KEY (id_pasajero) REFERENCES dwh.dim_pasajeros(id_pasajero),
    CONSTRAINT fk_hechos_rutas FOREIGN KEY (id_ruta) REFERENCES dwh.dim_rutas(id_ruta),
    CONSTRAINT fk_hechos_tiempo FOREIGN KEY (id_tiempo) REFERENCES dwh.dim_tiempo(id_tiempo),
    CONSTRAINT fk_hechos_autobuses FOREIGN KEY (id_autobus) REFERENCES dwh.dim_autobuses(id_autobus),
    CONSTRAINT fk_hechos_conductores FOREIGN KEY (id_conductor) REFERENCES dwh.dim_conductores(id_conductor)
);
