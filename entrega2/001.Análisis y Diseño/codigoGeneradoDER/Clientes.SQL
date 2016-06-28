IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Clientes') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Clientes
;

CREATE TABLE Clientes ( 
	idCliente int identity(1,1)  NOT NULL,
	idUsuario int NULL,
	nombre nvarchar(255) NULL,
	apellido nvarchar(255) NULL,
	fechaNacimiento date NULL,
	nroDNI numeric(18,2) NULL,
	tipoDocumento int NULL,
	tipoCliente nvarchar(255) NULL
)
;

ALTER TABLE Clientes
	ADD CONSTRAINT UQ_Clientes_idUsuario UNIQUE (idUsuario)
;

ALTER TABLE Clientes
	ADD CONSTRAINT UQ_Clientes_idCliente UNIQUE (idCliente)
;

CREATE INDEX IDX_Clientes_nombre
ON Clientes (nombre ASC)
;

CREATE INDEX IDX_Clientes_apellido
ON Clientes (apellido ASC)
;

CREATE INDEX IDX_Clientes_nroDNI_tipoDocumento
ON Clientes (nroDNI ASC, tipoDocumento ASC)
;

ALTER TABLE Clientes
	ADD CONSTRAINT UQ_Clientes_nroDni_tipoDocumento UNIQUE (nroDNI, tipoDocumento)
;

CREATE INDEX IDX_Clientes_Clientes_usuarios
ON Clientes (idUsuario ASC)
;

CREATE INDEX IDX_Clientes_PK
ON Clientes (idCliente ASC)
;

ALTER TABLE Clientes ADD CONSTRAINT PK_Clientes 
	PRIMARY KEY CLUSTERED (idCliente)
;

ALTER TABLE Clientes ADD CONSTRAINT FK_Clientes_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
	ON DELETE CASCADE ON UPDATE CASCADE
;









