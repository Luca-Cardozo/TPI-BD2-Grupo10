

-- VISTAS

-- Se muestra el listado de usuarios con su cantidad de reseñas y reproducciones realizadas por cada uno de ellos y la suscripción de cada uno (para uso administrativo)

CREATE VIEW VW_ResumenActividadUsuarios
AS
SELECT U.Nombre, U.Apellido, U.DNI, U.Email,
S.Descripcion AS 'Suscripcion', COUNT(DISTINCT R.IdResenia) AS 'CantReseñas', COUNT(DISTINCT V.IdVisualizacion) AS 'CantReproducciones'
FROM Usuarios U
INNER JOIN UsuariosxSuscripciones US ON US.IdUsuario = U.IdUsuario
INNER JOIN Suscripciones S ON US.IdSuscripcion = S.IdSuscripcion
LEFT JOIN Resenias R ON R.IdUsuario = U.IdUsuario
LEFT JOIN Visualizaciones V ON V.IdUsuario = U.IdUsuario
WHERE US.Activo = 1
GROUP BY U.Nombre, U.Apellido, U.DNI, U.Email, S.Descripcion


-- PROCEDIMIENTOS ALMACENADOS

-- Se realiza un SELECT de películas filtrando por título, género, director, clasificación, actor, año de estreno)

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
    SELECT DISTINCT P.IdPelicula, P.Titulo, P.DuracionMinutos, P.FechaEstreno, P.PromedioCalificacion
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

-- Se actualiza la suscripción de un Usuario dándose de baja la anterior y de alta la nueva

CREATE PROCEDURE SP_CambioSuscripcion
(@IdUsuario INT, @IdSuscripcionNueva INT)
AS
BEGIN
	BEGIN TRY

		IF NOT EXISTS (SELECT 1 FROM Suscripciones WHERE IdSuscripcion = @IdSuscripcionNueva)
        BEGIN
            RAISERROR('La suscripción seleccionada no existe', 16, 1);
            RETURN;
        END
		
		IF EXISTS (SELECT 1 FROM UsuariosxSuscripciones WHERE IdUsuario = @IdUsuario AND IdSuscripcion = @IdSuscripcionNueva AND Activo = 1)
        BEGIN
            RAISERROR('El usuario ya posee esa suscripción activa', 16, 1);
            RETURN;
        END

		BEGIN TRANSACTION
		UPDATE UsuariosxSuscripciones SET Activo = 0, FechaBaja = GETDATE() WHERE IdUsuario = @IdUsuario AND Activo = 1
		INSERT INTO UsuariosxSuscripciones (IdUsuario, IdSuscripcion, FechaAlta, FechaBaja, Activo)
		VALUES (@IdUsuario, @IdSuscripcionNueva, GETDATE(), NULL, 1)
		COMMIT TRANSACTION

	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		DECLARE @MensajeError VARCHAR(4000);
        SET @MensajeError = ERROR_MESSAGE();
		RAISERROR(@MensajeError, 16, 1);
		RETURN;

	END CATCH
END

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
	IF EXISTS (SELECT 1 FROM Watchlist WHERE IdUsuario = @IdUsuario AND IdPelicula = @IdPelicula AND Activo = 1)
	BEGIN
		RAISERROR('La película ya se encuentra agregada a la watchlist', 16, 1);
		RETURN;
	END
	IF EXISTS (SELECT 1 FROM Watchlist WHERE IdUsuario = @IdUsuario AND IdPelicula = @IdPelicula AND Activo = 0)
	BEGIN
		UPDATE Watchlist SET Activo = 1 WHERE IdUsuario = @IdUsuario AND IdPelicula = @IdPelicula
		RETURN;
	END
	INSERT INTO Watchlist (IdUsuario, IdPelicula, Activo) VALUES (@IdUsuario, @IdPelicula, 1)
END

