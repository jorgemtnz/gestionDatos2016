IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Usuarios') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Usuarios
;

CREATE TABLE Usuarios ( 
	idUsuario int identity(1,1)  NOT NULL,
	codLocalidad int,
	password nvarchar(255),
	username nvarchar(255),
	flagHabilitado bit,
	tipoUsuario nvarchar(255),
	mail nvarchar(255),
	telefono nvarchar(255),
	codigoPostal nvarchar(50),
	nroPiso numeric(18),
	nroDpto nvarchar(50),
	fechaCreacion datetime,
	nroCalle numeric(18),
	domCalle nvarchar(255)
)
;

ALTER TABLE Usuarios
	ADD CONSTRAINT UQ_Usuarios_idUsuario UNIQUE (idUsuario)
;

CREATE INDEX IDX_indice_Usuarios
ON Usuarios (idUsuario ASC)
;

ALTER TABLE Usuarios ADD CONSTRAINT PK_Usuarios 
	PRIMARY KEY CLUSTERED (idUsuario)
;

ALTER TABLE Usuarios ADD CONSTRAINT FK_Usuarios_Localidades 
	FOREIGN KEY (codLocalidad) REFERENCES Localidades (codLocalidad)
;















