PRINT 'Populating billetes table';
SET NOCOUNT ON;

SET IDENTITY_INSERT transporte.billetes ON;


INSERT INTO transporte.billetes (dni_pasajero, id_ruta_servicio, fecha, importe) VALUES
('12345678A', 1, '2024-03-01', 10.50),
('23456789B', 2, '2024-03-02', 15.75),
('34567890C', 3, '2024-03-03', 12.00),
('45678901D', 4, '2024-03-04', 8.25),
('56789012E', 5, '2024-03-05', 18.90),
('67890123F', 6, '2024-03-06', 9.50),
('78901234G', 7, '2024-03-07', 20.00),
('89012345H', 8, '2024-03-08', 11.25),
('90123456I', 9, '2024-03-09', 14.60),
('01234567J', 10, '2024-03-10', 7.80);

SET IDENTITY_INSERT transporte.billetes OFF;