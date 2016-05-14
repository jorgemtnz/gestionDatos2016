IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Clientes') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Clientes
;

CREATE TABLE Clientes ( 
	idCliente int identity(1,1)  NOT NULL,
	idUsuario int,
	nombre nvarchar(255),
	apellido nvarchar(255),
	fechaNacimiento date,
	nroDNI numeric(18,2),
	tipoDocumento int,
	idHistorial int,
	tipoCliente nvarchar(255),
	beneficio1eraPublicacion bit
)
;

ALTER TABLE Clientes
	ADD CONSTRAINT UQ_Clientes_idCliente UNIQUE (idCliente)
;

ALTER TABLE Clientes ADD CONSTRAINT PK_Clientes 
	PRIMARY KEY CLUSTERED (idCliente)
;

ALTER TABLE Clientes ADD CONSTRAINT FK_Clientes_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
;











