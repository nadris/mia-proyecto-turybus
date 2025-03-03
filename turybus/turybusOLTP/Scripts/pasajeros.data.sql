PRINT 'Populating pasajeros table';
SET NOCOUNT ON;

SET IDENTITY_INSERT seguridad.pasajeros ON;

INSERT INTO seguridad.pasajeros (dni, nombre, telefono) VALUES
('12345678A', 'Juan Pérez', '555-0101'),
('23456789B', 'María López', '555-0102'),
('34567890C', 'Carlos García', '555-0103'),
('45678901D', 'Ana Fernández', '555-0104'),
('56789012E', 'Luis Martínez', '555-0105'),
('67890123F', 'Sofía Rodríguez', '555-0106'),
('78901234G', 'Miguel Torres', '555-0107'),
('89012345H', 'Laura Díaz', '555-0108'),
('90123456I', 'Pedro Ramírez', '555-0109'),
('01234567J', 'Andrea Gómez', '555-0110');

SET IDENTITY_INSERT seguridad.pasajeros OFF;