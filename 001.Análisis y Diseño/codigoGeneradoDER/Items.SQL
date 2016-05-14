IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Items') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Items
;

CREATE TABLE Items ( 
	idItem int identity(1,1)  NOT NULL,
	nombre nvarchar(255),
	cantidad numeric(18),
	montoItem numeric(18,2)
)
;

ALTER TABLE Items
	ADD CONSTRAINT UQ_Items_idItem UNIQUE (idItem)
;

CREATE INDEX IDX_indice_items
ON Items (idItem ASC)
;

ALTER TABLE Items ADD CONSTRAINT PK_Items 
	PRIMARY KEY CLUSTERED (idItem)
;





