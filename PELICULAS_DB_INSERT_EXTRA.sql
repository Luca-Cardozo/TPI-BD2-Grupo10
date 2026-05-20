USE Peliculas_DB;
GO

-- ============================================================
--  RESEÑAS Y VISUALIZACIONES ADICIONALES — 10 PELÍCULAS NUEVAS
--  Películas elegidas (todas con contadores en 0):
--  4=Memento, 5=Dunkirk, 12=Kill Bill, 13=Django,
--  19=Avatar, 20=Terminator 2, 22=Blade Runner 2049,
--  23=Alien, 27=LOTR Comunidad, 32=El Padrino II
-- ============================================================

INSERT INTO Resenias (IdUsuario, IdPelicula, Comentario, Calificacion, Fecha) VALUES
-- Memento (4)
(2,  4,  'Una narrativa al revés que te mantiene en vilo de principio a fin.',         9,  '2024-03-10'),
(5,  4,  'Nolan en su estado más creativo. Muy original.',                             8,  '2024-04-22'),
(8,  4,  'Una película que exige tu atención. Brillante.',                             9,  '2024-05-15'),
-- Dunkirk (5)
(11, 5,  'Una experiencia cinematográfica única. El sonido y la tensión son brutales.', 9,  '2024-06-01'),
(16, 5,  'Una película de guerra diferente a todas. Nolan logra algo increíble.',      8,  '2024-07-10'),
(2,  5,  'La tensión no baja ni un segundo. Impresionante.',                           9,  '2024-08-05'),
-- Kill Bill Vol. 1 (12)
(5,  12, 'Tarantino en su máxima expresión visual. Una obra de arte del cine de acción.', 9, '2024-04-18'),
(8,  12, 'La coreografía de las peleas es increíble. Muy entretenida.',                8,  '2024-05-25'),
(3,  12, 'Una película que no para un segundo. Me encantó.',                           8,  '2024-06-12'),
-- Django Sin Cadenas (13)
(6,  13, 'Una historia de venganza brutal pero muy bien contada.',                     8,  '2024-07-05'),
(9,  13, 'DiCaprio como villano es impresionante. Muy buena película.',                9,  '2024-08-15'),
(12, 13, 'Tarantino logra algo especial con esta historia.',                           8,  '2024-09-01'),
-- Avatar (19)
(2,  19, 'Visualmente es una revolución del cine. La historia es simple pero efectiva.', 7, '2024-03-20'),
(5,  19, 'Los efectos visuales siguen siendo impresionantes. Buen entretenimiento.',   7,  '2024-04-10'),
(11, 19, 'Un espectáculo visual único. La historia podría ser más profunda.',          6,  '2024-05-08'),
-- Terminator 2 (20)
(16, 20, 'Una secuela que supera a la original. Schwarzenegger en su mejor papel.',    9,  '2024-06-20'),
(8,  20, 'Los efectos especiales para su época son increíbles. Un clásico.',           9,  '2024-07-15'),
(2,  20, 'Una película de acción perfecta. No tiene un minuto desperdiciado.',         8,  '2024-08-20'),
-- Blade Runner 2049 (22)
(5,  22, 'Una obra de arte visual. Villeneuve logró algo extraordinario.',             9,  '2024-09-10'),
(11, 22, 'Lenta pero absolutamente fascinante. Una experiencia única.',                8,  '2024-10-05'),
(3,  22, 'La fotografía es de otro mundo. Una gran película de ciencia ficción.',      9,  '2024-11-01'),
-- Alien (23)
(6,  23, 'La mejor película de terror espacial de la historia.',                       9,  '2024-04-25'),
(9,  23, 'Scott creó algo que sigue aterrando décadas después. Perfecta.',             9,  '2024-05-30'),
(14, 23, 'La tensión es insoportable en el buen sentido. Un clásico del terror.',      8,  '2024-06-25'),
-- LOTR: La Comunidad del Anillo (27)
(2,  27, 'Jackson adaptó Tolkien de manera perfecta. Una epopeya increíble.',         9,  '2024-07-25'),
(16, 27, 'Una película que te transporta a otro mundo completamente.',                 9,  '2024-08-30'),
(8,  27, 'El comienzo de la mejor trilogía de fantasía del cine.',                     9,  '2024-09-20'),
-- El Padrino Parte II (32)
(5,  32, 'Tan buena como la primera. De Niro joven es extraordinario.',                9,  '2024-10-15'),
(11, 32, 'Una de las pocas secuelas que iguala o supera a la original.',               9,  '2024-11-05'),
(2,  32, 'Coppola logró algo irrepetible con esta saga.',                              10, '2024-11-20');
GO

