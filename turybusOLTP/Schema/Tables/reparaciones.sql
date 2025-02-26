CREATE TABLE seguridad.reparaciones (
    id INT IDENTITY PRIMARY KEY,
    revision_id INT NOT NULL,
    codigo_reparacion VARCHAR(20) NOT NULL,
    tiempo_empleado INT NOT NULL CHECK (tiempo_empleado > 0),
    comentario TEXT,
    CONSTRAINT fk_reparaciones_revisiones FOREIGN KEY (revision_id) REFERENCES seguridad.revisiones(id) ON DELETE CASCADE
);