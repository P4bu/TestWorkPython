-- Crear la base de datos
CREATE DATABASE TestColegioDB;
GO

USE TestColegioDB;
GO

-- Crear la tabla de Profesores
CREATE TABLE Profesores (
    ProfesorID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Apellido NVARCHAR(100) NOT NULL
);
GO

-- Crear la tabla de Alumnos
CREATE TABLE Alumnos (
    AlumnoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Apellido NVARCHAR(100) NOT NULL
);
GO

-- Crear la tabla de Cursos
CREATE TABLE Cursos (
    CursoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL UNIQUE,
    ProfesorID INT NOT NULL,
    FOREIGN KEY (ProfesorID) REFERENCES Profesores(ProfesorID)
);
GO

-- Crear la tabla de Inscripciones
CREATE TABLE Inscripciones (
    InscripcionID INT IDENTITY(1,1) PRIMARY KEY,
    AlumnoID INT NOT NULL,
    CursoID INT NOT NULL,
    FOREIGN KEY (AlumnoID) REFERENCES Alumnos(AlumnoID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID),
    UNIQUE (AlumnoID, CursoID) -- Para no repetir el alumno en el mismo curso
);
GO

-- Crear la tabla de Pruebas
CREATE TABLE Pruebas (
    PruebaID INT IDENTITY(1,1) PRIMARY KEY,
    CursoID INT NOT NULL,
    Fecha DATE NOT NULL,
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);
GO

-- Crear la tabla de Notas
CREATE TABLE Notas (
    NotaID INT IDENTITY(1,1) PRIMARY KEY,
    AlumnoID INT NOT NULL,
    PruebaID INT NOT NULL,
    Nota DECIMAL(5,2) NOT NULL
    FOREIGN KEY (AlumnoID) REFERENCES Alumnos(AlumnoID),
    FOREIGN KEY (PruebaID) REFERENCES Pruebas(PruebaID),
    UNIQUE (AlumnoID, PruebaID)  --Para que unalumno no puede tener la misma nota en la misma prueba
);
GO
