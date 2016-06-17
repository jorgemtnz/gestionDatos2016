-----------------------------------------------------------------
--*****************************************************************
--******* PROCEDURE LOGUEO    *************************************
--*****************************************************************
alter procedure TPGDD.usuarioLogin2
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

