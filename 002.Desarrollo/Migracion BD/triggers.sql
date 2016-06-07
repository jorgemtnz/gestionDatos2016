------------------------------------------------------------------------------------------------
--TRIGGERS
------------------------------------------------------------------------------------------------
--1. Para actualizar la reputación del vendedor cuando se inserta una calificacion en calificaciones.



alter trigger updateReputacionVenderorTrigger
on  Calificaciones
after insert
as
   update Usuarios set reputacion =  (select avg(C2.cantEstrellas)
                                     from 
										getComprasVendedor((select I.idCompra from inserted I)) C1, 
										Calificaciones C2 
									 where C1.idCompra = C2.idCompra)
  where Usuarios.idUsuario = dbo.getIdVendedor((select I.idCompra from inserted I))
go

---FUNCIONES AYUDADORAS
alter FUNCTION getIdVendedor(@idCompra int)
RETURNS  int
AS
BEGIN
	RETURN  (select top 1 T.idVendedor from Compras T where T.idCompra = @idCompra)
END
go
 
alter FUNCTION getComprasVendedor(@idCompra int)
RETURNS  @rtnTable TABLE 
(
	idCompra int NOT NULL,
	idPublicacion numeric(18) NULL,
	idCliente int NULL,
	fecha datetime NULL,
	cantidad numeric(18) NULL,
	compraTipo  nvarchar(255) NULL, --subasta o compraInmediata
	calificada bit DEFAULT 0 NULL, --0 no calificada
	idVendedor int NULL,
	tipoPublicacion nvarchar(255) NULL
)
AS
BEGIN
    insert into @rtnTable 
	select * from Compras C where C.idVendedor = dbo.getIdVendedor(@idCompra)
	RETURN 
END
go

--2. para actualizar el stock disponible en comras inmediatas cuando se inserta una compra en compras.
alter trigger updateStockPublicacionTrigger
on Compras
after insert
as
   update Publicaciones set pStock = (select P.pStock - I.cantidad 
									from Publicaciones P, inserted I 
									where P.pCodigo = I.idPublicacion)
	where Publicaciones.pCodigo = (select I.idPublicacion from inserted I)
go


--3. para actualizar el valorActual de una subasta cuando se realiza una oferta en ofertas.
alter trigger updateValorActualSubastaTrigger
on Ofertas
after insert
as
   update Subastas set valorActual = (select I.monto from inserted I)
   where Subastas.idSubasta = (select I.idSubasta from inserted I)
go

--4. para eliminar los usuariosRoles cuando en roles cambio el habilitado.
alter trigger deleteUsuariosRolesTrigger
on Roles
after update
as
   if((select I.habilitado from inserted I) = 0)
		delete from UsuariosRoles where UsuariosRoles.idRol = (select I.idRol from inserted I)
go

/*
select * from Publicaciones
update Publicaciones set idEstado = 2 where pCodigo = 1 
select * from Facturaciones	where codPublicacion = 1
select * from Items where nroFactura = 2
select * from Compras
*/

--5. cuando una pubicacion se pone activa armar la factura de la publicacion y generar el item
alter trigger generarFacturacionPorPublicar
on Publicaciones
after update
as
   if((select D.idEstado from deleted D) = 1 and (select I.idEstado from inserted I) = 2 )
   begin
	insert into Facturaciones (idUsuario, fecha, total)
	values ((select I.idUsuario from inserted I), 
			GETDATE(),
			dbo.getPrecioVisibilidad((select I.codVisibilidad from inserted I)))
	insert into Items (nroFactura, nombre, cantidad, montoItem, idPublicacion)
	values(@@IDENTITY, 'comision x publicar', 1, dbo.getPrecioVisibilidad((select I.codVisibilidad from inserted I)), (select I.pCodigo from inserted I))
   end	
go

