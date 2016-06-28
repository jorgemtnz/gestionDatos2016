IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Calificaciones') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Calificaciones
;

CREATE TABLE Calificaciones ( 
	codigoCalificacion numeric(18) identity(1,1)  NOT NULL,
	idCompra int NOT NULL,
	calificador int NULL,
	cantEstrellas numeric(18) NULL,
	observacion nvarchar(255) NULL
)
;

ALTER TABLE Calificaciones
	ADD CONSTRAINT UQ_Calificaciones_codigoCalificacion UNIQUE (codigoCalificacion)
;

CREATE INDEX IDX_calificacionPK
ON Calificaciones (codigoCalificacion ASC)
;

CREATE INDEX IDX_calificacion_Calificador
ON Calificaciones (calificador ASC)
;

CREATE INDEX IDX_idCompra
ON Calificaciones (idCompra ASC)
;

ALTER TABLE Calificaciones ADD CONSTRAINT PK_Clasificaciones 
	PRIMARY KEY CLUSTERED (codigoCalificacion)
;

ALTER TABLE Calificaciones ADD CONSTRAINT FK_Calificaciones_Compras 
	FOREIGN KEY (idCompra) REFERENCES Compras (idCompra)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Calificaciones ADD CONSTRAINT FK_Clasificaciones_Clientes 
	FOREIGN KEY (calificador) REFERENCES Clientes (idCliente)
;






