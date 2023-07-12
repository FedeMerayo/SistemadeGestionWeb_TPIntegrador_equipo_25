-- Create the RestoDB database
DROP DATABASE IF EXISTS RestoDB;
GO

CREATE DATABASE RestoDB;
GO

USE RestoDB;
GO

-- Create Table TIPOUSUARIO
IF OBJECT_ID('TIPOUSUARIO', 'U') IS NOT NULL
    DROP TABLE TIPOUSUARIO;

GO

CREATE TABLE TIPOUSUARIO
(
    IdTipoUsuario INT NOT NULL IDENTITY(1,1),
    Descripcion VARCHAR(45) NOT NULL,
    PRIMARY KEY (IdTipoUsuario)
);

GO

IF OBJECT_ID('USUARIO', 'U') IS NOT NULL
    DROP TABLE USUARIO;

GO

-- Create Table USUARIO
CREATE TABLE USUARIO
(
    IdUsuario INT NOT NULL IDENTITY(1,1),
    TipoUsuario INT NOT NULL,
    Nombres VARCHAR(45) NOT NULL,
    Apellidos VARCHAR(45) NOT NULL,
    Mail VARCHAR(45) NOT NULL,
    Pass VARCHAR(45) NOT NULL DEFAULT 'password',
    Activo bit null
    PRIMARY KEY (IdUsuario)
);

GO

IF OBJECT_ID('CATEGORIAPRODUCTO', 'U') IS NOT NULL
    DROP TABLE CATEGORIAPRODUCTO;

GO

-- Create Table CATEGORIAPRODUCTO
CREATE TABLE CATEGORIAPRODUCTO
(
    IdCategoriaProducto INT NOT NULL IDENTITY(1,1),
    Descripcion VARCHAR(45) NOT NULL,
    PRIMARY KEY (IdCategoriaProducto)
);

GO

IF OBJECT_ID('PRODUCTOS', 'U') IS NOT NULL
    DROP TABLE PRODUCTOS;

-- Create Table PRODUCTOS
CREATE TABLE PRODUCTOS
(
    IdProducto INT NOT NULL IDENTITY(1,1),
    CategoriaProducto INT NOT NULL,
    Nombre VARCHAR(45) NOT NULL,
    Descripcion VARCHAR(45) NOT NULL,
    Valor DECIMAL(10,2) NOT NULL,
    AptoVegano BIT NULL,
    AptoCeliaco BIT NULL,
    Alcohol BIT NULL,
    Stock INT NULL,
    Activo BIT NOT NULL,
    TiempoCoccion TIME NULL,
    PRIMARY KEY (IdProducto)
);

GO

IF OBJECT_ID('MESA', 'U') IS NOT NULL
    DROP TABLE MESA;

GO

-- Create Table MESA
CREATE TABLE MESA
(
    IdMesa INT NOT NULL,
    Capacidad INT NOT NULL,
    Activo BIT NOT NULL,
    PRIMARY KEY (IdMesa),
    UNIQUE (IdMesa)
);

GO

IF OBJECT_ID('MESASPORDIA', 'U') IS NOT NULL
    DROP TABLE MESASPORDIA;

GO

-- Create Table MESASPORDIA
CREATE TABLE MESASPORDIA
(
    IdMesaPorDia INT NOT NULL IDENTITY(1,1),
    IdMeseroPorDia INT,
    IdMesa INT NOT NULL,
    Fecha DATE NOT NULL,
    IdMesero INT,
    Apertura TIME,
     Cierre TIME
    PRIMARY KEY (IdMesaPorDia)
);

GO

IF OBJECT_ID('SERVICIO', 'U') IS NOT NULL
    DROP TABLE SERVICIO;

GO

-- Create Table SERVICIO
CREATE TABLE SERVICIO
(
    IdServicio INT NOT NULL IDENTITY(1,1),
    IdMesaPorDia INT NOT NULL,
    Fecha DATE NOT NULL DEFAULT GETDATE(),
    Apertura TIME NOT NULL DEFAULT GETDATE(),
    Cierre TIME NULL,
    Cobrado BIT NOT NULL DEFAULT 0,
    PRIMARY KEY (IdServicio)
);

GO

