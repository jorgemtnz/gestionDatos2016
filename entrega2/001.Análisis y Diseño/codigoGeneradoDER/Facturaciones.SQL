IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Facturaciones') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Facturaciones
;

CREATE TABLE Facturaciones ( 
	nroFactura numeric(18) identity(1,1)  NOT NULL,
	idFormaPago int NULL,
	idUsuario int NULL,
	codPublicacion numeric(18) NULL,
	fecha date NULL,
	monto numeric(10,2) NULL,
	total numeric(18,2) NULL,
	cTipoPublicacion numeric(10,2) NULL
)
;

ALTER TABLE Facturaciones
	ADD CONSTRAINT UQ_Facturaciones_nroFactura UNIQUE (nroFactura)
;

CREATE INDEX IDX_FacturacionesPK
ON Facturaciones (nroFactura ASC)
;

CREATE INDEX IDX_Facturaciones_idFormaPago
ON Facturaciones (idFormaPago ASC)
;

CREATE INDEX IDX_Facturaciones_codPublicacion
ON Facturaciones (codPublicacion ASC)
;

CREATE INDEX IDX_Facturaciones_idUsuario
ON Facturaciones (idUsuario ASC)
;

ALTER TABLE Facturaciones ADD CONSTRAINT PK_Facturaciones 
	PRIMARY KEY CLUSTERED (nroFactura)
;

ALTER TABLE Facturaciones ADD CONSTRAINT FK_Facturaciones_FormasPago 
	FOREIGN KEY (idFormaPago) REFERENCES FormasPago (idFormaPago)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Facturaciones ADD CONSTRAINT FK_Facturaciones_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
	ON DELETE CASCADE ON UPDATE CASCADE
;









