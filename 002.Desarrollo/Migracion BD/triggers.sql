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

							