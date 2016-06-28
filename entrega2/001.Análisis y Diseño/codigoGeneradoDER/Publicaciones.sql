IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Publicaciones') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Publicaciones
;

CREATE TABLE Publicaciones ( 
	pCodigo numeric(18) identity(1,1)  NOT NULL,
	codVisibilidad numeric(18) NULL,
	codRubro int NOT NULL,
	idEstado int NULL,
	idUsuario int NULL,
	pDescripcion nvarchar(255) NULL,
	pStock numeric(18) NULL,
	pFecha datetime NULL,
	pFecha_Venc datetime NULL,
	pPrecio numeric(18,2) NULL,
	pCosto bigint NULL,
	pEnvio bit DEFAULT 1 NULL,
	pPreguntar bit DEFAULT 1 NULL
)
;

ALTER TABLE Publicaciones
	ADD CONSTRAINT UQ_Publicaciones_pCodigo UNIQUE (pCodigo)
;

CREATE UNIQUE INDEX IDX_publicacionesPK
ON Publicaciones (pCodigo ASC)
;

CREATE INDEX IDX_publicaciones_pDescripcion
ON Publicaciones (pDescripcion ASC)
;

CREATE INDEX IDX_publicaciones_Estados
ON Publicaciones (idEstado ASC)
;

CREATE INDEX IDX_publicaciones_visibilidad
ON Publicaciones (codVisibilidad ASC)
;

CREATE INDEX IDX_publicaciones_usuarios
ON Publicaciones (idUsuario ASC)
;

ALTER TABLE Publicaciones ADD CONSTRAINT PK_Publicaciones 
	PRIMARY KEY CLUSTERED (pCodigo)
;

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Estados 
	FOREIGN KEY (idEstado) REFERENCES Estados (idEstado)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Visibilidades 
	FOREIGN KEY (codVisibilidad) REFERENCES Visibilidades (Codigo)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Rubros 
	FOREIGN KEY (codRubro) REFERENCES Rubros (codRubro)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
	ON DELETE CASCADE ON UPDATE CASCADE
;














