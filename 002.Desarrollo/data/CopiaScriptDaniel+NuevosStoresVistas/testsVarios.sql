
--************************************************************************************************************
--0 . test para sp: PROCEDURE [TPGDD].[SP_CAMBIAR_CONTRASE�A_OK](@idUsuario int, @pass nvarchar(255),@nuevaPass nvarchar(255))
-- usuario: admin
-- contrase�a actual = 'e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7'
-- contrase�a nueva = '0x5B6B2BAF48C28EF9C2F15BFB83DC2FD3B78636A575822A532E09592D03F8B4E9' 
--************************************************************************************************************
--select * from TPGDD.Usuarios
--SELECT HASHBYTES('SHA2_256','w23j')
go
create  PROCEDURE TPGDD.testVerificarParaCambiarContrase�aStoredProcedure
AS 
BEGIN
Begin transaction 

	--precondiciones

	--ejecucion
		--Cambiar la contrase�a del admin
		exec TPGDD.SP_CAMBIAR_CONTRASE�A_OK 1, 'e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7',
											   '0x5B6B2BAF48C28EF9C2F15BFB83DC2FD3B78636A575822A532E09592D03F8B4E9'	
		
	--asercion estado idCompra = 1035 debe ser 1
		if (select C.password  from TPGDD.Usuarios C where C.idUsuario = 1) <> '0x5B6B2BAF48C28EF9C2F15BFB83DC2FD3B78636A575822A532E09592D03F8B4E9' 
			RAISERROR ('ERROR TEST: testVerificarParaCambiarContrase�aStoredProcedure. LA NUEVA CONTRASE�A NO FUE MODIFICADA CORRECTAMENTE',15,1)
		else
			PRINT('OK TEST: testVerificarParaCambiarContrase�aStoredProcedure')			
rollback --restauro el estado anterior
END
go
/*CREATE PROCEDURE [TPGDD].[SP_CAMBIAR_CONTRASE�A_OK](@idUsuario int, @pass nvarchar(255),@nuevaPass nvarchar(255))
AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

  UPDATE Usuarios SET password = @nuevaPass WHERE idUsuario= @idUsuario AND password like @pass

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se actualiz� la contrase�a con exito'; 
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR(N'Ocurri� un error durante la operacion de actualizaci�n.',16,1, @idUsuario, @ERROR)

END CATCH

*/
--EL PROBLEMA DEBE DE ESTAR EN LA ENCRIPTACI�N O DES-ENCRIPTACI�N

 --************************************************************************************************************
--4 . test para trigger: 1.para eliminar los usuariosRoles cuando en roles cambio el habilitado de 1 a 0.
--todos los roles habilitados
--2 = cliente  y tenemos 28 usuarios con rol cliente
--************************************************************************************************************
create  PROCEDURE TPGDD.testEliminarLosUsuariosRolesAlDeshabilidarUnRolQueEstaHabilitado
AS 
BEGIN
Begin transaction 

	--precondiciones
	
	--ejecucion
		--Deshabilitar el rol cliente = 2 
		update TPGDD.Roles set habilitado = 0 where idRol = 2
		
	--asercion deberiamos tener 0 usuarios con el rol cliente
		if (select count(*) from TPGDD.UsuariosRoles	U where U.idRol = 2) <> 0
			RAISERROR ('ERROR TEST: testEliminarLosUsuariosRolesAlDeshabilidarUnRolQueEstaHabilitado. No deberia haber ningun usuario con rol cliente',15,1)
		else
			PRINT('OK TEST: testEliminarLosUsuariosRolesAlDeshabilidarUnRolQueEstaHabilitado')			
rollback --restauro el estado anterior
END
go
 /*--************************************************************************
--4. para eliminar los usuariosRoles cuando en roles cambio el habilitado.
--*************************************************************************
create  trigger TPGDD.deleteUsuariosRolesTrigger
on TPGDD.Roles
after update
as
   declare @estadoRolAnterior bit, @estadoRolNuevo bit
   set @estadoRolAnterior = (select D.habilitado from deleted D)
   set @estadoRolNuevo = (select I.habilitado from inserted I)
   
   if(@estadoRolAnterior = 1 and @estadoRolNuevo = 0)
		Begin transaction
			Begin try
				delete from UsuariosRoles where UsuariosRoles.idRol = (select I.idRol from inserted I)
			Commit
			End try
			Begin catch
				Raiserror('No se pudieron eliminar las tuplas(usuarios,roles) para el rol deshabilitado',15,1)
				Rollback transaction
			End catch
		
*/
