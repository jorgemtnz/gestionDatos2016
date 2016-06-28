USE [GD1C2016]
GO
--FALTAN AGREGAR LOS ASSERT Y LOS ROLLBACK PARA RESTAURAR LOS ESTADOS

--************************************************************************************************************
--1 . test para sp: dar alta ususario cliente
--************************************************************************************************************
--select * from TPGDD.Usuarios U, TPGDD.UsuariosRoles R, TPGDD.Clientes C where U.idUsuario = C.idUsuario and U.idUsuario = R.idUsuario and U.username = '@username'
EXECUTE [TPGDD].[darAltaUsuarioCliente] 
   ''
  ,'@username.....'
  ,'@password'
  ,'Cliente'
  ,'@mail'
  ,'@telefono'
  ,1 --nroPiso
  ,'@nroDpto'
  ,1 --nroCalle 
  ,'@domCalle'
  ,'@codPostal'
  ,'Cliente'
  ,'@nombre'
  ,'@apellido'
  ,	'1996-06-14'--fechaNac
  ,34236753 --nroDoc
  ,'@tipoDocumento....'
GO
--************************************************************************************************************
--1 . test para sp: dar alta usuario empresa
--************************************************************************************************************
--select * from TPGDD.Usuarios U, TPGDD.UsuariosRoles R, TPGDD.Empresas C where U.idUsuario = C.idUsuario and U.idUsuario = R.idUsuario and U.username = '@username..'
EXECUTE [TPGDD].[darAltaUsuarioEmpresa] 
   ''
  ,'@username.......'
  ,'@password'
  ,'Empresa'
  ,'@mail'
  ,'@telefono'
  ,1 --nroPiso
  ,'@nroDpto'
  ,1 --nroCalle 
  ,'@domCalle'
  ,'@codPostal'
  ,'Empresa'
  , '@razonSocial...'
  ,'@cuit nvarchar(50)'
  ,'@nombreContacto'
  ,'@nombreRubro'
  ,'@ciudad'
GO

--************************************************************************************************************
--XXX . test para sp: modificar usuario cliente
--************************************************************************************************************
--select * from TPGDD.Usuarios U, TPGDD.Clientes C where C.idUsuario = U.idUsuario
EXECUTE [TPGDD].[modificarUsuarioClienteSP] 
   ''
  ,'arcangela_Carvajal'
  ,'@password'
  ,'@mail'
  ,'@telefono'
  ,1
  ,'@nroDpto'
  ,1
  ,'@domCalle'
  ,'@codPostal'
  ,'@nombre'
  ,'@apellido'
  ,'1950-07-04'
  ,11
  ,'1'
GO

--************************************************************************************************************
--XXX . test para sp: modificar usuario empresa
--************************************************************************************************************
--select * from TPGDD.Usuarios U, TPGDD.Empresas C where C.idUsuario = U.idUsuario
--update TPGDD.Localidades set descripcion = ''

EXECUTE [TPGDD].[modificarUsuarioEmpresaSP] 
   ''
  ,'RazonSocialNº:36'
  ,'@password'
  ,'@mail'
  ,'@telefono'
  ,1
  ,'@nroDpto'
  ,1
  ,'@domCalle'
  ,'@codPostal'
  ,'@razonSocial'
  ,'@cuit'
  ,'@nombreContacto'
  ,'@nombreRubro'
  ,'@ciudad'
GO


