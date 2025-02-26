CREATE TABLE transporte.servicios_diarios (
    id INT IDENTITY PRIMARY KEY,
    ruta_id INT NOT NULL,
    hora_salida TIME NOT NULL,
    dias_programados VARCHAR(50) NOT NULL,
    CONSTRAINT fk_servicios_rutas FOREIGN KEY (ruta_id) REFERENCES transporte.rutas(id) ON DELETE CASCADE
);