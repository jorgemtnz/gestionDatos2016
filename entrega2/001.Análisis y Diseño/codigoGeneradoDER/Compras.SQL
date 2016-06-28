IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Compras') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Compras
;

CREATE TABLE Compras ( 
	idCompra int identity(1,1)  NOT NULL,
	idPublicacion numeric(18) NULL,
	idClientes int NULL,
	fecha datetime NULL,
	cantidad numeric(18) NULL
)
;

ALTER TABLE Compras
	ADD CONSTRAINT UQ_Compra_idCompra UNIQUE (idCompra)
;

CREATE INDEX IDX_comprasPK
ON Compras (idCompra ASC)
;

CREATE INDEX IDX_compras_publicaciones
ON Compras (idPublicacion ASC)
;

CREATE INDEX IDX_compras_clientes
ON Compras (idClientes ASC)
;

ALTER TABLE Compras ADD CONSTRAINT PK_Compra 
	PRIMARY KEY CLUSTERED (idCompra)
;

ALTER TABLE Compras ADD CONSTRAINT FK_Compra_Clientes 
	FOREIGN KEY (idClientes) REFERENCES Clientes (idCliente)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Compras ADD CONSTRAINT FK_Compra_Publicaciones 
	FOREIGN KEY (idPublicacion) REFERENCES Publicaciones (pCodigo)
	ON DELETE CASCADE ON UPDATE CASCADE
;






