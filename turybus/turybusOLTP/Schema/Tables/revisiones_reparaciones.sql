-- Tabla de Revisiones y Reparaciones combinadas
create table transporte.revisiones_reparaciones (
    id_revision INT PRIMARY KEY IDENTITY(1,1),
    matricula NVARCHAR(20) NOT NULL,
    fecha DATE NOT NULL,
    diagnostico NVARCHAR(MAX),
    codigo_reparacion NVARCHAR(50),
    tiempo_empleado INT,
    comentario NVARCHAR(MAX),
    rowversion  timestamp         NOT NULL,
    constraint fk_revisiones_reparaciones_autobuses FOREIGN KEY (matricula) REFERENCES transporte.autobuses_conductores(matricula) ON DELETE CASCADE ON UPDATE CASCADE
);