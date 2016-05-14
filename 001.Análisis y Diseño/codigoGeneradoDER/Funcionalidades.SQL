IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Funcionalidades') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Funcionalidades
;

CREATE TABLE Funcionalidades ( 
	idFuncionalidad int identity(1,1)  NOT NULL,
	nombre nvarchar(255),
	descripcion nvarchar(255)
)
;

ALTER TABLE Funcionalidades
	ADD CONSTRAINT UQ_Funcionalidades_idFuncionalidad UNIQUE (idFuncionalidad)
;

CREATE INDEX IDX_indice_funcionalidades
ON Funcionalidades (idFuncionalidad ASC)
;

ALTER TABLE Funcionalidades ADD CONSTRAINT PK_Funcionalidades 
	PRIMARY KEY CLUSTERED (idFuncionalidad)
;




