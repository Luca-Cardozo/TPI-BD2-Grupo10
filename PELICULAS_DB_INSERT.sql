USE Peliculas_DB;
GO

-- ============================================================
--  CLASIFICACIONES (4)
-- ============================================================
INSERT INTO Clasificaciones (Descripcion) VALUES
('ATP'),
('+13'),
('+16'),
('+18');
GO

-- ============================================================
--  GENEROS (10)
-- ============================================================
INSERT INTO Generos (Descripcion) VALUES
('Acción'),
('Comedia'),
('Drama'),
('Terror'),
('Ciencia Ficción'),
('Animación'),
('Thriller'),
('Romance'),
('Aventura'),
('Fantasía');
GO

-- ============================================================
--  SUSCRIPCIONES (3)
-- ============================================================
INSERT INTO Suscripciones (Descripcion, PrecioMensual) VALUES
('Gratuita',  0),
('Estándar',  999),
('Premium',   1999);
GO

-- ============================================================
--  DIRECTORES (10)
-- ============================================================
INSERT INTO Directores (Nombre, Apellido, Nacionalidad) VALUES
('Christopher', 'Nolan',       'Británico'),
('Steven',      'Spielberg',   'Estadounidense'),
('Quentin',     'Tarantino',   'Estadounidense'),
('Martin',      'Scorsese',    'Estadounidense'),
('James',       'Cameron',     'Canadiense'),
('Ridley',      'Scott',       'Británico'),
('David',       'Fincher',     'Estadounidense'),
('Peter',       'Jackson',     'Neozelandés'),
('Francis',     'Ford Coppola','Estadounidense'),
('Stanley',     'Kubrick',     'Estadounidense');
GO

-- ============================================================
--  ACTORES (20)
-- ============================================================
INSERT INTO Actores (Nombre, Apellido, Nacionalidad) VALUES
('Leonardo',  'DiCaprio',   'Estadounidense'),
('Meryl',     'Streep',     'Estadounidense'),
('Tom',       'Hanks',      'Estadounidense'),
('Cate',      'Blanchett',  'Australiana'),
('Brad',      'Pitt',       'Estadounidense'),
('Natalie',   'Portman',    'Israelí'),
('Morgan',    'Freeman',    'Estadounidense'),
('Scarlett',  'Johansson',  'Estadounidense'),
('Robert',    'De Niro',    'Estadounidense'),
('Charlize',  'Theron',     'Sudafricana'),
('Matt',      'Damon',      'Estadounidense'),
('Jodie',     'Foster',     'Estadounidense'),
('Heath',     'Ledger',     'Australiano'),
('Viola',     'Davis',      'Estadounidense'),
('Joaquin',   'Phoenix',    'Estadounidense'),
('Emma',      'Stone',      'Estadounidense'),
('Christian', 'Bale',       'Británico'),
('Judi',      'Dench',      'Británica'),
('Russell',   'Crowe',      'Neozelandés'),
('Halle',     'Berry',      'Estadounidense');
GO

