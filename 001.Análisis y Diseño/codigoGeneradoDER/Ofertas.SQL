IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Ofertas') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Ofertas
;

CREATE TABLE Ofertas ( 
	idOferta int identity(1,1)  NOT NULL,
	idCliente int NOT NULL,
	idSubasta int NULL,
	fecha datetime NULL,
	monto numeric(18,2) NULL
)
;

ALTER TABLE Ofertas
	ADD CONSTRAINT UQ_Oferta_idOferta UNIQUE (idOferta)
;

CREATE INDEX IDX_ofertaPK
ON Ofertas (idOferta ASC)
;

CREATE INDEX IDX_oferta_idCliente
ON Ofertas (idCliente ASC)
;

CREATE INDEX IDX_oferta_idSubasta
ON Ofertas (idSubasta ASC)
;

ALTER TABLE Ofertas ADD CONSTRAINT PK_Oferta 
	PRIMARY KEY CLUSTERED (idOferta)
;

ALTER TABLE Ofertas ADD CONSTRAINT FK_Ofertas_Subastas 
	FOREIGN KEY (idSubasta) REFERENCES Subastas (idPublicacion)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Ofertas ADD CONSTRAINT FK_Ofertas_Clientes 
	FOREIGN KEY (idCliente) REFERENCES Clientes (idCliente)
	ON DELETE CASCADE ON UPDATE CASCADE
;






