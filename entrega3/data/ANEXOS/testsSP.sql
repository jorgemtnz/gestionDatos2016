USE [GD1C2016]
GO
--************************************************************************************************************
--0 . test para sp: dar alta usuario
--************************************************************************************************************
--select *  from TPGDD.Localidades
DECLARE @codLocalidad int
DECLARE @username nvarchar(255)
DECLARE @password nvarchar(255)
DECLARE @tipoUsuario nvarchar(255)
DECLARE @mail nvarchar(255)
DECLARE @telefono nvarchar(255)
DECLARE @nroPiso numeric(18,0)
DECLARE @nroDpto nvarchar(50)
DECLARE @nroCalle numeric(18,0)
DECLARE @domCalle nvarchar(255)
DECLARE @codPostal nvarchar(50)

--select * from TPGDD.Usuarios where username = 'daniel'
EXECUTE  [TPGDD].[darAltaUsuarioSP] 
   1
  ,'daniel'
  ,'terricola'
  ,'Cliente'
  ,'danielchungara1@gmail.com'
  ,'1132642399'
  ,0
  ,'1A'
  ,3222
  ,'Huergo'
  ,1842
GO

--************************************************************************************************************
--1 . test para sp: dar alta cliente
--************************************************************************************************************
DECLARE @nombre nvarchar(255)
DECLARE @apellido nvarchar(255)
DECLARE @fechaNacimiento date
DECLARE @nroDNI numeric(18,2)
DECLARE @tipoDocumento nvarchar(255)
DECLARE @codLocalidad int
DECLARE @username nvarchar(255)
DECLARE @password nvarchar(255)
DECLARE @tipoUsuario nvarchar(255)
DECLARE @mail nvarchar(255)
DECLARE @telefono nvarchar(255)
DECLARE @nroPiso numeric(18,0)
DECLARE @nroDpto nvarchar(50)
DECLARE @nroCalle numeric(18,0)
DECLARE @domCalle nvarchar(255)
DECLARE @codPostal nvarchar(50)

--select * from TPGDD.Usuarios U, TPGDD.Clientes C where U.username = '@daniel' and U.idUsuario = C.idUsuario
EXECUTE [TPGDD].[darAltaClienteSP] 
   'daniel amilcar'
  ,'chungara ruiz'
  ,'1986-06-14'
  ,34346752
  ,'DNI'
  ,1
  ,'@daniel'
  ,'terricola'
  ,'Cliente'
  ,'danielchungara1@gmail.com'
  ,'1132642399'
  ,0
  ,'1A'
  ,3222
  ,'Huergo'
  ,1842
GO

--************************************************************************************************************
--1 . test para sp: dar alta empresa
--************************************************************************************************************
DECLARE @RC int
DECLARE @razonSocial nvarchar(255)
DECLARE @cuit nvarchar(50)
DECLARE @nombreContacto nvarchar(255)
DECLARE @nombreRubro nvarchar(255)
DECLARE @ciudad nvarchar(255)
DECLARE @codLocalidad int
DECLARE @username nvarchar(255)
DECLARE @password nvarchar(255)
DECLARE @tipoUsuario nvarchar(255)
DECLARE @mail nvarchar(255)
DECLARE @telefono nvarchar(255)
DECLARE @nroPiso numeric(18,0)
DECLARE @nroDpto nvarchar(50)
DECLARE @nroCalle numeric(18,0)
DECLARE @domCalle nvarchar(255)
DECLARE @codPostal nvarchar(50)

-- TODO: Set parameter values here.
--select * from TPGDD.Usuarios U , TPGDD.Empresas E where E.idUsuario = U.idUsuario  and U.username = 'pcElectronic'
EXECUTE  [TPGDD].[darAltaEmpresaSP] 
   'pcElectronic2'
  ,'113234543201'
  ,'contacto'
  ,'electronica'
  ,'buenos aires'
  ,1
  ,'pcElectronic2'
  ,'1234'
  ,'Empresa'
  ,'@mail'
  ,'@telefono'
  ,1
  ,'@nroDpto'
  ,1234
  ,'@domCalle'
  ,'@codPostal'
GO

