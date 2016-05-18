

/****** Script for SelectTopNRows command from SSMS  ******/
create table dbo.clientes(
	idCliente int primary key identity(1,1),
	mail varchar(50)
)

create table dbo.facturas_(
	idFactura int primary key identity(1,1),
	importe numeric(10,2),
	fecha date,
	id_Cliente int references dbo.clientes
)

select * from dbo.clientes
select * from dbo.facturas_
insert into dbo.clientes values (NULL)
insert into dbo.facturas_ values (10.2, GETDATE(),2)
insert into dbo.facturas_ values (10.2, GETDATE(),2)
insert into dbo.facturas_ values (10.2, GETDATE(),2)
insert into dbo.facturas_ values (10.2, GETDATE(),2)

delete dbo.clientes where idCliente=3	 

select ISNULL(c.mail, 'c') as a
from dbo.clientes c

select getdate() as fecha, 
	   current_user as actual,
	   'daniel' + ' ' + 'chungara' as cliente,
	   ROUND(1.4, 0) as redondeo,  
	   year(GETDATE()) as año,
	   month(GETDATE()) as mes,
	   day(GETDATE()) as dia,
	   datepart(WEEKDAY, getdate()) as diaSemana,
	   DATEADD(DAY, 3, getdate()) as fechaMas3Dias,
	   datediff(YEAR, '1989-05-26',getdate()) as MiEdad,
	   upper('daniel chungara')	 as miNombreEnMayu,
	   CHARINDEX('daniel', 'amilcar daniel') as posicionSubcadena,
	   SUBSTRING('DANIEL', 1, 4) AS aka,
	   LEN('daniel') as cantDaniel

select * from dbo.clientes c inner join dbo.facturas_ f on c.idCliente = f.id_Cliente  	

update dbo.facturas_ set id_Cliente = (select c.idCliente from dbo.clientes c where c.mail = '@juan')
where id_Cliente = 1

select c.mail from dbo.clientes c where c.idCliente in (select 1 as n, 2 as n4)


create table dbo.empleados(
	id int primary key identity(1,1),
	nombre varchar(50),
	sector varchar(50),
	sueldo numeric(10,2))

insert into dbo.empleados values('J', 'V', 1500.0),('M', 'V', 1200.0),('B', 'C', 1400.0),('H', 'C', 1400.0)
select * from dbo.empleados e
where e.sueldo = (select max(e2.sueldo) from dbo.empleados e2 where e2.sector = e.sector)

select * from dbo.clientes c inner join dbo.facturas_ f on f.id_Cliente = c.idCliente
where YEAR(f.fecha) = 2016 and not exists (select 1 from dbo.facturas_ f2 where YEAR(f2.fecha) = 2017 and f2.id_Cliente = c.idCliente) 

insert into dbo.facturas_ values (10.40, '2017-04-17', 2)	

create table dobleAgrupamiento2(
	letra char,
	numero int,
	aleatorio int) 

insert into dobleAgrupamiento2 values ('B',2,2)

select * from dobleAgrupamiento2;

select letra, numero, count(*) repeticionesNumero, max(aleatorio) max_aletorio 
from dobleAgrupamiento2
group by letra, numero
order by letra, numero
		    