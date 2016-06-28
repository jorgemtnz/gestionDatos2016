--************************************************************************************************************
--0 . test para trigger: 0.actualizar que una compra ha sido calificada, cuando se ingresa una calificaciòn**
--************************************************************************************************************
create  PROCEDURE TPGDD.testVerificarCambioEstadoCompraAlSerCalificada
AS 
BEGIN
Begin transaction 

	--precondiciones
		--Borro la calificacion de la compra id = 1035
		delete from TPGDD.Calificaciones where idCompra = 1035
		--Actualizo el campo calificada = 0 en compras para idCompra = 1035
		update TPGDD.Compras set calificada = 0 where idCompra = 1035	
	
	--ejecucion
		--Inserto la calificacion 
		insert into TPGDD.Calificaciones (idCompra, cantEstrellas) values (1035, 5)	
		
	--asercion estado idCompra = 1035 debe ser 1
		if (select C.calificada  from TPGDD.Compras C where C.idCompra = 1035) <> 1
			RAISERROR ('ERROR TEST: testVerificarCambioEstadoCompraAlSerCalificada. EL ESTADO DE LA COMPRA 1035 DEBIO HABER SIDO 1',15,1)
		else
			PRINT('OK TEST: testVerificarCambioEstadoCompraAlSerCalificada')			
rollback --restauro el estado anterior
END
go






--************************************************************************************************************
--1 . test para trigger: 1.update reputacion de vendedor, reputacion = cantidadEstrellas/comprasConcretadas
--vendedor 87
--cantidadEstrellas = 4221
--compras concretadas =	1373
--select sum(C1.cantEstrellas) from TPGDD.Calificaciones C1 , TPGDD.Compras C2 where C1.idCompra = C2.idCompra and C2.idVendedor = 87
--select * from TPGDD.Compras C where C.idCompra = 1035
--select count(*) from TPGDD.Compras C where C.idVendedor = 87
--************************************************************************************************************
create  PROCEDURE TPGDD.testActualizarReputacionVendedorAlCalificarUnaCompra
AS 
BEGIN
Begin transaction 
	 declare @idVendedor int 
	 set @idVendedor = (select C.idVendedor from TPGDD.Compras C where C.idCompra = 1035)
	--precondiciones
		--Borro la calificacion de la compra id = 1035
		delete from TPGDD.Calificaciones where idCompra = 1035
		--Actualizo el campo calificada = 0 en compras para idCompra = 1035
		update TPGDD.Compras set calificada = 0 where idCompra = 1035	
	
	--ejecucion
		--Inserto la calificacion 
		insert into TPGDD.Calificaciones (idCompra, cantEstrellas) values (1035, 5)	
		
	--asercion reputacion = 4226/	1373 = 3
		if (select U.reputacion from TPGDD.Usuarios U where U.idUsuario = @idVendedor) <> 3
			RAISERROR ('ERROR TEST: testActualizarReputacionVendedorAlCalificarUnaCompra. LA REPUTACION DEL VENDEDOR 86 DEBERIA HABER SIDO 3',15,1)
		else
			PRINT('OK TEST: testActualizarReputacionVendedorAlCalificarUnaCompra')			
rollback --restauro el estado anterior
END
go



--************************************************************************************************************
--2 . test para trigger: 2.update stock disponible cuando se inserta una compra para compra inmediata, 
--se compra 1 unidad de la publicacion(compra inmeidata) 12354 con stock actual 0
--************************************************************************************************************
--Pubilcacion = 12354 tiene un stock de 1 y una compra realizada => stockDisponible 0
create  PROCEDURE TPGDD.testActualizarStockDisponibleAlInsertarCompraTipoCompraInmediata
AS 
BEGIN
Begin transaction 

	--precondiciones							  
		--Solo Cambiar el stock disponible de la publicacion = 12354 a 2
		update TPGDD.ComprasInmediatas set stockDisponible = 2 where idPublicacion = 12354	
		--select * from 	TPGDD.ComprasInmediatas C where C.idPublicacion = 12354	 									 
	--ejecucion
		--Se compra una unidad de la publicacion 12354
		insert into TPGDD.Compras(idPublicacion, cantidad, calificada, tipoPublicacion) values (12354, 1, 0, 'Compra Inmediata')	

		
	--asercion stock disponible para publicacion 12354 deberia ser: 2 - 1 = 1 
		if (TPGDD.getStockComprasInmediatas(12354) ) <> 1
			RAISERROR ('ERROR TEST: testActualizarStockDisponibleAlInsertarCompraTipoCompraInmediata. Stock disponible para publicacion 12354 DEBERIA HABER SIDO 1',15,1)
		else
			PRINT('OK TEST: testActualizarStockDisponibleAlInsertarCompraTipoCompraInmediata')			
