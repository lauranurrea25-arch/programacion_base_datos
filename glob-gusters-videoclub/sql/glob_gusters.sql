-- Base de Datos Relacional Glob-Gusters Video-Club
-- Autor: Andrés Felipe Gutiérrez Rivera
-- Fecha: 2024-06-10

-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS `glob_gusters` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `glob_gusters`;

-- Eliminación de la base de datos
-- DROP DATABASE IF EXISTS `glob_gusters`;
CREATE TABLE Nacionalidad(
  NacionalidadID integer PRIMARY KEY,
  Nombre varchar
);

CREATE TABLE Actor (
  ActorID integer PRIMARY KEY,
  Nombre varchar(255),
  Sexo char (1),
  NacionalidadID integer,
    CONSTRAINT fk_Nacionalidad
    FOREIGN KEY (NacionalidadID)
    REFERENCES Nacionalidad (NacionalidadID)
  
);
CREATE TABLE Reparto (
  ActorID integer,
  CONSTRAINT fk_Actor
  FOREIGN KEY (ActorID)
  REFERENCES Actor (ActorID)
  PeliculaID integer,
  CONSTRAINT fk_Pelicula
  FOREIGN KEY (PeliculaID)
  REFERENCES Pelicula (PeliculaID)
);
CREATE TABLE Pelicula (
  PeliculaID integer PRIMARY KEY,
  ProductoraID integer,
  CONSTRAINT fk_Productora
  FOREIGN KEY (ProductoraID)
  REFERENCES Productora (ProductoraID),
  NacionalidadID integer,
    CONSTRAINT fk_Nacionalidad
    FOREIGN KEY (NacionalidadID)
    REFERENCES Nacionalidad (NacionalidadID),
  Titulo varhar,
  Fecha date
);
  
  
  