-- ============================================================
--  PELICULAS (40)
--  IdClasificacion: 1=ATP 2=+13 3=+16 4=+18
--  IdDirector: 1=Nolan 2=Spielberg 3=Tarantino 4=Scorsese
--              5=Cameron 6=Scott 7=Fincher 8=Jackson
--              9=Coppola 10=Kubrick
-- ============================================================
INSERT INTO Peliculas (Titulo, Descripcion, DuracionMinutos, FechaEstreno, IdDirector, IdClasificacion, URLImagen, URLTrailer, ContadorVisualizaciones, PromedioCalificacion, Activo) VALUES
('Inception',               'Un ladrón roba secretos corporativos mediante tecnología de sueños compartidos y recibe la tarea de plantar una idea.',  148, '2010-07-16', 1, 3, 'https://image.tmdb.org/t/p/w500/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg', 'https://www.youtube.com/embed/YoHD9XEInc0', 0, 0, 1),
('Interstellar',            'Un grupo de astronautas viaja a través de un agujero de gusano en busca de un nuevo hogar para la humanidad.',           169, '2014-11-07', 1, 2, 'https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg', 'https://www.youtube.com/embed/zSWdZVtXT7E', 0, 0, 1),
('El Caballero de la Noche','Batman enfrenta al Joker, un criminal que siembra el caos en Gotham City.',                                             152, '2008-07-18', 1, 3, 'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg', 'https://www.youtube.com/embed/EXeTwQWrcwY', 0, 0, 1),
('Memento',                 'Un hombre con pérdida de memoria a corto plazo intenta encontrar al asesino de su esposa.',                             113, '2000-10-11', 1, 3, 'https://image.tmdb.org/t/p/w500/yuNs09hvpHVU1cBTCAk9zxsL2oW.jpg', 'https://www.youtube.com/embed/0vS0E9bBSL0', 0, 0, 1),
('Dunkirk',                 'La evacuación de las tropas aliadas de las costas de Dunkerque durante la Segunda Guerra Mundial.',                      106, '2017-07-21', 1, 2, 'https://image.tmdb.org/t/p/w500/ebSnOwiMzPNOlYzILBfxHAfPMIL.jpg', 'https://www.youtube.com/embed/F-eMt3SrfFU', 0, 0, 1),
('Tiburón',                 'Un sheriff, un oceanógrafo y un cazador de tiburones buscan eliminar a un gran tiburón blanco.',                        124, '1975-06-20', 2, 3, 'https://image.tmdb.org/t/p/w500/lxM6e836RCyS9kSEr0BHg5uMwqk.jpg', 'https://www.youtube.com/embed/U1fu_sA7XhE', 0, 0, 1),
('La Lista de Schindler',   'La historia real de Oskar Schindler, quien salvó a más de mil judíos durante el Holocausto.',                           195, '1993-12-15', 2, 4, 'https://image.tmdb.org/t/p/w500/sF1U4EUQS8YHUYjNl3pMGNIQyr0.jpg', 'https://www.youtube.com/embed/gG22XNhtnoY', 0, 0, 1),
('E.T.',                    'Un niño ayuda a un extraterrestre perdido a regresar a su planeta natal.',                                              115, '1982-06-11', 2, 1, 'https://image.tmdb.org/t/p/w500/an0nD6uq6byfxXCfk6liqzawaGT.jpg', 'https://www.youtube.com/embed/qYAETtIIClk', 0, 0, 1),
('Indiana Jones',           'Un arqueólogo aventurero compite contra los nazis para encontrar el Arca de la Alianza.',                               115, '1981-06-12', 2, 2, 'https://image.tmdb.org/t/p/w500/ceG9VzoRAVGwivFU403Wc3AHRys.jpg', 'https://www.youtube.com/embed/XkkzKHEMbNg', 0, 0, 1),
('Encuentros Cercanos',     'Un trabajador de Indiana es testigo de encuentros con OVNIs y siente una obsesión por buscar respuestas.',               135, '1977-11-16', 2, 1, 'https://image.tmdb.org/t/p/w500/ds18VfFdHovFpZSRUCCL1QBzWW8.jpg', 'https://www.youtube.com/embed/YAFGHgqBSDI', 0, 0, 1),
('Pulp Fiction',            'Las historias entrelazadas de criminales, boxeadores y gángsters en Los Ángeles.',                                      154, '1994-10-14', 3, 4, 'https://image.tmdb.org/t/p/w500/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg', 'https://www.youtube.com/embed/s7EdQ4FqbhY', 0, 0, 1),
('Kill Bill Vol. 1',        'Una asesina busca venganza contra su exjefe y sus cómplices después de sobrevivir a un tiroteo.',                       111, '2003-10-10', 3, 4, 'https://image.tmdb.org/t/p/w500/v7TaX8kXMXs5yFFGR41guUDNcnB.jpg', 'https://www.youtube.com/embed/6AtLLVNGu2I', 0, 0, 1),
('Django Sin Cadenas',      'Un esclavo liberado viaja para rescatar a su esposa con la ayuda de un cazarrecompensas alemán.',                       165, '2012-12-25', 3, 4, 'https://image.tmdb.org/t/p/w500/7oWY8VDWW7thTzWh3OKYRkWcKno.jpg', 'https://www.youtube.com/embed/eUdM9vrCbow', 0, 0, 1),
('Bastardos Sin Gloria',    'Durante la Segunda Guerra Mundial, un grupo de soldados judíos planea asesinar a líderes nazis.',                       153, '2009-08-21', 3, 4, 'https://image.tmdb.org/t/p/w500/fD5qdm04EhHFOpuBvABVFMxMvNC.jpg', 'https://www.youtube.com/embed/KnrRy6kSFF0', 0, 0, 1),
('Taxi Driver',             'Un veterano de Vietnam se convierte en taxista nocturno en Nueva York y cae en la alienación social.',                  114, '1976-02-08', 4, 4, 'https://image.tmdb.org/t/p/w500/ekstpH614fwDX8DUln1a2Opz0N8.jpg', 'https://www.youtube.com/embed/UggM4sRVVMA', 0, 0, 1),
('Goodfellas',              'La historia de ascenso y caída de un gángster en la mafia de Nueva York durante décadas.',                             146, '1990-09-19', 4, 4, 'https://image.tmdb.org/t/p/w500/aKuFiU82s5ISJpGZp7YkIr3kCUd.jpg', 'https://www.youtube.com/embed/qo5jJpHtI1Y', 0, 0, 1),
('El Lobo de Wall Street',  'La historia de Jordan Belfort, un corredor de bolsa que cayó en la corrupción y el exceso.',                           180, '2013-12-25', 4, 4, 'https://image.tmdb.org/t/p/w500/34m2tygAYBGqA9MXKhRDtzOd6ja.jpg', 'https://www.youtube.com/embed/iszwuX1AK6A', 0, 0, 1),
('Titanic',                 'Una historia de amor entre dos jóvenes de distintas clases sociales a bordo del Titanic.',                             195, '1997-12-19', 5, 2, 'https://image.tmdb.org/t/p/w500/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg', 'https://www.youtube.com/embed/kVrqfYjkTdQ', 0, 0, 1),
('Avatar',                  'Un marine paralítico viaja a Pandora, donde se une a los Na''vi y lidera su resistencia.',                              162, '2009-12-18', 5, 2, 'https://image.tmdb.org/t/p/w500/jRXYjXNq0Cs2TcJjLkki24MLp7u.jpg', 'https://www.youtube.com/embed/5PSNL1qE6VY', 0, 0, 1),
('Terminator 2',            'Un cyborg protector lucha contra un Terminator avanzado para salvar al futuro líder de la resistencia.',               137, '1991-07-03', 5, 3, 'https://image.tmdb.org/t/p/w500/5M0j0B18abtBI5gi3JOGMPWLAlU.jpg', 'https://www.youtube.com/embed/CRRlbK5w8AE', 0, 0, 1),
('Gladiador',               'Un general romano es traicionado y reducido a la esclavitud, jurando vengarse del emperador corrupto.',                155, '2000-05-05', 6, 3, 'https://image.tmdb.org/t/p/w500/ty8TGRuvJLPUmAR1h1nqJhRHcBP.jpg', 'https://www.youtube.com/embed/owK1qxDselE', 0, 0, 1),
('Blade Runner 2049',       'Un joven Blade Runner descubre un secreto que podría sumir a la sociedad en el caos.',                                 164, '2017-10-06', 6, 3, 'https://image.tmdb.org/t/p/w500/gajva2L0rPYkEWjzgFlBXCAVBE5.jpg', 'https://www.youtube.com/embed/gD6zfB5LBE4', 0, 0, 1),
('Alien',                   'La tripulación de una nave espacial se enfrenta a un aterrador alienígena que los va eliminando uno a uno.',           117, '1979-05-25', 6, 3, 'https://image.tmdb.org/t/p/w500/vfrQk5IPloGg1v9Rzbh2Eg3VGyM.jpg', 'https://www.youtube.com/embed/LjLamj-b0I8', 0, 0, 1),
('El Club de la Pelea',     'Un insomne forma un club de lucha clandestino con un carismático vendedor de jabón.',                                  139, '1999-10-15', 7, 4, 'https://image.tmdb.org/t/p/w500/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg', 'https://www.youtube.com/embed/SUXWAEX2jlg', 0, 0, 1),
('Seven',                   'Dos detectives investigan a un asesino serial que basa sus crímenes en los siete pecados capitales.',                  127, '1995-09-22', 7, 4, 'https://image.tmdb.org/t/p/w500/69Sns8WoET6CfaYlIkHbla4l7nC.jpg', 'https://www.youtube.com/embed/znmZoVkCjpI', 0, 0, 1),
('La Red Social',           'La historia del origen de Facebook y las disputas legales que surgieron entre sus fundadores.',                        120, '2010-10-01', 7, 3, 'https://image.tmdb.org/t/p/w500/n0ybibhJtQ5icDqTp8eRytcIHJx.jpg', 'https://www.youtube.com/embed/lB95KLmpLR4', 0, 0, 1),
('El Señor de los Anillos: La Comunidad del Anillo', 'Un hobbit emprende un peligroso viaje para destruir un anillo de poder con la ayuda de una comunidad.',   178, '2001-12-19', 8, 2, 'https://image.tmdb.org/t/p/w500/6oom5QYQ2yQTMJIbnvbkBL9cHo6.jpg', 'https://www.youtube.com/embed/V75dMMIW2B4', 0, 0, 1),
('El Señor de los Anillos: Las Dos Torres',          'La comunidad se divide mientras la guerra avanza en la Tierra Media.',                                     179, '2002-12-18', 8, 2, 'https://image.tmdb.org/t/p/w500/5VTN0pR8gcqV3EPUHHfMGnJYspN.jpg', 'https://www.youtube.com/embed/hYcGBFGEYpk', 0, 0, 1),
('El Señor de los Anillos: El Retorno del Rey',      'La batalla final por la Tierra Media mientras Frodo y Sam se acercan al Monte del Destino.',               201, '2003-12-17', 8, 2, 'https://image.tmdb.org/t/p/w500/rCzpDGLbOoPwLjy3OAm5NUPOTrC.jpg', 'https://www.youtube.com/embed/r5X-hFf6sfk', 0, 0, 1),
('El Hobbit: Un Viaje Inesperado',                   'El hobbit Bilbo Bolsón emprende una aventura épica con trece enanos para recuperar su hogar.',             169, '2012-12-14', 8, 2, 'https://image.tmdb.org/t/p/w500/yHA9Fc37VmpUA5UncTxxo3rTGVA.jpg', 'https://www.youtube.com/embed/SDnYMbYB-nU', 0, 0, 1),
('El Padrino',              'El patriarca de una poderosa familia mafiosa transfiere el control de su imperio a su reticente hijo.',                175, '1972-03-24', 9, 4, 'https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsLlegTcKJubb.jpg', 'https://www.youtube.com/embed/sY1S34973zA', 0, 0, 1),
('El Padrino Parte II',     'El ascenso de Vito Corleone y la expansión del imperio criminal de Michael Corleone.',                                202, '1974-12-18', 9, 4, 'https://image.tmdb.org/t/p/w500/hek3koDUyRQk7FIhPXsa6mT2Zc3.jpg', 'https://www.youtube.com/embed/9O1Iy9od7-A', 0, 0, 1),
('Apocalypse Now',          'Durante la Guerra de Vietnam, un capitán del ejército es enviado a eliminar a un coronel que se ha vuelto loco.',     147, '1979-08-15', 9, 4, 'https://image.tmdb.org/t/p/w500/gQB8Y5RCMkv2zwzFHbUJX3kAhvA.jpg', 'https://www.youtube.com/embed/FhOdFQf2ppo', 0, 0, 1),
('2001: Odisea del Espacio','Una misión espacial hacia Júpiter desvela secretos sobre los orígenes de la humanidad.',                              149, '1968-04-02', 10, 1, 'https://image.tmdb.org/t/p/w500/ve72VxNqjGM69Uky4WTo2bK6rfq.jpg', 'https://www.youtube.com/embed/oR_e9y-bka0', 0, 0, 1),
('El Resplandor',           'Un escritor acepta cuidar un hotel aislado durante el invierno y comienza a enloquecer.',                            146, '1980-05-23', 10, 4, 'https://image.tmdb.org/t/p/w500/b6ko0IKC8MdYBBPkkA1aBPLe2yz.jpg', 'https://www.youtube.com/embed/5Cb3ik6zP2I', 0, 0, 1),
('Naranja Mecánica',        'En un futuro distópico, un delincuente juvenil es sometido a un experimento de modificación de conducta.',            136, '1971-12-19', 10, 4, 'https://image.tmdb.org/t/p/w500/7IiZBOAEIDSLOnLFSxvpRPLzAB0.jpg', 'https://www.youtube.com/embed/SPRzm8ibDQ8', 0, 0, 1),
('Full Metal Jacket',       'Las experiencias de un grupo de reclutas durante el entrenamiento y la Guerra de Vietnam.',                           116, '1987-06-26', 10, 4, 'https://image.tmdb.org/t/p/w500/kShtwLzjgqBnrIwTqLnW2AXZX8k.jpg', 'https://www.youtube.com/embed/4b7LVBS_Ej8', 0, 0, 1),
('Forrest Gump',            'Un hombre con bajo coeficiente intelectual logra grandes hazañas y vive momentos históricos del siglo XX.',           142, '1994-07-06', 2, 1, 'https://image.tmdb.org/t/p/w500/saHP97rTPS5eLmrLQEcANmKrsFl.jpg', 'https://www.youtube.com/embed/bLvqoHBptjg', 0, 0, 1),
('El Silencio de los Inocentes','Una agente del FBI busca la ayuda de un asesino en serie para atrapar a otro criminal.',                          118, '1991-02-14', 7, 4, 'https://image.tmdb.org/t/p/w500/uS9m8OBk1A8eM9I042bx8XXZngQ.jpg', 'https://www.youtube.com/embed/W6Mm8Sbe__o', 0, 0, 1),
('Joker',                   'La historia del origen del icónico villano de Gotham City y su caída en la locura.',                                  122, '2019-10-04', 7, 4, 'https://image.tmdb.org/t/p/w500/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg', 'https://www.youtube.com/embed/zAGVQLHvwOY', 0, 0, 1),
('La Gran Estafa',          'Dos estafadores idean un plan para engañar a la mafia y escapar con su dinero.',                                       116, '2001-12-07', 7, 3, 'https://image.tmdb.org/t/p/w500/I9e6RCNuN6vST89UzMBDKEL9dE.jpg', 'https://www.youtube.com/embed/SDhuDCPbik4', 0, 0, 1);
GO