rollback --restauro el estado anterior
END
go




--************************************************************************************************************
--3 . test para trigger: 3.actualizar el valorActual de una subasta cuando se realiza una oferta en ofertas.
-- idSubasta =  1 , valor actual =75
-- Al realizar una oferta monto = 100
-- idSubasta = 1, valor actual =  100
-- select * from TPGDD.Subastas
-- idPublicacion = 66955, asociada a la subasta
-- idCliente = 1, porque no admite nulos
--************************************************************************************************************
create  PROCEDURE TPGDD.testActualizarValorActualSubastaAlInsertarUnaOferta
AS 
BEGIN
Begin transaction 

	--precondiciones
		--Solo Cambiar el estado de la publicacion asociada(66955)  a la subasta a activa (2) porque esta finalizada
		update TPGDD.Publicaciones set idEstado = 2 where pCodigo = 66955
		
	--ejecucion
		--Realizar una oferta para la subasta asociada a la publicacion 66955
		declare @idSubasta int
		set @idSubasta = (select S.idSubasta from TPGDD.Subastas S where idPublicacion = 66955 )
		insert into TPGDD.Ofertas(idSubasta, monto, idCliente) values (@idSubasta,200, 1)	
		
	--asercion monto de la subasta deberia ser 200$
		if (select S.valorActual from TPGDD.Subastas S where S.idSubasta = @idSubasta) <> 200
			RAISERROR ('ERROR TEST: testActualizarValorActualSubastaAlInsertarUnaOferta. El valor actual de la subasta de la publicacion 66955 DEBERIA HABER SIDO 100',15,1)
		else
			PRINT('OK TEST: testActualizarValorActualSubastaAlInsertarUnaOferta')			
rollback --restauro el estado anterior
END
go


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


--************************************************************************************************************
--5 . test para trigger: 5.cuando una pubicacion se pone de borrador a  activa armar la factura de la publicacion y generar el item
--vendedor 87
--publicacion 12353
--cantidad facturaciones  815
--cantidad de items	2023
--select count(*) from TPGDD.Facturaciones F where F.idUsuario = 87
--select count(*)	from TPGDD.Facturaciones F, TPGDD.Items I where I.nroFactura = F.nroFactura and F.idUsuario=87
--select * from TPGDD.Publicaciones P where pCodigo = 12353
--************************************************************************************************************
create  PROCEDURE TPGDD.testGenerarFacturacionCuandoPublicacionPasaDeBorradorAActiva
AS 
BEGIN
Begin transaction 
	 declare @idVendedor int 
	 set @idVendedor = (select P.idUsuario from TPGDD.Publicaciones P where pCodigo = 12353)
	--precondiciones
		--Cambio el estado de la publicacion 12353 a borrador (1) porque todas las publicaciones se encuentran finalizadas
		--No es necesario eliminar la facturacion y el item por publicar porque no existia en el sistema anterior
		update TPGDD.Publicaciones set idEstado = 1	where pCodigo = 12353
		
	--ejecucion
		--Cambio el estado de la publicacion 12353 a activa
		update TPGDD.Publicaciones set idEstado = 2 where pCodigo = 12353
		
	--asercion verificar que la cantidad de facturaciones sea = 815 +1 = 816 e items = 2023 + 1 = 2024
		if (select count(*) from TPGDD.Facturaciones F	where f.idUsuario = @idVendedor) <> 816 or
		   (select count(*) from TPGDD.Facturaciones F, TPGDD.Items I where f.idUsuario = @idVendedor and I.nroFactura = F.nroFactura) <> 2024  
			RAISERROR ('ERROR TEST: testGenerarFacturacionCuandoPublicacionPasaDeBorradorAActiva. EL VENDEDOR 86 DEBERIA TENER 816 FACTURACIONES Y 2024 ITEMS',15,1)
		else
			PRINT('OK TEST: testGenerarFacturacionCuandoPublicacionPasaDeBorradorAActiva')			
