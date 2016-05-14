IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Calificaciones') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Calificaciones
;

CREATE TABLE Calificaciones ( 
	codigoCalificacion numeric(18) identity(1,1)  NOT NULL,
	calificador int,
	userVta nvarchar(255),
	cantEstrellas numeric(18),
	observacion nvarchar(255)
)
;

ALTER TABLE Calificaciones
	ADD CONSTRAINT UQ_Calificaciones_codigoCalificacion UNIQUE (codigoCalificacion)
;

CREATE INDEX IDX_indice_calificacion
ON Calificaciones (codigoCalificacion ASC)
;

ALTER TABLE Calificaciones ADD CONSTRAINT PK_Clasificaciones 
	PRIMARY KEY CLUSTERED (codigoCalificacion)
;

ALTER TABLE Calificaciones ADD CONSTRAINT FK_Clasificaciones_Clientes 
	FOREIGN KEY (calificador) REFERENCES Clientes (idCliente)
;