-- ============================================================
--  PELICULASXGENEROS
-- ============================================================
INSERT INTO PeliculasxGeneros (IdPelicula, IdGenero) VALUES
(1,  5), -- Inception         - Ciencia Ficción
(1,  7), -- Inception         - Thriller
(2,  5), -- Interstellar      - Ciencia Ficción
(2,  3), -- Interstellar      - Drama
(3,  1), -- El Caballero      - Acción
(3,  7), -- El Caballero      - Thriller
(4,  7), -- Memento           - Thriller
(4,  3), -- Memento           - Drama
(5,  1), -- Dunkirk           - Acción
(5,  3), -- Dunkirk           - Drama
(6,  4), -- Tiburón           - Terror
(6,  7), -- Tiburón           - Thriller
(7,  3), -- La Lista          - Drama
(8,  1), -- E.T.              - Aventura
(8,  5), -- E.T.              - Ciencia Ficción
(9,  9), -- Indiana Jones     - Aventura
(9,  1), -- Indiana Jones     - Acción
(10, 5), -- Encuentros        - Ciencia Ficción
(11, 7), -- Pulp Fiction      - Thriller
(11, 3), -- Pulp Fiction      - Drama
(12, 1), -- Kill Bill         - Acción
(13, 3), -- Django            - Drama
(13, 1), -- Django            - Acción
(14, 7), -- Bastardos         - Thriller
(14, 3), -- Bastardos         - Drama
(15, 7), -- Taxi Driver       - Thriller
(15, 3), -- Taxi Driver       - Drama
(16, 3), -- Goodfellas        - Drama
(16, 7), -- Goodfellas        - Thriller
(17, 3), -- El Lobo           - Drama
(18, 8), -- Titanic           - Romance
(18, 3), -- Titanic           - Drama
(19, 5), -- Avatar            - Ciencia Ficción
(19, 9), -- Avatar            - Aventura
(20, 5), -- Terminator 2      - Ciencia Ficción
(20, 1), -- Terminator 2      - Acción
(21, 1), -- Gladiador         - Acción
(21, 3), -- Gladiador         - Drama
(22, 5), -- Blade Runner      - Ciencia Ficción
(22, 7), -- Blade Runner      - Thriller
(23, 4), -- Alien             - Terror
(23, 5), -- Alien             - Ciencia Ficción
(24, 7), -- Club de la Pelea  - Thriller
(24, 3), -- Club de la Pelea  - Drama
(25, 7), -- Seven             - Thriller
(25, 4), -- Seven             - Terror
(26, 3), -- La Red Social     - Drama
(26, 7), -- La Red Social     - Thriller
(27, 10),-- LOTR 1            - Fantasía
(27, 9), -- LOTR 1            - Aventura
(28, 10),-- LOTR 2            - Fantasía
(28, 9), -- LOTR 2            - Aventura
(29, 10),-- LOTR 3            - Fantasía
(29, 9), -- LOTR 3            - Aventura
(30, 10),-- El Hobbit         - Fantasía
(30, 9), -- El Hobbit         - Aventura
(31, 3), -- El Padrino        - Drama
(31, 7), -- El Padrino        - Thriller
(32, 3), -- El Padrino II     - Drama
(33, 3), -- Apocalypse Now    - Drama
(33, 1), -- Apocalypse Now    - Acción
(34, 5), -- 2001              - Ciencia Ficción
(35, 4), -- El Resplandor     - Terror
(35, 7), -- El Resplandor     - Thriller
(36, 5), -- Naranja Mecánica  - Ciencia Ficción
(36, 3), -- Naranja Mecánica  - Drama
(37, 1), -- Full Metal Jacket - Acción
(37, 3), -- Full Metal Jacket - Drama
(38, 3), -- Forrest Gump      - Drama
(38, 2), -- Forrest Gump      - Comedia
(39, 7), -- El Silencio       - Thriller
(39, 4), -- El Silencio       - Terror
(40, 3), -- Joker             - Drama
(40, 7), -- Joker             - Thriller
(41, 7), -- La Gran Estafa    - Thriller
(41, 2); -- La Gran Estafa    - Comedia
GO

