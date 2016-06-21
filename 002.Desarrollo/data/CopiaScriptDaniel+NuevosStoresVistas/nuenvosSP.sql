--**********************************************************************
--Nuevos Stores Procedures
--**********************************************************************

Create procedure TPGDD.rolesUsuarioSP (
	@username nvarchar(255)) As
	Begin
		select R.nombre 
		from TPGDD.Usuarios U, TPGDD.UsuariosRoles Ur, TPGDD.Roles R 
		where U.idUsuario = Ur.idUsuario and Ur.idRol = R.idRol and U.username = @username
	End
Go
--exec tpgdd.rolesUsuarioSP 'admin'
--select * from TPGDD.Usuarios
--update TPGDD.Usuarios set flagHabilitado = 1 where idUsuario = 1
--insert  TPGDD.UsuariosRoles values(1, 2)
--select * from TPGDD.roles