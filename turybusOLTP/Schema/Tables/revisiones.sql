CREATE TABLE seguridad.revisiones (
    id INT IDENTITY PRIMARY KEY,
    matricula VARCHAR(20) NOT NULL,
    fecha DATE NOT NULL,
    diagnostico TEXT,
    FOREIGN KEY (matricula) REFERENCES transporte.autobuses(matricula)
);
