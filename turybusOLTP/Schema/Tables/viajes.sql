-- Tabla de viajes
CREATE TABLE transporte.viajes (
    id INT IDENTITY PRIMARY KEY,
    servicio_id INT NOT NULL,
    fecha DATE NOT NULL,
    matricula VARCHAR(20) NOT NULL,
    ci_conductor VARCHAR(20) NOT NULL,
    hora_llegada_prevista TIME NOT NULL,
    CONSTRAINT fk_viajes_servicios FOREIGN KEY (servicio_id) REFERENCES transporte.servicios_diarios(id) ON DELETE CASCADE,
    CONSTRAINT fk_viajes_autobuses FOREIGN KEY (matricula) REFERENCES transporte.autobuses(matricula) ON DELETE CASCADE,
    CONSTRAINT fk_viajes_conductores FOREIGN KEY (ci_conductor) REFERENCES transporte.conductores(ci) ON DELETE CASCADE
);