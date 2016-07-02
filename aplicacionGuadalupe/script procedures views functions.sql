USE [GD1C2016]
GO
/****** Object:  UserDefinedTableType [TPGDD].[TABLA_NOMBRES_FUNCIONALIDADES]    Script Date: 02/07/2016 16:09:34 ******/
CREATE TYPE [TPGDD].[TABLA_NOMBRES_FUNCIONALIDADES] AS TABLE(
	[NOMBRE_FUNCIONALIDAD] [nvarchar](255) NULL
)
GO
/****** Object:  StoredProcedure [TPGDD].[AgregarFuncionalidadRol]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*******************************************************************
--modificaciones

CREATE procedure [TPGDD].[AgregarFuncionalidadRol] (
	@nombre nvarchar(255),
	@Funcionalidad nvarchar(255)) 
AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		Declare @idRol int
		Select @idRol = idRol  from TPGDD.Roles R
		where R.nombre = @nombre 
		Insert into TPGDD.RolesFuncionalidades (idRol, idFuncionalidad)
			Values(@idRol, (select idFuncionalidad from Funcionalidades where nombre like  @Funcionalidad))

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	Raiserror('No se pudo agregar la funcionalidad %s al rol',15,1, @Funcionalidad)
END CATCH




GO
/****** Object:  StoredProcedure [TPGDD].[Dar_Baja_Rol]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*************************************************************************
Create procedure [TPGDD].[Dar_Baja_Rol] (
	@idRol int) as
	Begin
	Begin transaction
	Begin try
		Update TPGDD.Roles 
		Set habilitado = 0 --NO HABILITADO
		Where idRol = @idRol 
	Commit
	End try
	Begin catch
		Raiserror('No se pudo dar de baja el rol',15,1)
		Rollback
	End catch
	End

GO
/****** Object:  StoredProcedure [TPGDD].[mejoresVendedoresPorCantidadFacturasSP]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*****************************************************
------------------------------------------------------------------------------------
--3. Vendedores con mayor cantidad de facturas dentro de un mes y año particular
------------------------------------------------------------------------------------
create   PROCEDURE [TPGDD].[mejoresVendedoresPorCantidadFacturasSP](@numeroTrimestre int, @year int) 
AS 
BEGIN

	select top 5 U.idUsuario idVendedor, TPGDD.cantidadFacturas(U.idUsuario,@numeroTrimestre, @year)  as CantidadFacturas, U.username
	from TPGDD.Usuarios U
	where exists(select 1 from TPGDD.Publicaciones P where P.idUsuario = U.idUsuario)
	order by 2 desc
END

GO
/****** Object:  StoredProcedure [TPGDD].[mejoresVendedoresPorMontoFacturadoSP]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--******************************************************
------------------------------------------------------------------------------------
--4. Vendedores con mayor monto facturado dentro de un mes y año particular
------------------------------------------------------------------------------------

create   PROCEDURE [TPGDD].[mejoresVendedoresPorMontoFacturadoSP](@numeroTrimestre int, @year int) 
AS 
BEGIN

	select top 5 U.idUsuario idVendedor, TPGDD.montoFacturado(U.idUsuario,@numeroTrimestre, @year)  as MontoFacturado, U.username
	from TPGDD.Usuarios U
	where exists(select 1 from TPGDD.Publicaciones P where P.idUsuario = U.idUsuario)
	order by 2 desc
END

GO
/****** Object:  StoredProcedure [TPGDD].[Quitar_Funcionalidad_A_Rol]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*********************************************************************
Create procedure [TPGDD].[Quitar_Funcionalidad_A_Rol] (
	@idRol int,
	@idFuncionalidad int) as
	Begin
	Begin transaction
	Begin try
		Delete from TPGDD.RolesFuncionalidades
		Where idRol = @idRol And idFuncionalidad = @idFuncionalidad 
	Commit
	End try
	Begin catch
		Raiserror('No se pudo dar de baja la funcionalidad del rol',15,1)
		Rollback transaction
	End catch
	End

GO
/****** Object:  StoredProcedure [TPGDD].[SP_AGREGAR_FUNCIONALIDAD_ROL_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--*******************************************************************
--modificaciones

CREATE procedure [TPGDD].[SP_AGREGAR_FUNCIONALIDAD_ROL_OK] (
	@nombre nvarchar(255),
	@Funcionalidad nvarchar(255)) 
AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		Declare @idRol int
		Select @idRol = idRol  from TPGDD.Roles R
		where R.nombre = @nombre 
		Insert into TPGDD.RolesFuncionalidades (idRol, idFuncionalidad)
			Values(@idRol, (select idFuncionalidad from Funcionalidades where nombre like  @Funcionalidad))

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	Raiserror('No se pudo agregar la funcionalidad %s al rol',15,1, @Funcionalidad)
END CATCH





GO
/****** Object:  StoredProcedure [TPGDD].[SP_BusquedaUsuarioCliente]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--****************************************************************************************************************
--***FIN SCRIPT tiempo de carga en pruebas: Entre 1 minuto y medio y dos minutos, según las característias de la PC
--****************************************************************************************************************

create  procedure [TPGDD].[SP_BusquedaUsuarioCliente] (
	@username nvarchar(255),
	@nombre nvarchar(255),
	@apellido nvarchar(255))
	As
	Begin
		Select u.username, c.nombre, c.apellido, c.tipoDocumento, c.nroDNI
		from TPGDD.Clientes c, TPGDD.Usuarios u 
		where c.idUsuario = u.idUsuario and 
		(u.username like '%'+@username+'%' and c.apellido like '%'+@apellido+'%'
		and c.nombre like '%'+@nombre+'%') 
	End

GO
/****** Object:  StoredProcedure [TPGDD].[SP_BusquedaUsuarioEmpresa]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		
--exec TPGDD.SP_BusquedaUsuarioCliente '', '', 'art'
--si no se ingresa nada -> '' en GUI

 create  procedure [TPGDD].[SP_BusquedaUsuarioEmpresa] (
	@username nvarchar(255),
	@razonSocial nvarchar(255),
	@cuit nvarchar(50))
	As
	Begin
		Select u.username, c.razonSocial, c.cuit
		from TPGDD.Empresas c, TPGDD.Usuarios u 
		where c.idUsuario = u.idUsuario and 
		(u.username like '%'+@username+'%' and c.razonSocial like '%'+@razonSocial+'%'
		and c.cuit like '%'+@cuit+'%') 
	End

GO
/****** Object:  StoredProcedure [TPGDD].[SP_CAMBIAR_CONTRASEÑA_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------------------------
CREATE PROCEDURE [TPGDD].[SP_CAMBIAR_CONTRASEÑA_OK](@idUsuario int, @pass nvarchar(255),@nuevaPass nvarchar(255))
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
		PRINT N'Se actualizó la contraseña con exito'; 
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR(N'Ocurrió un error durante la operacion de actualización.',16,1, @idUsuario, @ERROR)

END CATCH


GO
/****** Object:  StoredProcedure [TPGDD].[SP_DAR_ALTA_ROL]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	
create  procedure [TPGDD].[SP_DAR_ALTA_ROL]  @nombreRol nvarchar(255), 
									   @nombresFuncionalidades TPGDD.TABLA_NOMBRES_FUNCIONALIDADES READONLY 
As
Begin
	--Validaciones
	IF EXISTS(SELECT 1 FROM TPGDD.Roles WHERE nombre = @nombreRol)
	BEGIN
		Raiserror('ERROR: YA EXISTE EL ROL.',15,1)
		RETURN
	END
		
	Begin transaction
	Begin try
	
		--DOY DE ALTA ROL
		EXEC TPGDD.Dar_Alta_Roles @nombreRol
			
		--AGREGO LAS FUNCIONALIDADES
		DECLARE cursor_funcionalidades CURSOR FOR select * from @nombresFuncionalidades; 
		DECLARE @nombreFuncionalidad nvarchar(255);
		OPEN cursor_funcionalidades;
		FETCH NEXT FROM cursor_funcionalidades INTO @nombreFuncionalidad;
		WHILE @@FETCH_STATUS = 0  
		BEGIN  
			   declare @idFuncionalidad int;
			   set @idFuncionalidad = (select idFuncionalidad from TPGDD.Funcionalidades where nombre= @nombreFuncionalidad); 
			   exec TPGDD.AgregarFuncionalidadRol @nombreRol, @idFuncionalidad;
			   FETCH NEXT FROM cursor_funcionalidades INTO @nombreFuncionalidad;
		END;
		CLOSE cursor_funcionalidades;
		DEALLOCATE cursor_funcionalidades;
		Commit

	End try
	Begin catch
		declare @msg nvarchar(255)
		set @msg = 'ERROR NO SE PUDO DAR DE ALTA EL ROL.' + (SELECT  ERROR_MESSAGE() )
		Raiserror(@msg,15,1)
		Rollback
	End catch
	
End

GO
/****** Object:  StoredProcedure [TPGDD].[SP_datosModificablesCliente]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create procedure [TPGDD].[SP_datosModificablesCliente] (
	@username nvarchar(255))
	As
	Begin
		Select u.password, u.mail, u.telefono, u.nroPiso, u.nroDpto, u.nroCalle, u.domCalle, u.codPostal,
			   c.nombre, c.apellido, c.fechaNacimiento, c.nroDNI, c.tipoDocumento 
		from TPGDD.Clientes c, TPGDD.Usuarios u 
		where c.idUsuario = u.idUsuario and 
			  u.username =  @username
	End

GO
/****** Object:  StoredProcedure [TPGDD].[SP_datosModificablesEmpresa]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec TPGDD.localidadesSP

create procedure [TPGDD].[SP_datosModificablesEmpresa] (
	@username nvarchar(255))
	As
	Begin
		Select u.password, u.mail, u.telefono, u.nroPiso, u.nroDpto, u.nroCalle, u.domCalle, u.codPostal,
			   c.razonSocial, c.cuit, c.nombreContacto, c.nombreRubro, c.ciudad 
		from TPGDD.Empresas c, TPGDD.Usuarios u 
		where c.idUsuario = u.idUsuario and 
			  u.username =  @username
	End

GO
/****** Object:  StoredProcedure [TPGDD].[SP_FINALIZAR_SUBASTAS_VENCIDAS_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




---------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [TPGDD].[SP_FINALIZAR_SUBASTAS_VENCIDAS_OK]
	@FECHA DATETIME

AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)


BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		--GENERO LA COMPRA ADJUDICANDO LAS SUBASTAS AL CLIENTE QUE OFERTO MAS
		INSERT INTO [TPGDD].[Compras]
				   ([idPublicacion]
				   ,[idCliente]
				   ,[fecha]
				   ,[cantidad]
				   ,[idVendedor]
				   ,[tipoPublicacion])
		   
		SELECT P.pCodigo,
			   (SELECT idCliente FROM TPGDD.Ofertas O WHERE O.idSubasta = S.idSubasta AND O.monto = (SELECT MAX(OO.monto) FROM TPGDD.Ofertas OO WHERE O.idSubasta = S.idSubasta)),
			   @FECHA,
			   1,
			   P.idUsuario,
			   'subasta'
        FROM TPGDD.Publicaciones P INNER JOIN TPGDD.Subastas S ON S.idPublicacion = P.pCodigo    
		WHERE pFecha_Venc < @FECHA AND P.idEstado = 2 --ESTADO ACTIVA

		IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se adjudicaron las subastas vencidas al mejor postor'; 
END TRY
BEGIN CATCH

	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR(N'Ocurrió un error durante la operacion de adjudicacion de subastas vencidas. %s',16,1, @ERROR)

END CATCH
		
BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		--inserto el item de la factura que corresponde con la mayor oferta recibida
		declare @idcompra int
		SET @idcompra = @@IDENTITY

		INSERT INTO [TPGDD].[Items]
			   ([nroFactura],
			   [idCompra],
			   [nombre],
			   [cantidad],
			   [montoItem],
			   [idPublicacion])
	
		select
		 (select top 1 nroFactura from TPGDD.Items i where i.idPublicacion = p.pCodigo),
		  @idcompra,
		   'costo por venta tipo subasta',
			1, 
			(select valorActual from TPGDD.Subastas s where s.idPublicacion = p.pCodigo),
			P.pCodigo 
	    from TPGDD.Publicaciones p inner join Subastas sub on sub.idPublicacion = p.pCodigo   
		WHERE pFecha_Venc < @FECHA AND P.idEstado = 2 --ESTADO ACTIVA

		IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se generaron las facturas por venta de las subastas vencidas'; 
END TRY
BEGIN CATCH

	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR(N'Ocurrió un error durante la operacion de generación de facturas. %s',16,1, @ERROR)

END CATCH

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		UPDATE Publicaciones
		SET idEstado = 4--FINALIZADA
		WHERE pFecha_Venc < @FECHA and pCodigo in (select idPublicacion from Subastas)

		IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se actualizaron las fechas de finalizacion de las subastas vencidas'; 
END TRY
BEGIN CATCH

	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR(N'Ocurrió un error durante la operacion de actualización subastas vencidas. %s',16,1, @ERROR)

END CATCH





GO
/****** Object:  StoredProcedure [TPGDD].[SP_FUNCIONALIDADES]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [TPGDD].[SP_FUNCIONALIDADES]
AS
BEGIN 
	SELECT nombre FROM TPGDD.Funcionalidades
END

GO
/****** Object:  StoredProcedure [TPGDD].[SP_INSERT_CALIFICACION_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [TPGDD].[SP_INSERT_CALIFICACION_OK]
(@USER int,
 @idcompra INT ,
 @CALIFICACION NUMERIC(18),
 @OBSERVACION NVARCHAR(255))
AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
    BEGIN TRANSACTION
        INSERT INTO [TPGDD].[Calificaciones]
           ([idCompra]
           ,[calificador]
           ,[cantEstrellas]
           ,[observacion])
        VALUES
           (@idcompra
		   ,@USER
           ,@CALIFICACION
           ,@OBSERVACION)

	    update TPGDD.Compras set calificada = 'true' where idCompra = @idcompra
 
		UPDATE TPGDD .Usuarios SET reputacion = ((reputacion + @CALIFICACION) / 2 ) WHERE idUsuario = (SELECT idVendedor FROM TPGDD.Compras WHERE idCompra = @idcompra)

		IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se registro la calificacion con exito'; 
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR(N'Ocurrió un error durante la operacion de calificacion.',16,1, '', @ERROR)

END CATCH






GO
/****** Object:  StoredProcedure [TPGDD].[SP_INSERT_CLIENTE_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-------------------------------------------------------------------
CREATE PROCEDURE [TPGDD].[SP_INSERT_CLIENTE_OK]
--PARA EL USUARIO
@LOC nvarchar(255),
@USER nvarchar(255),  
@PASS nvarchar(255), 
@MAIL nvarchar(255), 
@TEL nvarchar(255), 
@PISO numeric(18,0),
@DEPTO nvarchar(255), 
@F_CREAC datetime,
@NRO_CALLE numeric(18,0),  
@DOM_CALLE nvarchar(255),  
@CP nvarchar(255),
@TIPO nvarchar(255),
--PARA EL CLIENTE
@NOM nvarchar(255),
@APE nvarchar(255),
@FECHA_NAC datetime,
@NRO_DNI numeric(18,2),
@TIPODOC nvarchar(255)
AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

			DECLARE @idUsuario INT

			IF not EXISTS (select idCliente  from [TPGDD].Clientes  where tipoDocumento  like @TIPODOC  and nroDNI  like @NRO_DNI)
				BEGIN   
				   declare @idLocalidad int
				   select @idLocalidad = codLocalidad  from TPGDD.Localidades where descripcion like @LOC

				   EXEC TPGDD.SP_INSERT_USUARIO_OK @idLocalidad, @USER, @PASS,  @MAIL, @TEL, @PISO, @DEPTO, @F_CREAC, @NRO_CALLE, @DOM_CALLE, @CP, 'Cliente'
 				   SET @idUsuario = @@IDENTITY

				   INSERT INTO [TPGDD].[UsuariosRoles]
						([idUsuario]
						,[idRol])
					VALUES
						(@idUsuario,(select idRol from TPGDD.Roles where nombre like 'Cliente'))

				   INSERT INTO [TPGDD].[Clientes]
							([idUsuario]
							,[nombre]
							,[apellido]
							,[fechaNacimiento]
							,[nroDNI]
							,[tipoDocumento]
							)
						VALUES
							(@idUsuario
							,@NOM
							,@APE
							,@FECHA_NAC
							,@NRO_DNI
							,@TIPODOC)

					COMMIT
					PRINT N'Cliente registrado con exito';

			   END
			ELSE
				BEGIN
				  PRINT N'Ya existe un cliente con el tipo de documento y nro ingresados.'; 
				  ROLLBACK
				END

END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('Ocurrió un error al ingresar el cliente: %s',16,1, @ERROR)
END CATCH




GO
/****** Object:  StoredProcedure [TPGDD].[SP_INSERT_COMPRAS_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [TPGDD].[SP_INSERT_COMPRAS_OK]

@PUBLICACION int,
@IDUSUARIO INT,
@FECHA datetime,
@CANTIDAD numeric(18,0), 
@TIPO nvarchar(255), 
@VENDEDOR nvarchar(255)

AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		DECLARE @IDCLIENTE INT
		SELECT @IDCLIENTE = idCliente FROM TPGDD.Clientes WHERE idUsuario = @IDUSUARIO 

	    DECLARE @CALIFICACIONES INT
		SELECT @CALIFICACIONES = isnull(COUNT(*),0) FROM TPGDD.Compras WHERE calificada = 'FALSE' AND idCliente = @IDCLIENTE  

		IF @CALIFICACIONES > 3
			RAISERROR('No puede realizar la operacion hasta no realizar las calificaciones pendientes',16,1)
        ELSE
		BEGIN

			INSERT INTO [TPGDD].[Compras]
					   ([idPublicacion], [idCliente], [fecha], [cantidad], [idVendedor], [tipoPublicacion])
		    VALUES
					   (@PUBLICACION, @IDCLIENTE, @FECHA, @CANTIDAD, (SELECT IDUSUARIO FROM [TPGDD].USUARIOS WHERE USERNAME LIKE @VENDEDOR), @TIPO)

	    update TPGDD.ComprasInmediatas set stockDisponible = (stockDisponible - @CANTIDAD), unidadesVendidas = (unidadesVendidas + @CANTIDAD) where idPublicacion = @PUBLICACION

		--si vendí la ultima unidad actualizo el estado de la publicacion a finalizada
		if (select stockDisponible from TPGDD.ComprasInmediatas where idPublicacion = @PUBLICACION) = 0
		    update TPGDD.Publicaciones set idEstado = 4 where pCodigo = @PUBLICACION  

		END						
	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Operacion registrada con exito';
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('Ocurrió un error al ingresar el registro: %s',16,1, @ERROR)
END CATCH







GO
/****** Object:  StoredProcedure [TPGDD].[SP_INSERT_EMPRESA_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------------
CREATE  PROCEDURE [TPGDD].[SP_INSERT_EMPRESA_OK]
--PARA EL USUARIO
@LOC nvarchar(255),
@USER nvarchar(255),  
@PASS nvarchar(255), 
@MAIL nvarchar(255), 
@TEL nvarchar(255), 
@PISO numeric(18,0),
@DEPTO nvarchar(255), 
@F_CREAC datetime,
@NRO_CALLE numeric(18,0),  
@DOM_CALLE nvarchar(255),  
@CP nvarchar(255),
@TIPO nvarchar(255),
--PARA LA EMPRESA
@RAZON nvarchar(255),
@CUIT nvarchar(50),
@CONTACTO nvarchar(255),

@RUBRO nvarchar(255),
@CIUDAD nvarchar(255)

AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		DECLARE @idUsuario INT

		IF not EXISTS (select idEmpresa from [TPGDD].Empresas  where cuit like @CUIT and razonSocial like @RAZON)
			BEGIN   
				declare @idLocalidad int
				select @idLocalidad = codLocalidad  from TPGDD.Localidades where descripcion like @LOC
				EXEC [TPGDD].SP_INSERT_USUARIO_OK @idLocalidad, @USER, @PASS,  @MAIL, @TEL, @PISO, @DEPTO, @F_CREAC, @NRO_CALLE, @DOM_CALLE, @CP, 'Empresa'
 			
				SET @idUsuario = @@IDENTITY

				 INSERT INTO [TPGDD].[UsuariosRoles]
						([idUsuario]
						,[idRol])
				VALUES
				 (@idUsuario,(select idRol from TPGDD.Roles where nombre like 'Empresa'))

				INSERT INTO [TPGDD].Empresas
				([idUsuario]
				,[razonSocial]
				,[cuit]
				,[nombreContacto]
				,[nombreRubro]
				,[ciudad])
				VALUES
				(@idUsuario
				,@RAZON
				,@CUIT
				,@CONTACTO
				,@RUBRO
				,@CIUDAD)
			  IF @TRANSCOUNT = 0
			     COMMIT TRANSACTION
			  PRINT N'Usuario registrado con exito';
		   END
		ELSE
			BEGIN
			  PRINT N'No se pudo agregar el registro, ya existe un registro con la razon social y cuit ingresados.'; 
			  ROLLBACK
			END

END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('Ocurrió un error al ingresar el registro CodError: %s',16,1, @ERROR)
END CATCH




GO
/****** Object:  StoredProcedure [TPGDD].[SP_INSERT_FACTURA_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [TPGDD].[SP_INSERT_FACTURA_OK]

@VISIBILIDAD numeric(18,2), 
@USER int,
@FECHA DATETIME,
@idPublicacion numeric(18),
@CONCEPTO NVARCHAR(255)
AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		INSERT INTO [TPGDD].[Facturaciones]
				   ([idFormaPago]
				   ,[idUsuario]
				   ,[fecha]
				   ,[total])
			 VALUES
				   (1
				   ,@USER
				   ,@FECHA
				   ,@VISIBILIDAD)

		   DECLARE @NROFACTURA numeric(18,0)
		   SET @NROFACTURA = @@IDENTITY

		   INSERT INTO [TPGDD].[Items]
           ([nroFactura]
           ,[nombre]
           ,[cantidad]
           ,[montoItem]
           ,[idPublicacion])
     VALUES
           (@NROFACTURA
           ,@CONCEPTO
           ,1
           ,@VISIBILIDAD
           ,@idPublicacion)

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		--PRINT N'Se agregó con exito la publicacion';
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('Ocurrió un error en facturacion: %s',16,1, @ERROR)
END CATCH




GO
/****** Object:  StoredProcedure [TPGDD].[SP_INSERT_OFERTAS_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [TPGDD].[SP_INSERT_OFERTAS_OK]
(
@PUBLICACION int,
@IDUSUARIO INT,
@FECHA datetime,
@MONTO numeric(18,0)
)
AS
SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		DECLARE @CLIENTE INT
		SELECT @CLIENTE = idCliente FROM TPGDD.Clientes WHERE idUsuario = @IDUSUARIO  

		INSERT INTO [TPGDD].[Ofertas]
           ([idCliente]
           ,[idSubasta]
           ,[fecha]
           ,[monto])
        VALUES
           (@CLIENTE
           ,(SELECT idSubasta FROM [TPGDD].Subastas WHERE idPublicacion =@PUBLICACION)
           ,@FECHA
           ,@MONTO)

       UPDATE TPGDD.Subastas SET valorActual = @MONTO
	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Oferta registrada con exito';
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('Ocurrió un error al ingresar el registro: %s',16,1, @ERROR)
END CATCH



GO
/****** Object:  StoredProcedure [TPGDD].[SP_INSERT_PUBLICACION_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [TPGDD].[SP_INSERT_PUBLICACION_OK]
@TIPO nvarchar(255),

@VISIBILIDAD nvarchar(255), 
@RUBRO int,
@ESTADO int,
@USER int,
@DESCRIPCION nvarchar(255), 

@STOCK numeric(18,0),
@FECHA_CREACION DATETIME,
@FECHA_FIN DATETIME,
@PRECIO numeric(18,2),
@admiteEnvio bit

AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

--genero la publicacion
		INSERT INTO [TPGDD].[Publicaciones]
				   ([codVisibilidad], [codRubro], [idEstado], [idUsuario], [pDescripcion], [pStock]
				   ,[pFecha], [pFecha_Venc], [pPrecio], [pEnvio])
	    VALUES
				   ((select codigo from TPGDD.Visibilidades where descripcion like @VISIBILIDAD )
				   ,@RUBRO, @ESTADO, @USER, @DESCRIPCION, @STOCK
				   ,@FECHA_CREACION, @FECHA_FIN, @PRECIO, @admiteEnvio)

		DECLARE @idPublicacion numeric(18)
		SET @idPublicacion = @@IDENTITY

		IF @TIPO = 'compra inmediata'
			begin
				INSERT INTO [TPGDD].[ComprasInmediatas] ([idPublicacion], [stockDisponible], [unidadesVendidas])
				VALUES (@idPublicacion,@STOCK,0)
			end
		if @tipo ='subasta'
			begin
				INSERT INTO [TPGDD].[Subastas]
				([idPublicacion],[valorActual])
				VALUES
				(@idPublicacion, convert(numeric(18,0),@PRECIO))
			end

		if @ESTADO=2 --publicacion activa
			begin--genero la factura (el encabezado y el item)
				DECLARE @COSTOVISIBILIDAD numeric(18,2)
				SELECT @COSTOVISIBILIDAD = precio  FROM TPGDD.Visibilidades WHERE descripcion like @VISIBILIDAD

				EXEC [TPGDD].[SP_INSERT_FACTURA_OK] @COSTOVISIBILIDAD, @USER, @FECHA_CREACION, @idPublicacion, 'costo por publicar'
		end
	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se agregó con exito la publicacion';
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('Ocurrió un error al agregar la publicacion: %s',16,1, @ERROR)
END CATCH




GO
/****** Object:  StoredProcedure [TPGDD].[SP_INSERT_USUARIO_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-------------------------------------------------------------------------------------

CREATE  PROCEDURE [TPGDD].[SP_INSERT_USUARIO_OK]
@LOC int,
@USER nvarchar(255),  
@PASS nvarchar(255), 
@MAIL nvarchar(255), 
@TEL nvarchar(255), 
@PISO numeric(18,0),
@DEPTO nvarchar(255), 
@F_CREAC datetime,
@NRO_CALLE numeric(18,0),  
@DOM_CALLE nvarchar(255),  
@CP nvarchar(255),
@TIPO nvarchar(255)
AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION
			IF not exists(SELECT idUsuario FROM [TPGDD].usuarios WHERE username like @USER)
				Begin  
					INSERT INTO [TPGDD].[Usuarios]
						([codLocalidad]
						,[username]
						,[password]
						,[flagHabilitado]
						,[tipoUsuario]
						,[mail]
						,[telefono]
						,[nroPiso]
						,[nroDpto]
						,[fechaCreacion]
						,[nroCalle]
						,[domCalle]
						,[codPostal]
						,[intentosFallidos]
						,[reputacion]
						,[bajaLogica])
					VALUES
						(@LOC
						,@USER
						,@PASS
						,'TRUE'
						,@TIPO
						,@MAIL
						,@TEL
						,@PISO
						,@DEPTO
						,@F_CREAC
						,@NRO_CALLE
						,@DOM_CALLE
						,@CP
						,0
						,0
						,'FALSE')
			
					END
				ELSE
					BEGIN
						RAISERROR('USUARIO EXISTENTE.',16,1)
						return
					END


	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
	--	PRINT N'Operacion registrada con exito';
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('Ocurrió un error al ingresar el usuario: %s',16,1, @ERROR)
END CATCH





GO
/****** Object:  StoredProcedure [TPGDD].[SP_INSERT_VISIBILIDAD_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--------------------------------------------------------------------------

CREATE PROCEDURE [TPGDD].[SP_INSERT_VISIBILIDAD_OK](
@NOM nvarchar(255), 
@PRECIO numeric(18,2), 
@PORCENT numeric(18,2),
@ENVIO numeric(10,2),
@PRIORIDAD int,
@admiteEnvio bit
)

AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		INSERT INTO [TPGDD].[Visibilidades]
           ([codigo]
           ,[descripcion]
           ,[precio]
           ,[porcentaje]
           ,[Envio]
           ,[prioridad] --esto esta como identity y tira error
           ,[admiteEnvio])
     VALUES
           ((select max(codigo) from Visibilidades) + 1
           ,@NOM
           ,@PRECIO
           ,@PORCENT
           ,@ENVIO
           ,@PRIORIDAD --esto esta como identity y tira error
           ,@admiteEnvio)

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se agregó con exito la visibilidad';
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('Ocurrió un error al agregar la visibilidad: %s',16,1, @ERROR)
END CATCH




GO
/****** Object:  StoredProcedure [TPGDD].[SP_LISTADOS_ESTADISTICOS_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [TPGDD].[SP_LISTADOS_ESTADISTICOS_OK] 
    @desde datetime, 
	@hasta datetime,
	@Visbilidad NVARCHAR(255),
	@Rubro NVARCHAR(255),
	@TIPO INT --PARA PODER ELEGIR EL LISTADO QUE QUIERO
As
Begin
	Set nocount on

	DECLARE @user int

	IF (@TIPO=1) 

	    select distinct top 5 idUsuario, username, TPGDD.FX_NO_VENDIDOS(idUsuario, @desde, @hasta, @Visbilidad) as noVendidos 
		from TPGDD.usuarios
		where TPGDD.FX_NO_VENDIDOS(idUsuario, @desde, @hasta, @Visbilidad) is not null 
		order by noVendidos desc

	IF (@TIPO=2) 

	    select top 5 cli.idcliente, username,  TPGDD.FX_CANTIDAD_COMPRADA_CLIENTE_OK (cli.idcliente, @desde , @hasta, @Rubro)  as comprados
		from  TPGDD.usuarios u inner join TPGDD.Clientes cli on cli.idUsuario = u.idUsuario-- inner join compras co on co.idCliente = cli.idCliente order by fecha
		where TPGDD.FX_CANTIDAD_COMPRADA_CLIENTE_OK (cli.idcliente, @desde , @hasta, @Rubro) is not null


    IF (@TIPO=3)  

		select distinct top 5 idUsuario, username, TPGDD.[FX_CANTIDAD_FACTURAS] (idUsuario, @desde , @hasta) as  cantFacturas 
		from TPGDD.usuarios
		where TPGDD.[FX_CANTIDAD_FACTURAS] (idUsuario, @desde , @hasta) is not null
		order by cantFacturas desc

    IF (@TIPO=4) 
	
	    select distinct top 5 idUsuario, username,  TPGDD.[FX_MONTO_FACTURADO] (idUsuario, @desde , @hasta) as  montoFacturas
	    from TPGDD.usuarios 
		where TPGDD.[FX_MONTO_FACTURADO] (idUsuario, @desde , @hasta) is not null
		order by montoFacturas desc
	
	return	  
End




GO
/****** Object:  StoredProcedure [TPGDD].[SP_LOGIN]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------------------------------------------------

--este no lo uso nunca pero esta listo como para llamar desde la aplicacion
CREATE PROCEDURE [TPGDD].[SP_LOGIN](@username nvarchar(255), @pass nvarchar(255), @rol nvarchar(255))
AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)
DECLARE @BAJA BIT
DECLARE @IDUSUARIO INT
DECLARE @IDROL INT

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

	SELECT @IDUSUARIO = U.idUsuario, @BAJA = bajaLogica, @rol = R.idRol
	FROM usuarios U INNER JOIN UsuariosRoles UR ON U.idUsuario = UR.idUsuario inner join Roles R ON R.nombre LIKE @rol
	WHERE username like @username AND password LIKE @pass 

						IF @IDUSUARIO IS NOT NULL  
							BEGIN
								UPDATE Usuarios SET intentosFallidos = 0 WHERE idUsuario = @IDUSUARIO 
		
								IF  @BAJA = 'FALSE' 
    							BEGIN
	  									PRINT N'Loguin ok'; 
								END
								ELSE
								BEGIN
	  									PRINT N'Usuario temporalmente bloqueado'; 
								END
							END
						ELSE
						   BEGIN
							IF exists(SELECT idUsuario FROM usuarios WHERE username like @username)
								BEGIN
									UPDATE Usuarios SET intentosFallidos = intentosFallidos + 1 WHERE username LIKE @username 
									PRINT N'Contraseña no valida'; 
								END 
							ELSE
								BEGIN
									PRINT N'No existe el usuario'; 
								END 
						   END

IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('Ocurrió un error al agregar la visibilidad: %s',16,1, @ERROR)
END CATCH



GO
/****** Object:  StoredProcedure [TPGDD].[sp_mejoresCompradores_ok]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--*******************************************************************
------------------------------------------------------------------------------------
--2. Clientes con mayor cantidad de productos comprados, por mes y por año, dentro 
--de un rubro particular
------------------------------------------------------------------------------------
CREATE   PROCEDURE [TPGDD].[sp_mejoresCompradores_ok](@idRubro int, @numeroTrimestre int, @year int) 
AS 
BEGIN

	select top 5 ci.idCliente  ,sum(Co.cantidad) as CantidadProductosComprados, R.descripcionCorta as Rubro, U.username
	from TPGDD.Clientes Ci, TPGDD.Compras Co, TPGDD.Publicaciones P, TPGDD.Rubros R, TPGDD.Usuarios U
	where U.idUsuario = Ci.idUsuario and Ci.idCliente = Co.idCliente and Co.idPublicacion = P.pCodigo and P.codRubro = R.codRubro and R.codRubro = @idRubro 
		  and year(P.pFecha_Venc) = @year and TPGDD.getTrimestre(P.pFecha_Venc) = @numeroTrimestre 
	group by Ci.idCliente, R.descripcionCorta, U.username
	order by 2 desc
END



GO
/****** Object:  StoredProcedure [TPGDD].[sp_mejoresVendedoresPorCantidadFacturas_ok]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--*****************************************************
------------------------------------------------------------------------------------
--3. Vendedores con mayor cantidad de facturas dentro de un mes y año particular
------------------------------------------------------------------------------------
CREATE   PROCEDURE [TPGDD].[sp_mejoresVendedoresPorCantidadFacturas_ok](@numeroTrimestre int, @year int) 
AS 
BEGIN

	select top 5 U.idUsuario, TPGDD.cantidadFacturas(U.idUsuario,@numeroTrimestre, @year)  as CantidadFacturas, U.username
	from TPGDD.Usuarios U
	where exists(select 1 from TPGDD.Publicaciones P where P.idUsuario = U.idUsuario)
	order by 2 desc
END



GO
/****** Object:  StoredProcedure [TPGDD].[sp_mejoresVendedoresPorMontoFacturado_ok]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--******************************************************
------------------------------------------------------------------------------------
--4. Vendedores con mayor monto facturado dentro de un mes y año particular
------------------------------------------------------------------------------------

CREATE   PROCEDURE [TPGDD].[sp_mejoresVendedoresPorMontoFacturado_ok](@numeroTrimestre int, @year int) 
AS 
BEGIN

	select top 5 idUsuario, TPGDD.montoFacturado(U.idUsuario,@numeroTrimestre, @year)  as MontoFacturado, U.username
	from TPGDD.Usuarios U
	where exists(select 1 from TPGDD.Publicaciones P where P.idUsuario = U.idUsuario)
	order by 2 desc
END



GO
/****** Object:  StoredProcedure [TPGDD].[SP_MODIFICAR_ROLES_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [TPGDD].[SP_MODIFICAR_ROLES_OK] (
	@idRol int,
	@nombre nvarchar(255)
	,@HABILITADO BIT) 

AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT
	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION


		Update TPGDD.Roles
		Set nombre = @nombre , habilitado =@HABILITADO
		Where idRol = @idRol

        DELETE FROM RolesFuncionalidades WHERE idRol = @idRol  

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se actualizo con exito el rol';
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('No se pudo modificar el rol: %s',16,1, @ERROR)
END CATCH



GO
/****** Object:  StoredProcedure [TPGDD].[SP_modificarPassword]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create  procedure  [TPGDD].[SP_modificarPassword] (
		@username nvarchar(255),
		@password nvarchar(255)
) 
As
Begin
	UPDATE [TPGDD].[Usuarios]
	SET
		[password] = @password
	WHERE username = @username
end

GO
/****** Object:  StoredProcedure [TPGDD].[sp_peoresVendedores_ok]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--******************************************************
--1 . Vendedores con mayor cantidad de productos no vendidos
CREATE   PROCEDURE [TPGDD].[sp_peoresVendedores_ok](@codigoVisbilidad numeric(18,0), @numeroTrimestre int, @year int) 
AS 
BEGIN

	SELECT TOP 5 C.idVendedor, P.pStock - sum(C.cantidad) as cantidadNoVendida, P.pFecha_Venc as [fecha fin], V.descripcion as visibilidad
				 
	FROM TPGDD.Compras C, TPGDD.Publicaciones P, TPGDD.Visibilidades V
	where C.idPublicacion = P.pCodigo and P.codVisibilidad = V.codigo 
		  and TPGDD.getTrimestre(P.pFecha_Venc) = @numeroTrimestre and year(P.pFecha_Venc) = @year and P.codVisibilidad = @codigoVisbilidad 
	group by C.idVendedor, P.pStock, P.pFecha_Venc, V.descripcion
	ORDER BY 3 desc, 4 desc
END



GO
/****** Object:  StoredProcedure [TPGDD].[SP_UPDATE_PUBLICACION_ESTADO_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




---------------------------------------------------------------------------------------

CREATE PROCEDURE [TPGDD].[SP_UPDATE_PUBLICACION_ESTADO_OK](
@ESTADO nvarchar(255),
@ID  numeric(18), 
@FECHA DATETIME
)

AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		--ACTUALIZO EL ESTADO DE LA PUBLICACION
			UPDATE Publicaciones
		    SET idEstado = (SELECT [idEstado] FROM [TPGDD].[Estados] WHERE descripcion LIKE @ESTADO) 
		    WHERE pCodigo = @ID

			if @ESTADO= 'Activa'
			begin--genero la factura (el encabezado y el item)
				DECLARE @COSTOVISIBILIDAD numeric(18,2)
				DECLARE @USER INT 
				SELECT @COSTOVISIBILIDAD = precio, @USER = idUsuario   
				FROM TPGDD.Visibilidades v inner join TPGDD.Publicaciones p on p.codVisibilidad =v.codigo 
				  WHERE pCodigo = @ID

				EXEC [TPGDD].[SP_INSERT_FACTURA_OK] @COSTOVISIBILIDAD, @USER, @FECHA, @ID, 'costo por publicar'
		    end

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se actualizó con exito el estado de la publicacion'; 
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('Ocurrió un error al actualizar el estado de la publicacion de codigo %s: %s',16,1, @ID, @ERROR)
END CATCH






GO
/****** Object:  StoredProcedure [TPGDD].[SP_UPDATE_PUBLICACION_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-------------------------------------------------------------------------------------
--*****************************************************************************************
--**********PROCEDURES

CREATE PROCEDURE [TPGDD].[SP_UPDATE_PUBLICACION_OK](

@VISIBILIDAD nvarchar(255),
@RUBRO nvarchar(255),
@ESTADO nvarchar(255),
@USER int,
@DESCRIPCION nvarchar(255),
@STOCK numeric(18,0),
@FECHA datetime,
@FIN datetime,
@PRECIO numeric(18,2),
@ENVIO BIT,
@ID  numeric(18, 0),
@TIPO nvarchar(255)
)

AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		--ACTUALIZO LA PUBLICACION
			UPDATE [TPGDD].[Publicaciones]
			   SET [codVisibilidad] = (SELECT CODIGO FROM [TPGDD].Visibilidades WHERE descripcion LIKE @VISIBILIDAD) 
				  ,[codRubro] = (SELECT codRubro  FROM [TPGDD].Rubros WHERE descripcionCorta LIKE @RUBRO) 
				  ,[idEstado] = (SELECT idEstado FROM [TPGDD].Estados WHERE descripcion LIKE @ESTADO) 
				  ,[idUsuario] = @USER
				  ,[pDescripcion] = @DESCRIPCION
				  ,[pStock] = @STOCK
				  ,[pFecha] = @FECHA
				  ,[pFecha_Venc] = @FIN
				  ,[pPrecio] =@PRECIO
				  ,[pEnvio] = @ENVIO
			 WHERE pCodigo = @ID
			
			 --ACTUALIZO EN SUBASTAS O COMPRA INMEDIATAS
			 IF @TIPO='Subasta' 
			 BEGIN
				 IF exists(SELECT * FROM [TPGDD].ComprasInmediatas WHERE idPublicacion = @ID) 
				 BEGIN
					 DELETE FROM  [TPGDD].ComprasInmediatas WHERE idPublicacion = @ID 
					 INSERT INTO [TPGDD].Subastas (idPublicacion,valorActual) 
					 VALUES (@ID, @PRECIO)
				 END
				 ELSE
	 				 UPDATE [TPGDD].Subastas SET valorActual = @PRECIO WHERE idPublicacion = @ID
			END
			ELSE
			BEGIN
				 IF exists(SELECT * FROM [TPGDD].Subastas WHERE idPublicacion = @ID) 
				 BEGIN
					 DELETE FROM  [TPGDD].Subastas WHERE idPublicacion = @ID 
					 INSERT INTO [TPGDD].ComprasInmediatas (idPublicacion,stockDisponible ) 
					 VALUES (@ID, @STOCK)
				 END
				 ELSE
	 				 UPDATE [TPGDD].ComprasInmediatas SET stockDisponible = @STOCK WHERE idPublicacion = @ID

			END

			if @ESTADO= 'Activa'
			begin--genero la factura (el encabezado y el item)
				DECLARE @COSTOVISIBILIDAD numeric(18,2)
				SELECT @COSTOVISIBILIDAD = precio  FROM TPGDD.Visibilidades WHERE descripcion like @VISIBILIDAD

				EXEC [TPGDD].[SP_INSERT_FACTURA_OK] @COSTOVISIBILIDAD, @USER, @FECHA, @ID, 'costo por publicar'
		    end

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se actualizó la publicacion con exito'; 
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR(N'Ocurrió un error al actualizar la publicacion, %s', 16, 1, @ERROR)

END CATCH




GO
/****** Object:  StoredProcedure [TPGDD].[SP_UPDATE_USUARIO_CLIENTE_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [TPGDD].[SP_UPDATE_USUARIO_CLIENTE_OK]
(
--parametros usuarios
@ID int,
@localidad nvarchar(255),
@password nvarchar(255),
@HABILITADO BIT,--por intentos de logueo fallidos
@MAIL nvarchar(255),
@TEL  nvarchar(255),
@PISO numeric(18,0),
@DEPTO nvarchar(50),
@FECHA datetime,
@NROCALLE numeric(18),
@DOMICILIO nvarchar(255),
@CP nvarchar(50),
@TIPO nvarchar(255),

--parametros cliente
@BAJA  bit,--por baja logica por algun admin
@nombre nvarchar(255),
@apellido nvarchar(255),
@fechanac date,
@dni numeric(18,2),
@tipodni nvarchar(255)
)

AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION
--actualizo el usuario
		UPDATE [TPGDD].[Usuarios]
		   SET [codLocalidad] = (select codLocalidad from Localidades where descripcion = @localidad)
			  ,[password] = case when @password='' then [password] else  @password end
			  ,[flagHabilitado] = @HABILITADO
			  ,[tipoUsuario] ='Cliente'
			  ,[mail] = @MAIL
			  ,[telefono] = @TEL
			  ,[nroPiso] = @PISO
			  ,[nroDpto] = @DEPTO
			  ,[fechaCreacion] = case when @FECHA = '' then null else  @FECHA end 
			  ,[nroCalle] = @NROCALLE
			  ,[domCalle] = @DOMICILIO
			  ,[codPostal] = @CP 
			  ,[bajaLogica] = @BAJA
		 WHERE  idUsuario like @ID

--actualizo el cliente
		UPDATE [TPGDD].[Clientes]
			SET  [nombre] = @nombre
				,[apellido] = @apellido
				,[fechaNacimiento] = case when @fechanac = '' then null else  @fechanac end 
				,[nroDNI] =case when (@dni = null or @tipodni = '') then null else  @dni end   
				,[tipoDocumento] =case when (@dni = null or @tipodni = '') then '' else  @tipodni end     
			WHERE idUsuario =@ID

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se actualizó el usuario con exito'; 
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR(N'Ocurrió un error al actualizar el usuario %s',16,1, @ERROR)

END CATCH





GO
/****** Object:  StoredProcedure [TPGDD].[SP_UPDATE_USUARIO_EMPRESA_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


------------------------------------------------------------------------------------------



CREATE PROCEDURE [TPGDD].[SP_UPDATE_USUARIO_EMPRESA_OK]
(
--parametros usuarios
@ID int,
@localidad nvarchar(255),
@password nvarchar(255),
@HABILITADO BIT,
@MAIL nvarchar(255),
@TEL  nvarchar(255),
@PISO numeric(18,0),
@DEPTO nvarchar(50),
@FECHA datetime,
@NROCALLE numeric(18),
@DOMICILIO nvarchar(255),
@CP nvarchar(50),
@TIPO nvarchar(255),
@BAJA  bit,

--parametros empresa
@razon nvarchar(255),
@cuit nvarchar(50),
@contacto nvarchar(50),
@rubro nvarchar(255),
@ciudad nvarchar(255)

)

AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

--actualizo el usuario
		UPDATE [TPGDD].[Usuarios]
		   SET [codLocalidad] = (select codLocalidad from Localidades where descripcion = @localidad)
			  ,[password] = case when @password='' then [password] else  @password end
			  ,[flagHabilitado] = @HABILITADO
			  ,[tipoUsuario] ='Empresa'
			  ,[mail] = @MAIL
			  ,[telefono] = @TEL
			  ,[nroPiso] = @PISO
			  ,[nroDpto] = @DEPTO
			  ,[fechaCreacion] = case when @FECHA = '' then null else  @FECHA end 
			  ,[nroCalle] = @NROCALLE
			  ,[domCalle] = @DOMICILIO
			  ,[codPostal] = @CP 
			  ,[bajaLogica] = @BAJA
		 WHERE  idUsuario like @ID

--actualizo la empresa
		UPDATE [TPGDD].[Empresas]
		   SET [razonSocial] = @razon
			  ,[cuit] = @cuit
			  ,[nombreContacto] =@contacto
			  ,[nombreRubro] = @rubro
			  ,[ciudad] = @ciudad
		 WHERE  idUsuario =@ID

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se actualizó el usuario con exito'; 
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR(N'Ocurrió un error al actualizar el usuario %s',16,1, @ERROR)

END CATCH


GO
/****** Object:  StoredProcedure [TPGDD].[SP_UPDATE_VISIBILIDAD_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



---------------------------------------------------------------------------------------------------

CREATE PROCEDURE [TPGDD].[SP_UPDATE_VISIBILIDAD_OK] (@DESCRIPCION NVARCHAR(255), @PRIORIDAD INT, @ID NUMERIC(18))
AS

SET XACT_ABORT ON	
SET NOCOUNT ON	



DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		--ACTUALIZO LA VISIBILIDAD
			UPDATE [TPGDD].[Visibilidades]
			   SET descripcion = @DESCRIPCION, prioridad= @PRIORIDAD  --por alguna razon esto esta como identity y no se puede actualizar, modificar la base
            WHERE codigo = @ID

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'La visibilidad fue actualizada con exito'; 
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('Ocurrió un error al actualizar la visibilidas de codigo %s: %s',16,1, @ID, @ERROR)
END CATCH





GO
/****** Object:  StoredProcedure [TPGDD].[SP_USUARIO_LOGIN_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [TPGDD].[SP_USUARIO_LOGIN_OK]
	@username nvarchar(255),
	@password nvarchar(255),
	@rol nvarchar(255)
As
Begin
	Set nocount on
	Declare @usuario nvarchar(255)
	Declare @passwordPosta nvarchar(255)
	Declare @intentos int
	Declare @flagHabilitado bit
	Declare @baja bit

	 select  @baja= u.bajaLogica ,  @usuario = u.username, @flagHabilitado = u.flagHabilitado, @intentos = u.intentosFallidos, @passwordPosta = u.password 
	 from TPGDD.Usuarios as u
	 where u.username like @username
	
	If @usuario is null	--VERIFICO EXSITENCIA	
	Begin
		Raiserror('USUARIO INEXISTENTE.',15,1)
		return
	End

	else--USUARIO EXISTENTE
	begin
		--VERIFICO HABILITACION
		IF(@flagHabilitado = 0) or (@baja = 1)--no habilitado
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
				Where  username = @username 
				Return
			End
			else --ACTUALIZO LOS INTENTO FALLIDOS
			BEGIN
				declare @intentosRestantes int
				set @intentosRestantes = 3 - @intentos 
				Raiserror ('PASSWORD ERRONEO. LE QUEDAN %d INTENTOS.',15,1, @intentosRestantes)
				Update TPGDD.Usuarios 
				Set intentosFallidos = @intentos
				Where  username = @username 
				Return
			END
		  END
	  end
	end
	-- TODO CORRECTO	  
	Update TPGDD.Usuarios
	Set intentosFallidos = 0
	Where username = @username 

	SELECT idUsuario, tipoUsuario, intentosFallidos, bajaLogica, flagHabilitado, IDROL 
    FROM TPGDD.VW_LOGIN_OK 
	WHERE  username = @username AND password LIKE @password and idRol =(select idrol from [TPGDD].roles where nombre = @rol)

	return	  
End




GO
/****** Object:  UserDefinedFunction [TPGDD].[cantidadFacturas]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec TPGDD.mejoresCompradoresSP 3, 1, 2016 
--select * from TPGDD.Rubros
--******************************************************
--*********** FUNCIONES AUXILIARES LIST3 ***************
--******************************************************
--Funciones ayudadoras
create    FUNCTION [TPGDD].[cantidadFacturas](@idVendedor int, @numeroTrimestre int, @year int)
RETURNS  int
AS
BEGIN
	
	RETURN  (select count(F.nroFactura)
			 from TPGDD.Facturaciones F
			 where F.idUsuario = @idVendedor and
				   year(F.fecha) = @year and 
				   TPGDD.getTrimestre(F.fecha) =  @numeroTrimestre 
			 )
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[cantidadNoVendida]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 create   FUNCTION [TPGDD].[cantidadNoVendida](@idVendedor int, @codigoVisbilidad numeric(18,0), @numeroTrimestre int, @year int)
RETURNS  int
AS
BEGIN
	
	RETURN  (TPGDD.stockTotalInicial(@idVendedor , @codigoVisbilidad , @numeroTrimestre , @year )
			- TPGDD.cantidadVendida(@idVendedor , @codigoVisbilidad , @numeroTrimestre , @year ))
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[cantidadProductosComprados]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec TPGDD.peoresVendedoresSP 10005,1, 2016
--select * from TPGDD.Visibilidades
--select * from TPGDD.Compras


--******************************************************
--*******  FUNCIONES AUXILIARES LIST2   ****************
--******************************************************
create    FUNCTION [TPGDD].[cantidadProductosComprados](@idCliente int, @idRubro int, @numeroTrimestre int, @year int)
RETURNS  int
AS
BEGIN
	
	RETURN  (select sum(C2.cantidad)
			 from TPGDD.Clientes C1, TPGDD.Compras C2 
			 where C1.idCliente = @idCliente and
				   C1.idCliente = C2.idCliente and
				   year(C2.fecha) = @year and 
				   TPGDD.getTrimestre(C2.fecha) =  @numeroTrimestre and
				   TPGDD.getRubro(C2.idPublicacion) = @idRubro
			 )
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[cantidadVendida]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 create   FUNCTION [TPGDD].[cantidadVendida](@idVendedor int, @codigoVisbilidad numeric(18,0), @numeroTrimestre int, @year int)
RETURNS  int
AS
BEGIN
	
	RETURN (select sum(C.cantidad)
			from TPGDD.getPublicacionesFiltradas(@idVendedor,@codigoVisbilidad,@numeroTrimestre,@year) P, TPGDD.Compras C
			where   P.pCodigo = C.idPublicacion)
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[convierteEstrellas]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec tpgdd.mejoresVendedoresPorMontoFacturadoSP 1, 2015
--go
--******************************************************************
-- **** PROCEDURE Y FUNCION AUXILIARES DE MIGRACION      *************
--*********************************************************************
CREATE FUNCTION [TPGDD].[convierteEstrellas](@cantidadEstrellas int)
RETURNS INT AS
BEGIN
DECLARE @estrellasConvertidas INT

SET @estrellasConvertidas =
	CASE WHEN (@cantidadEstrellas = 10 OR @cantidadEstrellas =9) THEN 5 
	WHEN (@cantidadEstrellas = 8 OR @cantidadEstrellas =7) THEN 4
	WHEN (@cantidadEstrellas = 6 OR @cantidadEstrellas =5) THEN 3
	WHEN (@cantidadEstrellas = 4 OR @cantidadEstrellas =3) THEN 2
	WHEN (@cantidadEstrellas = 2 OR @cantidadEstrellas =1) THEN 1 
	END
RETURN  @estrellasConvertidas
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[dameReputacionDe]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--LA USO LUEGO DE LA MIGRACION
CREATE FUNCTION [TPGDD].[dameReputacionDe](@idUsuario int)
RETURNS INT AS
BEGIN
DECLARE @reputacion INT
DECLARE @promedio  INT

SELECT @promedio = round(  avg  
     ( (cal.cantEstrellas)  ),0  )
  FROM TPGDD.Calificaciones cal
  INNER JOIN TPGDD.Compras C ON c.idCompra= cal.idCompra and  C.idVendedor = @idUsuario
  where c.calificada = 1  --para que sean compras concretadas
set @reputacion = ( @promedio )
  return @reputacion 
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[es_usuario_bloqueado]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create function [TPGDD].[es_usuario_bloqueado](@username nvarchar(255))
Returns bit
As
Begin
	Declare @hab bit
	Select @hab = u.flagHabilitado
		from TPGDD.Usuarios as u 
		where @username = u.username
	Return @hab
End

GO
/****** Object:  UserDefinedFunction [TPGDD].[FX_CALIFICACIONES_PROMEDIO_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------------------------------

CREATE FUNCTION  [TPGDD].[FX_CALIFICACIONES_PROMEDIO_OK] (@IDUSUARIO INT)
RETURNS @RESUMEN  TABLE
(
	FALTAN INT, 
	PROMEDIO INT
)
AS BEGIN

DECLARE @CUENTA INT
DECLARE @PROMEDIO INT
DECLARE @IDCLIENTE INT

SELECT @IDCLIENTE = idCliente FROM Clientes WHERE idUsuario = @IDUSUARIO
SELECT @CUENTA = COUNT(idCompra) FROM COMPRAS WHERE CALIFICADA = 'FALSE' AND IDCLIENTE = @IDCLIENTE
SELECT @PROMEDIO = AVG(cantEstrellas)  FROM Calificaciones WHERE calificador = @IDCLIENTE	
	
	INSERT @RESUMEN (FALTAN, PROMEDIO ) VALUES (@CUENTA,@PROMEDIO)

  RETURN

END


GO
/****** Object:  UserDefinedFunction [TPGDD].[FX_CANTIDAD_COMPRADA_CLIENTE_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-----------------------------------------------------------------------
CREATE FUNCTION [TPGDD].[FX_CANTIDAD_COMPRADA_CLIENTE_OK] (@idCliente int, @desde datetime, @hasta datetime, @RUBRO nvarchar(255))
RETURNS nvarchar(255)
AS
BEGIN

	DECLARE  @cantidadComprada nvarchar(255)
	if @idCliente is null return null

	if @RUBRO is null and @desde is null and @hasta is null
	 begin 
		 select @cantidadComprada = sum(cantidad) from [TPGDD].compras where idcliente = @idCliente 
	 end 
	if @RUBRO is null
	 begin 
		 select @cantidadComprada = sum(cantidad) from [TPGDD].compras where  idcliente = @idCliente and fecha between @desde and @hasta 
	 end
 	else
	 begin 
	 	DECLARE @IDRUBRO INT
		SELECT @IDRUBRO = codRubro FROM TPGDD.Rubros WHERE descripcionCorta LIKE @RUBRO 

		select @cantidadComprada = sum(cantidad) from [TPGDD].compras c inner join [TPGDD].publicaciones p on c.idPublicacion = p.pCodigo
		 where  idcliente = @idCliente and fecha between @desde and @hasta and codRubro  = @IDRUBRO  
	 end
	RETURN @cantidadComprada

END



GO
/****** Object:  UserDefinedFunction [TPGDD].[FX_CANTIDAD_FACTURAS]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [TPGDD].[FX_CANTIDAD_FACTURAS] (@user int, @desde datetime, @hasta datetime)

RETURNS  nvarchar(255)
AS
BEGIN

	DECLARE @cantidad  nvarchar(255)
	if @user is null return null
	if  @desde is null OR @hasta is null
	 begin 
		 select @cantidad = COUNT(*) from [TPGDD].Facturaciones where idUsuario=@user
	 end 
 	else
	 begin 
		 select @cantidad = COUNT(*) from [TPGDD].Facturaciones where idUsuario=@user and fecha between @desde and @hasta
	 end

	RETURN @cantidad

END



GO
/****** Object:  UserDefinedFunction [TPGDD].[FX_COMPRAS_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-----------------------------------------------------------------------

CREATE FUNCTION [TPGDD].[FX_COMPRAS_OK]
(
	@CALIFICADA BIT, @USER INT, @TIPO NVARCHAR(255)
)
RETURNS INT
AS
BEGIN

DECLARE @RETORNO INT
IF @CALIFICADA='TRUE' --SOLO LAS COMPRAS O SUBASTAS CALIFICADAS
   SELECT @RETORNO =isnull(COUNT(*),0) FROM  Compras  
   WHERE idCliente =@USER  AND calificada='TRUE' AND tipoPublicacion LIKE @TIPO
	 
ELSE--TODAS LAS COMPRAS DEL CLIENTE O TODAS LAS SUBASTAS
	SELECT @RETORNO =isnull(COUNT(*),0)
	FROM  Compras  
	WHERE idCliente =@USER AND tipoPublicacion LIKE @TIPO


RETURN @RETORNO
END


GO
/****** Object:  UserDefinedFunction [TPGDD].[FX_FUNCIONALIDADES_NO_ASIGNADAS_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------

CREATE FUNCTION [TPGDD].[FX_FUNCIONALIDADES_NO_ASIGNADAS_OK](@IDROL INT)
RETURNS @FUNCIONALIDADES  TABLE
(
NOMBRE NVARCHAR(255)
)
AS BEGIN

INSERT @FUNCIONALIDADES
  Select f1.nombre from tpgdd.Funcionalidades f1
   EXCEPT

SELECT  

	  f.[nombre]
  --    ,[descripcion], r.nombre
  FROM [GD1C2016].[TPGDD].[Funcionalidades] f
  inner join TPGDD.RolesFuncionalidades rf on rf.idFuncionalidad = f.idFuncionalidad
  inner join TPGDD.Roles r on r.idRol = rf.idRol
  where r.idRol = @IDROL
  

  RETURN

END



GO
/****** Object:  UserDefinedFunction [TPGDD].[FX_MONTO_FACTURADO]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-----------------------------------------------------------------------

CREATE FUNCTION [TPGDD].[FX_MONTO_FACTURADO] (@user int, @desde datetime, @hasta datetime)

RETURNS nvarchar(255)
AS
BEGIN

	DECLARE @cantidad nvarchar(255)
	if @user is null return null
	if  @desde is null OR @hasta is null
	 begin 
		 select @cantidad = SUM(total) from [TPGDD].Facturaciones where idUsuario=@user
	 end 
 	else
	 begin 
		 select @cantidad = SUM(total) from [TPGDD].Facturaciones where idUsuario=@user and fecha between @desde and @hasta
	 end
	RETURN @cantidad

END



GO
/****** Object:  UserDefinedFunction [TPGDD].[FX_NO_VENDIDOS]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-----------------------------------------------------------------------

CREATE FUNCTION [TPGDD].[FX_NO_VENDIDOS] (@user int, @desde datetime, @hasta datetime, @visibilidad nvarchar(255))

RETURNS  nvarchar(255)
AS
BEGIN
	DECLARE @cantidad nvarchar(255)
	if @user is null return null

	if @visibilidad is null and @desde is null and @hasta is null
	 begin
		 select @cantidad = sum(pSTOCK) from [TPGDD].Publicaciones where idUsuario=@user and idEstado in (4,5) 
	end 
	if @visibilidad is null
	 begin 
		select @cantidad = sum(pSTOCK) from [TPGDD].Publicaciones where idUsuario=@user and idEstado in (4,5)  and pFecha between @desde and @hasta 
	 end
 	else
	 begin 
	 	 DECLARE @codigoVisbilidad numeric(18,0)
         SELECT @codigoVisbilidad = codigo FROM TPGDD.Visibilidades WHERE descripcion LIKE @visibilidad 
         select @cantidad = sum(pSTOCK) from [TPGDD].Publicaciones where idUsuario=@user and idEstado in (4,5)  and pFecha between @desde and @hasta  and codVisibilidad = @codigoVisbilidad   
	 end
	
	RETURN @cantidad;

END


GO
/****** Object:  UserDefinedFunction [TPGDD].[FX_RESUMEN_ESTRELLAS_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [TPGDD].[FX_RESUMEN_ESTRELLAS_OK](@IDUSUARIO INT)
RETURNS @RESUMEN  TABLE
(
	ESTRELLAS1 INT, 
	ESTRELLAS2 INT,
	ESTRELLAS3 INT,
	ESTRELLAS4 INT,
	ESTRELLAS5 INT, 
	tipoPublicacion NVARCHAR(255)
)
AS BEGIN

DECLARE @IDCLIENTE INT
SELECT @IDCLIENTE = idCliente FROM TPGDD.Clientes WHERE idUsuario = @IDUSUARIO   

INSERT @RESUMEN

  SELECT 
  (SELECT ISNULL(COUNT(*),0) FROM TPGDD.Compras CO INNER JOIN TPGDD.Calificaciones CA ON CO.idCompra =CA.idCompra WHERE CO.idCliente = @IDCLIENTE AND CA.cantEstrellas = 1 AND tipoPublicacion LIKE 'Compra inmediata'),
  (SELECT ISNULL(COUNT(*),0) FROM TPGDD.Compras CO INNER JOIN TPGDD.Calificaciones CA ON CO.idCompra =CA.idCompra WHERE CO.idCliente = @IDCLIENTE AND CA.cantEstrellas = 2 AND tipoPublicacion LIKE 'Compra inmediata'),
  (SELECT ISNULL(COUNT(*),0) FROM TPGDD.Compras CO INNER JOIN TPGDD.Calificaciones CA ON CO.idCompra =CA.idCompra WHERE CO.idCliente = @IDCLIENTE AND CA.cantEstrellas = 3 AND tipoPublicacion LIKE 'Compra inmediata'),
  (SELECT ISNULL(COUNT(*),0) FROM TPGDD.Compras CO INNER JOIN TPGDD.Calificaciones CA ON CO.idCompra =CA.idCompra WHERE CO.idCliente = @IDCLIENTE AND CA.cantEstrellas = 4 AND tipoPublicacion LIKE 'Compra inmediata'),
  (SELECT ISNULL(COUNT(*),0) FROM TPGDD.Compras CO INNER JOIN TPGDD.Calificaciones CA ON CO.idCompra =CA.idCompra WHERE CO.idCliente = @IDCLIENTE AND CA.cantEstrellas = 5 AND tipoPublicacion LIKE 'Compra inmediata'),
  'Compra inmediata'
  FROM TPGDD.Compras  

  UNION 

  SELECT 
  (SELECT ISNULL(COUNT(*),0) FROM TPGDD.Compras CO INNER JOIN TPGDD.Calificaciones CA ON CO.idCompra =CA.idCompra WHERE CO.idCliente = @IDCLIENTE AND CA.cantEstrellas = 1 AND tipoPublicacion LIKE 'Subasta'),
  (SELECT ISNULL(COUNT(*),0) FROM TPGDD.Compras CO INNER JOIN TPGDD.Calificaciones CA ON CO.idCompra =CA.idCompra WHERE CO.idCliente = @IDCLIENTE AND CA.cantEstrellas = 2 AND tipoPublicacion LIKE 'Subasta'),
  (SELECT ISNULL(COUNT(*),0) FROM TPGDD.Compras CO INNER JOIN TPGDD.Calificaciones CA ON CO.idCompra =CA.idCompra WHERE CO.idCliente = @IDCLIENTE AND CA.cantEstrellas = 3 AND tipoPublicacion LIKE 'Subasta'),
  (SELECT ISNULL(COUNT(*),0) FROM TPGDD.Compras CO INNER JOIN TPGDD.Calificaciones CA ON CO.idCompra =CA.idCompra WHERE CO.idCliente = @IDCLIENTE AND CA.cantEstrellas = 4 AND tipoPublicacion LIKE 'Subasta'),
  (SELECT ISNULL(COUNT(*),0) FROM TPGDD.Compras CO INNER JOIN TPGDD.Calificaciones CA ON CO.idCompra =CA.idCompra WHERE CO.idCliente = @IDCLIENTE AND CA.cantEstrellas = 5 AND tipoPublicacion LIKE 'Subasta'),
  'Subasta'
  FROM TPGDD.Compras 

  RETURN
END


GO
/****** Object:  UserDefinedFunction [TPGDD].[FX_RESUMEN_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--select * from TPGDD.Usuarios u, TPGDD.Empresas e where u.idUsuario = e.idEmpresa and username = 'RazonSocialNº:36'
--****************************************************************************************
--****aporte Guadalupe  de aca hasta el final y hizo toda la aplicacion desktop***********

--******************************************************************************

--**************FUNCIONES*******************************************************
CREATE FUNCTION [TPGDD].[FX_RESUMEN_OK]
(
	@ESTRELLAS INT, @USER INT, @TIPO NVARCHAR(255)
)
RETURNS INT
AS
BEGIN

DECLARE @IDCLIENTE INT
SELECT @IDCLIENTE= IDCLIENTE FROM CLIENTES WHERE idUsuario = @USER

RETURN(	SELECT COUNT(*) 
FROM Calificaciones CA INNER JOIN Compras CO ON CA.idCompra = CO.idCompra 
WHERE idCliente = @IDCLIENTE  AND cantEstrellas = @ESTRELLAS AND tipoPublicacion LIKE @TIPO )	 

END



GO
/****** Object:  UserDefinedFunction [TPGDD].[getAdmiteEnvio]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [TPGDD].[getAdmiteEnvio](@idPublicacion numeric(18,0))
RETURNS  bit
AS
BEGIN
	return (select V.admiteEnvio from TPGDD.Publicaciones P, TPGDD.Visibilidades V where P.codVisibilidad = V.codigo and P.pCodigo = @idPublicacion)
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[getCantidadCompras]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--********************************************************************
--***** FUNCIONES AUXILIARES DE TRIGGERS 1-6 *************************
--********************************************************************
create  FUNCTION [TPGDD].[getCantidadCompras](@idVendedor int)
RETURNS  int
AS
BEGIN
	RETURN  (select count(*) from TPGDD.Compras C where C.idVendedor = @idVendedor)
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[getCantidadSubastas]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  FUNCTION [TPGDD].[getCantidadSubastas](@idVendedor int)
RETURNS  int
AS
BEGIN
	RETURN  (select count(*) from TPGDD.Publicaciones P, TPGDD.Subastas S 
	where P.pCodigo = S.idPublicacion and P.idUsuario = @idVendedor)
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[getComprasVendedor]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create  FUNCTION [TPGDD].[getComprasVendedor](@idCompra int)
RETURNS  @rtnTable TABLE 
(
	idCompra int NOT NULL,
	idPublicacion numeric(18) NULL,
	idCliente int NULL,
	fecha datetime NULL,
	cantidad numeric(18) NULL,	
	CHECK (cantidad >0),
	calificada bit DEFAULT 0 NULL, --0 no calificada
	idVendedor int NULL,
	tipoPublicacion nvarchar(255) NULL  --subasta o compraInmediata	
)
AS
BEGIN
    insert into @rtnTable 
	select * from TPGDD.Compras C where C.idVendedor = TPGDD.getIdVendedor(@idCompra)
	RETURN 
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[getIdLocalidad]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*****************************************************************
--*****************************************************************
--******* PROCEDURES FUNCIONALIDADES*******************************
--*****************************************************************

--***************************************************
--******* AUXILIARES *******************************
--***************************************************
 create    FUNCTION [TPGDD].[getIdLocalidad](@nombreLocalidad nvarchar(255))
RETURNS  int
AS
BEGIN
	
	RETURN (select top 1 L.codLocalidad
			from TPGDD.Localidades L where L.descripcion = @nombreLocalidad)
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[getIdRol]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   FUNCTION [TPGDD].[getIdRol](@nombreRol nvarchar(255))
RETURNS  int
AS
BEGIN
	
	RETURN (select T.idRol
			from TPGDD.Roles T where T.nombre = @nombreRol)
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[getIdUsuario]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   FUNCTION [TPGDD].[getIdUsuario](@username nvarchar(255))
RETURNS  int
AS
BEGIN
	
	RETURN (select T.idUsuario
			from TPGDD.Usuarios T where T.username = @username)
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[getIdVendedor]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  FUNCTION [TPGDD].[getIdVendedor](@idCompra int)
RETURNS  int
AS
BEGIN
	RETURN  (select top 1 T.idVendedor from TPGDD.Compras T where T.idCompra = @idCompra)
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[getMontoItemPorEnvio]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  FUNCTION [TPGDD].[getMontoItemPorEnvio](@idPublicacion numeric(18,0))
RETURNS  numeric(10,2)
AS
BEGIN
	return (select V.Envio from TPGDD.Publicaciones P, TPGDD.Visibilidades V 
	where P.codVisibilidad = V.codigo and P.pCodigo = @idPublicacion)
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[getMontoItemPorVentaCompraInmediata]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  FUNCTION [TPGDD].[getMontoItemPorVentaCompraInmediata](@cantidad numeric(18,0), @idPublicacion numeric(18,0))
RETURNS  numeric(18,2)
AS
BEGIN
	return @cantidad * (select P.pPrecio from TPGDD.Publicaciones P where pCodigo = @idPublicacion) * 
			(select V.porcentaje from TPGDD.Publicaciones P, TPGDD.Visibilidades V 
			where P.codVisibilidad = V.codigo and P.pCodigo = @idPublicacion)
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[getMontoItemPorVentaSubasta]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [TPGDD].[getMontoItemPorVentaSubasta](@idPublicacion numeric(18,0))
RETURNS  numeric(18,2)
AS
BEGIN

	return (select top 1 S.valorActual from TPGDD.Subastas S where S.idPublicacion = @idPublicacion)

END

GO
/****** Object:  UserDefinedFunction [TPGDD].[getPrecioVisibilidad]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  FUNCTION [TPGDD].[getPrecioVisibilidad](@codVisibildad numeric(18,0))
RETURNS  numeric(18,2)
AS
BEGIN
	RETURN  (select V.precio from Visibilidades V where V.codigo = @codVisibildad)
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[getRubro]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create    FUNCTION [TPGDD].[getRubro](@idPublicacion numeric (18,0))
RETURNS  int
AS
BEGIN
	
	RETURN  (select P.codRubro
			 from TPGDD.Publicaciones P
			 where P.pCodigo = @idPublicacion
			 )
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[getTotalCompraInmediata]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [TPGDD].[getTotalCompraInmediata](@cantidad numeric(18,0), @idPublicacion numeric(18,0))
RETURNS  numeric(18,2)
AS
BEGIN
	declare @totalSinEnvio numeric(18,2)
		
	set @totalSinEnvio = TPGDD.getMontoItemPorVentaCompraInmediata(@cantidad, @idPublicacion)
	
	if(TPGDD.getAdmiteEnvio(@idPublicacion) = 1)
	   return @totalSinEnvio + TPGDD.getMontoItemPorEnvio(@idPublicacion)
	
	return @totalSinEnvio
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[getTotalCompraSubasta]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [TPGDD].[getTotalCompraSubasta]( @idPublicacion numeric(18,0))
RETURNS  numeric(18,2)
AS
BEGIN
	declare @totalSinEnvio numeric(18,2)
		
	set @totalSinEnvio = TPGDD.getMontoItemPorVentaSubasta(@idPublicacion)
	
	if(TPGDD.getAdmiteEnvio(@idPublicacion) = 1)
	   return @totalSinEnvio + TPGDD.getMontoItemPorEnvio(@idPublicacion)
	
	return @totalSinEnvio
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[getTrimestre]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--********************************************************
--*****   LISTADO ESTADÍSTICO    *************************
--********************************************************

--****************************************************************
--****** FUNCIONES AUXILIARES  LIST1  ****************************
--****************************************************************
create   FUNCTION [TPGDD].[getTrimestre](@fecha datetime)
RETURNS  int
AS
BEGIN
	return (case 
					when MONTH(@fecha) between 1 And 3	 then 1
					when MONTH(@fecha) between 4 And 6 then 2 
					when MONTH(@fecha) between 7 And 9 then 3
					when MONTH(@fecha) between 10 And 12 then 4
					else 0
					end)
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[intentosDe]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*************************************************************************
-- **** FUNCIONES AUXILIARES LOGIN *****************************
--*************************************************************************
Create function [TPGDD].[intentosDe](@username nvarchar(255))
Returns smallint 
As
Begin
	Declare @intentos int
	Select @intentos = u.intentosFallidos
		from TPGDD.Usuarios as u
		where @username = u.username
	Return @intentos
End

GO
/****** Object:  UserDefinedFunction [TPGDD].[montoFacturado]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec TPGDD.mejoresVendedoresPorCantidadFacturasSP 1, 2016
--go
--***************************************************
--***** FUNCIONES AUXILIARES LIST4  *****************
--***************************************************
create    FUNCTION [TPGDD].[montoFacturado](@idVendedor int, @numeroTrimestre int, @year int)
RETURNS  int
AS
BEGIN
	
	RETURN  (select sum(F.total)
			 from TPGDD.Facturaciones F
			 where F.idUsuario = @idVendedor and
				   year(F.fecha) = @year and 
				   TPGDD.getTrimestre(F.fecha) =  @numeroTrimestre 
			 )
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[stockTotalInicial]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create   FUNCTION [TPGDD].[stockTotalInicial](@idVendedor int, @codigoVisbilidad numeric(18,0), @numeroTrimestre int, @year int)
RETURNS  int
AS
BEGIN
	return (select sum(P.pStock)
	from TPGDD.getPublicacionesFiltradas(@idVendedor,@codigoVisbilidad,@numeroTrimestre,@year) P)
	
END

GO
/****** Object:  View [TPGDD].[VW_USUARIOS_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------

CREATE VIEW [TPGDD].[VW_USUARIOS_OK]
AS 
SELECT  U.password, U.bajaLogica,U.flagHabilitado, u.idUsuario as id,  username as usuario,
 nombre as nombre_razon, apellido as apellido_rubro, clientes.tipoDocumento + ' '
  + cast(nroDNI as varchar) as dni_cuit, reputacion, fechaCreacion, mail as Email, tipoUsuario 
  FROM TPGDD.Usuarios u inner join TPGDD.clientes on u.idUsuario = clientes.idUsuario 

union

SELECT  U.password, U.bajaLogica,U.flagHabilitado,  u.idUsuario, username, razonSocial,
 nombreRubro, cuit, reputacion ,fechaCreacion, mail as Email, tipoUsuario  
 FROM TPGDD.Usuarios u inner join TPGDD.Empresas on u.idUsuario = Empresas.idUsuario 



GO
/****** Object:  View [TPGDD].[VW_VENDEDORES_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [TPGDD].[VW_VENDEDORES_OK]
AS 
SELECT distinct VW.id, VW.usuario AS vendedor, VW.reputacion, VW.fechaCreacion, VW.Email 
FROM TPGDD.Publicaciones P INNER JOIN TPGDD.VW_USUARIOS_OK VW ON P.idUsuario = VW.id  


GO
/****** Object:  View [TPGDD].[VW_PUBLICACIONES_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------


CREATE VIEW [TPGDD].[VW_PUBLICACIONES_OK]
AS 
SELECT P.pCodigo as id, P.pDescripcion descripcion ,P.pPrecio as precio, P.codVisibilidad AS idVisibilidad, V.prioridad , V.descripcion as visibilidad, P.codRubro as idRubro, R.descripcionCorta as rubro, P.idEstado ,E.descripcion as estado, P.pStock as stock, p.idUsuario, u.username as vendedor,  p.pFecha as fecha, p.pFecha_Venc as finalizacion, p.pEnvio as envio, p.pPreguntar as preguntas,u.reputacion 
 FROM TPGDD.Publicaciones P 
 left join TPGDD.Visibilidades V on P.codVisibilidad =v.Codigo  
 left join TPGDD.Rubros R on P.codRubro =R.codRubro  
 left join TPGDD.Estados E on P.idEstado = E.idEstado  
 left join TPGDD.usuarios u on P.idUsuario =u.idUsuario 


GO
/****** Object:  View [TPGDD].[vw_publicaciones_tipo_ok]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


----------------------------------------------------

CREATE view [TPGDD].[vw_publicaciones_tipo_ok]
as 

SELECT [id]
      ,[descripcion]
      ,[precio]
      ,[idVisibilidad]
      ,[prioridad]
      ,[visibilidad]
      ,[idRubro]
      ,[rubro]
      ,[idEstado]
      ,[estado]
      ,[stockDisponible] as stock
      ,[idUsuario]
      ,[vendedor]
      ,[fecha]
      ,[finalizacion]
      ,[envio]
      ,[preguntas]
      ,[reputacion], 'compra inmediata' as tipo
  FROM TPGDD.VW_PUBLICACIONES_OK vw
 inner join TPGDD.ComprasInmediatas ci on vw.id = ci.idPublicacion 

union

SELECT [id]
      ,[descripcion]
      ,[precio]
      ,[idVisibilidad]
      ,[prioridad]
      ,[visibilidad]
      ,[idRubro]
      ,[rubro]
      ,[idEstado]
      ,[estado]
      ,[stock]
      ,[idUsuario]
      ,[vendedor]
      ,[fecha]
      ,[finalizacion]
      ,[envio]
      ,[preguntas]
      ,[reputacion], 'subasta'
  FROM TPGDD.VW_PUBLICACIONES_OK vw inner join TPGDD.Subastas su  on vw.id = su.idPublicacion 
  



GO
/****** Object:  UserDefinedFunction [TPGDD].[getPublicacionesFiltradas]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  FUNCTION [TPGDD].[getPublicacionesFiltradas] (@idVendedor int, @codigoVisbilidad numeric(18,0), @numeroTrimestre int, @year int)  
RETURNS TABLE  
AS  
RETURN   
(  
    SELECT *
	from TPGDD.Publicaciones P
	where P.idUsuario = @idVendedor 
		  and P.codVisibilidad = @codigoVisbilidad 
	      and year(P.pFecha_Venc) = @year
		  and TPGDD.getTrimestre(P.pFecha_Venc) = @numeroTrimestre
);  

GO
/****** Object:  View [TPGDD].[VW_CALIFICACIONES_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------

CREATE VIEW [TPGDD].[VW_CALIFICACIONES_OK]
AS 

SELECT  codigoCalificacion idCalificacion, co.idCliente, cantEstrellas calificacion, observacion ,CO.idCompra, CO.idPublicacion,
	  fecha ,cantidad ,tipoPublicacion as operacion, idVendedor, USERNAME as vendedor, reputacion ,pDescripcion as detalleCompra ,
	   (select idUsuario from TPGDD.Clientes where idCliente =co.idCliente) as idUsuarioCliente
  FROM TPGDD.COMPRAS CO 
  INNER JOIN TPGDD.PUBLICACIONES P ON P.pCodigo= CO.idPublicacion 
  INNER JOIN TPGDD.USUARIOS U ON CO.idVendedor=U.idUsuario
  LEFT JOIN TPGDD.Calificaciones CA ON CO.idCompra=CA.idCompra


GO
/****** Object:  View [TPGDD].[VW_CALIFICACIONES_PENDIENTE_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [TPGDD].[VW_CALIFICACIONES_PENDIENTE_OK]
AS 

SELECT CO.idCompra, P.pDescripcion as detalleCompra, CO.calificada,
	  CO.fecha ,CO.cantidad ,CO.tipoPublicacion as operacion, (SELECT USERNAME FROM TPGDD.Usuarios US WHERE US.idUsuario = CO.idVendedor) as VENDEDOR ,
	  CI.idUsuario 

  FROM TPGDD.COMPRAS CO 
  INNER JOIN TPGDD.PUBLICACIONES P ON P.pCodigo= CO.idPublicacion 
  INNER JOIN TPGDD.Clientes CI ON CO.idCliente =CI.idCliente
GO
/****** Object:  View [TPGDD].[VW_CALIFICACIONES_REALIZADAS_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE VIEW [TPGDD].[VW_CALIFICACIONES_REALIZADAS_OK]
AS 

SELECT CO.idCompra, pDescripcion as detalleCompra, cantidad,  fecha,
	 tipoPublicacion as operacion, (SELECT USERNAME FROM TPGDD.Usuarios US WHERE US.idUsuario = CO.idVendedor) as VENDEDOR,
	  cantEstrellas calificacion, observacion ,
	   CI.idUsuario , codigoCalificacion
	  
  FROM TPGDD.COMPRAS CO 
  INNER JOIN TPGDD.PUBLICACIONES P ON P.pCodigo= CO.idPublicacion 
  INNER JOIN TPGDD.Clientes CI ON CO.idCliente =CI.idCliente
  INNER JOIN TPGDD.Calificaciones CA ON CO.idCompra=CA.idCompra


GO
/****** Object:  View [TPGDD].[VW_CLIENTES_EMPRESAS_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------

CREATE VIEW [TPGDD].[VW_CLIENTES_EMPRESAS_OK]
AS 

SELECT U.[idUsuario]
      ,[username]
      ,[flagHabilitado]
      ,[tipoUsuario]
      ,[mail]
      ,[telefono]
      ,[nroPiso]
      ,[nroDpto]
      ,[fechaCreacion]
      ,[nroCalle]
      ,[domCalle]
      ,[codPostal]
      ,[bajaLogica]
	  ,[idCliente]
      ,[nombre]
      ,[apellido]
      ,[fechaNacimiento]
      ,[nroDNI]
      ,[tipoDocumento]
	  ,[idEmpresa]
      ,[razonSocial]
      ,[cuit]
      ,[nombreContacto]
      ,[nombreRubro]
      ,[ciudad]
	  ,[descripcion]

  FROM [TPGDD].[Usuarios] U 
  LEFT JOIN  TPGDD.[Clientes] C ON U.idUsuario =C.idUsuario 
  LEFT JOIN TPGDD.[Empresas] E ON U.idUsuario = E.idUsuario
   LEFT JOIN TPGDD.[Localidades] L ON U.codLocalidad = L.codLocalidad 


GO
/****** Object:  View [TPGDD].[VW_ESTADOS_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------

CREATE VIEW [TPGDD].[VW_ESTADOS_OK]
AS 
SELECT idEstado as id,descripcion 
from TPGDD.Estados where descripcion not like 'Publicada' 


GO
/****** Object:  View [TPGDD].[VW_FACTURAS_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------

CREATE VIEW [TPGDD].[VW_FACTURAS_OK]
AS 
SELECT F.nroFactura, F.idUsuario, U.username AS usuario, FP.descripcion modoPago, F.total,
F.fecha, I.nombre concepto, cantidad, montoItem, idPublicacion, pDescripcion as publicacion , UR.idRol 

FROM TPGDD.facturaciones F 
inner join TPGDD.items I on F.nroFactura=I.nroFactura 
inner join TPGDD.formasPago FP on F.idFormaPago=FP.idFormaPago 
inner join TPGDD.usuarios U on F.idUsuario=U.idUsuario 
inner join TPGDD.publicaciones P on p.pCodigo=I.idPublicacion 
INNER JOIN TPGDD.UsuariosRoles UR ON UR.idUsuario = U.idUsuario  

GO
/****** Object:  View [TPGDD].[VW_FACTURAS_ROL_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [TPGDD].[VW_FACTURAS_ROL_OK]
AS 
SELECT F.nroFactura, F.idUsuario , U.username AS usuario , FP.descripcion modoPago, F.total ,
F.fecha, UR.idRol 
FROM TPGDD.facturaciones F 
inner join TPGDD.formasPago FP on F.idFormaPago=FP.idFormaPago 
inner join TPGDD.usuarios U on F.idUsuario=U.idUsuario 
inner join TPGDD.UsuariosRoles UR ON UR.idUsuario = U.idUsuario  


GO
/****** Object:  View [TPGDD].[VW_FUNCIONALIDADES_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------

CREATE VIEW [TPGDD].[VW_FUNCIONALIDADES_OK]
AS 
select nombre, idFuncionalidad as id from TPGDD.funcionalidades


GO
/****** Object:  View [TPGDD].[VW_HISTORIAL_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------------------------------------

CREATE VIEW [TPGDD].[VW_HISTORIAL_OK]
AS
SELECT  U.idUsuario, p.pCodigo as id, P.pDescripcion as descripcion, CO.cantidad as cantidad, CO.tipoPublicacion as operacion, 
CO.fecha as fecha, CA.cantEstrellas as estrellas, CO.idCliente, U.username as cliente     
FROM TPGDD.Publicaciones p 
INNER JOIN TPGDD.Compras CO ON p.pCodigo = CO.idPublicacion 
INNER JOIN TPGDD.Usuarios U ON U.idUsuario = CO.idVendedor  
LEFT JOIN TPGDD.Calificaciones CA ON  CO.idCompra =CA.idCompra 


GO
/****** Object:  View [TPGDD].[VW_LOCALIDADES_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----------------------------------------------------

CREATE VIEW [TPGDD].[VW_LOCALIDADES_OK]
AS 
select codLocalidad as id, descripcion from TPGDD.Localidades


GO
/****** Object:  View [TPGDD].[VW_LOGIN_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-----------------------------------------------

CREATE VIEW [TPGDD].[VW_LOGIN_OK]
AS 
SELECT UR.idRol , u.idUsuario, U.username , U.password, U.tipoUsuario ,U.intentosFallidos , U.bajaLogica, U.flagHabilitado 
FROM TPGDD.Usuarios u left join TPGDD.UsuariosRoles UR on u.idUsuario = UR.idUsuario 



GO
/****** Object:  View [TPGDD].[VW_MEDIOS_PAGO_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-------------------------------------------------

CREATE VIEW [TPGDD].[VW_MEDIOS_PAGO_OK]
AS 
SELECT idFormaPago as id, descripcion  as nombre from TPGDD.FormasPago


GO
/****** Object:  View [TPGDD].[VW_RESUMEN_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------

CREATE VIEW [TPGDD].[VW_RESUMEN_OK]
AS 
SELECT ([TPGDD].[FX_RESUMEN_OK] (1, idCliente, tipoPublicacion )) AS ESTRELLAS1 ,
([TPGDD].[FX_RESUMEN_OK] (2, idCliente, tipoPublicacion )) AS ESTRELLAS2 ,
([TPGDD].[FX_RESUMEN_OK] (3, idCliente, tipoPublicacion )) AS ESTRELLAS3 ,
([TPGDD].[FX_RESUMEN_OK] (4, idCliente, tipoPublicacion )) AS ESTRELLAS4 ,
([TPGDD].[FX_RESUMEN_OK] (5, idCliente, tipoPublicacion )) AS ESTRELLAS5 ,
tipoPublicacion , idCliente , [TPGDD].[FX_COMPRAS_OK](idCliente,calificada , tipoPublicacion )  AS COMPRA
FROM  TPGDD.Compras


GO
/****** Object:  View [TPGDD].[VW_ROLES_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------

CREATE VIEW [TPGDD].[VW_ROLES_OK]
AS 
select R.idRol, R.nombre as rol, habilitado, F.idFuncionalidad, F.nombre  as funcionalidad 
from TPGDD.Roles R 
left join TPGDD.RolesFuncionalidades RF on R.idRol =RF.idRol   
left join TPGDD.Funcionalidades F on RF.idFuncionalidad =F.idFuncionalidad 


GO
/****** Object:  View [TPGDD].[VW_RUBROS_EMPRESAS_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------

CREATE VIEW [TPGDD].[VW_RUBROS_EMPRESAS_OK]
AS 
select DISTINCT nombreRubro as descripcion from TPGDD.Empresas 


GO
/****** Object:  View [TPGDD].[VW_RUBROS_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------

CREATE VIEW [TPGDD].[VW_RUBROS_OK]
AS 
SELECT codRubro AS id, descripcionCorta as nombre  FROM TPGDD.Rubros


GO
/****** Object:  View [TPGDD].[VW_VISIBILIDADES_OK]    Script Date: 02/07/2016 16:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--*************************************************************************
--**** VISTAS DE DATOS SENSIBLES DE TABLAS                   *************
--*************************************************************************

-----------------------------------------------------------

CREATE VIEW [TPGDD].[VW_VISIBILIDADES_OK]
AS 
SELECT codigo as id, descripcion, precio, porcentaje as costoVenta, envio as costoEnvio, prioridad, admiteEnvio  
from TPGDD.Visibilidades 


GO
