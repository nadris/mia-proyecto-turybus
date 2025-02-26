CREATE TABLE seguridad.reparaciones (
    id INT IDENTITY PRIMARY KEY,
    revision_id INT NOT NULL,
    codigo_reparacion VARCHAR(20) NOT NULL,
    tiempo_empleado INT NOT NULL,
    comentario TEXT,
    FOREIGN KEY (revision_id) REFERENCES seguridad.revisiones(id)
);