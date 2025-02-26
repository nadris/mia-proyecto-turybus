CREATE TABLE transporte.conductores (
    ci VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    CONSTRAINT chk_telefono_conductores CHECK (telefono LIKE '[0-9]%')
);