IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Empresas') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Empresas
;

CREATE TABLE Empresas ( 
	idEmpresa int identity(1,1)  NOT NULL,
	idUsuario int NOT NULL,
	razonSocial nvarchar(255) NULL,
	cuit nvarchar(50) NULL,
	nombreContacto nvarchar(255) NULL,
	nombreRubro nvarchar(255) NULL,
	ciudad nvarchar(255) NULL,
	rubro nvarchar(255) NULL
)
;

ALTER TABLE Empresas
	ADD CONSTRAINT UQ_Empresas_idEmpresa UNIQUE (idEmpresa)
;

ALTER TABLE Empresas
	ADD CONSTRAINT UQ_Empresas_idUsuario UNIQUE (idUsuario)
;

ALTER TABLE Empresas
	ADD CONSTRAINT UQ_Empresas_RazonSocial_Cuit UNIQUE (razonSocial, cuit)
;

CREATE INDEX IDX_indice_empresas
ON Empresas (idEmpresa ASC)
;

CREATE INDEX IDX_Empresas_RazonSocial_Cuit
ON Empresas (razonSocial ASC, cuit ASC)
;

CREATE INDEX IDX_indice_idUsuario
ON Empresas (idUsuario ASC)
;

ALTER TABLE Empresas ADD CONSTRAINT PK_Empresas 
	PRIMARY KEY CLUSTERED (idEmpresa)
;

ALTER TABLE Empresas ADD CONSTRAINT FK_Empresas_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
	ON DELETE CASCADE ON UPDATE CASCADE
;









