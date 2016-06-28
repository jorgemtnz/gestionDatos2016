IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('ComprasInmediatas') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE ComprasInmediatas
;

CREATE TABLE ComprasInmediatas ( 
	idCompraInmediata int identity(1,1)  NOT NULL,
	idPublicacion numeric(18) NOT NULL,
	stockDisponible int DEFAULT 1 NOT NULL,
	unidadesVendidas int DEFAULT 0 NOT NULL
)
;

ALTER TABLE ComprasInmediatas
	ADD CONSTRAINT UQ_ComprasInmediatas_idCompraInmediata UNIQUE (idCompraInmediata)
;

CREATE INDEX IDX_ComprasInmediataPK
ON ComprasInmediatas (idCompraInmediata ASC)
;

CREATE INDEX IDX_ComprasInmediata_idPublicacion
ON ComprasInmediatas (idPublicacion ASC)
;

ALTER TABLE ComprasInmediatas ADD CONSTRAINT PK_ComprasInmediatas 
	PRIMARY KEY CLUSTERED (idCompraInmediata)
;

ALTER TABLE ComprasInmediatas ADD CONSTRAINT FK_ComprasInmediatas_Publicaciones 
	FOREIGN KEY (idPublicacion) REFERENCES Publicaciones (pCodigo)
	ON DELETE CASCADE ON UPDATE CASCADE
;





