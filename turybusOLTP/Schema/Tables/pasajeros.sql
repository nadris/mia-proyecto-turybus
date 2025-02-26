CREATE TABLE transporte.pasajeros (
    ci VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    CONSTRAINT chk_telefono_pasajeros CHECK (telefono LIKE '[0-9]%')
);