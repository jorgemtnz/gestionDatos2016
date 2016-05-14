IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Facturaciones') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Facturaciones
;

CREATE TABLE Facturaciones ( 
	nroFactura numeric(18) identity(1,1)  NOT NULL,
	idComision int,
	idItem int,
	idFormaPago int,
	idUsuario6 int,
	fecha date,
	monto numeric(10,2),
	maestroDetalle nvarchar(255),
	total numeric(18,2)
)
;

ALTER TABLE Facturaciones
	ADD CONSTRAINT UQ_Facturaciones_nroFactura UNIQUE (nroFactura)
;

ALTER TABLE Facturaciones ADD CONSTRAINT PK_Facturaciones 
	PRIMARY KEY CLUSTERED (nroFactura)
;

ALTER TABLE Facturaciones ADD CONSTRAINT FK_Facturaciones_Comisiones 
	FOREIGN KEY (idComision) REFERENCES Comisiones (idComision)
;

ALTER TABLE Facturaciones ADD CONSTRAINT FK_Facturaciones_FormasPago 
	FOREIGN KEY (idFormaPago) REFERENCES FormasPago (idFormaPago)
;

ALTER TABLE Facturaciones ADD CONSTRAINT FK_Facturaciones_Items 
	FOREIGN KEY (idItem) REFERENCES Items (idItem)
;

ALTER TABLE Facturaciones ADD CONSTRAINT FK_Facturaciones_Usuarios 
	FOREIGN KEY (idUsuario6) REFERENCES Usuarios (idUsuario)
;










