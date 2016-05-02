CREATE TABLE Usuarios ( 
	password nvarchar(255),
	username nvarchar(255),
	idUsuario int identity(1,1)  NOT NULL,
	tipoUsuario nvarchar(255),
	flagHabilitado bit,
	mail nvarchar(255),
	telefono nvarchar(255),
	codigoPostal nvarchar(255),
	nroPiso int,
	nroDpto int
)
;

ALTER TABLE Usuarios
	ADD CONSTRAINT UQ_Usuarios_idUsuario UNIQUE (idUsuario)
;

ALTER TABLE Usuarios ADD CONSTRAINT PK_Usuarios 
	PRIMARY KEY CLUSTERED (idUsuario)
;











