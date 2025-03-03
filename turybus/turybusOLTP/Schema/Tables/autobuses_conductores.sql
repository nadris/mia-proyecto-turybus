-- Tabla de Autobuses y Conductores combinados
create table transporte.autobuses_conductores (
    id_asignacion INT PRIMARY KEY IDENTITY(1,1),
    matricula NVARCHAR(20) NOT NULL UNIQUE,
    modelo NVARCHAR(255) NOT NULL,
    fabricante NVARCHAR(255) NOT NULL,
    num_plazas INT NOT NULL,
    dni_conductor NVARCHAR(20) NOT NULL,
    nombre_conductor NVARCHAR(255) NOT NULL,
    telefono_conductor NVARCHAR(20) NOT NULL,
    direccion_conductor NVARCHAR(255) NOT NULL,
    constraint chk_num_plazas CHECK (num_plazas > 0)
);