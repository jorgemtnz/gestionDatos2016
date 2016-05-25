IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Roles') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Roles
;

CREATE TABLE Roles ( 
	idRol int identity(1,1)  NOT NULL,
	nombre nvarchar(255),
	habilitado bit DEFAULT 1 NOT NULL
)
;

ALTER TABLE Roles
	ADD CONSTRAINT UQ_Roles_nombre UNIQUE (nombre)
;

ALTER TABLE Roles
	ADD CONSTRAINT UQ_Roles_idRol UNIQUE (idRol)
;

CREATE INDEX IDX_indice_roles
ON Roles (idRol ASC)
;

CREATE INDEX IDX_indice_nombre
ON Roles (nombre ASC)
;

ALTER TABLE Roles ADD CONSTRAINT PK_Roles 
	PRIMARY KEY CLUSTERED (idRol)
;




