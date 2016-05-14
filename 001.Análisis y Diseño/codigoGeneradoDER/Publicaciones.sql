IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Publicaciones') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Publicaciones
;

CREATE TABLE Publicaciones ( 
	pCodigo numeric(18) identity(1,1)  NOT NULL,
	pVisibilidad int,
	codRubro int NOT NULL,
	idFacturacion numeric(18),
	idEstado int,
	idUsuario int,
	idPregunta int,
	pDescripcion nvarchar(255),
	pStock numeric(18),
	pFecha datetime,
	pFecha_Venc datetime,
	pPrecio numeric(18,2),
	pTipo nvarchar(255),
	pEstado nvarchar(255),
	pRubro_Descripcion nvarchar(255),
	pCosto bigint,
	pIdUsuario int,
	pPreguntar bit,
	idEmpresa int,
	idCliente int,
	gratuita bit
)
;

ALTER TABLE Publicaciones
	ADD CONSTRAINT UQ_Publicaciones_pCodigo UNIQUE (pCodigo)
;

CREATE UNIQUE INDEX IDX_indice_publicaciones
ON Publicaciones (pCodigo ASC)
;

ALTER TABLE Publicaciones ADD CONSTRAINT PK_Publicaciones 
	PRIMARY KEY CLUSTERED (pCodigo)
;

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Estados 
	FOREIGN KEY (idEstado) REFERENCES Estados (idEstado)
;

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Facturaciones 
	FOREIGN KEY (idFacturacion) REFERENCES Facturaciones (nroFactura)
;

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Preguntas 
	FOREIGN KEY (idPregunta) REFERENCES Preguntas (idPregunta)
;

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Rubros 
	FOREIGN KEY (codRubro) REFERENCES Rubros (codRubro)
;

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
;

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Visibilidades 
	FOREIGN KEY (pVisibilidad) REFERENCES Visibilidades (idVisibilidad)
;






















