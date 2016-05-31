/****** COMBIENE AGREGAR UNOS INDICES A LA TABLA MAESTRA PARA QUE BUSQUE MAS RAPIDO ******/

--CLIENTES DIFERENTES QUE COMPRARON: 28
SELECT DISTINCT  [Cli_Dni]
      ,[Cli_Apeliido]
      ,[Cli_Nombre]
      ,[Cli_Fecha_Nac]
      ,[Cli_Mail]
      ,[Cli_Dom_Calle]
      ,[Cli_Nro_Calle]
      ,[Cli_Piso]
      ,[Cli_Depto]
      ,[Cli_Cod_Postal]         
  FROM [GD1C2016].[gd_esquema].[Maestra]
  WHERE [Cli_Dni] IS NOT NULL
GO

  --CLIENTES DIFERENTES QUE PUBLICARON :28
    SELECT DISTINCT [Publ_Cli_Dni]
	 ,[Publ_Cli_Apeliido]
      ,[Publ_Cli_Nombre]
      ,[Publ_Cli_Fecha_Nac]
      ,[Publ_Cli_Mail]
      ,[Publ_Cli_Dom_Calle]
      ,[Publ_Cli_Nro_Calle]
      ,[Publ_Cli_Piso]
      ,[Publ_Cli_Depto]
      ,[Publ_Cli_Cod_Postal]
      FROM [GD1C2016].[gd_esquema].[Maestra]
  WHERE [Publ_Cli_Dni] IS NOT NULL 
  GO

  --CLIENTES de todo el sistema
SELECT  DISTINCT  [Cli_Dni] AS DNI, REPLACE(Cli_Mail,' ',' ')  FROM [GD1C2016].[gd_esquema].[Maestra]
 WHERE Cli_Dni IS NOT NULL
  UNION
   SELECT DISTINCT [Publ_Cli_Dni] AS DNI , REPLACE(Publ_Cli_Mail,' ',' ') FROM [GD1C2016].[gd_esquema].[Maestra]
 WHERE Publ_Cli_Dni IS NOT NULL 
  ORDER BY 1
GO
--QUEDA PROBADO CON ESTA TABLA QUE LA SENTENCIA ANTERIOR ME DEVUELVE TODOS LOS CLIENTES DEL SISTEMA
/*
CREATE TABLE [tempLocalidad](
	[DNI] numeric(18,2) NULL,	
	[Mail] [nvarchar](255) NOT NULL)
	GO

INSERT INTO dbo.tempLocalidad (DNI, Mail)
SELECT  DISTINCT  [Cli_Dni], Cli_Mail  FROM [GD1C2016].[gd_esquema].[Maestra]
 WHERE Cli_Dni IS NOT NULL
-- UNION ALL
GO
INSERT INTO dbo.tempLocalidad (DNI, Mail)
 SELECT DISTINCT [Publ_Cli_Dni] , Publ_Cli_Mail FROM [GD1C2016].[gd_esquema].[Maestra]
 WHERE Publ_Cli_Dni IS NOT NULL 
 GO

 SELECT * FROM tempLocalidad
 ORDER BY DNI  ASC
 GO

 SELECT DISTINCT Mail FROM tempLocalidad

 DROP TABLE dbo.tempLocalidad
GO
*/
  --EMPRESAS DIFERENTES QUE PUBLICARON: 67
  SELECT DISTINCT  [Publ_Empresa_Razon_Social]
      ,[Publ_Empresa_Cuit]
      ,[Publ_Empresa_Fecha_Creacion]
      ,[Publ_Empresa_Mail]
      ,[Publ_Empresa_Dom_Calle]
      ,[Publ_Empresa_Nro_Calle]
      ,[Publ_Empresa_Piso]
      ,[Publ_Empresa_Depto]
      ,[Publ_Empresa_Cod_Postal] 
  FROM [GD1C2016].[gd_esquema].[Maestra]
  WHERE [Publ_Empresa_Razon_Social] IS NOT NULL 
  GO
  --para obtener forma de pago, ya se que solo hay una, asi que la cargo solo esa.
  SELECT DISTINCT  Forma_Pago_Desc    
  FROM [GD1C2016].[gd_esquema].[Maestra]
  WHERE Factura_Nro >0 
GO
--PARA OBTENER UN NOMBRE DE USUARIO
--OBTENGO SOLO EL NOMBRE DEL MAIL Y LE PONGO UN MISMO PASSWORD
SELECT DISTINCT REPLACE(SUBSTRING(Cli_Mail,1,CHARINDEX('@',Cli_Mail)-1),' ','') AS nombreUsuario,'26d6a8ad97c75ffc548f6873e5e93ce475479e3e1a1097381e54221fb53ec1d2' AS password
FROM gd_esquema.Maestra 
WHERE Cli_Mail IS NOT NULL 
GO

--REPLACE SACA TODOS LOS ESPACIOS EN BLANCO DEL NVARCHAR
SELECT  DISTINCT  1 AS codLocalidad, --codLocalidad 1 significa vacio
REPLACE(SUBSTRING(Cli_Mail,1,CHARINDEX('@',Cli_Mail)-1),' ','') AS username,
'26d6a8ad97c75ffc548f6873e5e93ce475479e3e1a1097381e54221fb53ec1d2' AS password,
'Cliente' AS tipoUsuario,
Cli_Mail AS Mail,
Cli_Piso AS nroPiso,
Cli_Depto AS nroDpto,
GETDATE() AS fechaCreacion,
Cli_Nro_Calle AS nroCalle,
Cli_Dom_Calle AS nroDom,
Cli_Cod_Postal AS codPostal FROM [GD1C2016].[gd_esquema].[Maestra]
 WHERE Cli_Dni IS NOT NULL
  UNION -- UNION ALL ME DA 56 FILAS PERO CON REPETIDOS, UNION solo no permite repetidos
   SELECT DISTINCT     1 AS codLocalidad, --codLocalidad 1 significa vacio
REPLACE(SUBSTRING(Publ_Cli_Mail,1,CHARINDEX('@',Publ_Cli_Mail)-1),' ','') AS username,
'26d6a8ad97c75ffc548f6873e5e93ce475479e3e1a1097381e54221fb53ec1d2' AS password,
'Cliente' AS tipoUsuario,
Publ_Cli_Mail AS Mail,
Publ_Cli_Piso AS nroPiso,
Publ_Cli_Depto AS nroDpto,
GETDATE() AS fechaCreacion,
Publ_Cli_Nro_Calle AS nroCalle,
Publ_Cli_Dom_Calle AS nroDom,
Publ_Cli_Cod_Postal AS codPostal FROM [GD1C2016].[gd_esquema].[Maestra]
 WHERE Publ_Cli_Dni IS NOT NULL 
  ORDER BY username
GO

-- por esto es que debo usar SET IDENTITY_INSERT , par poder insertar un valor que yo quiera
--No se puede insertar un valor explícito en la columna de identidad de la tabla 'FormasPago' cuando IDENTITY_INSERT es OFF.

SELECT DISTINCT MA.Publ_Empresa_Razon_Social AS RAZONSOCIAL,MA.Publ_Empresa_Cuit, (SELECT idUsuario FROM dbo.Usuarios
 WHERE MA.Publ_Empresa_Razon_Social = SUBSTRING(mail,1,CHARINDEX('@',mail)-1) )  AS NOMBREUSUARIO FROM [GD1C2016].[gd_esquema].[Maestra] MA
 WHERE MA.Publ_Empresa_Razon_Social IS NOT NULL
 ORDER BY NOMBREUSUARIO

SELECT *  FROM Usuarios
SELECT *  FROM Empresas

