USE Peliculas_DB;

-- VISTAS

-- Se muestra el listado de usuarios con su cantidad de reseñas y reproducciones realizadas por cada uno de ellos y la suscripción de cada uno

CREATE VIEW VW_ResumenActividadUsuarios
AS
SELECT U.Nombre, U.Apellido, U.DNI, U.Email,
S.Descripcion AS 'Suscripcion', COUNT(DISTINCT R.IdResenia) AS 'CantReseñas', 
COUNT(DISTINCT V.IdVisualizacion) AS 'CantReproducciones'
FROM Usuarios U
INNER JOIN UsuariosxSuscripciones US ON US.IdUsuario = U.IdUsuario
INNER JOIN Suscripciones S ON US.IdSuscripcion = S.IdSuscripcion
LEFT JOIN Resenias R ON R.IdUsuario = U.IdUsuario
LEFT JOIN Visualizaciones V ON V.IdUsuario = U.IdUsuario
WHERE US.Activo = 1
GROUP BY U.Nombre, U.Apellido, U.DNI, U.Email, S.Descripcion
GO

-- Se muestra el historial de suscripciones de cada usuario con fechas de alta y de baja, incluyendo el tipo de membresía y la vigencia de la misma.

CREATE VIEW VW_HistorialSuscripciones
AS
SELECT 
     U.IdUsuario,
     U.Nombre,
     U.Apellido,
     U.Email,
     S.Descripcion AS TipoMembresia,
    UXS.FechaAlta,
    UXS.FechaBaja,
    UXS.Activo AS EsSuscripcionActiva,
    CASE 
        WHEN UXS.Activo = 1 THEN 'Vigente'
        ELSE 'Finalizada'
    END AS EstadoVigencia
FROM UsuariosxSuscripciones UXS
INNER JOIN Usuarios U ON UXS.IdUsuario = U.IdUsuario
INNER JOIN Suscripciones S ON UXS.IdSuscripcion = S.IdSuscripcion;
GO

-- Se muestran las 10 películas con mejor calificación de mayor a menor

CREATE VIEW VW_RankingMejoresPuntuadas
AS

SELECT TOP 10
    p.IdPelicula,
    p.Titulo,
    p.PromedioCalificacion,
    p.URLImagen
FROM Peliculas p
WHERE p.Activo = 1
ORDER BY p.PromedioCalificacion DESC;
GO 

-- PROCEDIMIENTOS ALMACENADOS

-- Inserta el nuevo usuario en la tabla Usuarios e inserta la suscripción elegida en la tabla UsuariosxSuscripciones

CREATE PROCEDURE SP_RegistrarUsuario
    @Nombre VARCHAR(100),
    @Apellido VARCHAR(100),
    @DNI VARCHAR(10),
    @Email VARCHAR(100),
    @Password VARCHAR(100),
    @Telefono VARCHAR(25) = NULL,
    @IdSuscripcion INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
  
        INSERT INTO Usuarios (Nombre, Apellido, DNI, Email, 
		Password, Telefono, EsAdmin)
        VALUES (@Nombre, @Apellido, @DNI, @Email, 
		@Password, @Telefono, 0);
       
        DECLARE @NuevoIdUsuario INT;
        
        SELECT @NuevoIdUsuario = IdUsuario 
        FROM Usuarios 
        WHERE DNI = @DNI;
       
        INSERT INTO UsuariosxSuscripciones (IdUsuario, IdSuscripcion, 
		FechaAlta, FechaBaja, Activo)
        VALUES (@NuevoIdUsuario, @IdSuscripcion, GETDATE(), NULL, 1);
        
        COMMIT TRANSACTION;
        PRINT 'Usuario y suscripción registrados correctamente.';
        
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

-- Se realiza un SELECT de películas filtrando por título, género, director, clasificación, actor, año de estreno