--VISTA
/*VW_RankingMejoresPuntuadas (se muestra las 10 películas con mejor calificación)*/
USE Peliculas_DB;
GO
CREATE VIEW VW_RankingMejoresPuntuadas
AS
SELECT TOP 10
    p.IdPelicula,
    p.Titulo,
    p.PromedioCalificacion
FROM Peliculas p
WHERE p.Activo = 1
ORDER BY p.PromedioCalificacion DESC;
GO

--PRUEBA DE VISTA.
SELECT *
FROM VW_RankingMejoresPuntuadas;
-- PROCEDIMIENTOS ALMACENADOS
/*SP_RegistrarResenia (INSERT de una nueva reseña de una determinada película de un determinado usuario, la cual modfica existente o carga nueva)*/

CREATE PROCEDURE SP_RegistrarResenia
    @IdUsuario INT,
    @IdPelicula INT,
    @Comentario VARCHAR(1000),
    @Calificacion INT
AS
BEGIN
    
	BEGIN TRY

    IF NOT EXISTS (
        SELECT 1
        FROM UsuariosxSuscripciones
        WHERE IdUsuario = @IdUsuario
          AND Activo = 1
          AND FechaBaja IS NULL
		  AND IdSuscripcion IN (2,3)
    )
    BEGIN
        RAISERROR('El usuario no tiene una suscripción activa para realizar reseñas.', 16, 1);
        RETURN;
    END

	BEGIN TRANSACTION

    IF EXISTS (
        SELECT 1
        FROM Resenias
        WHERE IdUsuario = @IdUsuario
          AND IdPelicula = @IdPelicula
    )
    BEGIN
        UPDATE Resenias
        SET Comentario = @Comentario,
            Calificacion = @Calificacion,
            Fecha = GETDATE()
        WHERE IdUsuario = @IdUsuario
          AND IdPelicula = @IdPelicula;
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
		RAISERROR('Ocurrió un error, no se pudo registrar la reseña', 16, 1);
		RETURN;
	END CATCH

END;
GO

/*SP_RegistrarVisualizacion (INSERT de una nueva visualización de una determinada película de un determinado usuario, se valida que el usuario posea suscripción Premium activa para poder realizar la inserción)
*/
CREATE PROCEDURE SP_RegistrarVisualizacion
    @IdUsuario INT,
    @IdPelicula INT
AS
BEGIN
    
	BEGIN TRY
	
	IF NOT EXISTS (
        SELECT 1
        FROM UsuariosxSuscripciones uxs
        WHERE uxs.IdUsuario = @IdUsuario
          AND uxs.Activo = 1
          AND uxs.FechaBaja IS NULL
          AND uxs.IdSuscripcion = 3
    )
    BEGIN
        RAISERROR('El usuario no posee una suscripción Premium activa.', 16, 1);
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
		RAISERROR('Ocurrió un error, no se pudo registrar la visualización', 16, 1);
		RETURN;
	END CATCH
END;
GO
/*--PRUEBA DE SP
EXEC SP_RegistrarResenia
    @IdUsuario = 14,
    @IdPelicula = 1,
    @Comentario = 'Excelente película',
    @Calificacion = 9;
SELECT *
FROM UsuariosxSuscripciones
WHERE Activo = 0
;

 SELECT *
FROM Resenias
WHERE IdUsuario = 1
AND IdPelicula = 1;
EXEC SP_RegistrarResenia
    @IdUsuario = 15,
    @IdPelicula = 1,
    @Comentario = 'Muy mala',
    @Calificacion = 1;
    
   UPDATE UsuariosxSuscripciones
SET Activo = 0,
    FechaBaja = GETDATE()
WHERE IdUsuario = 15
AND Activo = 1; 
    
    
    */

    --TRIGGER
/*TR_ActualizarPromedioCalificacion (cada vez que un usuario deja una reseña y califica una película, 
se actualiza el promedio de puntuación de dicha película)*/

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