-- ============================================================
--  PELICULASXACTORES
-- ============================================================
INSERT INTO PeliculasxActores (IdPelicula, IdActor) VALUES
(1,  1),  -- Inception         - DiCaprio
(2,  11), -- Interstellar      - Damon
(3,  13), -- El Caballero      - Ledger
(3,  17), -- El Caballero      - Bale
(4,  7),  -- Memento           - Freeman (cameo)
(7,  3),  -- La Lista          - Hanks (narrador)
(11, 5),  -- Pulp Fiction      - Pitt (cameo)
(15, 9),  -- Taxi Driver       - De Niro
(15, 12), -- Taxi Driver       - Foster
(16, 9),  -- Goodfellas        - De Niro
(17, 1),  -- El Lobo           - DiCaprio
(18, 1),  -- Titanic           - DiCaprio
(21, 19), -- Gladiador         - Crowe
(24, 5),  -- Club de la Pelea  - Pitt
(25, 7),  -- Seven             - Freeman
(25, 5),  -- Seven             - Pitt
(26, 16), -- La Red Social     - Stone
(31, 9),  -- El Padrino        - De Niro
(38, 3),  -- Forrest Gump      - Hanks
(40, 15); -- Joker             - Phoenix
GO

-- ============================================================
--  USUARIOS (16) — 1 admin + 15 usuarios comunes
-- ============================================================
INSERT INTO Usuarios (Nombre, Apellido, DNI, Email, Password, Telefono, EsAdmin) VALUES
('Admin',      'Sistema',    '00000000',  'admin@peliculasdb.com',     'admin1234',   '1199999999',   1),
('Lucas',      'Fernández',  '30123456',  'lucas.fernandez@mail.com',  'pass1234',    '1145678901',   0),
('Valentina',  'Gómez',      '31234567',  'valen.gomez@mail.com',      'pass1234',    '1156789012',   0),
('Martín',     'López',      '32345678',  'martin.lopez@mail.com',     'pass1234',    '1167890123',   0),
('Sofía',      'Martínez',   '33456789',  'sofia.martinez@mail.com',   'pass1234',    '1178901234',   0),
('Nicolás',    'Rodríguez',  '34567890',  'nico.rodriguez@mail.com',   'pass1234',    '1189012345',   0),
('Camila',     'García',     '35678901',  'cami.garcia@mail.com',      'pass1234',    '1190123456',   0),
('Joaquín',    'Pérez',      '36789012',  'joaco.perez@mail.com',      'pass1234',    '1101234567',   0),
('Lucía',      'Sánchez',    '37890123',  'lucia.sanchez@mail.com',    'pass1234',    '1112345678',   0),
('Tomás',      'Ramírez',    '38901234',  'tomas.ramirez@mail.com',    'pass1234',    '1123456789',   0),
('Florencia',  'Torres',     '39012345',  'flor.torres@mail.com',      'pass1234',    '1134567890',   0),
('Agustín',    'Flores',     '40123456',  'agus.flores@mail.com',      'pass1234',    '1145678902',   0),
('Carolina',   'Díaz',       '41234567',  'caro.diaz@mail.com',        'pass1234',    '1156789013',   0),
('Diego',      'Moreno',     '42345678',  'diego.moreno@mail.com',     'pass1234',    '1177777777',   0),
('Ana',        'Muñoz',      '43456789',  'ana.munoz@mail.com',        'pass1234',    '1178901235',   0),
('Pablo',      'Álvarez',    '44567890',  'pablo.alvarez@mail.com',    'pass1234',    '1189012346',   0);
GO