CREATE PROCEDURE SP_BuscarPeliculas
(
    @Titulo VARCHAR(100) = NULL,
    @IdGenero INT = NULL,
    @IdDirector INT = NULL,
    @IdClasificacion INT = NULL,
    @IdActor INT = NULL,
    @AnioEstreno INT = NULL
)
AS
BEGIN
    SELECT DISTINCT P.IdPelicula, P.Titulo, P.DuracionMinutos, 
	P.FechaEstreno, P.PromedioCalificacion
    FROM Peliculas P
    INNER JOIN Directores D ON P.IdDirector = D.IdDirector
    INNER JOIN Clasificaciones C ON P.IdClasificacion = C.IdClasificacion
    LEFT JOIN PeliculasxGeneros PG ON PG.IdPelicula = P.IdPelicula
    LEFT JOIN Generos G ON PG.IdGenero = G.IdGenero
    LEFT JOIN PeliculasxActores PA ON P.IdPelicula = PA.IdPelicula
    LEFT JOIN Actores A ON PA.IdActor = A.IdActor
    WHERE P.Activo = 1
	AND (@Titulo IS NULL OR P.Titulo LIKE '%' + @Titulo + '%')
	AND (@IdGenero IS NULL OR G.IdGenero = @IdGenero)
	AND (@IdDirector IS NULL OR P.IdDirector = @IdDirector)
	AND (@IdClasificacion IS NULL OR P.IdClasificacion = @IdClasificacion)
	AND (@IdActor IS NULL OR A.IdActor = @IdActor)
	AND (@AnioEstreno IS NULL OR YEAR(P.FechaEstreno) = @AnioEstreno)
    ORDER BY P.Titulo;
END
GO

-- Se actualiza la suscripción de un Usuario dándose de baja la anterior y de alta la nueva

CREATE PROCEDURE SP_CambioSuscripcion
(@IdUsuario INT, @IdSuscripcionNueva INT)
AS
BEGIN
	BEGIN TRY

		IF NOT EXISTS (SELECT 1 FROM Suscripciones 
		WHERE IdSuscripcion = @IdSuscripcionNueva)
        BEGIN
            RAISERROR('La suscripción seleccionada no existe', 16, 1);
            RETURN;
        END
		
		IF EXISTS (SELECT 1 FROM UsuariosxSuscripciones 
		WHERE IdUsuario = @IdUsuario 
		AND IdSuscripcion = @IdSuscripcionNueva 
		AND Activo = 1)
        BEGIN
            RAISERROR('Ya posee esa suscripción activa', 16, 1);
            RETURN;
        END

		BEGIN TRANSACTION
		UPDATE UsuariosxSuscripciones SET Activo = 0, FechaBaja = GETDATE() 
		WHERE IdUsuario = @IdUsuario AND Activo = 1
		INSERT INTO UsuariosxSuscripciones 
		(IdUsuario, IdSuscripcion, FechaAlta, FechaBaja, Activo)
		VALUES (@IdUsuario, @IdSuscripcionNueva, GETDATE(), NULL, 1)
		COMMIT TRANSACTION

	END TRY
	BEGIN CATCH

		IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
		DECLARE @MensajeError VARCHAR(4000);
        SET @MensajeError = ERROR_MESSAGE();
		RAISERROR(@MensajeError, 16, 1);
		RETURN;

	END CATCH
END;
GO

-- Se inserta una nueva reseña de una determinada película de un determinado usuario o se modifica la existente

CREATE PROCEDURE SP_RegistrarResenia
    @IdUsuario INT,
    @IdPelicula INT,
    @Comentario VARCHAR(1000),
    @Calificacion INT
AS
BEGIN
    
	BEGIN TRY

    IF NOT EXISTS (SELECT 1 FROM UsuariosxSuscripciones
        WHERE IdUsuario = @IdUsuario AND Activo = 1
        AND FechaBaja IS NULL AND IdSuscripcion IN (2,3))
    BEGIN
        RAISERROR('Necesitás una suscripción Estándar o Premium activa para dejar reseñas', 16, 1);
        RETURN;
    END

	BEGIN TRANSACTION

    IF EXISTS (SELECT 1 FROM Resenias
	WHERE IdUsuario = @IdUsuario AND IdPelicula = @IdPelicula)
    BEGIN
        UPDATE Resenias SET Comentario = @Comentario,
        Calificacion = @Calificacion, Fecha = GETDATE()
        WHERE IdUsuario = @IdUsuario AND IdPelicula = @IdPelicula;
    END
    ELSE
    BEGIN
        INSERT INTO Resenias (IdUsuario, IdPelicula, Comentario, Calificacion, Fecha)
        VALUES (@IdUsuario, @IdPelicula, @Comentario, @Calificacion, GETDATE());
    END

	COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		DECLARE @MensajeError VARCHAR(4000);
        SET @MensajeError = ERROR_MESSAGE();
        RAISERROR(@MensajeError, 16, 1);
		RETURN;
	END CATCH

END;
GO

-- Se inserta una nueva visualización de una determinada película de un determinado usuario y se valida que el usuario posea suscripción Premium activa para poder realizar la inserción

CREATE PROCEDURE SP_RegistrarVisualizacion
    @IdUsuario INT,
    @IdPelicula INT
