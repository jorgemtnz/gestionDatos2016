IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Empresas') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Empresas
;

CREATE TABLE Empresas ( 
	idEmpresa int identity(1,1)  NOT NULL,
	idUsuario int NOT NULL,
	razonSocial nvarchar(255),
	cuit nvarchar(50),
	nombreContacto nvarchar(255),
	nombreRubro nvarchar(255),
	ciudad nvarchar(255),
	rubro nvarchar(255),
	beneficio1eraPublicacion bit
)
;

ALTER TABLE Empresas
	ADD CONSTRAINT UQ_Empresas_idEmpresa UNIQUE (idEmpresa)
;

ALTER TABLE Empresas
	ADD CONSTRAINT UQ_Empresas_idUsuario UNIQUE (idUsuario)
;

CREATE INDEX IDX_indice_empresas
ON Empresas (idEmpresa ASC)
;

ALTER TABLE Empresas ADD CONSTRAINT PK_Empresas 
	PRIMARY KEY CLUSTERED (idEmpresa)
;

ALTER TABLE Empresas ADD CONSTRAINT FK_Empresas_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
;