-- ============================================================
--  USUARIOSXSUSCRIPCIONES — variadas por usuario
--  IdSuscripcion: 1=Gratuita 2=Estándar 3=Premium
-- ============================================================
INSERT INTO UsuariosxSuscripciones (IdUsuario, IdSuscripcion, FechaAlta, FechaBaja, Activo) VALUES
(1,  3, '2024-01-01', NULL,         1),  -- Admin       - Premium
(2,  3, '2024-03-15', NULL,         1),  -- Lucas       - Premium
(3,  2, '2024-04-01', NULL,         1),  -- Valentina   - Estándar
(4,  1, '2024-05-10', NULL,         1),  -- Martín      - Gratuita
(5,  3, '2024-02-20', NULL,         1),  -- Sofía       - Premium
(6,  2, '2024-06-01', NULL,         1),  -- Nicolás     - Estándar
(7,  1, '2024-07-15', NULL,         1),  -- Camila      - Gratuita
(8,  3, '2024-01-10', NULL,         1),  -- Joaquín     - Premium
(9,  2, '2024-08-01', NULL,         1),  -- Lucía       - Estándar
(10, 1, '2024-09-05', NULL,         1),  -- Tomás       - Gratuita
(11, 3, '2024-03-01', NULL,         1),  -- Florencia   - Premium
(12, 2, '2024-10-01', NULL,         1),  -- Agustín     - Estándar
(13, 1, '2024-11-15', NULL,         1),  -- Carolina    - Gratuita
(14, 3, '2024-04-20', '2024-10-20', 0),  -- Diego       - Premium vencida
(14, 2, '2024-10-21', NULL,         1),  -- Diego       - Estándar activa
(15, 2, '2024-05-01', '2024-11-01', 0),  -- Ana         - Estándar vencida
(15, 1, '2024-11-02', NULL,         1),  -- Ana         - Gratuita activa
(16, 3, '2024-06-15', NULL,         1);  -- Pablo       - Premium
GO

