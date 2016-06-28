IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Estados') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Estados
;

CREATE TABLE Estados ( 
	idEstado int identity(1,1)  NOT NULL,
	descripcion nvarchar(255) NULL
)
;

ALTER TABLE Estados
	ADD CONSTRAINT UQ_Estados_idEstado UNIQUE (idEstado)
;

CREATE INDEX IDX_Estados
ON Estados (idEstado ASC)
;

ALTER TABLE Estados ADD CONSTRAINT PK_Estados 
	PRIMARY KEY CLUSTERED (idEstado)
;



