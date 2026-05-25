

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
