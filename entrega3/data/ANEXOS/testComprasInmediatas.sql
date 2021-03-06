
--***************************************************************
--estos son los metodos que serian de uso general para una tabla maestra
--donde la publicacion de comprasInmediatas hubiera tenido stockDisponible >0

INSERT INTO TPGDD.ComprasInmediatas(idPublicacion ,unidadesVendidas,stockDisponible)
SELECT   MA.Publicacion_Cod AS idPublicacion,
(SELECT sum(MA1.Compra_Cantidad) FROM [GD1C2016].[gd_esquema].[Maestra] MA1
where ma1.Publicacion_Cod = MA.Publicacion_Cod AND MA1.Compra_Cantidad IS NOT NULL 
AND MA1.Calificacion_Codigo IS NULL
) as unidadesVendidas,
ma.Publicacion_Stock AS stockDisponible
FROM [GD1C2016].[gd_esquema].[Maestra] MA
inner JOIN TPGDD.Publicaciones p ON P.pCodigo = MA.Publicacion_Cod
WHERE MA.Compra_Cantidad IS NOT NULL and MA.Publicacion_Tipo = 'Compra Inmediata' 
and ma.Calificacion_Codigo is null
GROUP BY MA.Publicacion_Cod, ma.Publicacion_Stock
ORDER BY  MA.Publicacion_Cod
--PRINT 'MIGRO ComprasInmediatas OK'
GO

CREATE FUNCTION TPGDD.dameStockActual(@unidadesVendidas int, @StockActual int)
RETURNS INT AS
BEGIN
DECLARE @stockdisponible INT
 SET @stockdisponible = @StockActual - @unidadesVendidas
 RETURN @stockdisponible
END
GO

--ES EL CURSOR PARA RECORRER LA TABLA y actualizar 
CREATE PROCEDURE tpgdd.actualizarComprasInmediatas
AS 
  BEGIN 
      DECLARE @idPublicacion NUMERIC(18) 
      DECLARE @stockPublicacion INT 
      DECLARE @unidadesVendidas INT 
      DECLARE @acumUnidadesVendidas INT 
      DECLARE @stockDisponible INT 
      DECLARE @stockActual INT 
      SET @stockActual = 0 
      DECLARE cursorReTempci CURSOR FOR 
        SELECT idPublicacion, stockDisponible, unidadesVendidas 
        FROM   TPGDD.ComprasInmediatas
      OPEN cursorReTempci 
      --PRIMER RECORRIDO 
      FETCH next FROM cursorReTempci INTO @idPublicacion, @stockDisponible, 
      @unidadesVendidas 
      WHILE ( @@FETCH_STATUS = 0 ) 
        BEGIN 
			SET @stockActual = TPGDD.dameStockActual(@unidadesVendidas,@stockDisponible )			
	        update tpgdd.comprasInmediatas 
			set stockDisponible = @stockActual
			where idPublicacion = @idPublicacion                       
          FETCH next FROM cursorReTempci INTO @idPublicacion,@stockDisponible, @unidadesVendidas 
       END 
      CLOSE cursorReTempci 
      DEALLOCATE cursorReTempci 
  END 
go 
--ACTUALIZAR LA TABLA
EXEC tpgdd.actualizarComprasInmediatas 
PRINT 'MIGRO COMPRASINMEDIATAS OK '
GO

exec tpgdd.actualizarComprasInmediatas
go
