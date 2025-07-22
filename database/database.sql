CREATE DATABASE api_tareas;

CREATE TABLE tareas
(
    idTarea int PRIMARY KEY,
    titulo text NOT NULL,
    descripcion text,
    completado boolean NOT NULL,
    fechaCreacion date NOT NULL
);

INSERT INTO tareas (idTarea, titulo, descripcion, completado, fechaCreacion) VALUES 
    (1, 'Analisis', 'Realizar en análisis del proyecto con hisorias de usuario', true, '2025-07-01'),
    (2, 'Desarrollo front', 'Comenzar con el diseño de las pantallas', true, '2025-07-10'),
    (3, 'Desarrollo back', 'Comenzar con el desarrollo de los CRUD', false, '2025-08-02'),
    (4, 'Pruebas internas', 'Realizar documento para pruebas', false, '2025-08-09'),
    (5, 'Pruebas externas', 'Revisar el documento de pruebas con el usuario', false, '2025-08-16');