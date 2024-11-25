CREATE DATABASE GestionEquipos;
GO

USE GestionEquipos;
GO

CREATE TABLE Usuarios (
    UsuarioID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50),
    Apellido NVARCHAR(50),
    Email NVARCHAR(100)
);

CREATE TABLE Tecnicos (
    T�cnicoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50),
    Apellido NVARCHAR(50),
    Especialidad NVARCHAR(50)
);

CREATE TABLE Equipos (
    EquipoID INT IDENTITY(1,1) PRIMARY KEY,
    EquipmentName NVARCHAR(50),
    Model NVARCHAR(50),
    UsuarioID INT FOREIGN KEY REFERENCES Usuarios(UsuarioID),
    T�cnicoID INT FOREIGN KEY REFERENCES Tecnicos(T�cnicoID)
);
GO
-- Procedimientos almacenados para Equipos

CREATE PROCEDURE sp_InsertarEquipo
    @EquipmentName VARCHAR(50),
    @Model VARCHAR(50),
    @UsuarioID INT,
    @T�cnicoID INT
AS
BEGIN
    INSERT INTO Equipos (EquipmentName, Model, UsuarioID, T�cnicoID)
    VALUES (@EquipmentName, @Model, @UsuarioID, @T�cnicoID);
END
GO

CREATE PROCEDURE sp_LeerEquipos
AS
BEGIN
    SELECT * FROM Equipos;
END
GO
CREATE PROCEDURE sp_ActualizarEquipo
    @EquipoID INT,
    @EquipmentName NVARCHAR(50),
    @Model NVARCHAR(50),
    @UsuarioID INT,
    @T�cnicoID INT
AS
BEGIN
    UPDATE Equipos
    SET EquipmentName = @EquipmentName,
        Model = @Model,
        UsuarioID = @UsuarioID,
        T�cnicoID = @T�cnicoID
    WHERE EquipoID = @EquipoID;
END
GO
CREATE PROCEDURE sp_EliminarEquipo
    @EquipoID INT
AS
BEGIN
    DELETE FROM Equipos
    WHERE EquipoID = @EquipoID;
END

