CREATE TABLE Empresas ( 
	razonSocial nvarchar(255),
	cuit nvarchar(255),
	nombreContacto nvarchar(50),
	idUsuario3 int,
	codRubro1 int,
	ciudad nvarchar(255),
	idEmpresa int NOT NULL,
	codLocalidad int NOT NULL
)
;

ALTER TABLE Empresas
	ADD CONSTRAINT UQ_Empresas_codLocalidad UNIQUE (codLocalidad)
;

ALTER TABLE Empresas
	ADD CONSTRAINT UQ_Empresas_idEmpresa UNIQUE (idEmpresa)
;

ALTER TABLE Empresas ADD CONSTRAINT PK_Empresas 
	PRIMARY KEY CLUSTERED (idEmpresa)
;

ALTER TABLE Empresas ADD CONSTRAINT FK_Empresas_Localidades 
	FOREIGN KEY (codLocalidad) REFERENCES Localidades (codLocalidad)
;

ALTER TABLE Empresas ADD CONSTRAINT FK_Empresas_Rubros 
	FOREIGN KEY (codRubro1) REFERENCES Rubros (codRubro)
;

ALTER TABLE Empresas ADD CONSTRAINT FK_Empresas_Usuarios 
	FOREIGN KEY (idUsuario3) REFERENCES Usuarios (idUsuario)
;