IF OBJECT_ID('PEDIDO', 'U') IS NOT NULL
    DROP TABLE PEDIDO;


GO

-- Create Table PEDIDO
-- CREATE TABLE PEDIDO
-- (
--     IdPedido INT NOT NULL IDENTITY(1,1),
--     IdServicio INT NOT NULL,
--     Fecha DATE NOT NULL DEFAULT GETDATE(),
--     Apertura TIME NOT NULL DEFAULT GETDATE(),
--     Cierre TIME NULL,
--     PRIMARY KEY (IdPedido)
-- );

CREATE TABLE PEDIDO
(
    IdPedido INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    IdServicio INT NOT NULL,
)

GO

IF OBJECT_ID('PRODUCTOSPORDIA_MENU', 'U') IS NOT NULL
    DROP TABLE PRODUCTOSPORDIA_MENU;

GO

-- Create Table PRODUCTOSPORDIA_MENU
CREATE TABLE PRODUCTOSPORDIA_MENU (
    IdProducto INT NOT NULL,
    CategoriaProducto INT NOT NULL,
    Nombre VARCHAR(45) NOT NULL,
    Descripcion VARCHAR(45) NOT NULL,
    Valor DECIMAL(10,2) NOT NULL,
    AptoVegano BIT NULL,
    AptoCeliaco BIT NULL,
    Alcohol BIT NULL,
    Stock INT NULL,
    Activo BIT NOT NULL,
    TiempoCoccion TIME NULL,
    Fecha DATE NOT NULL,
    StockInicial INT NOT NULL,
    StockCierre INT NOT NULL,
    PRIMARY KEY(IdProducto, Fecha)
);

GO

IF OBJECT_ID('PRODUCTOPORPEDIDO', 'U') IS NOT NULL
    DROP TABLE PRODUCTOPORPEDIDO;

GO

-- Create Table PRODUCTOPORPEDIDO
CREATE TABLE PRODUCTOPORPEDIDO
(
    IdProductoPorPedido INT NOT NULL IDENTITY(1,1),
    IdPedido INT NOT NULL,
    IdProducto INT NOT NULL,
    Cantidad VARCHAR(45) NOT NULL,
    Valor DECIMAL(10,2),
    PRIMARY KEY (IdProductoPorPedido)
);

GO

IF OBJECT_ID('MESEROPORDIA', 'U') IS NOT NULL
    DROP TABLE MESEROPORDIA;

GO

-- Create Table MESEROPORDIA
CREATE TABLE MESEROPORDIA
(
    IdMeseroPorDia INT NOT NULL IDENTITY(1,1),
    IdMesero INT NOT NULL,
    Fecha DATE NOT NULL,
    Ingreso TIME DEFAULT GETDATE(),
    Salida TIME,
    PRIMARY KEY (IdMeseroPorDia)
);

GO

IF OBJECT_ID('PRODUCTO_X_PEDIDO', 'U') IS NOT NULL
    DROP TABLE PRODUCTO_X_PEDIDO;

GO

-- Create Table PRODUCTO_X_PEDIDO
CREATE TABLE PRODUCTO_X_PEDIDO
(
    IdProductoPorPedido INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    IdPedido INT NOT NULL,
    IdProductopordia INT NOT NULL, 
    Fecha DATE NOT NULL,
    Cantidad int NOT NULL,
    Valor DECIMAL(10,2) NULL
)

GO

IF OBJECT_ID('ESTADO_X_PEDIDO', 'U') IS NOT NULL
    DROP TABLE ESTADO_X_PEDIDO;

GO

-- Create Table PRODUCTO_X_PEDIDO
CREATE TABLE ESTADO_X_PEDIDO (
    IdPedido INT NOT NULL,
    IdEstado INT NOT NULL,  
    FechaActualizacion DATETIME NOT NULL
)

GO

IF OBJECT_ID('ESTADOPEDIDO', 'U') IS NOT NULL
    DROP TABLE ESTADOPEDIDO;

GO

-- Create Table PRODUCTO_X_PEDIDO
CREATE TABLE ESTADOPEDIDO (
IdEstado INT NOT NULL PRIMARY KEY IDENTITY (1,1),
Descripcion Varchar (30) NOT NULL
)

GO

-- FOREIGN KEYS --

