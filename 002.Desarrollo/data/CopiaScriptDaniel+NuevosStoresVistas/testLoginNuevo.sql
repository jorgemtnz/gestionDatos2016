

 --************************************************************************************************************
--4 . test para PROCEDURE LOGUEO: USUARIO INEXISTENTE
--username = '12345'
--************************************************************************************************************
create   PROCEDURE TPGDD.testUsusarioInexistente
AS 
BEGIN
Begin transaction 
	 declare @username nvarchar(255)
	 set @username = '12345'
	--precondiciones
	
	--ejecucion
		Begin try
			--Logueo
			exec TPGDD.usuarioLogin2 @username, 'password'
		End try
	--asercion expected = raiseerror
		Begin catch
			declare @msg nvarchar(255)
			set @msg = (SELECT  ERROR_MESSAGE() ) 
			PRINT('OK TEST: testUsusarioInexistente.' + @msg )			
			Rollback
			return
		End catch
		
		rollback --restauro el estado anterior
		RAISERROR ('ERROR TEST: testUsusarioInexistente. El usuario 12345 no deberia haberse logueado',15,1)		
END
go

 --************************************************************************************************************
--4 . test para PROCEDURE LOGUEO: USUARIO DESHABILITADO
--username = 'admin'
--************************************************************************************************************
create   PROCEDURE TPGDD.testUsuarioDeshabilitado
AS 
BEGIN
Begin transaction 
	 declare @username nvarchar(255)
	 set @username = 'admin'
	--precondiciones
	  update Usuarios set flagHabilitado = 0 where username = @username
	--ejecucion
		Begin try
			--Logueo
			exec TPGDD.usuarioLogin2 @username, 'password'
		End try
	--asercion expected = raiseerror
		Begin catch
			declare @msg nvarchar(255)
			set @msg = (SELECT  ERROR_MESSAGE() ) 
			PRINT('OK TEST: testUsuarioDeshabilitado.' + @msg )			
			Rollback
			return
		End catch
		
		rollback --restauro el estado anterior
		RAISERROR ('ERROR TEST: testUsuarioDeshabilitado. El usuario admin no deberia haberse logueado, pues deberia estar deshabilitado',15,1)		
END
go

 --************************************************************************************************************
--4 . test para PROCEDURE LOGUEO: USUARIO HABILITADO INGRESA PASSWORD ERRONEO CON 2 INTENTOS FALLIDOS => DESHABILITA AL USUARIO
--username = 'admin' ok
--intentos fallidos = 2	   
--password erroneo = '12345' 
--habilitado = 1 ok
--************************************************************************************************************
create  PROCEDURE TPGDD.testDeshabilitaUsuarioPorPasswordErroneoCon2intentosFallidos
AS 
BEGIN
Begin transaction 
	 declare @username nvarchar(255), @intentosFallidos int, @password nvarchar(255) 
	 set @username = 'admin'
	 set @intentosFallidos = 2
	 set @password = '12345'
	--precondiciones
	  update Usuarios set intentosFallidos = @intentosFallidos where username = @username	  
	--ejecucion
		Begin try
			--Logueo
			exec TPGDD.usuarioLogin2 @username, @password
		End try
	--asercion expected = raiseerror
		Begin catch
			declare @msg nvarchar(255)
			set @msg = (SELECT  ERROR_MESSAGE() ) 
			PRINT('OK TEST: testDeshabilitaUsuarioPorPasswordErroneoCon2intentosFallidos.' + @msg )			
			Rollback
			return
		End catch
		
		rollback --restauro el estado anterior
		RAISERROR ('ERROR TEST: testDeshabilitaUsuarioPorPasswordErroneoCon2intentosFallidos. El usuario admin no deberia haberse logueado, pues tendría que haber sido deshabilitado',15,1)		
END
go

 --************************************************************************************************************
--4 . test para PROCEDURE LOGUEO: USUARIO HABILITADO INGRESA PASSWORD ERRONEO CON 0 INTENTOS FALLIDOS => LE RESTAN 2 INTENTOS
--username = 'admin' ok
--intentos fallidos = 0	   
--password erroneo = '12345' 
--habilitado = 1 ok
--************************************************************************************************************
create  PROCEDURE TPGDD.testUsuarioQuedaCon2IntentosDespuesDeLoginErroneo
AS 
BEGIN
Begin transaction 
	 declare @username nvarchar(255), @intentosFallidos int, @password nvarchar(255) 
	 set @username = 'admin'
	 set @intentosFallidos = 0
	 set @password = '12345'
	--precondiciones
	  update Usuarios set intentosFallidos = @intentosFallidos where username = @username	  
	--ejecucion
		Begin try
			--Logueo
			exec TPGDD.usuarioLogin2 @username, @password
		End try
	--asercion expected = raiseerror
		Begin catch
			declare @msg nvarchar(255)
			set @msg = (SELECT  ERROR_MESSAGE() ) 
			PRINT('OK TEST: testUsuarioQuedaCon2IntentosDespuesDeLoginErroneo.' + @msg )			
			Rollback
			return
		End catch
		
		rollback --restauro el estado anterior
		RAISERROR ('ERROR TEST: testUsuarioQuedaCon2IntentosDespuesDeLoginErroneo. El usuario admin no deberia haberse logueado, pues el password ingresado fue erroneo',15,1)		
