IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Subastas') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Subastas
;

CREATE TABLE Subastas ( 
	idSubasta int identity(1,1)  NOT NULL,
	idPublicacion numeric(18) NOT NULL,
	valorActual bigint NOT NULL
)
;

ALTER TABLE Subastas
	ADD CONSTRAINT UQ_Subastas_idSubasta UNIQUE (idSubasta)
;

CREATE INDEX IDX_SubastaPK
ON Subastas (idSubasta ASC)
;

CREATE INDEX IDX_subasta_idPublicacion
ON Subastas (idPublicacion ASC)
;

ALTER TABLE Subastas ADD CONSTRAINT PK_Subastas 
	PRIMARY KEY CLUSTERED (idSubasta)
;

ALTER TABLE Subastas ADD CONSTRAINT FK_Subastas_Publicaciones 
	FOREIGN KEY (idPublicacion) REFERENCES Publicaciones (pCodigo)
	ON DELETE CASCADE ON UPDATE CASCADE
;




