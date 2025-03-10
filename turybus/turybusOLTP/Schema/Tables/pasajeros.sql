-- Tabla de Pasajeros
create table seguridad.pasajeros (
    dni NVARCHAR(20) PRIMARY KEY,
    nombre NVARCHAR(255) NOT NULL,
    telefono NVARCHAR(20) NOT NULL,
    rowversion  timestamp         NOT NULL,
    constraint uq_pasajeros_telefono UNIQUE (telefono)
);