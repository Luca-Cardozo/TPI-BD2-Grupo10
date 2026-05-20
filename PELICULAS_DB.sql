--CREACIÓN DE LA BASE DE DATOS

CREATE DATABASE Peliculas_DB;
GO

USE Peliculas_DB;
GO

--GENEROS

CREATE TABLE Generos (
    IdGenero INT NOT NULL IDENTITY(1,1),
    Descripcion VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Generos PRIMARY KEY (IdGenero)
);
GO

--CLASIFICACIONES

CREATE TABLE Clasificaciones (
    IdClasificacion INT NOT NULL IDENTITY(1,1),
    Descripcion VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Clasificaciones PRIMARY KEY (IdClasificacion)
);
GO

--DIRECTORES

CREATE TABLE Directores (
    IdDirector INT NOT NULL IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Nacionalidad VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Directores PRIMARY KEY (IdDirector)
);
GO

--PELICULAS

CREATE TABLE Peliculas (
    IdPelicula INT NOT NULL IDENTITY(1,1),    
    Titulo VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(250) NOT NULL,
    DuracionMinutos INT NOT NULL CHECK(DuracionMinutos > 0),
    FechaEstreno DATE NOT NULL,
	IdDirector INT NOT NULL,
    IdClasificacion INT NOT NULL,
	URLImagen VARCHAR(300) NOT NULL,
	URLTrailer VARCHAR(300) NOT NULL,
    ContadorVisualizaciones INT NOT NULL DEFAULT 0,
    PromedioCalificacion DECIMAL(3,2) NOT NULL DEFAULT 0,
    Activo BIT NOT NULL DEFAULT 1,
    CONSTRAINT PK_Peliculas PRIMARY KEY (IdPelicula)
);
GO

--PELICULASXGENEROS

CREATE TABLE PeliculasxGeneros (
    Id INT NOT NULL IDENTITY(1,1),
    IdPelicula INT NOT NULL,
    IdGenero INT NOT NULL,
    CONSTRAINT PK_PeliculasxGeneros PRIMARY KEY (Id)
);


--USUARIOS
GO
CREATE TABLE Usuarios (
    IdUsuario INT NOT NULL IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    DNI VARCHAR(10) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(100) NOT NULL,
    Telefono VARCHAR(25) NULL,
    EsAdmin BIT NOT NULL DEFAULT 0,

    CONSTRAINT PK_Usuarios PRIMARY KEY (IdUsuario)
    );
    GO
    
    --SUSCRIPCIONES
    CREATE TABLE Suscripciones (
    IdSuscripcion INT NOT NULL IDENTITY(1,1),
    Descripcion VARCHAR(50) NOT NULL,
    PrecioMensual MONEY NOT NULL,

    CONSTRAINT PK_Suscripciones PRIMARY KEY (IdSuscripcion),
	CONSTRAINT CHK_Suscripciones_Precio CHECK (PrecioMensual >= 0)
    );

    GO
    --USUARIOSxSUSCRIPCIONES
    CREATE TABLE UsuariosxSuscripciones (
    Id INT NOT NULL IDENTITY(1,1),
    IdUsuario INT NOT NULL,
    IdSuscripcion INT NOT NULL,
    FechaAlta DATE NOT NULL DEFAULT GETDATE(),
    FechaBaja DATE NULL,
    Activo BIT NOT NULL DEFAULT 1,

    CONSTRAINT PK_UsuariosxSuscripciones PRIMARY KEY (Id),
    CONSTRAINT CHK_UsuariosxSuscripciones_FechaBaja
        CHECK (FechaBaja IS NULL OR FechaBaja >= FechaAlta)

    );
    GO
    
    --RESEÑAS
    CREATE TABLE Resenias (
    IdResenia INT NOT NULL IDENTITY(1,1),
    IdUsuario INT NOT NULL,
    IdPelicula INT NOT NULL,
    Comentario VARCHAR(1000) NOT NULL,
    Calificacion INT NOT NULL,
    Fecha DATE NOT NULL,

    CONSTRAINT PK_Resenias PRIMARY KEY (IdResenia),
    CONSTRAINT CHK_Resenias_Calificacion CHECK (Calificacion BETWEEN 1 AND 10)
);
GO
   --ACTORES
   CREATE TABLE Actores(
   IdActor INT NOT NULL IDENTITY(1,1),
   Nombre VARCHAR(100) NOT NULL,
   Apellido VARCHAR(100) NOT NULL,
   Nacionalidad VARCHAR(100) NOT NULL,

   CONSTRAINT PK_Actores PRIMARY KEY (IdActor)
   );
   GO

   --PELICULASXACTORES
   CREATE TABLE PeliculasxActores(
   Id INT NOT NULL IDENTITY(1,1),
   IdPelicula INT NOT NULL,
   IdActor INT NOT NULL,
    
   CONSTRAINT PK_PeliculasxActores PRIMARY KEY (Id)

   );
   GO

   -- VISUALIZACIONES
   CREATE TABLE Visualizaciones (
    IdVisualizacion INT NOT NULL IDENTITY(1,1),
    IdUsuario INT NOT NULL,
    IdPelicula INT NOT NULL,
    FechaVisualizacion DATE NOT NULL DEFAULT GETDATE(),
    
    CONSTRAINT PK_Visualizaciones PRIMARY KEY (IdVisualizacion)
   );
   GO

   -- WATCHLIST
  CREATE TABLE Watchlist (
    IdWatchlist INT NOT NULL IDENTITY(1,1),
    IdUsuario INT NOT NULL,
    IdPelicula INT NOT NULL,
    FechaAgregado DATE NOT NULL DEFAULT GETDATE(),
    Activo BIT NOT NULL DEFAULT 1,
    
    CONSTRAINT PK_Watchlist PRIMARY KEY (IdWatchlist)
  );
  GO