-- ============================================================
--  RESEÑAS (20)
--  Solo usuarios con suscripción Estándar o Premium pueden reseñar
--  IdUsuario Premium:  1,2,5,8,11,16
--  IdUsuario Estándar: 3,6,9,12,14(activa),
-- ============================================================
INSERT INTO Resenias (IdUsuario, IdPelicula, Comentario, Calificacion, Fecha) VALUES
(2,  1,  'Una obra maestra del cine moderno. Los efectos visuales y la narrativa son increíbles.',       10, '2024-03-20'),
(5,  1,  'Muy buena pero la primera vez que la ves es difícil de seguir. Vale la pena verla dos veces.', 8,  '2024-04-15'),
(8,  3,  'La mejor película de superhéroes de la historia. Ledger está brillante como el Joker.',        10, '2024-02-10'),
(11, 3,  'Una película que te deja sin palabras. El Joker de Ledger es simplemente magistral.',          9,  '2024-05-22'),
(2,  31, 'El Padrino es simplemente la mejor película que existe. Una obra de arte del cine.',           10, '2024-03-25'),
(16, 31, 'Impecable en todos los aspectos. Coppola en su mejor momento.',                                10, '2024-07-01'),
(3,  11, 'Pulp Fiction es única. La narrativa no lineal y los diálogos son geniales.',                   9,  '2024-04-20'),
(6,  11, 'Una película que te engancha desde el primer minuto. Tarantino en estado puro.',               8,  '2024-06-15'),
(9,  24, 'El Club de la Pelea tiene una de las mejores escenas finales del cine.',                       9,  '2024-08-10'),
(12, 24, 'Una película que te hace pensar. Muy buena actuación de Pitt y Norton.',                       8,  '2024-10-05'),
(5,  2,  'Interstellar me dejó con la boca abierta. La banda sonora de Zimmer es perfecta.',             10, '2024-05-30'),
(8,  2,  'Una película emocionante y visualmente impresionante. Nolan en su mejor momento.',             9,  '2024-03-12'),
(11, 38, 'Forrest Gump es una película que te toca el corazón. Tom Hanks está fantástico.',              10, '2024-06-20'),
(16, 38, 'Una historia hermosa y emotiva. Imprescindible.',                                              9,  '2024-08-05'),
(2,  40, 'Joker es una película oscura e incómoda, pero brillante. Phoenix está increíble.',             9,  '2024-04-08'),
(3,  40, 'Una actuación extraordinaria de Phoenix. La película te hace reflexionar.',                    8,  '2024-05-14'),
(6,  21, 'Gladiador es épica en todos los sentidos. Russell Crowe en su mejor papel.',                   9,  '2024-07-20'),
(9,  21, 'Una historia de venganza y honor que te atrapa desde el comienzo.',                            8,  '2024-09-01'),
(12, 25, 'Seven es un thriller perturbador y muy bien construido. Freeman y Pitt excelentes.',           9,  '2024-11-10'),
(14, 18, 'Titanic es un clásico emotivo. La historia de amor es conmovedora.',                           8,  '2024-10-25');
GO

