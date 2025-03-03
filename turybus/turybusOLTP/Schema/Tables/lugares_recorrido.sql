-- Tabla de Lugares del Recorrido
create table transporte.lugares_recorrido (
    id_lugar INT PRIMARY KEY IDENTITY(1,1),
    id_ruta_servicio INT NOT NULL,
    nombre NVARCHAR(255) NOT NULL,
    hora_llegada TIME NOT NULL,
    actividad NVARCHAR(255),
    tiempo_parada INT,
    constraint fk_lugares_recorrido_rutas_servicios FOREIGN KEY (id_ruta_servicio) REFERENCES transporte.rutas_servicios(id_ruta_servicio) ON DELETE CASCADE ON UPDATE CASCADE
);
