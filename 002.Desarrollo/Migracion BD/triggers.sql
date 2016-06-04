------------------------------------------------------------------------------------------------
--TRIGGERS
------------------------------------------------------------------------------------------------
--1. Para actualizar la reputación del vendedor cuando se inserta una calificacion en calificaciones.
create trigger updateReputacionVenderorTrigger2
on Calificaciones
after insert
as
   update Usuarios set reputacion = (select avg(C.cantEstrellas) + count(*) 
									from Calificaciones C, inserted I 
									where C.idVendedor = I.idVendedor)
	where Usuarios.idUsuario = (select top 1 I.idVendedor from inserted I)
go

--Consideraciones: 
--1.Se debe agregar en Calificaciones: el campo idVendedor, para determinar a qué vendedor esta asociada la calificacion
--2.Para contabilizar las calificacion de las subastas concretadas se debe agregar el campo idSubasta en Calificacion, 
--pero creo que por ahora dejemos solo las calificaciones de las compras inmeidatas

--2. para actualizar el stock disponible en comras inmediatas cuando se inserta una compra en compras.
create trigger updateStockPublicacionTrigger
on Compras
after insert
as
   update Pulicaciones set pStock = (select P.pStock - 1 
									from Pulicaciones P, inserted I 
									where P.pCodigo = I.idPublicacion)
	where Pulicaciones.pCodigo = (select top 1 I.idPublicacion from inserted I)
go

--3. para actualizar el valorActual de una subasta cuando se realiza una oferta en ofertas.
create trigger updateValorActualSubastaTrigger
on Ofertas
after insert
as
   update Subastas set valorActual = (select top 1 I.monto from inserted I)
   where Subastas.idSubasta = (select top 1 I.idSubasta from inserted I)
go

--4. para eliminar los usuariosRoles cuando en roles cambio el habilitado.
create trigger deleteUsuariosRolesTrigger
on Roles
after update
as
   if((select top 1 I.habilitado from inserted I) = 0)
		delete from UsuariosRoles where UsuariosRoles.idRol = inserted.idRol
go
							