END
go

 --************************************************************************************************************
--4 . test para PROCEDURE LOGUEO: USUARIO HABILITADO INGRESA PASSWORD CORRECTO CON 2 INTENTOS FALLIDOS => SE RESETEA A 0 LOS INTENTOS FALLIDOS
--username = 'admin' ok
--intentos fallidos = 2	   
--password correcto = 'e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7' 
--habilitado = 1 ok
--SELECT * FROM TPGDD.Usuarios
--************************************************************************************************************
create  PROCEDURE TPGDD.testUsuarioLoginCorrectoCon2IntentosFallidosSeReiniciaLosIntentosFallidos
AS 
BEGIN
Begin transaction 
	 declare @username nvarchar(255), @intentosFallidos int, @password nvarchar(255) 
	 set @username = 'admin'
	 set @intentosFallidos = 2
	 set @password = 'e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7'
	--precondiciones
	  update Usuarios set intentosFallidos = @intentosFallidos where username = @username	  
	--ejecucion
		--Logueo
		exec TPGDD.usuarioLogin2 @username, @password
	--asercion intentosFallidos = 0
		if(select U.intentosFallidos from TPGDD.Usuarios U where U.username = @username) <> 0
			RAISERROR ('ERROR TEST: testUsuarioLoginCorrectoCon2IntentosFallidosSeReiniciaLosIntentosFallidos. El usuario admin no deberia intentos fallidos despues de haberse logueado correctamente con 2 intentos fallidos',15,1)		
		else
			PRINT('OK TEST: testUsuarioLoginCorrectoCon2IntentosFallidosSeReiniciaLosIntentosFallidos')			
	rollback --restauro el estado anterior		
END
go


exec TPGDD.testVerificarParaCambiarContraseñaStoredProcedure
exec TPGDD.testEliminarLosUsuariosRolesAlDeshabilidarUnRolQueEstaHabilitado
exec TPGDD.testUsusarioInexistente
exec TPGDD.testUsuarioDeshabilitado 
exec TPGDD.testDeshabilitaUsuarioPorPasswordErroneoCon2intentosFallidos
exec TPGDD.testUsuarioQuedaCon2IntentosDespuesDeLoginErroneo
exec TPGDD.testUsuarioLoginCorrectoCon2IntentosFallidosSeReiniciaLosIntentosFallidos
go


/*
--*****************************************************************
--******* PROCEDURE LOGUEO    *************************************
--*****************************************************************
create  procedure TPGDD.usuarioLogin2
	@username nvarchar(255),
	@password nvarchar(255)
As
Begin
	Set nocount on
	Declare @usuario nvarchar(255)
	Declare @passwordPosta nvarchar(255)
	Declare @intentos int
	Declare @flagHabilitado bit

	
	 select  @usuario = u.username, @flagHabilitado = u.flagHabilitado, @intentos = u.intentosFallidos, @passwordPosta = u.password from TPGDD.Usuarios as u
		where @username=u.username 
	
	If @usuario is null	--VERIFICO EXSITENCIA	
	Begin
		Raiserror('USUARIO INEXISTENTE.',15,1)
		return
	End

	else--USUARIO EXISTENTE
	begin
		--VERIFICO HABILITACION
		IF(@flagHabilitado = 0)--no habilitado
		begin
			Raiserror('USTED SE ENCUENTRA DESHABILITADO NO PUEDE ENTRAR AL SISTEMA, CONSULTE AL ADMIN.',15,1)
			return
		end
		else--USUARIO HABILITADO
		BEGIN
		  --VERIFICO PASSWORD
		  if(@passwordPosta <> @password)--PASSWORD ERRONEO
		  BEGIN
			set @intentos = @intentos + 1 --INCREMENTO INTENTOS FALLIDOS
		    if (@intentos >= 3)
			Begin
				Raiserror ('TIENE 3 INTENTOS FALLIDOS, QUEDO DESHABILITADO PARA REALIZAR ACCIONES.',15,1)
				Update TPGDD.Usuarios 
				Set intentosFallidos = 0, flagHabilitado = 0 --SIGNIFICA NO HABILITADO
				Where @username = username
				Return
			End
			else --ACTUALIZO LOS INTENTO FALLIDOS
			BEGIN
				declare @intentosRestantes int
				set @intentosRestantes = 3 - @intentos 
				Raiserror ('PASSWORD ERRONEO. LE QUEDAN %d INTENTOS.',15,1, @intentosRestantes)
				Update TPGDD.Usuarios 
				Set intentosFallidos = @intentos
				Where @username = username
				Return
			END
		  END
	  end
	end
	-- TODO CORRECTO	  
	Update TPGDD.Usuarios
	Set intentosFallidos = 0
	Where @username = username
	return	  
End
Go
*/