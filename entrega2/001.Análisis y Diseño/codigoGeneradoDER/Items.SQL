IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Items') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Items
;

CREATE TABLE Items ( 
	idItem int identity(1,1)  NOT NULL,
	nroFactura numeric(18) NOT NULL,
	idCompra int NOT NULL,
	nombre nvarchar(255) NULL,
	cantidad numeric(18) NULL,
	montoItem numeric(18,2) NULL,
	comProdVendido numeric(10,2) NULL,
	cEnvioProducto numeric(10,2) NULL
)
;

ALTER TABLE Items
	ADD CONSTRAINT UQ_Items_idCompra UNIQUE (idCompra)
;

ALTER TABLE Items
	ADD CONSTRAINT UQ_Items_idItem UNIQUE (idItem)
;

CREATE INDEX IDX_itemsPK
ON Items (idItem ASC)
;

CREATE INDEX IDX_items_nroFactura
ON Items (nroFactura ASC)
;

ALTER TABLE Items ADD CONSTRAINT PK_Items 
	PRIMARY KEY CLUSTERED (idItem)
;

ALTER TABLE Items ADD CONSTRAINT FK_Items_Compras 
	FOREIGN KEY (idCompra) REFERENCES Compras (idCompra)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Items ADD CONSTRAINT FK_Items_Facturaciones 
	FOREIGN KEY (nroFactura) REFERENCES Facturaciones (nroFactura)
	ON DELETE CASCADE ON UPDATE CASCADE
;