--ALTER CONSTRAINT FK_USUARIO_TIPOUSUARIO ON USUARIO;
ALTER TABLE USUARIO
ADD CONSTRAINT FK_USUARIO_TIPOUSUARIO FOREIGN KEY (TipoUsuario)
REFERENCES TIPOUSUARIO (IdTipoUsuario);

GO

--ALTER CONSTRAINT FK_PRODUCTOS_CATEGORIAPRODUCTO ON PRODUCTOS;
ALTER TABLE PRODUCTOS
ADD CONSTRAINT FK_PRODUCTOS_CATEGORIAPRODUCTO FOREIGN KEY (CategoriaProducto)
REFERENCES CATEGORIAPRODUCTO (IdCategoriaProducto);

GO

--ALTER CONSTRAINT FK_MESASPORDIA_IDMESERO ON MESASPORDIA;
ALTER TABLE MESASPORDIA
ADD CONSTRAINT FK_MESASPORDIA_IDMESERO FOREIGN KEY (IdMesero)
REFERENCES USUARIO (IdUsuario);

GO

ALTER TABLE MESASPORDIA
ADD CONSTRAINT FK_MESASPORDIA_MESEROPORDIA FOREIGN KEY (IdMeseroPorDia)
REFERENCES MESEROPORDIA (IdMeseroPorDia);

GO

ALTER TABLE MESASPORDIA
ADD CONSTRAINT FK_MESASPORDIA_IDMESA FOREIGN KEY (IdMesa)
REFERENCES MESA (IdMesa);

GO

--ALTER CONSTRAINT FK_SERVICIO_MESASPORDIA ON SERVICIO;
ALTER TABLE SERVICIO
ADD CONSTRAINT FK_SERVICIO_MESASPORDIA FOREIGN KEY (IdMesaPorDia)
REFERENCES MESASPORDIA (IdMesaPorDia);

GO

--ALTER CONSTRAINT FK_PEDIDO_SERVICIO ON PEDIDO;
ALTER TABLE PEDIDO
ADD CONSTRAINT FK_PEDIDO_SERVICIO FOREIGN KEY (IdServicio)
REFERENCES SERVICIO (IdServicio);

GO

--ALTER CONSTRAINT FK_PRODUCTOPORPEDIDO_IDPEDIDO ON PRODUCTOPORPEDIDO;
ALTER TABLE PRODUCTOPORPEDIDO
ADD CONSTRAINT FK_PRODUCTOPORPEDIDO_IDPEDIDO FOREIGN KEY (IdPedido)
REFERENCES PEDIDO (IdPedido);

GO

--ALTER CONSTRAINT FK_PRODUCTOPORPEDIDO_IDPRODUCTO ON PRODUCTOPORPEDIDO;
ALTER TABLE PRODUCTOPORPEDIDO
ADD CONSTRAINT FK_PRODUCTOPORPEDIDO_IDPRODUCTO FOREIGN KEY (IdProducto)
REFERENCES PRODUCTOS (IdProducto);

GO

-- ALTER CONSTRAINT FK_MESEROPORDIA_USUARIO ON MESEROPORDIA;
ALTER TABLE MESEROPORDIA
ADD CONSTRAINT FK_MESEROPORDIA_USUARIO FOREIGN KEY (IdMesero)
REFERENCES USUARIO (IdUsuario);

GO

-- ALTER CONSTRAINT FK_PRODUCTO_X_PEDIDO_IDPEDIDO ON PRODUCTO_X_PEDIDO;
ALTER TABLE PRODUCTO_X_PEDIDO
ADD CONSTRAINT FK_PRODUCTO_X_PEDIDO_IDPEDIDO FOREIGN KEY (IdPedido)
REFERENCES PEDIDO (IdPedido)

GO

-- ALTER CONSTRAINT FK_PRODUCTO_X_PEDIDO_IDPRODUCTOPORDIA ON PRODUCTO_X_PEDIDO;
ALTER TABLE PRODUCTO_X_PEDIDO
ADD CONSTRAINT FK_PRODUCTO_X_PEDIDO_IDPRODUCTOPORDIA FOREIGN KEY (IdProductopordia, Fecha)
REFERENCES PRODUCTOSPORDIA_MENU (IdProducto, Fecha);

