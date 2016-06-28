IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('PublicacionCostos') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE PublicacionCostos
;

CREATE TABLE PublicacionCostos ( 
	idCosto int identity(1,1)  NOT NULL,
	idFactura numeric(18) NOT NULL,
	idPublicacion numeric(18) NOT NULL,
	monto numeric(10,2) NULL
)
;

ALTER TABLE PublicacionCostos
	ADD CONSTRAINT UQ_PublicacionCostos_idCosto UNIQUE (idCosto)
;

ALTER TABLE PublicacionCostos
	ADD CONSTRAINT UQ_PublicacionCostos_idPublicacion UNIQUE (idPublicacion)
;

CREATE INDEX IDX_PublicacionCostosPK
ON PublicacionCostos (idCosto ASC)
;

CREATE INDEX IDX_ComprasInmediata_idFactura
ON PublicacionCostos (idFactura ASC)
;

CREATE INDEX IDX_ComprasInmediata_idPublicacion
ON PublicacionCostos (idPublicacion ASC)
;

ALTER TABLE PublicacionCostos ADD CONSTRAINT PK_PublicacionCostos 
	PRIMARY KEY CLUSTERED (idCosto)
;

ALTER TABLE PublicacionCostos ADD CONSTRAINT FK_PublicacionCostos_Facturaciones 
	FOREIGN KEY (idFactura) REFERENCES Facturaciones (nroFactura)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE PublicacionCostos ADD CONSTRAINT FK_PublicacionCostos_Publicaciones 
	FOREIGN KEY (idPublicacion) REFERENCES Publicaciones (pCodigo)
	ON DELETE CASCADE ON UPDATE CASCADE
;





