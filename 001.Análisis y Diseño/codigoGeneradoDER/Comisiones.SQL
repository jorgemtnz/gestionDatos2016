IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Comisiones') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Comisiones
;

CREATE TABLE Comisiones ( 
	idComision int identity(1,1)  NOT NULL,
	cTipoPublicacion numeric(10,2),
	cProductoVendido numeric(10,2),
	cEnvioProducto numeric(10,2)
)
;

ALTER TABLE Comisiones
	ADD CONSTRAINT UQ_Comisiones_idComision UNIQUE (idComision)
;

CREATE INDEX IDX_indice_comision
ON Comisiones (idComision ASC)
;

ALTER TABLE Comisiones ADD CONSTRAINT PK_Comisiones 
	PRIMARY KEY CLUSTERED (idComision)
;