rollback --restauro el estado anterior
END
go



--************************************************************************************************************
--6 . test para trigger: 6.cuando genero una compra generar el item y agregarselo a la factura PARA COMPRAS INMEDIATAS
--Pubilcacion = 12354 tiene un stock de 1 y una compra realizada => stockDisponible 0
--La publicacion admite envio => se generar 2 items para la factura que genera el trigger
--idVendedor = 87 
--cantFacturaciones=815
--cantItems= 2023
--select * from TPGDD.Publicaciones P where P.pCodigo = 12354
--select count(*) from TPGDD.Facturaciones F where F.idUsuario = 87
--select count(*)	from TPGDD.Facturaciones F, TPGDD.Items I where I.nroFactura = F.nroFactura and F.idUsuario=87
--************************************************************************************************************
create  PROCEDURE TPGDD.testGenerarFacturacionPorCompraInmediataConEnvio
AS 
BEGIN
Begin transaction 
	 declare @idVendedor int 
	 set @idVendedor = (select P.idUsuario from TPGDD.Publicaciones P where pCodigo = 12354)
	--precondiciones
		--Cambio el estado de la publicacion 12354 a activa (2) porque todas las publicaciones se encuentran finalizadas
		--Modifico el stock disponible para la publicacion a 2 para poder comprar una unidad
		update TPGDD.Publicaciones set idEstado = 2	where pCodigo = 12354
		update TPGDD.ComprasInmediatas set stockDisponible = 2 where idPublicacion = 12354	
	--ejecucion
		--Se compra una unidad de la publicacion 12354
		insert into TPGDD.Compras(idPublicacion, cantidad, calificada, tipoPublicacion, idVendedor) values (12354, 1, 0, 'Compra Inmediata', @idVendedor)	
	
	--asercion verificar cantidad de facturas = 815 + 1 = 816 y cantidad de items = 2023 + 2 = 2025
		if (select count(*) from TPGDD.Facturaciones F	where f.idUsuario = @idVendedor) <> 816 or
		   (select count(*) from TPGDD.Facturaciones F, TPGDD.Items I where f.idUsuario = @idVendedor and I.nroFactura = F.nroFactura) <> 2025
			begin
			RAISERROR ('ERROR TEST: testGenerarFacturacionPorCompraInmediataConEnvio.EL VENDEDOR 86 DEBERIA TENER 816 FACTURACIONES Y 2025 ITEMS',15,1)
			end
		else
			PRINT('OK TEST: testGenerarFacturacionPorCompraInmediataConEnvio')			
rollback --restauro el estado anterior
END
go



--************************************************************************************************************
--7 . test para trigger: 6.cuando genero una compra generar el item y agregarselo a la factura PARA SUBASTAS
-- idVendedor = 54
-- cantidad facturaciones  = 848
-- cantidad de items facturador =  2158
-- idSubasta = 1
-- idPublicacion = 66955, asociada a la subasta
-- idCliente = 1, porque no admite nulos
--select * from TPGDD.Subastas P where P.idPublicacion = 66955
--select * from TPGDD.Publicaciones where pCodigo = 66955  
--select count(*) from TPGDD.Facturaciones F where F.idUsuario = 54
--select count(*)	from TPGDD.Facturaciones F, TPGDD.Items I where I.nroFactura = F.nroFactura and F.idUsuario=54
--select * from TPGDD.Ofertas where idSubasta = 1
--************************************************************************************************************

create  PROCEDURE TPGDD.testGenerarFacturacionPorSubastaConEnvio
AS 
BEGIN
Begin transaction 
	 declare @idVendedor int 
	 set @idVendedor = (select P.idUsuario from TPGDD.Publicaciones P where pCodigo = 66955)
	--precondiciones
		--Cambio el estado de la publicacion subasta 66955 a activa (2) porque todas las publicaciones se encuentran finalizadas
		update TPGDD.Publicaciones set idEstado = 2	where pCodigo = 66955
		
	--ejecucion
		--Para las subastas se genera la facturacion al pasar la subasta al estado finalizado (tambien se ejecuta trigger 11: generaCompdeSubastaTrigger)
		update TPGDD.Publicaciones set idEstado = 4	 where 	pCodigo = 66955
	
	--asercion verificar cantidad de facturas 
		if (select count(*) from TPGDD.Facturaciones F	where f.idUsuario = @idVendedor) <> 849 or
		   (select count(*) from TPGDD.Facturaciones F, TPGDD.Items I where f.idUsuario = @idVendedor and I.nroFactura = F.nroFactura) <> 2160
			begin
			RAISERROR ('ERROR TEST: testGenerarFacturacionPorSubastaConEnvio.EL VENDEDOR 54 DEBERIA TENER 851 FACTURACIONES Y 2162 ITEMS',15,1)
			end
		else
			PRINT('OK TEST: testGenerarFacturacionPorSubastaConEnvio')			
