/*Práctica de SQL...
Según el modelo de datos resuelva...*/

/*4.
Realizar una consulta que muestre para todos los artículos código, detalle y cantidad
de artículos que lo componen. Mostrar solo aquellos artículos para los cuales el
stock promedio por depósito sea mayor a 100.*/

select A.prod_codigo, A.prod_detalle, A.cantidadArticulosQueLoComponen 
from 
	(select prod_codigo, prod_detalle, count(*) as cantidadArticulosQueLoComponen
	from GD2015C1.dbo.Producto inner join GD2015C1.dbo.Composicion on prod_codigo = comp_producto
	group by prod_codigo, prod_detalle
	union
	select prod_codigo, prod_detalle, 1
	from GD2015C1.dbo.Producto) A
inner join GD2015C1.dbo.STOCK on stoc_producto = prod_codigo
group by stoc_producto, A.cantidadArticulosQueLoComponen, A.prod_codigo, A.prod_detalle
having sum(stoc_cantidad) / count(*) > 100

/*5.
Realizar una consulta que muestre código de artículo, detalle y cantidad de egresos
de stock que se realizaron para ese artículo en el año 2012 (egresan los productos
que fueron vendidos). Mostrar solo aquellos que hayan tenido más egresos que en el
2011.*/

select P.prod_codigo, P.prod_detalle, sum(item_cantidad) as ventas2012
from GD2015C1.dbo.Producto P inner join GD2015C1.dbo.Item_Factura I on prod_codigo = item_producto
							 inner join GD2015C1.dbo.Factura F on item_tipo = fact_tipo and item_sucursal = fact_sucursal and item_numero = fact_numero
where year(fact_fecha) = 2012							   
group by prod_codigo, prod_detalle
having sum(item_cantidad) > (select sum(I2.item_cantidad) as ventas2011
				from GD2015C1.dbo.Item_Factura I2 inner join GD2015C1.dbo.Factura F2 on I2.item_tipo = F2.fact_tipo and I2.item_sucursal = F2.fact_sucursal and I2.item_numero = F2.fact_numero 
				where I2.item_producto = P.prod_codigo and year(F2.fact_fecha) = 2011)

/*6. Mostrar para todos los rubros de artículos código, detalle, cantidad de artículos de
ese rubro y stock total de ese rubro de artículos. Solo tener en cuenta aquellos
artículos que tengan un stock mayor al del artículo ‘00000000’ en el depósito ‘00’.*/

select a.rubr_id, a.rubr_detalle, a.cantProducto, sum(cantProducto) as stockTotal
from 
	(select prod_codigo, rubr_id, rubr_detalle, count(*) as cantProducto
	from  GD2015C1.dbo.Rubro inner join GD2015C1.dbo.Producto on prod_rubro = rubr_id
	group by prod_codigo, rubr_id, rubr_detalle) a
	inner join GD2015C1.dbo.STOCK on a.prod_codigo = stoc_producto
group by stoc_producto, a.rubr_id, a.rubr_detalle, a.cantProducto
having  sum(cantProducto) > (select stoc_cantidad from GD2015C1.dbo.STOCK where stoc_producto = '00000000' and stoc_deposito = '00')

/*8. Mostrar para el o los artículos que tengan stock en todos los depósitos, nombre del
artículo, stock del depósito que más stock tiene.*/
select prod_detalle, max(stoc_cantidad) stockDelDepositoQueMasStockTiene 
from GD2015C1.dbo.Producto inner join GD2015C1.dbo.STOCK on prod_codigo = stoc_producto
group by prod_codigo, prod_detalle
having count(*) = (select count(*) from GD2015C1.dbo.DEPOSITO)

/*9. Mostrar el código del jefe, código del empleado que lo tiene como jefe, nombre del
mismo y la cantidad de depósitos que ambos tienen asignados.*/
select e2.empl_codigo as jefe_codigo, e1.empl_codigo as empl_codigo, e2.empl_nombre as jefe_nombre, e1.empl_nombre as empl_nombre
from GD2015C1.dbo.Empleado e1, GD2015C1.dbo.Empleado e2
where e1.empl_jefe = e2.empl_codigo

/*10. Mostrar los 10 productos mas vendidos en la historia y también los 10 productos
menos vendidos en la historia. Además mostrar de esos productos, quien fue el
cliente que mayor compra realizo.*/

select p.prod_codigo as Primeros10MasVendidosUltimosMenosEnTodaLaHistoria, (select top 1 C.clie_codigo 
																			from GD2015C1.dbo.Factura F, GD2015C1.dbo.Item_Factura I2,  GD2015C1.dbo.Cliente C
																			where I2.item_tipo = F.fact_tipo and
																					I2.item_sucursal = F.fact_sucursal and
																					I2.item_numero = F.fact_numero and
																					F.fact_cliente = C.clie_codigo and
																					I2.item_producto = p.prod_codigo
																			group by C.clie_codigo
																			order by sum(I2.item_cantidad)desc)as ClienteQueMasCompro
from GD2015C1.dbo.Producto p
where prod_codigo in(select top 10 P2.prod_codigo
					 from GD2015C1.dbo.Producto P2, GD2015C1.dbo.Item_Factura I
					 where P2.prod_codigo = I.item_producto
					 group by P2.prod_codigo
					 order by sum(I.item_cantidad) desc)
union
select p.prod_codigo, (select top 1 C.clie_codigo 
						from GD2015C1.dbo.Factura F, GD2015C1.dbo.Item_Factura I2,  GD2015C1.dbo.Cliente C
						where I2.item_tipo = F.fact_tipo and
								I2.item_sucursal = F.fact_sucursal and
								I2.item_numero = F.fact_numero and
								F.fact_cliente = C.clie_codigo and
								I2.item_producto = p.prod_codigo
						group by C.clie_codigo
						order by sum(I2.item_cantidad)desc)as ClienteQueMasCompro