INSERT INTO Visualizaciones (IdUsuario, IdPelicula, FechaVisualizacion) VALUES
-- Memento (4)
(2,  4,  '2024-03-08'),
(5,  4,  '2024-04-20'),
(8,  4,  '2024-05-13'),
(11, 4,  '2024-06-10'),
-- Dunkirk (5)
(11, 5,  '2024-05-30'),
(16, 5,  '2024-07-08'),
(2,  5,  '2024-08-03'),
(1,  5,  '2024-09-15'),
-- Kill Bill Vol. 1 (12)
(5,  12, '2024-04-16'),
(8,  12, '2024-05-23'),
(1,  12, '2024-06-10'),
(16, 12, '2024-07-05'),
-- Django Sin Cadenas (13)
(2,  13, '2024-07-03'),
(5,  13, '2024-08-12'),
(8,  13, '2024-09-08'),
(11, 13, '2024-10-01'),
-- Avatar (19)
(2,  19, '2024-03-18'),
(5,  19, '2024-04-08'),
(8,  19, '2024-05-05'),
-- Terminator 2 (20)
(16, 20, '2024-06-18'),
(8,  20, '2024-07-13'),
(2,  20, '2024-08-18'),
(5,  20, '2024-09-10'),
-- Blade Runner 2049 (22)
(5,  22, '2024-09-08'),
(11, 22, '2024-10-03'),
(1,  22, '2024-10-25'),
-- Alien (23)
(2,  23, '2024-04-23'),
(5,  23, '2024-05-28'),
(8,  23, '2024-06-22'),
(16, 23, '2024-07-18'),
-- LOTR: La Comunidad del Anillo (27)
(2,  27, '2024-07-23'),
(16, 27, '2024-08-28'),
(8,  27, '2024-09-18'),
(1,  27, '2024-10-10'),
-- El Padrino Parte II (32)
(5,  32, '2024-10-13'),
(11, 32, '2024-11-03'),
(2,  32, '2024-11-18'),
(16, 32, '2024-12-01');
GO

-- ============================================================
--  WATCHLIST ADICIONAL (15 registros)
-- ============================================================
INSERT INTO Watchlist (IdUsuario, IdPelicula, FechaAgregado, Activo) VALUES
(2,  4,  '2024-03-07', 1),   -- Lucas       - Memento
(3,  3,  '2024-04-23', 1),   -- Valentina   - El Caballero de la Noche
(4,  27, '2024-05-14', 1),   -- Martín      - LOTR Comunidad
(5,  32, '2024-06-02', 1),   -- Sofía       - El Padrino II
(6,  20, '2024-06-17', 0),   -- Nicolás     - Terminator 2 (eliminada lógicamente)
(7,  12, '2024-07-21', 1),   -- Camila      - Kill Bill
(8,  22, '2024-08-09', 1),   -- Joaquín     - Blade Runner 2049
(9,  13, '2024-08-28', 1),   -- Lucía       - Django Sin Cadenas
(10, 23, '2024-09-11', 1),   -- Tomás       - Alien
(11, 5,  '2024-09-25', 0),   -- Florencia   - Dunkirk (eliminada lógicamente)
(12, 31, '2024-10-08', 1),   -- Agustín     - El Padrino
(13, 19, '2024-10-22', 1),   -- Carolina    - Avatar
(14, 38, '2024-11-03', 1),   -- Diego       - Forrest Gump
(15, 2,  '2024-11-14', 1),   -- Ana         - Interstellar
(16, 32, '2024-12-02', 1);   -- Pablo       - El Padrino II
GO


-- ============================================================
--  UPDATE CONTADORES FINALES
-- ============================================================

UPDATE p
SET p.ContadorVisualizaciones = (
    SELECT COUNT(*)
    FROM Visualizaciones v
    WHERE v.IdPelicula = p.IdPelicula
)
FROM Peliculas p;

UPDATE p
SET p.PromedioCalificacion = ISNULL((
    SELECT CAST(ROUND(AVG(CAST(r.Calificacion AS FLOAT)), 2) AS DECIMAL(4,2))
    FROM Resenias r
    WHERE r.IdPelicula = p.IdPelicula
), 0)
FROM Peliculas p;
GO