-- ============================================================
--  VISUALIZACIONES (20)
--  Solo usuarios con suscripción Premium pueden reproducir
--  IdUsuario Premium activos: 1,2,5,8,11,16
-- ============================================================
INSERT INTO Visualizaciones (IdUsuario, IdPelicula, FechaVisualizacion) VALUES
(2,  1,  '2024-03-18'),
(2,  31, '2024-03-22'),
(2,  3,  '2024-04-05'),
(5,  1,  '2024-04-12'),
(5,  2,  '2024-05-28'),
(5,  38, '2024-06-15'),
(8,  3,  '2024-02-08'),
(8,  2,  '2024-03-10'),
(8,  24, '2024-04-20'),
(11, 31, '2024-05-18'),
(11, 38, '2024-06-18'),
(11, 3,  '2024-07-02'),
(16, 31, '2024-06-28'),
(16, 38, '2024-08-01'),
(16, 40, '2024-08-15'),
(1,  1,  '2024-01-10'),
(1,  3,  '2024-01-15'),
(1,  31, '2024-02-01'),
(2,  40, '2024-04-06'),
(8,  40, '2024-05-10');
GO

-- ============================================================
--  WATCHLIST (20) — Activo=1 activa, Activo=0 eliminada lógicamente
-- ============================================================
INSERT INTO Watchlist (IdUsuario, IdPelicula, FechaAgregado, Activo) VALUES
(2,  2,  '2024-03-19', 1),
(2,  21, '2024-04-01', 1),
(3,  1,  '2024-04-22', 1),
(3,  31, '2024-05-01', 1),
(4,  38, '2024-05-12', 1),
(5,  24, '2024-04-14', 1),
(5,  25, '2024-05-05', 0),  -- eliminada lógicamente
(6,  3,  '2024-06-16', 1),
(7,  2,  '2024-07-20', 1),
(8,  31, '2024-02-09', 0),  -- eliminada lógicamente
(8,  38, '2024-03-11', 1),
(9,  1,  '2024-08-03', 1),
(10, 40, '2024-09-10', 1),
(11, 2,  '2024-05-20', 1),
(12, 21, '2024-10-06', 1),
(13, 3,  '2024-11-16', 1),
(14, 18, '2024-10-26', 1),
(15, 24, '2024-11-05', 0),  -- eliminada lógicamente
(16, 25, '2024-07-10', 1),
(16, 40, '2024-08-16', 1);
GO

-- ============================================================
--  RESEÑAS ADICIONALES
-- ============================================================
INSERT INTO Resenias (IdUsuario, IdPelicula, Comentario, Calificacion, Fecha) VALUES
-- El Padrino (31) — acumulando para top puntuadas
(5,  31, 'Una película que define el cine de todos los tiempos. Perfección absoluta.',              10, '2024-06-10'),
(8,  31, 'Coppola logró algo irrepetible. Cada escena es una obra de arte.',                       10, '2024-07-15'),
(11, 11, 'Pulp Fiction revolucionó el cine. La estructura no lineal es brillante.',                 9,  '2024-08-01'),
-- Inception (1) — acumulando para top puntuadas
(16, 1,  'Una película que te obliga a pensar. La mejor de Nolan sin dudas.',                      10, '2024-09-05'),
(6,  1,  'Los efectos visuales envejecen muy bien. La historia es fascinante.',                     9,  '2024-10-12'),
-- El Caballero de la Noche (3) — acumulando para top puntuadas
(3,  3,  'Heath Ledger hizo al Joker inmortal. Una actuación que no se olvida.',                   10, '2024-06-25'),
(14, 3,  'La mejor película de acción que existe. No tiene un minuto aburrido.',                    9,  '2024-07-30'),
-- Interstellar (2) — acumulando para top puntuadas
(16, 2,  'Interstellar es la experiencia cinematográfica más impresionante que viví.',              10, '2024-08-20'),
(6,  2,  'La escena del agujero negro me dejó sin palabras. Imprescindible.',                       9,  '2024-09-15'),
-- Forrest Gump (38) — acumulando para top puntuadas
(2,  38, 'Una de las películas más emotivas que existen. Tom Hanks es brillante.',                 10, '2024-07-08'),
(6,  38, 'Te hace reír y llorar al mismo tiempo. Un clásico eterno.',                               9,  '2024-08-25'),
-- Joker (40)
(5,  40, 'Phoenix entrega una de las mejores actuaciones de la historia del cine.',                 10, '2024-09-20'),
(12, 40, 'Una película oscura pero magistral. Te incomoda de la mejor manera.',                     8,  '2024-10-30'),
-- Gladiador (21)
(2,  21, 'Russell Crowe en su mejor papel. La historia de venganza más épica del cine.',            9,  '2024-06-05'),
(5,  21, 'Una película que no envejece. La banda sonora es perfecta.',                              8,  '2024-07-25'),
-- El Club de la Pelea (24)
(16, 24, 'El final más impactante que vi en el cine. Una obra maestra.',                            10, '2024-09-10'),
(3,  24, 'Una crítica al consumismo que sigue siendo vigente. Muy buena.',                          8,  '2024-10-15'),
-- Seven (25)
(5,  25, 'El thriller más perturbador que existe. El final es devastador.',                         9,  '2024-08-28'),
(2,  25, 'Freeman y Pitt tienen una química increíble. Gran película.',                             8,  '2024-09-25'),
-- Titanic (18)
(5,  18, 'Un clásico que siempre emociona. La historia de amor es hermosa.',                        9,  '2024-07-12');
GO

