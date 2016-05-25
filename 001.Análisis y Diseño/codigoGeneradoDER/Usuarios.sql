IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Usuarios') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Usuarios
;

CREATE TABLE Usuarios ( 
	idUsuario int identity(1,1)  NOT NULL,
	codLocalidad int NULL,
	password nvarchar(255) NOT NULL,
	username nvarchar(255) NOT NULL,
	flagHabilitado bit DEFAULT 1 NULL,
	tipoUsuario nvarchar(255) NULL,
	mail nvarchar(255) NULL,
	telefono nvarchar(255) NULL,
	nroPiso numeric(18) NULL,
	nroDpto nvarchar(50) NULL,
	fechaCreacion datetime NULL,
	nroCalle numeric(18) NULL,
	domCalle nvarchar(255) NULL,
	codPostal nvarchar(50) NULL,
	intentosFallidos int DEFAULT 0 NOT NULL,
	reputacion int NULL
)
;

ALTER TABLE Usuarios
	ADD CONSTRAINT UQ_Usuarios_username UNIQUE (username)
;

ALTER TABLE Usuarios
	ADD CONSTRAINT UQ_Usuarios_idUsuario UNIQUE (idUsuario)
;

CREATE INDEX IDX_indice_Usuarios
ON Usuarios (idUsuario ASC)
;

CREATE INDEX IDX_usuarios_username
ON Usuarios (username ASC)
;

CREATE INDEX IDX_Usuarios_Localidades
ON Usuarios (codLocalidad ASC)
;

ALTER TABLE Usuarios ADD CONSTRAINT PK_Usuarios 
	PRIMARY KEY CLUSTERED (idUsuario)
;

ALTER TABLE Usuarios ADD CONSTRAINT FK_Usuarios_Localidades 
	FOREIGN KEY (codLocalidad) REFERENCES Localidades (codLocalidad)
	ON DELETE CASCADE ON UPDATE CASCADE
;

















