create database turybus5;
GO
use turybus5;
GO

-- Creaci�n de esquemas
create schema transporte;
GO
create schema seguridad;
GO

-- Tabla de Rutas y Servicios Diarios combinados
create table transporte.rutas_servicios (
    id_ruta_servicio INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(255) NOT NULL,
    importe DECIMAL(10,2) NOT NULL,
    hora_salida TIME NOT NULL,
    hora_llegada TIME NOT NULL,
    dias_programados NVARCHAR(50) NOT NULL,
    constraint chk_importe CHECK (importe > 0)
);

-- Tabla de Pasajeros
create table seguridad.pasajeros (
    dni NVARCHAR(20) PRIMARY KEY,
    nombre NVARCHAR(255) NOT NULL,
    telefono NVARCHAR(20) NOT NULL,
    constraint uq_pasajeros_telefono UNIQUE (telefono)
);

-- Tabla de Billetes
create table transporte.billetes (
    id_billete INT PRIMARY KEY IDENTITY(1,1),
    dni_pasajero NVARCHAR(20) NOT NULL,
    id_ruta_servicio INT NOT NULL,
    fecha DATE NOT NULL,
    importe DECIMAL(10,2) NOT NULL,
    constraint fk_billetes_pasajeros FOREIGN KEY (dni_pasajero) REFERENCES seguridad.pasajeros(dni) ON DELETE CASCADE ON UPDATE CASCADE,
    constraint fk_billetes_rutas_servicios FOREIGN KEY (id_ruta_servicio) REFERENCES transporte.rutas_servicios(id_ruta_servicio) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabla de Lugares del Recorrido
create table transporte.lugares_recorrido (
    id_lugar INT PRIMARY KEY IDENTITY(1,1),
    id_ruta_servicio INT NOT NULL,
    nombre NVARCHAR(255) NOT NULL,
    hora_llegada TIME NOT NULL,
    actividad NVARCHAR(255),
    tiempo_parada INT,
    constraint fk_lugares_recorrido_rutas_servicios FOREIGN KEY (id_ruta_servicio) REFERENCES transporte.rutas_servicios(id_ruta_servicio) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabla de Autobuses y Conductores combinados
create table transporte.autobuses_conductores (
    id_asignacion INT PRIMARY KEY IDENTITY(1,1),
    matricula NVARCHAR(20) NOT NULL UNIQUE,
    modelo NVARCHAR(255) NOT NULL,
    fabricante NVARCHAR(255) NOT NULL,
    num_plazas INT NOT NULL,
    dni_conductor NVARCHAR(20) NOT NULL,
    nombre_conductor NVARCHAR(255) NOT NULL,
    telefono_conductor NVARCHAR(20) NOT NULL,
    direccion_conductor NVARCHAR(255) NOT NULL,
    constraint chk_num_plazas CHECK (num_plazas > 0)
);

-- Tabla de Revisiones y Reparaciones combinadas
create table transporte.revisiones_reparaciones (
    id_revision INT PRIMARY KEY IDENTITY(1,1),
    matricula NVARCHAR(20) NOT NULL,
    fecha DATE NOT NULL,
    diagnostico NVARCHAR(MAX),
    codigo_reparacion NVARCHAR(50),
    tiempo_empleado INT,
    comentario NVARCHAR(MAX),
    constraint fk_revisiones_reparaciones_autobuses FOREIGN KEY (matricula) REFERENCES transporte.autobuses_conductores(matricula) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabla de Estad�sticas de Uso
create table transporte.estadisticas_uso (
    id_estadistica INT PRIMARY KEY IDENTITY(1,1),
    id_ruta_servicio INT NOT NULL,
    dni_pasajero NVARCHAR(20),
    km_recorridos DECIMAL(10,2) NOT NULL,
    horas_viaje DECIMAL(10,2) NOT NULL,
    constraint fk_estadisticas_uso_rutas_servicios FOREIGN KEY (id_ruta_servicio) REFERENCES transporte.rutas_servicios(id_ruta_servicio) ON DELETE CASCADE ON UPDATE CASCADE,
    constraint fk_estadisticas_uso_pasajeros FOREIGN KEY (dni_pasajero) REFERENCES seguridad.pasajeros(dni) ON DELETE CASCADE ON UPDATE CASCADE
);