GO

-- ALTER CONSTRAINT FK_ESTADO_X_PEDIDO_IDPEDIDO ON ESTADO_X_PEDIDO;
ALTER TABLE PEDIDO
ADD CONSTRAINT FK_PEDIDO_IDSERVICIO FOREIGN KEY (IdServicio)
REFERENCES SERVICIO (IdServicio);

GO

-- ALTER CONSTRAINT FK_ESTADO_X_PEDIDO_IDESTADO ON ESTADO_X_PEDIDO;
ALTER TABLE ESTADO_X_PEDIDO
ADD CONSTRAINT FK_ESTADO_X_PEDIDO_IDPEDIDO FOREIGN KEY (IdPedido)
REFERENCES PEDIDO (IdPedido);

GO

-- ALTER CONSTRAINT FK_ESTADO_X_PEDIDO_IDESTADO ON ESTADO_X_PEDIDO;
ALTER TABLE ESTADO_X_PEDIDO
ADD CONSTRAINT FK_ESTADO_X_PEDIDO_IDESTADO FOREIGN KEY (IdEstado)
REFERENCES ESTADOPEDIDO (IdEstado)


--TRIGGER

GO

create TRIGGER TR_INSERTARESTADO ON ESTADO_X_PEDIDO
INSTEAD OF INSERT
AS
BEGIN
BEGIN TRY
    BEGIN TRANSACTION
	DECLARE @IDPEDIDO INT
    DECLARE @IDESTADO INT
    DECLARE @FECHA DATETIME
    DECLARE @BANDERA BIT
    SELECT @IDESTADO=IdEstado, @IDPEDIDO=IdPedido,@FECHA=FechaActualizacion from inserted
    
    SELECT @BANDERA = COUNT(*) FROM ESTADO_X_PEDIDO WHERE IdEstado = @IDESTADO AND IdPedido = @IDPEDIDO    
	
    IF(@BANDERA>0)
    BEGIN
        ROLLBACK TRANSACTION
    END
    ELSE 
    begin
    INSERT INTO ESTADO_X_PEDIDO (IdEstado,IdPedido,FechaActualizacion)
        values (@IDESTADO,@IDPEDIDO,@FECHA)
    END
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
END CATCH
END

GO

-- INSERTS --

-- Insert into TIPOUSUARIO
INSERT INTO TIPOUSUARIO
    (Descripcion)
VALUES
    ('Gerente'),
    ('Admin'),
    ('Mesero'),
    ('Cocinero');

GO

-- Insert into USUARIO
INSERT INTO USUARIO
    (TipoUsuario, Nombres, Apellidos, Mail, Pass, Activo)
VALUES
    (1, 'Juan', 'Pérez', 'juan@mail.com', '123', 1),
    (2, 'María', 'Gómez', 'maria@mail.com', '123', 1),
    (3, 'Pedro', 'López', 'pedro@mail.com', '123', 1),
    (3, 'Luis', 'García', 'luis@mail.com', '123', 1),
    (3, 'Ana', 'Martínez', 'ana@mail.com', '123', 1),
    (3, 'Diego', 'Hernández', 'diego@mail.com', '123', 1),
    (4, 'Carolina', 'López', 'carolina@mail.com', '123', 1),
    (4, 'Ramon', 'Romero', 'ramon@mail.com', '123', 1);

GO

-- Insert into MESA
INSERT INTO MESA
    (IdMesa, Capacidad, Activo)
VALUES
    (1, 4, 0),
    (2, 6, 0),
    (3, 2, 0),
    (4, 8, 0),
    (5, 4, 0),
    (6, 6, 0),
    (7, 2, 0),
    (8, 4, 0),
    (9, 6, 0),
    (10, 2, 0),
    (11, 4, 0),
    (12, 6, 0),
    (13, 2, 0),
    (14, 4, 0),
    (15, 6, 0),
    (16, 2, 0),
    (17, 4, 0),
    (18, 6, 0),
    (19, 2, 0),
    (20, 4, 0);

-- Insert data into CATEGORIAPRODUCTO table
INSERT INTO CATEGORIAPRODUCTO (Descripcion)
VALUES ('Bebidas'), ('Entradas'), ('Platos Principales'), ('Postres');
