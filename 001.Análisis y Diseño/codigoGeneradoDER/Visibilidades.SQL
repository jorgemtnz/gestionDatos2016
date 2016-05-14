IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Visibilidades') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Visibilidades
;

CREATE TABLE Visibilidades ( 
	idVisibilidad int identity(1,1)  NOT NULL,
	pVCod numeric(18),
	pVDesc nvarchar(255),
	pVPrecio numeric(18,2),
	pVPorcentaje numeric(18,2),
	idComision int
)
;

ALTER TABLE Visibilidades
	ADD CONSTRAINT UQ_Visibilidades_idVisibilidad UNIQUE (idVisibilidad)
;

CREATE INDEX IDX_indice_visibilidades
ON Visibilidades (idVisibilidad ASC)
;

ALTER TABLE Visibilidades ADD CONSTRAINT PK_Visibilidades 
	PRIMARY KEY CLUSTERED (idVisibilidad)
;







