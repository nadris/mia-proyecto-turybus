CREATE TABLE seguridad.revisiones (
    id INT IDENTITY PRIMARY KEY,
    matricula VARCHAR(20) NOT NULL,
    fecha DATE NOT NULL,
    diagnostico TEXT,
    CONSTRAINT fk_revisiones_autobuses FOREIGN KEY (matricula) REFERENCES transporte.autobuses(matricula) ON DELETE CASCADE
);