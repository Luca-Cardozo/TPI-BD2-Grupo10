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
