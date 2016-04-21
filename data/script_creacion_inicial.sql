/*
SCRIPT DE MIGRACIÓN
*/

USE GD1C2015 -- Indica la base de datos a utilizar
GO


/* CREACIÓN DEL ESQUEMA */
CREATE SCHEMA BENDECIDOS AUTHORIZATION gd 
GO

/****************************************************** CREACIÓN DE TABLAS ******************************************************/

/* TABLA ROL */
CREATE TABLE [BENDECIDOS].ROL (
	[Rol_Id] numeric(5,0) NOT NULL IDENTITY(1,1),
	[Rol_Nombre] [varchar](255) NOT NULL,
	[Rol_Estado] char NOT NULL,
	PRIMARY KEY(
		[Rol_Id]
	)
)

/* TABLA FUNCIONALIDAD */
CREATE TABLE [BENDECIDOS].FUNCIONALIDAD (
	[Funcionalidad_Id] numeric(5,0) NOT NULL IDENTITY(1,1),
	[Funcionalidad_Nombre] [varchar](255) NOT NULL,
    PRIMARY KEY(
		[Funcionalidad_Id]
	)
)

/* TABLA ROL_FUNCIONALIDAD */
CREATE TABLE [BENDECIDOS].ROL_FUNCIONALIDAD (
	[Rol_Id] numeric(5,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.ROL(Rol_Id),
	[Funcionalidad_Id] numeric(5,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.FUNCIONALIDAD(Funcionalidad_Id),
	PRIMARY KEY(
		[Rol_Id],
		[Funcionalidad_Id]
	)
)

/* TABLA PAIS */
CREATE TABLE [BENDECIDOS].PAIS(
	[Pais_Id] numeric(18,0) NOT NULL,
	[Pais_Nombre] [varchar](255) NOT NULL,
	PRIMARY KEY(
		[Pais_Id]
	)
)

/* TABLA MONEDA */
CREATE TABLE [BENDECIDOS].MONEDA(
	[Moneda_Id] numeric(5,0) NOT NULL IDENTITY(1,1),
	[Moneda_Desc] [varchar](255) NOT NULL,
	PRIMARY KEY(
		[Moneda_Id]
	)
)

/* TABLA TIPO_DOCUMENTO */
CREATE TABLE [BENDECIDOS].TIPO_DOCUMENTO(
	[Tipo_Doc_Id] numeric(18,0) NOT NULL,
	[Tipo_Doc_Desc] [varchar](255) NOT NULL,
	PRIMARY KEY(
		[Tipo_Doc_Id]
	)
)

/* TABLA CLIENTE */
CREATE TABLE [BENDECIDOS].CLIENTE (
	[Cli_Id] numeric(18,0) NOT NULL,
	[Cli_Nombre] [varchar](255) NOT NULL,
    [Cli_Apellido] [varchar](255) NOT NULL,
	[Cli_Mail] [varchar](255) NOT NULL UNIQUE,
	[Cli_Pais] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.PAIS(Pais_Id),
	[Cli_Calle] [varchar](255) NULL,
	[Cli_Nro] numeric(18,0) NULL,
	[Cli_Piso] numeric(18,0) NULL,
	[Cli_Depto] [varchar](10) NULL,
	[Cli_Localidad] [varchar](255) NULL,
	[Cli_Nacionalidad] [varchar](255) NULL,
	[Cli_Fec_Nac] datetime NOT NULL,
	[Cli_Activo] char NOT NULL, 
	PRIMARY KEY(
		[Cli_Id]
	)
)

/* TABLA CLIENTE_ID */
CREATE TABLE [BENDECIDOS].CLIENTE_ID(
	[Cli_Doc] numeric(18,0) NOT NULL,
	[Cli_Tipo_Doc] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.TIPO_DOCUMENTO(Tipo_Doc_Id),
	[Cli_Id] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.CLIENTE(Cli_Id),
	PRIMARY KEY(
		[Cli_Doc],
		[Cli_Tipo_Doc]
	)
)

/* TABLA USUARIO */
CREATE TABLE [BENDECIDOS].USUARIO (
	[Username] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Usu_Fec_Creacion] datetime NOT NULL,
	[Usu_Fec_Mod] datetime NULL,
    [Usu_Cant_Login_Fallidos] numeric(5,0) NULL DEFAULT 0,
	[Usu_Pregunta_Secreta] [varchar](255) NOT NULL,
	[Usu_Respuesta_Secreta] [varchar](255) NOT NULL,
	[Usu_Activo] char NOT NULL,
	[Usu_Cli_Id] numeric(18,0) NULL FOREIGN KEY REFERENCES BENDECIDOS.CLIENTE(Cli_Id),
    PRIMARY KEY(
		[Username]
	)
)

/* TABLA USUARIO_ROL */
CREATE TABLE [BENDECIDOS].USUARIO_ROL(
	[Rol_Id] numeric(5,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.ROL(Rol_Id),
	[Username] [varchar](255) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.USUARIO(Username),
	PRIMARY KEY(
		[Rol_Id],
		[Username]
	)
)

/* TABLA LOG_LOGIN */
CREATE TABLE [BENDECIDOS].LOG_LOGIN (
	[Log_Id] numeric(18,0) NOT NULL IDENTITY(1,1),
	[Log_User] [varchar](255) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.USUARIO(Username),
	[Log_Fecha_Hora] datetime NOT NULL,
	[Log_Login_Correcto] char NOT NULL,
    [Log_Nro_Login_Fallido] numeric(5,0) NULL,
    PRIMARY KEY(
		[Log_Id]
	)
)

/* TABLA EMISOR_TARJETA */
CREATE TABLE [BENDECIDOS].EMISOR_TARJETA(
	[Tarjeta_Emisor_Id] numeric(5,0) NOT NULL IDENTITY(1,1),
	[Tarjeta_Emisor_Nombre] [varchar](255) NOT NULL,
	PRIMARY KEY(
		[Tarjeta_Emisor_Id]
	)
)

/* TABLA TARJETA */
CREATE TABLE [BENDECIDOS].TARJETA(
	[Tarjeta_Id] numeric(18,0) NOT NULL IDENTITY(1,1),
	[Tarjeta_Nro] [varbinary](255) NOT NULL,
	[Tarjeta_Fec_Emision] datetime NOT NULL,
	[Tarjeta_Fec_Venc] datetime NOT NULL,
	[Tarjeta_Cod_Seg] [varchar](3) NOT NULL,
	[Tarjeta_Ult_Dig] [varchar](4) NOT NULL,
	[Tarjeta_Emisor] numeric(5,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.EMISOR_TARJETA(Tarjeta_Emisor_Id),	
	PRIMARY KEY(
		[Tarjeta_Id]
	)
)

/* TABLA CLIENTE_TARJETA */
CREATE TABLE [BENDECIDOS].CLIENTE_TARJETA(
	[Cli_Id] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.CLIENTE(Cli_Id),
	[Tarjeta_Id] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.TARJETA(Tarjeta_Id),
	PRIMARY KEY(
		[Cli_Id],
		[Tarjeta_Id]
	)
)

/* TABLA TIPO_CUENTA */
CREATE TABLE [BENDECIDOS].TIPO_CUENTA(
	[Cuenta_Tipo_Id] numeric(5,0) NOT NULL IDENTITY(1,1),
	[Cuenta_Tipo_Desc] [varchar](255) NOT NULL,
	[Cuenta_Tipo_Duracion] numeric(18,0) NOT NULL,
	[Cuenta_Tipo_Costo] numeric(18,2) NOT NULL,
	[Cuenta_Tipo_Costo_Transf] numeric(18,2) NOT NULL,
	PRIMARY KEY(
		[Cuenta_Tipo_Id]
	)
)

/* TABLA ESTADO_CUENTA */
CREATE TABLE [BENDECIDOS].ESTADO_CUENTA(
	[Cuenta_Estado_Id] numeric(5,0) NOT NULL IDENTITY(1,1),
	[Cuenta_Estado_Desc] [varchar](255) NOT NULL,
	PRIMARY KEY(
		[Cuenta_Estado_Id]
	)
)

/* TABLA CUENTA */
CREATE TABLE [BENDECIDOS].CUENTA(
	[Cuenta_Nro] numeric(18,0) NOT NULL,
	[Cuenta_Pais] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.PAIS(Pais_Id),
	[Cuenta_Moneda] numeric(5,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.MONEDA(Moneda_Id),
	[Cuenta_Fec_Apertura] datetime NOT NULL,
	[Cuenta_Fec_Cierre] datetime NULL,
	[Cuenta_Fec_Limite] datetime NULL,
	[Cuenta_Tipo] numeric(5,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.TIPO_CUENTA(Cuenta_Tipo_Id),
	[Cuenta_Estado] numeric(5,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.ESTADO_CUENTA(Cuenta_Estado_Id),
	[Cuenta_Saldo] numeric(18,2) NULL DEFAULT 0,
	PRIMARY KEY(
		[Cuenta_Nro]
	)
)

/* TABLA CLIENTE_CUENTA */
CREATE TABLE [BENDECIDOS].CLIENTE_CUENTA(
	[Cli_Id] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.CLIENTE(Cli_Id),
	[Cuenta_Nro] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.CUENTA(Cuenta_Nro),
	PRIMARY KEY(
		[Cli_Id],
		[Cuenta_Nro]
	)
)

/* TABLA DEPOSITO */
CREATE TABLE [BENDECIDOS].DEPOSITO(
	[Cuenta_Nro] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.CUENTA(Cuenta_Nro),
	[Deposito_Nro] numeric(18,0) NOT NULL,
	[Deposito_Moneda] numeric(5,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.MONEDA(Moneda_Id),
	[Deposito_Fecha] datetime NOT NULL,
	[Deposito_Importe] numeric(18,2) NOT NULL,
	[Deposito_Tarjeta_Id] numeric(18,0) NULL FOREIGN KEY REFERENCES BENDECIDOS.TARJETA(Tarjeta_Id),
	PRIMARY KEY(
		[Cuenta_Nro],
		[Deposito_Nro]
	)
)

/* TABLA TRANSFERENCIA */
CREATE TABLE [BENDECIDOS].TRANSFERENCIA(
	[Trans_Id] numeric(18,0) NOT NULL IDENTITY(1,1),
	[Trans_Cta_Origen] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.CUENTA(Cuenta_Nro),
	[Trans_Cta_Destino] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.CUENTA(Cuenta_Nro),
	[Trans_Fecha] datetime NOT NULL,
	[Trans_Importe] numeric(18,2) NOT NULL,
	PRIMARY KEY(
		[Trans_Id]
	)
)

/* TABLA BANCO */
CREATE TABLE [BENDECIDOS].BANCO(
	[Banco_Id] numeric(18,0) NOT NULL,
	[Banco_Nombre] [varchar](255) NOT NULL,
	[Banco_Dir] [varchar](255) NOT NULL,
	PRIMARY KEY(
		[Banco_Id]
	)
)

/* TABLA CHEQUE */
CREATE TABLE [BENDECIDOS].CHEQUE(
	[Cheque_Nro] numeric(18,0) NOT NULL,
	[Cheque_Fecha] datetime NOT NULL,
	[Cheque_Importe] numeric(18,2) NOT NULL,
	[Cheque_Banco] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.BANCO(Banco_Id),
	[Cheque_Cliente] numeric(18,0) NULL FOREIGN KEY REFERENCES BENDECIDOS.CLIENTE(Cli_Id),
	PRIMARY KEY(
		[Cheque_Nro]
	)
)

/* TABLA RETIRO */
CREATE TABLE [BENDECIDOS].RETIRO(
	[Retiro_Id] numeric(18,0) NOT NULL,
	[Retiro_Cuenta_Nro] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.CUENTA(Cuenta_Nro),
	[Retiro_Fecha] datetime NOT NULL,
	[Retiro_Importe] numeric(18,2) NOT NULL,
	[Retiro_Cheque_Nro] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.CHEQUE(Cheque_Nro),
	PRIMARY KEY(
		[Retiro_Id]
	)
)

/* TABLA FACTURA_CAB */
CREATE TABLE [BENDECIDOS].FACTURA_CAB(
	[Factura_Id] numeric(18,0) NOT NULL IDENTITY(1,1),
	[Cli_Id] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.CLIENTE(Cli_Id),
	[Factura_Nro] numeric(18,0) NULL,
	PRIMARY KEY(
		[Factura_Id]
	)
)

/* TABLA FACTURA_DETALLE */
CREATE TABLE [BENDECIDOS].FACTURA_DETALLE(
	[Factura_Id] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.FACTURA_CAB(Factura_Id),
	[Detalle_Id] numeric(18,0) NOT NULL IDENTITY(1,1),
	[Factura_Fecha] datetime NOT NULL,
	[Factura_Item_Desc] [varchar](255) NOT NULL,
	[Factura_Item_Importe] numeric(18,2) NULL,
	PRIMARY KEY(
		[Factura_Id],
		[Detalle_Id]
	)
)

/* TABLA TRANSACCION */
CREATE TABLE [BENDECIDOS].TRANSACCION(
	[Tran_Id] numeric(18,0) NOT NULL IDENTITY(1,1),
	[Cli_Id] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.CLIENTE(Cli_Id),
	[Cuenta_Nro] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES BENDECIDOS.CUENTA(Cuenta_Nro),
	[Tran_Fecha] datetime NOT NULL,
	[Tran_Facturada] char NOT NULL,
	[Tran_Detalle] [varchar](255) NOT NULL,
	[Tran_Importe_Facturar] numeric(18,2) NOT NULL,
	[Tran_Importe_Tran] numeric(18,2) NOT NULL,
	[Tran_FechaFacturada] datetime,
	PRIMARY KEY(
		[Tran_Id],
		[Cli_Id]
	)
)

/****************************************************** CARGA DE DATOS ******************************************************/

/* TABLA ROL */
INSERT INTO BENDECIDOS.ROL (Rol_Nombre, Rol_Estado) VALUES ('Administrador', 'S')
INSERT INTO BENDECIDOS.ROL (Rol_Nombre, Rol_Estado) VALUES ('Cliente', 'S')

/* TABLA FUNCIONALIDAD */
INSERT INTO BENDECIDOS.FUNCIONALIDAD (Funcionalidad_Nombre) VALUES ('ABM de Rol')
INSERT INTO BENDECIDOS.FUNCIONALIDAD (Funcionalidad_Nombre) VALUES ('ABM de Usuario')
INSERT INTO BENDECIDOS.FUNCIONALIDAD (Funcionalidad_Nombre) VALUES ('ABM de Cliente')
INSERT INTO BENDECIDOS.FUNCIONALIDAD (Funcionalidad_Nombre) VALUES ('ABM de Cuenta')
INSERT INTO BENDECIDOS.FUNCIONALIDAD (Funcionalidad_Nombre) VALUES ('Depositos')
INSERT INTO BENDECIDOS.FUNCIONALIDAD (Funcionalidad_Nombre) VALUES ('Retiro de Efectivo')
INSERT INTO BENDECIDOS.FUNCIONALIDAD (Funcionalidad_Nombre) VALUES ('Transferencias entre Cuentas')
INSERT INTO BENDECIDOS.FUNCIONALIDAD (Funcionalidad_Nombre) VALUES ('Facturacion de Costos')
INSERT INTO BENDECIDOS.FUNCIONALIDAD (Funcionalidad_Nombre) VALUES ('Consulta de Saldos')
INSERT INTO BENDECIDOS.FUNCIONALIDAD (Funcionalidad_Nombre) VALUES ('Listado estadistico')
INSERT INTO BENDECIDOS.FUNCIONALIDAD (Funcionalidad_Nombre) VALUES ('Asociar/Desasociar tarjetas de credito')

/* TABLA ROL_FUNCIONALIDAD */
INSERT INTO BENDECIDOS.ROL_FUNCIONALIDAD (Rol_Id, Funcionalidad_Id) VALUES (1, 1)
INSERT INTO BENDECIDOS.ROL_FUNCIONALIDAD (Rol_Id, Funcionalidad_Id) VALUES (1, 2)
INSERT INTO BENDECIDOS.ROL_FUNCIONALIDAD (Rol_Id, Funcionalidad_Id) VALUES (1, 3)
INSERT INTO BENDECIDOS.ROL_FUNCIONALIDAD (Rol_Id, Funcionalidad_Id) VALUES (1, 4)
INSERT INTO BENDECIDOS.ROL_FUNCIONALIDAD (Rol_Id, Funcionalidad_Id) VALUES (1, 8)
INSERT INTO BENDECIDOS.ROL_FUNCIONALIDAD (Rol_Id, Funcionalidad_Id) VALUES (1, 9)
INSERT INTO BENDECIDOS.ROL_FUNCIONALIDAD (Rol_Id, Funcionalidad_Id) VALUES (1, 10)
INSERT INTO BENDECIDOS.ROL_FUNCIONALIDAD (Rol_Id, Funcionalidad_Id) VALUES (2, 4)
INSERT INTO BENDECIDOS.ROL_FUNCIONALIDAD (Rol_Id, Funcionalidad_Id) VALUES (2, 5)
INSERT INTO BENDECIDOS.ROL_FUNCIONALIDAD (Rol_Id, Funcionalidad_Id) VALUES (2, 6)
INSERT INTO BENDECIDOS.ROL_FUNCIONALIDAD (Rol_Id, Funcionalidad_Id) VALUES (2, 7)
INSERT INTO BENDECIDOS.ROL_FUNCIONALIDAD (Rol_Id, Funcionalidad_Id) VALUES (2, 8)
INSERT INTO BENDECIDOS.ROL_FUNCIONALIDAD (Rol_Id, Funcionalidad_Id) VALUES (2, 9)
INSERT INTO BENDECIDOS.ROL_FUNCIONALIDAD (Rol_Id, Funcionalidad_Id) VALUES (2, 11)

/* TABLA USUARIO */
INSERT INTO BENDECIDOS.USUARIO (Username, Password, Usu_Fec_Creacion, Usu_Fec_Mod, Usu_Pregunta_Secreta, Usu_Respuesta_Secreta, Usu_Activo, Usu_Cli_Id)
	VALUES ('admin', 'w23e', '20150617 12:00:00', NULL, 'Sin pregunta', 'Sin respuesta', 'S', NULL)

/* TABLA USUARIO_ROL */
INSERT INTO BENDECIDOS.USUARIO_ROL (Username, Rol_Id) VALUES ('admin', 1)

/* TABLA PAIS */
INSERT INTO BENDECIDOS.PAIS
	SELECT distinct Cli_Pais_Codigo, Cli_Pais_Desc
	FROM gd_esquema.Maestra
	UNION
	SELECT distinct Cuenta_Pais_Codigo, Cuenta_Pais_Desc
	FROM gd_esquema.Maestra
	ORDER BY 1

/* TABLA MONEDA */
INSERT INTO BENDECIDOS.MONEDA (Moneda_Desc) VALUES ('Dólares')
INSERT INTO BENDECIDOS.MONEDA (Moneda_Desc) VALUES ('Pesos')
INSERT INTO BENDECIDOS.MONEDA (Moneda_Desc) VALUES ('Euros')
INSERT INTO BENDECIDOS.MONEDA (Moneda_Desc) VALUES ('Reales')

/* TABLA TIPO_DOCUMENTO */
INSERT INTO BENDECIDOS.TIPO_DOCUMENTO
	SELECT distinct Cli_Tipo_Doc_Cod, Cli_Tipo_Doc_Desc
	FROM gd_esquema.Maestra

/* TABLA EMISOR_TARJETA */
INSERT INTO BENDECIDOS.EMISOR_TARJETA
	SELECT DISTINCT Tarjeta_Emisor_Descripcion
	FROM [GD1C2015].[gd_esquema].[Maestra]
	WHERE Tarjeta_Emisor_Descripcion IS NOT NULL
	ORDER BY Tarjeta_Emisor_Descripcion

/* TABLA BANCO */
INSERT INTO BENDECIDOS.BANCO
	SELECT DISTINCT Banco_Cogido, Banco_Nombre, Banco_Direccion
	FROM [GD1C2015].[gd_esquema].[Maestra]
	WHERE Banco_Cogido IS NOT NULL
	ORDER BY Banco_Cogido
	
/* TABLA ESTADO_CUENTA */
INSERT INTO BENDECIDOS.ESTADO_CUENTA (Cuenta_Estado_Desc) VALUES ('Pendiente de activación')
INSERT INTO BENDECIDOS.ESTADO_CUENTA (Cuenta_Estado_Desc) VALUES ('Habilitada')
INSERT INTO BENDECIDOS.ESTADO_CUENTA (Cuenta_Estado_Desc) VALUES ('Inhabilitada')
INSERT INTO BENDECIDOS.ESTADO_CUENTA (Cuenta_Estado_Desc) VALUES ('Cerrada')

/* TABLA TIPO_CUENTA */ --Duración expresada en Días
INSERT INTO BENDECIDOS.TIPO_CUENTA (Cuenta_Tipo_Desc, Cuenta_Tipo_Costo, Cuenta_Tipo_Duracion, Cuenta_Tipo_Costo_Transf) VALUES ('Gratuita', 0, 30, 20) 
INSERT INTO BENDECIDOS.TIPO_CUENTA (Cuenta_Tipo_Desc, Cuenta_Tipo_Costo, Cuenta_Tipo_Duracion, Cuenta_Tipo_Costo_Transf) VALUES ('Bronce', 50, 60, 15)
INSERT INTO BENDECIDOS.TIPO_CUENTA (Cuenta_Tipo_Desc, Cuenta_Tipo_Costo, Cuenta_Tipo_Duracion, Cuenta_Tipo_Costo_Transf) VALUES ('Plata', 75, 90, 10)
INSERT INTO BENDECIDOS.TIPO_CUENTA (Cuenta_Tipo_Desc, Cuenta_Tipo_Costo, Cuenta_Tipo_Duracion, Cuenta_Tipo_Costo_Transf) VALUES ('Oro', 100, 120, 5)

/*************************************************** CREACIÓN DE ÍNDICES ****************************************************/

CREATE INDEX IX_CLIENTE_Cli_Mail ON BENDECIDOS.CLIENTE(Cli_Mail)
CREATE INDEX IX_FACTURA_CAB_Nro ON BENDECIDOS.FACTURA_CAB(Factura_Nro)


/*************************************************** CREACIÓN DE FUNCIONES **************************************************/

GO
CREATE FUNCTION Encriptar (@clave varchar(16))
RETURNS VARBINARY(255)
AS
BEGIN
	
	DECLARE @pass AS VARBINARY(255)
	SET @pass = ENCRYPTBYPASSPHRASE('tarjeta', @clave)
	RETURN @pass
END

GO
CREATE FUNCTION Desencriptar (@clave varbinary(255))
RETURNS VARCHAR(16)
AS
BEGIN
	DECLARE @pass AS VARCHAR(16)
	SET @pass = DECRYPTBYPASSPHRASE('tarjeta', @clave)
	RETURN @pass
END


/************************************************ CREACIÓN DE PROCEDIMIENTOS ************************************************/

/* PROCEDIMIENTO QUE MIGRA LOS CLIENTES Y LES ASIGNA USUARIO */
GO
CREATE PROCEDURE MigraClientes AS
BEGIN
	DECLARE @CliNombre varchar(255)
	DECLARE @CliApellido varchar(255)
	DECLARE @CliTipoDoc numeric(18,0)
	DECLARE @CliDomCalle varchar(255)
	DECLARE @CliDomNro numeric(18,0)
	DECLARE @CliDomPiso numeric(18,0)
	DECLARE @CliDomDepto varchar(10)
	DECLARE @CliFecNac datetime
	DECLARE @CliMail varchar(255)
	DECLARE @CliPaisCodigo numeric(18,0)
	DECLARE @CliDoc numeric(18,0)
	DECLARE @CliId numeric(18,0)
	DECLARE @CliNacionalidad varchar(255)
	DECLARE @Username varchar(255)
	DECLARE @Password varchar(255)
	DECLARE @PreguntaSecreta varchar(255)
	DECLARE @RespuestaSecreta varchar(255)
	
	SET @CliId = 1

	DECLARE ElCursor CURSOR STATIC LOCAL FORWARD_ONLY FOR
		SELECT DISTINCT Cli_Nombre, Cli_Apellido, Cli_Tipo_Doc_Cod, Cli_Dom_Calle, Cli_Dom_Nro, 
						Cli_Dom_Piso, Cli_Dom_Depto, Cli_Fecha_Nac, Cli_Mail, Cli_Pais_Codigo
		FROM [GD1C2015].[gd_esquema].[Maestra]
 

	OPEN ElCursor FETCH NEXT FROM ElCursor INTO @CliNombre, @CliApellido, @CliTipoDoc, @CliDomCalle, @CliDomNro, @CliDomPiso,
												@CliDomDepto, @CliFecNac, @CliMail, @CliPaisCodigo
		WHILE (@@FETCH_STATUS = 0) BEGIN
		
			SELECT @CliDoc = CAST(RAND() * 1000000000 as numeric(18,0)) -- o puede ser también CAST(ABS(CHECKSUM(NEWID())) AS numeric(18,0))

			SELECT @CliNacionalidad = Pais_Nombre FROM BENDECIDOS.PAIS WHERE Pais_Id = @CliPaisCodigo
					
			INSERT INTO BENDECIDOS.CLIENTE (Cli_Id, Cli_Nombre, Cli_Apellido, Cli_Mail, Cli_Pais, Cli_Calle, Cli_Nro, Cli_Piso, Cli_Depto, Cli_Localidad, Cli_Nacionalidad, Cli_Fec_Nac, Cli_Activo)
				VALUES (@CliId, @CliNombre, @CliApellido, @CliMail, @CliPaisCodigo, @CliDomCalle, @CliDomNro, @CliDomPiso, @CliDomDepto, NULL, @CliNacionalidad, @CliFecNac, 'S')
				
			INSERT INTO BENDECIDOS.CLIENTE_ID (Cli_Doc, Cli_Tipo_Doc, Cli_Id) VALUES (@CliDoc, @CliTipoDoc, @CliId)
				
			SELECT @Username = LEFT(@CliMail, CHARINDEX('@', @CliMail) - 1)
			SET @Password = 'a60b85d409a01d46023f90741e01b79543a3cb1ba048eaefbe5d7a63638043bf' -- La password por defecto es 'cliente'				
			SET @PreguntaSecreta = 'Sin pregunta'
			SET @RespuestaSecreta = 'Sin respuesta'
				
			INSERT INTO BENDECIDOS.USUARIO (Username, Password, Usu_Fec_Creacion, Usu_Fec_Mod, Usu_Cant_Login_Fallidos, Usu_Pregunta_Secreta, Usu_Respuesta_Secreta, Usu_Activo, Usu_Cli_Id)
				VALUES (@Username, @Password, '20150617 12:00:00', NULL, 0, @PreguntaSecreta, @RespuestaSecreta, 'S', @CliId)
			
			INSERT INTO BENDECIDOS.USUARIO_ROL (Username, Rol_Id) VALUES (@Username, 2)			
			
			SET @CliId = @CliId + 1
			
			FETCH NEXT FROM ElCursor INTO @CliNombre, @CliApellido, @CliTipoDoc, @CliDomCalle, @CliDomNro, @CliDomPiso, @CliDomDepto, @CliFecNac, @CliMail, @CliPaisCodigo
		END
	CLOSE ElCursor
	DEALLOCATE ElCursor
END
GO

/* PROCEDIMIENTO QUE MIGRA LAS CUENTAS */
GO
CREATE PROCEDURE MigraCuentas AS
BEGIN
	DECLARE @CuentaNro numeric(18,0)
	DECLARE @CuentaFecCreacion datetime
	DECLARE @CuentaFecLimite datetime
	DECLARE @CuentaPais numeric(18,0)
	DECLARE @CliId numeric(18,0)

	DECLARE ElCursor CURSOR STATIC LOCAL FORWARD_ONLY FOR
		SELECT DISTINCT Cuenta_Numero, Cuenta_Fecha_Creacion, Cuenta_Pais_Codigo,
		(SELECT C.Cli_Id FROM BENDECIDOS.CLIENTE C WHERE C.Cli_Mail =  M.Cli_Mail) 'Cli_Id'
		FROM [GD1C2015].[gd_esquema].[Maestra] M
		WHERE Cuenta_Numero IS NOT NULL
		ORDER BY Cuenta_Numero
 

	OPEN ElCursor FETCH NEXT FROM ElCursor INTO @CuentaNro, @CuentaFecCreacion, @CuentaPais, @CliId
		WHILE (@@FETCH_STATUS = 0) BEGIN
		
			-- Por defecto las cuentas migradas son tipo BRONCE
		
			SET @CuentaFecLimite = @CuentaFecCreacion + 60

			INSERT INTO BENDECIDOS.CUENTA (Cuenta_Nro, Cuenta_Pais, Cuenta_Moneda, Cuenta_Fec_Apertura, Cuenta_Fec_Cierre, Cuenta_Fec_Limite, Cuenta_Tipo, Cuenta_Estado)
				VALUES (@CuentaNro, @CuentaPais, 1, @CuentaFecCreacion, NULL, @CuentaFecLimite, 2, 2)
				
			INSERT INTO BENDECIDOS.CLIENTE_CUENTA (Cuenta_Nro, Cli_Id) VALUES (@CuentaNro, @CliId)
			
			FETCH NEXT FROM ElCursor INTO @CuentaNro, @CuentaFecCreacion, @CuentaPais, @CliId
		END
	CLOSE ElCursor
	DEALLOCATE ElCursor
END
GO

/* PROCEDIMIENTO QUE MIGRA LAS TARJETAS */
GO
CREATE PROCEDURE MigraTarjetas AS
BEGIN
	DECLARE @TarjetaNro	varchar(16)
	DECLARE @TarjetaNroEncriptado varbinary(255)
	DECLARE @TarjetaFecEmision datetime
	DECLARE @TarjetaFecVenc datetime
	DECLARE @TarjetaCodSeg varchar(3)
	DECLARE @TarjetaUltNum varchar(4)
	DECLARE @TarjetaEmisor numeric(18,0)
	DECLARE @CliId numeric(18,0)

	DECLARE ElCursor CURSOR STATIC LOCAL FORWARD_ONLY FOR
		SELECT DISTINCT Tarjeta_Numero, Tarjeta_Fecha_Emision, Tarjeta_Fecha_Vencimiento, Tarjeta_Codigo_Seg, SUBSTRING(Tarjeta_Numero, 13, 4),
		(SELECT Tarjeta_Emisor_Id FROM BENDECIDOS.EMISOR_TARJETA WHERE BENDECIDOS.EMISOR_TARJETA.Tarjeta_Emisor_Nombre = Tarjeta_Emisor_Descripcion),
		(SELECT C.Cli_Id FROM BENDECIDOS.CLIENTE C WHERE C.Cli_Mail =  M.Cli_Mail) 'Cli_Id'
		FROM [GD1C2015].[gd_esquema].[Maestra] M
		WHERE Tarjeta_Numero IS NOT NULL

	OPEN ElCursor FETCH NEXT FROM ElCursor INTO @TarjetaNro, @TarjetaFecEmision, @TarjetaFecVenc, @TarjetaCodSeg, @TarjetaUltNum, @TarjetaEmisor, @CliId
		WHILE (@@FETCH_STATUS = 0) BEGIN
					
			SET @TarjetaNroEncriptado = dbo.Encriptar(@TarjetaNro)
			INSERT INTO BENDECIDOS.TARJETA (Tarjeta_Nro, Tarjeta_Fec_Emision, Tarjeta_Fec_Venc, Tarjeta_Cod_Seg, Tarjeta_Emisor, Tarjeta_Ult_Dig)
				VALUES (@TarjetaNroEncriptado, @TarjetaFecEmision, @TarjetaFecVenc, @TarjetaCodSeg, @TarjetaEmisor, @TarjetaUltNum)
			
			INSERT INTO BENDECIDOS.CLIENTE_TARJETA (Cli_Id, Tarjeta_Id) VALUES (@CliId, @@IDENTITY)
			
			FETCH NEXT FROM ElCursor INTO @TarjetaNro, @TarjetaFecEmision, @TarjetaFecVenc, @TarjetaCodSeg, @TarjetaUltNum, @TarjetaEmisor, @CliId
		END
	CLOSE ElCursor
	DEALLOCATE ElCursor
END
GO

/*********************************************** EJECUCIÓN DE PROCEDIMIENTOS ************************************************/

EXEC MigraClientes
EXEC MigraCuentas
EXEC MigraTarjetas

/****************************************************** CARGA DE DATOS ******************************************************/

/* TABLA CHEQUE */
INSERT INTO BENDECIDOS.CHEQUE
	SELECT DISTINCT Cheque_Numero, Cheque_Fecha, Cheque_Importe, Banco_Cogido, 
	(SELECT C.Cli_Id FROM BENDECIDOS.CLIENTE C WHERE C.Cli_Mail =  M.Cli_Mail) 'Cli_Id'
	FROM [GD1C2015].[gd_esquema].[Maestra] M
	WHERE Cheque_Numero IS NOT NULL

/* TABLA RETIRO */
INSERT INTO BENDECIDOS.RETIRO
	SELECT DISTINCT Retiro_Codigo, Cuenta_Numero, Retiro_Fecha, Retiro_Importe, Cheque_Numero
	FROM [GD1C2015].[gd_esquema].[Maestra] M
	WHERE Retiro_Codigo IS NOT NULL
	ORDER BY Retiro_Codigo

/* TABLA DEPOSITO */
INSERT INTO BENDECIDOS.DEPOSITO
	SELECT DISTINCT Cuenta_Numero, Deposito_Codigo, 1, Deposito_Fecha, Deposito_Importe,
	(SELECT CT.Tarjeta_Id FROM BENDECIDOS.TARJETA T JOIN BENDECIDOS.CLIENTE_TARJETA CT ON T.Tarjeta_Id = CT.Tarjeta_Id WHERE T.Tarjeta_Nro = M.Tarjeta_Numero) 'Tarjeta_Id'
	FROM [GD1C2015].[gd_esquema].[Maestra] M
	WHERE Deposito_Codigo IS NOT NULL
	ORDER BY Deposito_Codigo

/* TABLA TRANSFERENCIA */
INSERT INTO BENDECIDOS.TRANSFERENCIA
	SELECT DISTINCT Cuenta_Numero, Cuenta_Dest_Numero, Transf_Fecha, Trans_Importe
	FROM [GD1C2015].[gd_esquema].[Maestra] M
	WHERE Trans_Importe IS NOT NULL
		
/************************************************ CREACIÓN DE PROCEDIMIENTOS ************************************************/

/* PROCEDIMIENTO QUE CALCULA EL SALDO DE LAS CUENTAS */
GO
CREATE PROCEDURE CalculaSaldoCuentas AS
BEGIN
	DECLARE @CuentaNro numeric(18,0)
	DECLARE @SaldoCuenta numeric(18,2)
	DECLARE @TotalDepositos numeric(18,2)
	DECLARE @TotalRetiros numeric(18,2)
	DECLARE @TotalTransferencias numeric(18,2)
	DECLARE @TotalTransfRecibidas numeric(18,2)
	
	DECLARE ElCursor CURSOR STATIC LOCAL FORWARD_ONLY FOR
		SELECT Cuenta_Nro
		FROM BENDECIDOS.CUENTA

	OPEN ElCursor FETCH NEXT FROM ElCursor INTO @CuentaNro
		WHILE (@@FETCH_STATUS = 0) BEGIN
			
			SELECT @TotalDepositos = SUM(Deposito_Importe) FROM BENDECIDOS.DEPOSITO WHERE Cuenta_Nro = @CuentaNro
			SELECT @TotalRetiros = SUM(Retiro_Importe) FROM BENDECIDOS.RETIRO WHERE Retiro_Cuenta_Nro = @CuentaNro
			SELECT @TotalTransferencias = SUM(Trans_Importe) FROM BENDECIDOS.TRANSFERENCIA WHERE Trans_Cta_Origen = @CuentaNro
			SELECT @TotalTransfRecibidas = SUM(Trans_Importe) FROM BENDECIDOS.TRANSFERENCIA WHERE Trans_Cta_Destino = @CuentaNro
			
			SET @SaldoCuenta = @TotalDepositos - @TotalRetiros - @TotalTransferencias + @TotalTransfRecibidas
			
			UPDATE BENDECIDOS.CUENTA SET Cuenta_Saldo = @SaldoCuenta WHERE Cuenta_Nro = @CuentaNro
			
			FETCH NEXT FROM ElCursor INTO @CuentaNro
		END
	CLOSE ElCursor
	DEALLOCATE ElCursor
END
GO

/* PROCEDIMIENTO QUE MIGRA FACTURAS */
GO
CREATE PROCEDURE MigraFacturas AS
BEGIN
	DECLARE @FacturaNro numeric(18,0)
	DECLARE @CliId numeric(18,0)
	DECLARE @FacturaId numeric(18,0)
	DECLARE @ItemDetalle [varchar](255) 
	DECLARE @ItemImporte numeric(18,2)
	DECLARE @FacturaFecha datetime
	DECLARE @CantAux numeric(18,0)

	DECLARE ElCursor CURSOR STATIC LOCAL FORWARD_ONLY FOR
		SELECT Factura_Numero, (SELECT C.Cli_Id FROM BENDECIDOS.CLIENTE C WHERE C.Cli_Mail =  M.Cli_Mail) 'Cli_Id', Item_Factura_Descr, Item_Factura_Importe, Factura_Fecha
		FROM [GD1C2015].[gd_esquema].[Maestra] M
		WHERE Factura_Numero IS NOT NULL
		ORDER BY Factura_Numero

	OPEN ElCursor FETCH NEXT FROM ElCursor INTO @FacturaNro, @CliId, @ItemDetalle, @ItemImporte, @FacturaFecha
		WHILE (@@FETCH_STATUS = 0) BEGIN
			
			SELECT @CantAux = COUNT(*) FROM BENDECIDOS.FACTURA_CAB WHERE Factura_Nro = @FacturaNro
			
			IF @CantAux <= 0
				BEGIN
					INSERT INTO BENDECIDOS.FACTURA_CAB (Factura_Nro, Cli_Id) VALUES (@FacturaNro, @CliId)
					SELECT @FacturaId = @@IDENTITY
				END
			ELSE SELECT @FacturaId = Factura_Id FROM BENDECIDOS.FACTURA_CAB WHERE Factura_Nro = @FacturaNro
			
			INSERT INTO BENDECIDOS.FACTURA_DETALLE(Factura_Id, Factura_Fecha, Factura_Item_Desc, Factura_Item_Importe) 
				VALUES (@FacturaId, @FacturaFecha, @ItemDetalle, @ItemImporte)

			FETCH NEXT FROM ElCursor INTO @FacturaNro, @CliId, @ItemDetalle, @ItemImporte, @FacturaFecha
		END
	CLOSE ElCursor
	DEALLOCATE ElCursor
END
GO

/* PROCEDIMIENTO QUE VERIFICA E INHABILITA CUENTAS POR FECHA */
GO
CREATE PROCEDURE InhabilitaCuentasFecha AS
BEGIN
	DECLARE @CuentaNro numeric(18,0)
	DECLARE @CliId numeric(18,0)
	DECLARE @FechaSistema datetime
	
	SET @FechaSistema = '2017-01-01'

	DECLARE ElCursor CURSOR STATIC LOCAL FORWARD_ONLY FOR
		SELECT C.Cuenta_Nro, CC.Cli_Id FROM BENDECIDOS.CUENTA C JOIN BENDECIDOS.CLIENTE_CUENTA CC ON C.Cuenta_Nro = CC.Cuenta_Nro
		WHERE Cuenta_Fec_Limite >= @FechaSistema AND Cuenta_Estado = 2

	OPEN ElCursor FETCH NEXT FROM ElCursor INTO @CuentaNro, @CliId
		WHILE (@@FETCH_STATUS = 0) BEGIN
			
			UPDATE BENDECIDOS.CUENTA SET Cuenta_Estado = 3 WHERE Cuenta_Nro = @CuentaNro
			
			INSERT INTO BENDECIDOS.TRANSACCION (Cli_Id, Cuenta_Nro, Tran_Detalle, Tran_Facturada, Tran_Fecha, Tran_FechaFacturada, Tran_Importe_Facturar, Tran_Importe_Tran)
				VALUES (@CliId, @CuentaNro, 'INHABILITADO X FECHA', 'N', @FechaSistema, NULL, 0, 0)

			FETCH NEXT FROM ElCursor INTO @CuentaNro, @CliId
		END
	CLOSE ElCursor
	DEALLOCATE ElCursor
END
GO

/* PROCEDIMIENTO QUE VERIFICA E INHABILITA CUENTAS POR 5 TRANSACCIONES */
GO
CREATE PROCEDURE InhabilitaCuentasTransacciones AS
BEGIN
	DECLARE @CuentaNro numeric(18,0)
	DECLARE @CliId numeric(18,0)
	DECLARE @Cant numeric(18,0)
	DECLARE @FechaSistema datetime
	
	SET @FechaSistema = '2017-01-01'

	DECLARE ElCursor CURSOR STATIC LOCAL FORWARD_ONLY FOR
		SELECT CC.Cuenta_Nro, CC.Cli_Id FROM BENDECIDOS.CLIENTE_CUENTA CC JOIN BENDECIDOS.CUENTA C ON CC.Cuenta_Nro = C.Cuenta_Nro
		WHERE C.Cuenta_Estado = 2

	OPEN ElCursor FETCH NEXT FROM ElCursor INTO @CuentaNro, @CliId
		WHILE (@@FETCH_STATUS = 0) BEGIN
			
			SELECT @Cant = COUNT(*) FROM BENDECIDOS.TRANSACCION WHERE Cli_Id = @CliId AND Cuenta_Nro = @CuentaNro
			
			IF @Cant >= 5
				BEGIN
					UPDATE BENDECIDOS.CUENTA SET Cuenta_Estado = 3 WHERE Cuenta_Nro = @CuentaNro
					
					INSERT INTO BENDECIDOS.TRANSACCION (Cli_Id, Cuenta_Nro, Tran_Detalle, Tran_Facturada, Tran_Fecha, Tran_FechaFacturada, Tran_Importe_Facturar, Tran_Importe_Tran)
						VALUES (@CliId, @CuentaNro, 'INHABILITADO X 5', 'N', @FechaSistema, NULL, 0, 0)
				END

			FETCH NEXT FROM ElCursor INTO @CuentaNro, @CliId
		END
	CLOSE ElCursor
	DEALLOCATE ElCursor
END
GO

/* PROCEDIMIENTO QUE VERIFICA Y HABILITA CUENTAS CUANDO PAGARON */
GO
CREATE PROCEDURE HabilitaCuentasTransacciones AS
BEGIN
	DECLARE @CuentaNro numeric(18,0)
	DECLARE @CliId numeric(18,0)
	DECLARE @Cant numeric(18,0)

	DECLARE ElCursor CURSOR STATIC LOCAL FORWARD_ONLY FOR
		SELECT CC.Cuenta_Nro, CC.Cli_Id FROM BENDECIDOS.CLIENTE_CUENTA CC JOIN BENDECIDOS.CUENTA C ON CC.Cuenta_Nro = C.Cuenta_Nro
		WHERE C.Cuenta_Estado = 3

	OPEN ElCursor FETCH NEXT FROM ElCursor INTO @CuentaNro, @CliId
		WHILE (@@FETCH_STATUS = 0) BEGIN
			
			SELECT @Cant = COUNT(*) FROM BENDECIDOS.TRANSACCION WHERE Cli_Id = @CliId AND Cuenta_Nro = @CuentaNro
			
			IF @Cant < 5
				UPDATE BENDECIDOS.CUENTA SET Cuenta_Estado = 2 WHERE Cuenta_Nro = @CuentaNro

			FETCH NEXT FROM ElCursor INTO @CuentaNro, @CliId
		END
	CLOSE ElCursor
	DEALLOCATE ElCursor
END
GO

/*********************************************** EJECUCIÓN DE PROCEDIMIENTOS ************************************************/

EXEC CalculaSaldoCuentas
EXEC MigraFacturas

/*************************************************** BORRADO DE TABLAS *****************************************************/
/*
DROP TABLE BENDECIDOS.TRANSACCION
DROP TABLE BENDECIDOS.FACTURA_DETALLE
DROP TABLE BENDECIDOS.FACTURA_CAB
DROP TABLE BENDECIDOS.RETIRO
DROP TABLE BENDECIDOS.CHEQUE
DROP TABLE BENDECIDOS.BANCO
DROP TABLE BENDECIDOS.TRANSFERENCIA
DROP TABLE BENDECIDOS.DEPOSITO
DROP TABLE BENDECIDOS.CLIENTE_CUENTA
DROP TABLE BENDECIDOS.CUENTA
DROP TABLE BENDECIDOS.ESTADO_CUENTA
DROP TABLE BENDECIDOS.TIPO_CUENTA
DROP TABLE BENDECIDOS.CLIENTE_TARJETA
DROP TABLE BENDECIDOS.TARJETA
DROP TABLE BENDECIDOS.EMISOR_TARJETA
DROP TABLE BENDECIDOS.LOG_LOGIN
DROP TABLE BENDECIDOS.USUARIO_ROL
DROP TABLE BENDECIDOS.USUARIO
DROP TABLE BENDECIDOS.CLIENTE_ID
DROP TABLE BENDECIDOS.CLIENTE
DROP TABLE BENDECIDOS.TIPO_DOCUMENTO
DROP TABLE BENDECIDOS.MONEDA
DROP TABLE BENDECIDOS.PAIS
DROP TABLE BENDECIDOS.ROL_FUNCIONALIDAD
DROP TABLE BENDECIDOS.FUNCIONALIDAD
DROP TABLE BENDECIDOS.ROL
DROP SCHEMA BENDECIDOS
DROP PROCEDURE MigraClientes
DROP PROCEDURE MigraCuentas
DROP PROCEDURE MigraTarjetas
DROP PROCEDURE CalculaSaldoCuentas
DROP PROCEDURE MigraFacturas
DROP PROCEDURE InhabilitaCuentasFecha
DROP PROCEDURE InhabilitaCuentasTransacciones
DROP PROCEDURE HabilitaCuentasTransacciones
DROP FUNCTION Encriptar
DROP FUNCTION Desencriptar
*/