-- ============================================================
--  VISUALIZACIONES ADICIONALES
-- ============================================================
INSERT INTO Visualizaciones (IdUsuario, IdPelicula, FechaVisualizacion) VALUES
-- El Padrino (31) — top más vista
(5,  31, '2024-06-08'),
(8,  31, '2024-07-12'),
(11, 31, '2024-08-03'),
(16, 31, '2024-09-01'),
-- Inception (1) — top más vista
(5,  1,  '2024-09-03'),
(8,  1,  '2024-10-10'),
(11, 1,  '2024-11-01'),
(16, 1,  '2024-09-04'),
-- El Caballero de la Noche (3) — top más vista
(5,  3,  '2024-06-23'),
(16, 3,  '2024-07-28'),
(1,  3,  '2024-08-05'),
-- Interstellar (2) — top más vista
(8,  2,  '2024-08-18'),
(11, 2,  '2024-09-12'),
(16, 2,  '2024-10-01'),
-- Forrest Gump (38) — top más vista
(1,  38, '2024-05-20'),
(2,  38, '2024-07-05'),
(8,  38, '2024-08-22'),
(16, 38, '2024-09-18'),
-- extras para variedad
(1,  40, '2024-10-02'),
(2,  21, '2024-06-03');
GO

-- ============================================================
--  RESEÑAS Y VISUALIZACIONES ADICIONALES — TOP 10
-- ============================================================

-- Películas que ya están en el top 5 tienen suficientes datos.
-- Agregamos reseñas y visualizaciones para 5 películas más:
-- Goodfellas (16), El Club de la Pelea (24), Seven (25),
-- Joker (40), Gladiador (21)

INSERT INTO Resenias (IdUsuario, IdPelicula, Comentario, Calificacion, Fecha) VALUES
-- Goodfellas (16)
(2,  16, 'Scorsese en estado puro. De Niro y Pesci están increíbles.',                              10, '2024-05-05'),
(8,  16, 'Una de las mejores películas de gángsters de la historia.',                                9,  '2024-06-18'),
(16, 16, 'El ritmo narrativo es perfecto. No tiene un minuto de más.',                               9,  '2024-07-22'),
-- El Club de la Pelea (24) — ya tiene 4, agregamos 2 más
(11, 24, 'Una película que cambia tu forma de ver el mundo. Impactante.',                            10, '2024-11-05'),
(6,  24, 'El final te vuela la cabeza. Una obra maestra del cine de los 90.',                        9,  '2024-11-20'),
-- Seven (25) — ya tiene 4, agregamos 2 más
(16, 25, 'El thriller más oscuro y mejor construido que existe.',                                    10, '2024-10-08'),
(11, 25, 'Una película que te persigue días después de verla.',                                      9,  '2024-10-22'),
-- Joker (40) — ya tiene 5, agregamos 2 más
(8,  40, 'Una actuación que merece todos los premios del mundo.',                                    10, '2024-11-15'),
(9,  40, 'Una película que no te deja indiferente. Muy poderosa.',                                   9,  '2024-11-28'),
-- Gladiador (21) — ya tiene 4, agregamos 2 más
(8,  21, 'La batalla final es épica. Una película que no envejece.',                                 10, '2024-08-12'),
(11, 21, 'Hans Zimmer compuso la banda sonora perfecta para esta película.',                          9,  '2024-09-08');
GO

INSERT INTO Visualizaciones (IdUsuario, IdPelicula, FechaVisualizacion) VALUES
-- Goodfellas (16)
(2,  16, '2024-05-03'),
(5,  16, '2024-06-15'),
(8,  16, '2024-07-20'),
(11, 16, '2024-08-10'),
(16, 16, '2024-09-05'),
-- El Club de la Pelea (24)
(2,  24, '2024-05-15'),
(5,  24, '2024-06-20'),
(11, 24, '2024-11-03'),
(16, 24, '2024-11-18'),
-- Seven (25)
(2,  25, '2024-09-23'),
(8,  25, '2024-10-05'),
(11, 25, '2024-10-20'),
(16, 25, '2024-11-02'),
-- Joker (40)
(5,  40, '2024-09-18'),
(11, 40, '2024-11-13'),
(16, 40, '2024-11-25'),
-- Gladiador (21)
(5,  21, '2024-07-23'),
(8,  21, '2024-08-10'),
(11, 21, '2024-09-06'),
(16, 21, '2024-10-15');
GO

-- ============================================================
--  UPDATE CONTADORES FINALES (ejecutar al final del script)
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
    SELECT ROUND(AVG(CAST(r.Calificacion AS FLOAT)), 2)
    FROM Resenias r
    WHERE r.IdPelicula = p.IdPelicula
), 0)
FROM Peliculas p;
GO