rollback --restauro el estado anterior
END
go


--************************************************************************************************************
--8 . test para trigger: 7.PARA EVITAR QUE UN CLIENTE COMPRE CUANDO TIENE PENDIENTE MAS DE 3 CALIFICACIONES
--idCliente = 13
--cantCompras = 3394
--Todas las compras calificadas
--select count(*) cantCompras, idCliente from TPGDD.Compras where calificada = 1 group by idCliente  order by 1 asc
--select * from TPGDD.Compras
--select * from TPGDD.Calificaciones where calificador = 13--dos calificaciones de mas
--************************************************************************************************************

create  PROCEDURE TPGDD.testEvitarClienteCompreAlTenerMasDe3ComprasSinCalificar
AS 
BEGIN
Begin transaction 
	 declare @cliente int
	 set @cliente = 13
	--precondiciones
		--Elimino todas las calificaciones de las compras del cliente 13 (total 3394)
		delete from TPGDD.Calificaciones where calificador = @cliente
	
	--ejecucion
		Begin try
			--Inserto la compra 
			insert into TPGDD.Compras(idCliente) values (@cliente)
		End try
	--asercion expected = raiseerror
		Begin catch
			declare @msg nvarchar(255)
			set @msg = (SELECT  ERROR_MESSAGE() ) 
			PRINT('OK TEST: testEvitarClienteCompreAlTenerMasDe3ComprasSinCalificar' + @msg )			
			Rollback
			return
		End catch
		
		rollback --restauro el estado anterior
		RAISERROR ('ERROR TEST: testEvitarClienteCompreAlTenerMasDe3ComprasSinCalificar. EL CLIENTE 13 NO DEBERIA HABER PODIDO COMPRAR, DEBERIA TENER MAS DE 3 COMPRAS SIN CALIFICAR',15,1)		
END
go



--************************************************************************************************************
--9 . test para trigger: 8.PARA EVITAR QUE UN CLIENTE OFERTE CUANDO TIENE PENDIENTE MAS DE 3 COMPRAS SIN CALIFICAR
--idCliente = 13
--cantCompras = 3394
--Todas las compras calificadas
--select count(*) cantCompras, idCliente from TPGDD.Compras where calificada = 1 group by idCliente  order by 1 asc
--select * from TPGDD.Compras
--select * from TPGDD.Calificaciones where calificador = 13--dos calificaciones de mas
--************************************************************************************************************

create PROCEDURE TPGDD.testEvitarClienteOferteAlTenerMasDe3ComprasSinCalificar
AS 
BEGIN
Begin transaction 
	 declare @cliente int
	 set @cliente = 13
	--precondiciones
		--Elimino todas las calificaciones de las compras del cliente 13 (total 3394)
		delete from TPGDD.Calificaciones where calificador = @cliente
	
	--ejecucion
		Begin try
			--Inserto oferta
			insert into TPGDD.Ofertas(idCliente) values (@cliente)
		End try
	--asercion expected = raiseerror
		Begin catch
			declare @msg nvarchar(255)
			set @msg = (SELECT  ERROR_MESSAGE() ) 
			PRINT('OK TEST: testEvitarClienteOferteAlTenerMasDe3ComprasSinCalificar' + @msg )			
			Rollback
			return
		End catch
		
		rollback --restauro el estado anterior
		RAISERROR ('ERROR TEST: testEvitarClienteOferteAlTenerMasDe3ComprasSinCalificar. EL CLIENTE 13 NO DEBERIA HABER PODIDO OFERTAR, DEBERIA TENER MAS DE 3 COMPRAS SIN CALIFICAR',15,1)		
END
go