from GD2015C1.dbo.Producto p
where prod_codigo in(select top 10 P2.prod_codigo
					 from GD2015C1.dbo.Producto P2, GD2015C1.dbo.Item_Factura I
					 where P2.prod_codigo = I.item_producto
					 group by P2.prod_codigo
					 order by sum(I.item_cantidad) asc)

go

/*11. Realizar una consulta que retorne el detalle de la familia, la cantidad diferentes de
productos vendidos y el monto de dichas ventas sin impuestos. Los datos se deberán
ordenar de mayor a menor, por la familia que más productos diferentes vendidos
tenga, solo se deberán mostrar las familias que tengan una venta superior a 20000
pesos para el año 2012.*/
select Fam.fami_detalle, sum(I.item_cantidad) as CantProductosVendidos, sum(I.item_precio * I.item_cantidad) as MontoTotal
from GD2015C1.dbo.Familia Fam, GD2015C1.dbo.Producto P, GD2015C1.dbo.Item_Factura I, GD2015C1.dbo.Factura Fac
where Fam.fami_id = P.prod_familia and P.prod_codigo = I.item_producto and Fac.fact_tipo = I.item_tipo and 
	  Fac.fact_sucursal = I.item_sucursal and Fac.fact_numero = I.item_numero and year(Fac.fact_fecha) = 2012
group by Fam.fami_detalle
having sum(I.item_precio * I.item_cantidad) > 20000 
order by 2 desc 

/*12. Mostrar nombre de producto, cantidad de clientes distintos que lo compraron
importe promedio pagado por el producto, cantidad de depósitos en lo cuales hay
stock del producto y stock actual del producto en todos los depósitos. Se deberán
mostrar aquellos productos que hayan tenido operaciones en el año 2012 y los datos
deberán ordenarse de mayor a menor por monto vendido del producto.*/
select P.prod_detalle, count(distinct C.clie_codigo) as clientes_distintos_compraron,
	   avg(I.item_precio) as importe_promedio_pagado,
	   (select count(*) from GD2015C1.dbo.STOCK S where S.stoc_producto = P.prod_codigo and S.stoc_cantidad > 0)as cantidad_depositos_hay_stock,
	   (select sum(S.stoc_cantidad) from GD2015C1.dbo.STOCK S where S.stoc_producto = P.prod_codigo and S.stoc_cantidad > 0)as stock_actual_todos_depositos	    
from GD2015C1.dbo.Producto P, GD2015C1.dbo.Item_Factura I, GD2015C1.dbo.Factura F, GD2015C1.dbo.Cliente C
where P.prod_codigo = I.item_producto and 
	  I.item_tipo = F.fact_tipo and
	  I.item_sucursal = F.fact_sucursal and
	  I.item_numero = F.fact_numero and
	  F.fact_cliente = C.clie_codigo and
	  exists (select 1 from GD2015C1.dbo.Factura F2, GD2015C1.dbo.Item_Factura I2 where 
		I2.item_tipo = F2.fact_tipo and
		I2.item_sucursal = F2.fact_sucursal and
		I2.item_numero = F2.fact_numero and
		I2.item_producto = P.prod_codigo and 
		year(F2.fact_fecha) = 2012)
group by P.prod_codigo, P.prod_detalle
order by sum(I.item_cantidad * I.item_precio) desc

/*13. Realizar una consulta que retorne para cada producto que posea composición
nombre del producto, precio del producto, precio de la sumatoria de los precios por
la cantidad de los productos que lo componen. Solo se deberán mostrar los
productos que estén compuestos por más de 2 productos y deben ser ordenados de
mayor a menor por cantidad de productos que lo componen.*/

select P.prod_detalle, P.prod_precio, 
	   sum(C.comp_cantidad * P2.prod_precio) as precioTotalComponentes,	   
	   sum(C.comp_cantidad) as cantidadElementosComponen
from GD2015C1.dbo.Producto P, GD2015C1.dbo.Composicion C, GD2015C1.dbo.Producto P2										 
where P.prod_codigo = C.comp_producto and C.comp_componente = P2.prod_codigo
group by P.prod_codigo, P.prod_detalle, P.prod_precio
having sum(C.comp_cantidad)  >= 2
order by sum(C.comp_cantidad)  desc

/*14. Escriba una consulta que retorne una estadística de ventas por cliente. Los campos
que debe retornar son:
Código del cliente
Cantidad de veces que compro en el último año
Promedio por compra en el último año
Cantidad de productos diferentes que compro en el último año
Monto de la mayor compra que realizo en el último año
Se deberán retornar todos los clientes ordenados por la cantidad de veces que
compro en el último año.
No se deberán visualizar NULLs en ninguna columna*/

select C.clie_codigo, count(*) as cantidadComprasUltimoAño, 
(select count(distinct I.item_producto) from GD2015C1.dbo.Item_Factura I, GD2015C1.dbo.Factura F2 where  I.item_tipo = F2.fact_tipo  and F2.fact_numero = I.item_numero and F2.fact_sucursal = I.item_sucursal and F2.fact_cliente = C.clie_codigo and year((select max(F4.fact_fecha) from GD2015C1.dbo.Factura F4)) = year(F2.fact_fecha)) as cantidadProductosDiferentesCompradosUltimoAño,	   
	   max(F.fact_total) as mayorCompraUltimoAño
from GD2015C1.dbo.Cliente C, GD2015C1.dbo.Factura F
where year((select max(F3.fact_fecha) from GD2015C1.dbo.Factura F3)) = year(F.fact_fecha)
group by C.clie_codigo
order by count(*)