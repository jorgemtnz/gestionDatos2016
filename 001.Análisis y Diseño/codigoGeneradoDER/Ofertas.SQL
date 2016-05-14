IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Ofertas') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Ofertas
;

CREATE TABLE Ofertas ( 
	idOferta int identity(1,1)  NOT NULL,
	idPublicacion numeric(18) NOT NULL,
	idUsuario int NOT NULL,
	fecha datetime,
	monto numeric(18,2)
)
;

ALTER TABLE Ofertas
	ADD CONSTRAINT UQ_Oferta_idOferta UNIQUE (idOferta)
;

ALTER TABLE Ofertas
	ADD CONSTRAINT UQ_Ofertas_idPublicacion UNIQUE (idPublicacion)
;

CREATE INDEX IDX_indice_oferta
ON Ofertas (idOferta ASC)
;

ALTER TABLE Ofertas ADD CONSTRAINT PK_Oferta 
	PRIMARY KEY CLUSTERED (idOferta)
;

ALTER TABLE Ofertas ADD CONSTRAINT FK_Oferta_Publicaciones 
	FOREIGN KEY (idPublicacion) REFERENCES Publicaciones (pCodigo)
;

ALTER TABLE Ofertas ADD CONSTRAINT FK_Oferta_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
;






