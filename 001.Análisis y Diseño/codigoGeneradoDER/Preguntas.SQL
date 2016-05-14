IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Preguntas') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Preguntas
;

CREATE TABLE Preguntas ( 
	idPregunta int identity(1,1)  NOT NULL,
	idPublicacion int,
	preguntaRealizada nvarchar(255)
)
;

ALTER TABLE Preguntas
	ADD CONSTRAINT UQ_Preguntas_idPregunta UNIQUE (idPregunta)
;

ALTER TABLE Preguntas ADD CONSTRAINT PK_Preguntas 
	PRIMARY KEY CLUSTERED (idPregunta)
;




