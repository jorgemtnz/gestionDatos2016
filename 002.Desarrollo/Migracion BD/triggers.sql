------------------------------------------------------------------------------------------------
--TRIGGERS
------------------------------------------------------------------------------------------------
--1. Para actualizar la reputación del vendedor cuando se inserta una calificacion en calificaciones.
create trigger updateReputacionVenderorTrigger
on Calificaciones
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
CREATE FUNCTION getIdVendedor(@idCompra int)
RETURNS  int
AS
BEGIN
	RETURN  (select top 1 T.idVendedor from Compras T where T.idCompra = @idCompra)
END

CREATE FUNCTION getComprasVendedor(@idCompra int)
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

--2. para actualizar el stock disponible en comras inmediatas cuando se inserta una compra en compras.
create trigger updateStockPublicacionTrigger
on Compras
after insert
as
   update Publicaciones set pStock = (select P.pStock - I.cantidad 
									from Publicaciones P, inserted I 
									where P.pCodigo = I.idPublicacion)
	where Publicaciones.pCodigo = (select I.idPublicacion from inserted I)
go


--3. para actualizar el valorActual de una subasta cuando se realiza una oferta en ofertas.
create trigger updateValorActualSubastaTrigger
on Ofertas
after insert
as
   update Subastas set valorActual = (select I.monto from inserted I)
   where Subastas.idSubasta = (select I.idSubasta from inserted I)
go

--4. para eliminar los usuariosRoles cuando en roles cambio el habilitado.
create trigger deleteUsuariosRolesTrigger
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
	insert into Facturaciones (idUsuario, codPublicacion, fecha, total, cTipoPublicacion)
	values ((select I.idUsuario from inserted I), 
	        (select I.pCodigo from inserted I), 
			GETDATE(),
			dbo.getPrecioVisibilidad((select I.codVisibilidad from inserted I)),
			999)
			--getIdTipoPublicacion((select I.pCodigo from inserted I))
	insert into Items (nroFactura, nombre, cantidad, montoItem, idPublicacion, idCompra)
	values(@@IDENTITY, 'comision x publicar', 1, dbo.getPrecioVisibilidad((select I.codVisibilidad from inserted I)), (select I.pCodigo from inserted I), 2)
   end	
		--delete from UsuariosRoles where UsuariosRoles.idRol = (select I.idRol from inserted I)
go

---FUNCIONES AYUDADORAS
CREATE FUNCTION getPrecioVisibilidad(@codVisibildad numeric(18,0))
RETURNS  numeric(18,2)
AS
BEGIN
	RETURN  (select V.precio from Visibilidades V where V.codigo = @codVisibildad)
END
GO
/*
select * from Publicaciones
select dbo.getIdTipoPublicacion(18664)
select * from ComprasInmediatas

ALTER FUNCTION getIdTipoPublicacion(@codPublicacion numeric(18,0))
RETURNS  int
AS
Begin
	If exists ((select C.idPublicacion from ComprasInmediatas C where C.idPublicacion = @codPublicacion))
		return (select C.idPublicacion from ComprasInmediatas C where C.idPublicacion = 18664)
		
	If exists (select S.idPublicacion from Subastas S where S.idPublicacion = @codPublicacion)
		return (select S.idPublicacion from Subastas S where S.idPublicacion = @codPublicacion)
	
	return 0
End
go
*/


							