AS
BEGIN
    
	BEGIN TRY
	
	IF NOT EXISTS (SELECT 1 FROM UsuariosxSuscripciones uxs
        WHERE uxs.IdUsuario = @IdUsuario AND uxs.Activo = 1 
		AND uxs.FechaBaja IS NULL AND uxs.IdSuscripcion = 3)
    BEGIN
        RAISERROR('Requiere una suscripción Premium activa.', 16, 1);
        RETURN;
    END

	BEGIN TRANSACTION

    INSERT INTO Visualizaciones (IdUsuario, IdPelicula, FechaVisualizacion)
    VALUES (@IdUsuario, @IdPelicula, GETDATE());

	COMMIT TRANSACTION;
	
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		DECLARE @MensajeError VARCHAR(4000);
        SET @MensajeError = ERROR_MESSAGE();
        RAISERROR(@MensajeError, 16, 1);
		RETURN;
	END CATCH
END;
GO

-- TRIGGERS

-- Se evita que un usuario agregue dos veces una película a su watchlist si la película está activa. Si está inactiva, se vuelve a reactivar.

CREATE TRIGGER TR_EvitarDuplicadoWatchlist ON Watchlist
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @IdUsuario INT;
	SELECT @IdUsuario = IdUsuario FROM inserted
	DECLARE @IdPelicula INT;
	SELECT @IdPelicula = IdPelicula FROM inserted
	IF EXISTS (SELECT 1 FROM Watchlist 
	WHERE IdUsuario = @IdUsuario AND IdPelicula = @IdPelicula AND Activo = 1)
	BEGIN
		RAISERROR('La película ya se encuentra agregada a la watchlist', 16, 1);
		RETURN;
	END
	IF EXISTS (SELECT 1 FROM Watchlist 
	WHERE IdUsuario = @IdUsuario AND IdPelicula = @IdPelicula AND Activo = 0)
	BEGIN
		UPDATE Watchlist SET Activo = 1 
		WHERE IdUsuario = @IdUsuario AND IdPelicula = @IdPelicula
		RETURN;
	END
	INSERT INTO Watchlist (IdUsuario, IdPelicula, Activo) 
	VALUES (@IdUsuario, @IdPelicula, 1)
END
GO

-- Cada vez que un usuario reproduce una película, se suma 1 al contador de visualizaciones de dicha película

CREATE TRIGGER TR_ActualizarContadorVisualizaciones
ON Visualizaciones
AFTER INSERT
AS
BEGIN
    DECLARE @IdPelicula INT;
    SELECT @IdPelicula = IdPelicula FROM inserted
    UPDATE Peliculas
    SET ContadorVisualizaciones = ContadorVisualizaciones + 1
    WHERE IdPelicula = @IdPelicula;
END;
GO

-- En lugar de una baja física se hace una baja lógica de una película de una watchlist

CREATE TRIGGER TR_BajaLogicaWatchlist
ON Watchlist
INSTEAD OF DELETE
AS
BEGIN
   
    DECLARE @IdUsuario INT;
    DECLARE @IdPelicula INT;

    SELECT @IdUsuario = IdUsuario, @IdPelicula = IdPelicula FROM deleted;

    UPDATE Watchlist
    SET Activo = 0
    WHERE IdUsuario = @IdUsuario AND IdPelicula = @IdPelicula;
END;
GO

-- Cada vez que un usuario deja una reseña y califica una película, se actualiza el promedio de puntuación de dicha película

CREATE TRIGGER TR_ActualizarPromedioCalificacion
ON Resenias
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE p
    SET p.PromedioCalificacion = ISNULL((
        SELECT CAST(ROUND(AVG(CAST(r.Calificacion AS FLOAT)), 2) AS DECIMAL(4,2))
        FROM Resenias r
        WHERE r.IdPelicula = p.IdPelicula
    ), 0)
    FROM Peliculas p
    WHERE p.IdPelicula IN (
        SELECT DISTINCT IdPelicula
        FROM inserted
    );
END;
GO

-- Luego de que el administrador dé de baja una película, se eliminan lógicamente de todas las watchlists

CREATE TRIGGER TR_EliminarPeliculaDeWatchlists
ON Peliculas
AFTER UPDATE
AS
BEGIN

    DECLARE @IdPelicula INT;
    DECLARE @EstadoNuevo BIT;
    DECLARE @EstadoViejo BIT;

    SELECT @IdPelicula = IdPelicula, @EstadoNuevo = Activo 
	FROM inserted;

    SELECT @EstadoViejo = Activo FROM deleted;

    IF @EstadoNuevo = 0 AND @EstadoViejo = 1
    BEGIN     
        UPDATE Watchlist
        SET Activo = 0
        WHERE IdPelicula = @IdPelicula;
    END
END;
GO
