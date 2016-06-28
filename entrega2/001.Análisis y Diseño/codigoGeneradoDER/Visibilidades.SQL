IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Visibilidades') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Visibilidades
;

CREATE TABLE Visibilidades ( 
	Codigo numeric(18) NOT NULL,
	descripcion nvarchar(255) NULL,
	precio numeric(18,2) NULL,
	porcentaje numeric(18,2) NULL,
	Envio numeric(10,2) NULL,
	gratuita bit DEFAULT 1 NOT NULL
)
;

ALTER TABLE Visibilidades
	ADD CONSTRAINT UQ_Visibilidades_Codigo UNIQUE (Codigo)
;

CREATE INDEX IDX_visibilidadesPK
ON Visibilidades (Codigo ASC)
;

ALTER TABLE Visibilidades ADD CONSTRAINT PK_Visibilidades 
	PRIMARY KEY CLUSTERED (Codigo)
;







