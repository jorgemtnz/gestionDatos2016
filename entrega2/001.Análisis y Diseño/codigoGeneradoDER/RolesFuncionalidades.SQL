IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('RolesFuncionalidades') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE RolesFuncionalidades
;

CREATE TABLE RolesFuncionalidades ( 
	idRol int NOT NULL,
	idFuncionalidad int NOT NULL
)
;

CREATE INDEX IDX_rolesFuncionalidadesPK
ON RolesFuncionalidades (idRol ASC, idFuncionalidad ASC)
;

ALTER TABLE RolesFuncionalidades
	ADD CONSTRAINT UQ_Funcionalidades_idRol_IdFuncionalidad UNIQUE (idRol, idFuncionalidad)
;

ALTER TABLE RolesFuncionalidades ADD CONSTRAINT PK_RolesFuncionalidades 
	PRIMARY KEY CLUSTERED (idRol, idFuncionalidad)
;

ALTER TABLE RolesFuncionalidades ADD CONSTRAINT FK_RolesFuncionalidades_Funcionalidades 
	FOREIGN KEY (idFuncionalidad) REFERENCES Funcionalidades (idFuncionalidad)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE RolesFuncionalidades ADD CONSTRAINT FK_RolesFuncionalidades_Roles 
	FOREIGN KEY (idRol) REFERENCES Roles (idRol)
	ON DELETE CASCADE ON UPDATE CASCADE
;



