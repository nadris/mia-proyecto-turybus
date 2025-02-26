CREATE TABLE transporte.paradas (
    id INT IDENTITY PRIMARY KEY,
    ruta_id INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    hora_prevista TIME NOT NULL,
    actividad VARCHAR(100),
    tiempo_parada INT CHECK (tiempo_parada >= 0),
    CONSTRAINT fk_paradas_rutas FOREIGN KEY (ruta_id) REFERENCES transporte.rutas(id) ON DELETE CASCADE
);