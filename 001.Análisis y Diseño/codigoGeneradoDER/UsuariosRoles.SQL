IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('UsuariosRoles') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE UsuariosRoles
;

CREATE TABLE UsuariosRoles ( 
	idUsuario int NOT NULL,
	idRol int NOT NULL
)
;

ALTER TABLE UsuariosRoles ADD CONSTRAINT PK_UsuariosRoles 
	PRIMARY KEY CLUSTERED (idUsuario, idRol)
;

ALTER TABLE UsuariosRoles ADD CONSTRAINT FK_UsuariosRoles_Roles 
	FOREIGN KEY (idRol) REFERENCES Roles (idRol)
;

ALTER TABLE UsuariosRoles ADD CONSTRAINT FK_UsuariosRoles_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
;



