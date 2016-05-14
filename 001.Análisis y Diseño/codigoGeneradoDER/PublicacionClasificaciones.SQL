IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('PublicacionClasificaciones') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE PublicacionClasificaciones
;

CREATE TABLE PublicacionClasificaciones ( 
	idPublicacion int NOT NULL,
	idClasificaciones int NOT NULL
)
;

ALTER TABLE PublicacionClasificaciones
	ADD CONSTRAINT UQ_PublicacionClasificaciones_idClasificaciones UNIQUE (idClasificaciones)
;

ALTER TABLE PublicacionClasificaciones
	ADD CONSTRAINT UQ_PublicacionClasificaciones_idPublicacion UNIQUE (idPublicacion)
;

ALTER TABLE PublicacionClasificaciones ADD CONSTRAINT PK_PublicacionClasificaciones 
	PRIMARY KEY CLUSTERED (idPublicacion, idClasificaciones)
;

ALTER TABLE PublicacionClasificaciones ADD CONSTRAINT FK_PublicacionClasificaciones_Clasificaciones 
	FOREIGN KEY (idClasificaciones) REFERENCES Calificaciones (codigoCalificacion)
;

ALTER TABLE PublicacionClasificaciones ADD CONSTRAINT FK_PublicacionClasificaciones_Publicaciones 
	FOREIGN KEY (idPublicacion) REFERENCES Publicaciones (pCodigo)
;



