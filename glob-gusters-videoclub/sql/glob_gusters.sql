-- Base de Datos Relacional Glob-Gusters Video-Club
-- Autor: Laura Urrea
-- Fecha: 2024-09-18

-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS `glob_gusters` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `glob_gusters`;

-- Eliminación de la base de datos
-- DROP DATABASE IF EXISTS `glob_gusters`;
CREATE TABLE Nacionalidad(
  NacionalidadID integer PRIMARY KEY,
  Nombre varchar(255)
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
  REFERENCES Actor (ActorID),
  PeliculaID integer,
  CONSTRAINT fk_Pelicula
  FOREIGN KEY (PeliculaID)
  REFERENCES Pelicula (PeliculaID),
  Rol integer
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
  Titulo varchar (255),
  Fecha date,
  DirectorID integer,
    CONSTRAINT fk_Director
    FOREIGN KEY (DirectorID)
    REFERENCES Director (DirectorID)
);

CREATE TABLE Productora (
  ProductoraID integer PRIMARY KEY,
  Nombre varchar(255)
);

CREATE TABLE Director(
  DirectorID integer PRIMARY KEY,
  NacionalidadID integer,
    CONSTRAINT fk_Nacionalidad
    FOREIGN KEY (NacionalidadID)
    REFERENCES Nacionalidad (NacionalidadID),
  Nombre varchar(255)
);

CREATE TABLE Ejemplar (
  Ejemplar_NumeroID integer PRIMARY KEY,
  EstadoID integer,
    CONSTRAINT fk_Estado
    FOREIGN KEY (EstadoID)
    REFERENCES Estado (EstadoID),
  PeliculaID integer,
  CONSTRAINT fk_Pelicula
  FOREIGN KEY (PeliculaID)
  REFERENCES Pelicula (PeliculaID)
);

CREATE TABLE Estado(
  EstadoID integer PRIMARY KEY,
  Nombre varchar (255)
);
CREATE TABLE Ejemplar_Renta(
  Ejemplar_Numero integer,
    CONSTRAINT fk_Ejemplar
    FOREIGN KEY (Ejemplar_NumeroID)
    REFERENCES Ejemplar (Ejemplar_NumeroID),
  Renta_Numero integer,
    CONSTRAINT fk_Renta
    FOREIGN KEY (Renta_NumeroID)
    REFERENCES Renta (Renta_NumeroID),
  Entrega date
);
CREATE TABLE Renta(
  Renta_Numero integer PRIMARY KEY,
  Cliente_DNI integer,
  CONSTRAINT fk_Cliente
  FOREIGN KEY (Cliente_DNI)
  REFERENCES Cliente (Cliente_DNI),
  Inicia date,
  Termina date
);
CREATE TABLE Cliente(
  Cliente_DNI integer PRIMARY KEY,
  Nombre varchar(255),
  Direccion varchar(255),
  Telefono varchar(255)
);
  
  
  








