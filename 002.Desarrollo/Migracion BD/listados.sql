------------------------------------------------------------------------------------
--LISTADO ESTADÍSTICO
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
--Vendedores con mayor cantidad de productos no vendidos
------------------------------------------------------------------------------------
create   PROCEDURE peoresVendedoresSP(@codigoVisbilidad numeric(18,0), @numeroTrimestre int, @year int) 
AS 
BEGIN

	SELECT TOP 5  U.idUsuario idVendedor, isnull (dbo.cantidadNoVendida(U.idUsuario, @codigoVisbilidad, @numeroTrimestre, @year), 0) cantidadNoVendida
				 
	FROM Usuarios  U
	where exists(select 1 from Publicaciones P where P.idUsuario = U.idUsuario)
	ORDER BY 2 desc
END
go

/*Para probar el store
exec dbo.peoresVendedoresSP 10002, 4, 2015
go
*/

--FUNCIONES AYUDADORAS
create   FUNCTION getPublicacionesFiltradas (@idVendedor int, @codigoVisbilidad numeric(18,0), @numeroTrimestre int, @year int)  
RETURNS TABLE  
AS  
RETURN   
(  
    SELECT *
	from Publicaciones P
	where P.idUsuario = @idVendedor 
		  and P.codVisibilidad = @codigoVisbilidad 
	      and year(P.pFecha_Venc) = @year
		  and dbo.getTrimestre(P.pFecha_Venc) = @numeroTrimestre
);  
GO

/*
select * from dbo.getPublicacionesFiltradas(86,10002,1,2016)
select * from Publicaciones
*/

GO

 create    FUNCTION cantidadNoVendida(@idVendedor int, @codigoVisbilidad numeric(18,0), @numeroTrimestre int, @year int)
RETURNS  int
AS
BEGIN
	
	RETURN  (dbo.stockTotalInicial(@idVendedor , @codigoVisbilidad , @numeroTrimestre , @year )
			- dbo.cantidadVendida(@idVendedor , @codigoVisbilidad , @numeroTrimestre , @year ))
END
go

 create    FUNCTION stockTotalInicial(@idVendedor int, @codigoVisbilidad numeric(18,0), @numeroTrimestre int, @year int)
RETURNS  int
AS
BEGIN
	return (select sum(P.pStock)
	from dbo.getPublicacionesFiltradas(@idVendedor,@codigoVisbilidad,@numeroTrimestre,@year) P)
	
END
go

create    FUNCTION getTrimestre(@fecha datetime)
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
go

 create    FUNCTION cantidadVendida(@idVendedor int, @codigoVisbilidad numeric(18,0), @numeroTrimestre int, @year int)
RETURNS  int
AS
BEGIN
	
	RETURN (select sum(C.cantidad)
			from dbo.getPublicacionesFiltradas(@idVendedor,@codigoVisbilidad,@numeroTrimestre,@year) P, Compras C
			where   P.pCodigo = C.idPublicacion)
END
go

------------------------------------------------------------------------------------
--2. Clientes con mayor cantidad de productos comprados, por mes y por año, dentro 
--de un rubro particular
------------------------------------------------------------------------------------
create   PROCEDURE mejoresCompradoresSP(@idRubro int, @numeroTrimestre int, @year int) 
AS 
BEGIN

	select top 5 C.idCliente, dbo.cantidadProductosComprados(C.idCliente, @idRubro ,@numeroTrimestre, @year)  as CantidadProductosComprados
	from Clientes C
	order by 2 desc
END
go


/*Para probar el sp
exec  mejoresCompradoresSP 22,4, 2015 
select top 3 * from Publicaciones
go
*/

--Funciones ayudadoras
create     FUNCTION cantidadProductosComprados(@idCliente int, @idRubro int, @numeroTrimestre int, @year int)
RETURNS  int
AS
BEGIN
	
	RETURN  (select sum(C2.cantidad)
			 from Clientes C1, Compras C2 
			 where C1.idCliente = @idCliente and
				   C1.idCliente = C2.idCliente and
				   year(C2.fecha) = @year and 
				   dbo.getTrimestre(C2.fecha) =  @numeroTrimestre and
				   dbo.getRubro(C2.idPublicacion) = @idRubro
			 )
END
go


create     FUNCTION getRubro(@idPublicacion numeric (18,0))
RETURNS  int
AS
BEGIN
	
	RETURN  (select P.codRubro
			 from Publicaciones P
			 where P.pCodigo = @idPublicacion
			 )
END
go

------------------------------------------------------------------------------------
--3. Vendedores con mayor cantidad de facturas dentro de un mes y año particular
------------------------------------------------------------------------------------
create   PROCEDURE mejoresVendedoresPorCantidadFacturasSP(@numeroTrimestre int, @year int) 
AS 
BEGIN

	select top 5 U.idUsuario idVendedor, dbo.cantidadFacturas(U.idUsuario,@numeroTrimestre, @year)  as CantidadFacturas
	from Usuarios U
	where exists(select 1 from Publicaciones P where P.idUsuario = U.idUsuario)
	order by 2 desc
END
go


/*Para probar el sp
exec  mejoresVendedoresPorCantidadFacturasSP 1, 2015 
select top 3 * from Publicaciones
go
*/

--Funciones ayudadoras
create     FUNCTION cantidadFacturas(@idVendedor int, @numeroTrimestre int, @year int)
RETURNS  int
AS
BEGIN
	
	RETURN  (select count(F.nroFactura)
			 from Facturaciones F
			 where F.idUsuario = @idVendedor and
				   year(F.fecha) = @year and 
				   dbo.getTrimestre(F.fecha) =  @numeroTrimestre 
			 )
END
go

------------------------------------------------------------------------------------
--4. Vendedores con mayor monto facturado dentro de un mes y año particular
------------------------------------------------------------------------------------
create   PROCEDURE mejoresVendedoresPorMontoFacturadoSP(@numeroTrimestre int, @year int) 
AS 
BEGIN

	select top 5 U.idUsuario idVendedor, dbo.montoFacturado(U.idUsuario,@numeroTrimestre, @year)  as MontoFacturado
	from Usuarios U
	where exists(select 1 from Publicaciones P where P.idUsuario = U.idUsuario)
	order by 2 desc
END
go
											

/*Para probar el sp
exec  mejoresVendedoresPorMontoFacturadoSP 2, 2015 
select top 3 * from Publicaciones
go
*/

--Funciones ayudadoras
create     FUNCTION montoFacturado(@idVendedor int, @numeroTrimestre int, @year int)
RETURNS  int
AS
BEGIN
	
	RETURN  (select sum(F.total)
			 from Facturaciones F
			 where F.idUsuario = @idVendedor and
				   year(F.fecha) = @year and 
				   dbo.getTrimestre(F.fecha) =  @numeroTrimestre 
			 )
END
go