--************************************************************************************************************
--10 . test para trigger:TRIGGER 9 USUARIO CON BAJAlOGICA SE PAUSAN SUS PUBLICACIONES  ******
--idVendedor = 40
--Vendedor Sin baja logica = ok
--Cantidad publicaciones   = 840
--select * from TPGDD.Empresas
--select * from TPGDD.Usuarios where idUsuario = 40
--select count(*) from TPGDD.Publicaciones P where idUsuario = 40
go
--************************************************************************************************************
create  PROCEDURE TPGDD.testPausarPublicacionesParaVendedorDadoDeBajaLogica
AS 
BEGIN
Begin transaction 
	 declare @idVendedor int
	 set @idVendedor = 40
	--precondiciones
	
	--ejecucion
		--Doy de baja logica al vendedor 40
		update TPGDD.Usuarios set bajaLogica = 1 where idUsuario = @idVendedor
																		  
	--asercion el vendedor 40 deberia tener 840 publicaciones pausadas
		if (select count(*) from TPGDD.Publicaciones P where P.idUsuario = @idVendedor and P.idEstado = 3) <> 840
			begin
			rollback
			RAISERROR ('ERROR TEST: testPausarPublicacionesParaVendedorDadoDeBajaLogica. El vendedor 40 deberia tener 840 publicaciones pausadas',15,1)
			end
		else
			PRINT('OK TEST: testPausarPublicacionesParaVendedorDadoDeBajaLogica')			
rollback --restauro el estado anterior
END
go

--************************************************************************************************************
--11 . test para trigger:TRIGGER 10 USUARIO CON BAJAlOGICA SE ACTIVAN SUS PUBLICACIONES  *****
--idVendedor = 40
--Vendedor con baja logica = no => se debe dar de baja antes
--Cantidad publicaciones   = 840
--select * from TPGDD.Empresas
--select * from TPGDD.Usuarios where idUsuario = 40
--select count(*) from TPGDD.Publicaciones P where idUsuario = 40
go
--************************************************************************************************************
create  PROCEDURE TPGDD.testActivarPublicacionesParaVendedorAlDesactivarSuBajaLogica
AS 
BEGIN
Begin transaction 
	 declare @idVendedor int
	 set @idVendedor = 40
	--precondiciones
		--Doy de baja logica al vendedor 40	=> se pausan las publicaciones por otro trigger
		update TPGDD.Usuarios set bajaLogica = 1 where idUsuario = @idVendedor
	--ejecucion
		--desactivar la baja logica
		update TPGDD.Usuarios set bajaLogica = 0 where idUsuario = @idVendedor
																		  
	--asercion el vendedor 40 deberia tener 840 publicaciones activas
		if (select count(*) from TPGDD.Publicaciones P where P.idUsuario = @idVendedor and P.idEstado = 2) <> 840
			begin
			rollback
			RAISERROR ('ERROR TEST: testActivarPublicacionesParaVendedorAlDesactivarSuBajaLogica. El vendedor 40 deberia tener 840 publicaciones activas',15,1)
			end
		else
			PRINT('OK TEST: testActivarPublicacionesParaVendedorAlDesactivarSuBajaLogica')			
rollback --restauro el estado anterior
END
go


--*************************************************************************
-- *** ejecucion de tests  ***
--*************************************************************************
exec TPGDD.testVerificarCambioEstadoCompraAlSerCalificada 
go
exec TPGDD.testActualizarReputacionVendedorAlCalificarUnaCompra 
go
exec TPGDD.testActualizarStockDisponibleAlInsertarCompraTipoCompraInmediata 
go
exec TPGDD.testActualizarValorActualSubastaAlInsertarUnaOferta 
go
exec TPGDD.testEliminarLosUsuariosRolesAlDeshabilidarUnRolQueEstaHabilitado 
go
exec TPGDD.testGenerarFacturacionCuandoPublicacionPasaDeBorradorAActiva 
go
exec TPGDD.testGenerarFacturacionPorCompraInmediataConEnvio 
go
exec TPGDD.testGenerarFacturacionPorSubastaConEnvio 
go
exec TPGDD.testEvitarClienteCompreAlTenerMasDe3ComprasSinCalificar 
go
exec TPGDD.testEvitarClienteOferteAlTenerMasDe3ComprasSinCalificar 
go
exec TPGDD.testPausarPublicacionesParaVendedorDadoDeBajaLogica
go
exec TPGDD.testActivarPublicacionesParaVendedorAlDesactivarSuBajaLogica 
go