-- AGREGADO DE FKs
ALTER TABLE Peliculas
ADD CONSTRAINT FK_Peliculas_Director
FOREIGN KEY (IdDirector) REFERENCES Directores(IdDirector);
 
ALTER TABLE Peliculas
ADD CONSTRAINT FK_Peliculas_Clasificacion
FOREIGN KEY (IdClasificacion) REFERENCES Clasificaciones(IdClasificacion);
 
ALTER TABLE PeliculasxGeneros
ADD CONSTRAINT FK_PxG_Pelicula
FOREIGN KEY (IdPelicula) REFERENCES Peliculas(IdPelicula);
 
ALTER TABLE PeliculasxGeneros
ADD CONSTRAINT FK_PxG_Genero
FOREIGN KEY (IdGenero) REFERENCES Generos(IdGenero);

ALTER TABLE UsuariosxSuscripciones
ADD CONSTRAINT FK_UxS_Usuario
FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario);
 
ALTER TABLE UsuariosxSuscripciones
ADD CONSTRAINT FK_UxS_Suscripcion
FOREIGN KEY (IdSuscripcion) REFERENCES Suscripciones(IdSuscripcion);

ALTER TABLE PeliculasxActores
ADD CONSTRAINT FK_PxA_Pelicula
FOREIGN KEY (IdPelicula) REFERENCES Peliculas(IdPelicula);
 
ALTER TABLE PeliculasxActores
ADD CONSTRAINT FK_PxA_Actor
FOREIGN KEY (IdActor) REFERENCES Actores(IdActor);
 
ALTER TABLE Resenias
ADD CONSTRAINT FK_Resenias_Usuario
FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario);
 
ALTER TABLE Resenias
ADD CONSTRAINT FK_Resenias_Pelicula
FOREIGN KEY (IdPelicula) REFERENCES Peliculas(IdPelicula);
 
ALTER TABLE Visualizaciones
ADD CONSTRAINT FK_Visualizaciones_Usuario
FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario);
 
ALTER TABLE Visualizaciones
ADD CONSTRAINT FK_Visualizaciones_Pelicula
FOREIGN KEY (IdPelicula) REFERENCES Peliculas(IdPelicula);
 
ALTER TABLE Watchlist
ADD CONSTRAINT FK_Watchlist_Usuario
FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario);
 
ALTER TABLE Watchlist
ADD CONSTRAINT FK_Watchlist_Pelicula
FOREIGN KEY (IdPelicula) REFERENCES Peliculas(IdPelicula);