---FUNCIONES AYUDADORAS
alter FUNCTION getPrecioVisibilidad(@codVisibildad numeric(18,0))
RETURNS  numeric(18,2)
AS
BEGIN
	RETURN  (select V.precio from Visibilidades V where V.codigo = @codVisibildad)
END
GO

insert into Compras values (71079, 1,  GETDATE(), 1, 0, 1, 'compra inmediata', 1)

select * from Compras
select * from Publicaciones
select * from Clientes
select * from Empresas
select * from FormasPago
select * from Facturaciones
select * from Items
go 

--6. cuando genero una compra generar el item y agregarselo a la factura
alter trigger generarFacturacionPorComprar
on Compras
after insert
as
    declare @cantidad numeric (18,0)
	declare @idCompra int 
	declare @idPublicacion numeric (18,0)
	declare @nroFactura int
	declare @idFormaPago int
	declare @idVendedor int
    select @cantidad = I.cantidad, @idCompra = I.idCompra, @idPublicacion = I.idPublicacion, @idFormaPago = I.idFormaPago,
		   @idVendedor = I.idVendedor	
	from inserted I

   if((select I.tipoPublicacion from inserted I) = 'compra inmediata' )
   begin
	  insert into Facturaciones (fecha, idFormaPago, idUsuario, total)
	  values (GETDATE(), @idFormaPago, @idVendedor, dbo.getTotalCompraInmediata(@cantidad, @idPublicacion))
	  set @nroFactura = @@IDENTITY 

	  insert into Items (cantidad, idCompra, idPublicacion, montoItem, nombre, nroFactura) 
	  values(@cantidad, @idCompra, @idPublicacion, dbo.getMontoItemPorVenta(@cantidad, @idPublicacion), 'comision x venta', @nroFactura)
		
	  if (dbo.getAdmiteEnvio(@idPublicacion) = 1)
		  insert into Items (cantidad, idCompra, idPublicacion, montoItem, nombre, nroFactura) 
		  values(1, @idCompra, @idPublicacion, dbo.getMontoItemPorEnvio(@idPublicacion), 'comision x envio', @nroFactura)
   end
   
   if((select I.tipoPublicacion from inserted I) = 'subasta' )
   begin
   select * from Compras
	--insert into Facturas nueva factura
	--insert into Items detalle producto comprado por subasta
	--insert into Items envio (si admite)
   end	
go


---FUNCIONES AYUDADORAS
create FUNCTION getAdmiteEnvio(@idPublicacion numeric(18,0))
RETURNS  bit
AS
BEGIN

	return (select V.admiteEnvio from Publicaciones P, Visibilidades V where P.codVisibilidad = V.codigo and P.pCodigo = @idPublicacion)

END
GO

alter FUNCTION getMontoItemPorVenta(@cantidad numeric(18,0), @idPublicacion numeric(18,0))
RETURNS  numeric(18,2)
AS
BEGIN

	return @cantidad * (select P.pPrecio from Publicaciones P where pCodigo = @idPublicacion) * 
			(select V.porcentaje from Publicaciones P, Visibilidades V where P.codVisibilidad = V.codigo and P.pCodigo = @idPublicacion)

END
GO

alter FUNCTION getMontoItemPorEnvio(@idPublicacion numeric(18,0))
RETURNS  numeric(10,2)
AS
BEGIN

	return (select V.Envio from Publicaciones P, Visibilidades V where P.codVisibilidad = V.codigo and P.pCodigo = @idPublicacion)

END
GO


create FUNCTION getTotalCompraInmediata(@cantidad numeric(18,0), @idPublicacion numeric(18,0))
RETURNS  numeric(18,2)
AS
BEGIN
	declare @totalSinEnvio numeric(18,2)
		
	set @totalSinEnvio = dbo.getMontoItemPorVenta(@cantidad, @idPublicacion)
	
	if(dbo.getAdmiteEnvio(@idPublicacion) = 1)
	   return @totalSinEnvio + dbo.getMontoItemPorEnvio(@idPublicacion)
	
	return @totalSinEnvio
END
GO




							