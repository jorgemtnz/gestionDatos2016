IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Compras') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Compras
;

CREATE TABLE Compras ( 
	idCompra int identity(1,1)  NOT NULL,
	idPublicacion int,
	idClientes int,
	fecha datetime,
	cantidad numeric(18)
)
;

ALTER TABLE Compras
	ADD CONSTRAINT UQ_Compra_idCompra UNIQUE (idCompra)
;

CREATE INDEX IDX_indice_compras
ON Compras (idCompra ASC)
;

ALTER TABLE Compras ADD CONSTRAINT PK_Compra 
	PRIMARY KEY CLUSTERED (idCompra)
;

ALTER TABLE Compras ADD CONSTRAINT FK_Compra_Clientes 
	FOREIGN KEY (idClientes) REFERENCES Clientes (idCliente)
;

ALTER TABLE Compras ADD CONSTRAINT FK_Compra_Publicaciones 
	FOREIGN KEY (idPublicacion) REFERENCES Publicaciones (pCodigo)
;






