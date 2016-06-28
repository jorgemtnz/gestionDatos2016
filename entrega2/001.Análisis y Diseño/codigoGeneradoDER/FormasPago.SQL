IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FormasPago') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE FormasPago
;

CREATE TABLE FormasPago ( 
	idFormaPago int identity(1,1)  NOT NULL,
	descripcion nvarchar(255) NULL
)
;

ALTER TABLE FormasPago
	ADD CONSTRAINT UQ_FormasPago_idFormaPago UNIQUE (idFormaPago)
;

CREATE INDEX IDX_FormaPagoPK
ON FormasPago (idFormaPago ASC)
;

ALTER TABLE FormasPago ADD CONSTRAINT PK_FormasPago 
	PRIMARY KEY CLUSTERED (idFormaPago)
;



