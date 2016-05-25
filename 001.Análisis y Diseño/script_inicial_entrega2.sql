IF (SELECT name FROM master.dbo.sysdatabases WHERE name = 'GD1C2016') IS NULL
BEGIN
EXEC('CREATE DATABASE GD1C2016')
END
GO

USE GD1C2016;
GO

IF (SELECT name FROM sys.schemas WHERE name = 'TPGDD') IS NULL
BEGIN
EXEC ('CREATE SCHEMA TPGDD AUTHORIZATION dbo')
END
GO


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Calificaciones_Compras') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Calificaciones DROP CONSTRAINT FK_Calificaciones_Compras
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Clasificaciones_Clientes') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Calificaciones DROP CONSTRAINT FK_Clasificaciones_Clientes
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Clientes_Usuarios') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Clientes DROP CONSTRAINT FK_Clientes_Usuarios
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Compra_Clientes') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Compras DROP CONSTRAINT FK_Compra_Clientes
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Compra_Publicaciones') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Compras DROP CONSTRAINT FK_Compra_Publicaciones
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_ComprasInmediatas_Publicaciones') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE ComprasInmediatas DROP CONSTRAINT FK_ComprasInmediatas_Publicaciones
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Empresas_Usuarios') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Empresas DROP CONSTRAINT FK_Empresas_Usuarios
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Facturaciones_FormasPago') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Facturaciones DROP CONSTRAINT FK_Facturaciones_FormasPago
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Facturaciones_Usuarios') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Facturaciones DROP CONSTRAINT FK_Facturaciones_Usuarios
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Items_Compras') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Items DROP CONSTRAINT FK_Items_Compras
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Items_Facturaciones') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Items DROP CONSTRAINT FK_Items_Facturaciones
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Ofertas_Subastas') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Ofertas DROP CONSTRAINT FK_Ofertas_Subastas
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Ofertas_Clientes') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Ofertas DROP CONSTRAINT FK_Ofertas_Clientes
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Preguntas_Publicaciones') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Preguntas DROP CONSTRAINT FK_Preguntas_Publicaciones
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_PublicacionCostos_Facturaciones') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE PublicacionCostos DROP CONSTRAINT FK_PublicacionCostos_Facturaciones
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_PublicacionCostos_Publicaciones') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE PublicacionCostos DROP CONSTRAINT FK_PublicacionCostos_Publicaciones
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Publicaciones_Estados') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Publicaciones DROP CONSTRAINT FK_Publicaciones_Estados
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Publicaciones_Visibilidades') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Publicaciones DROP CONSTRAINT FK_Publicaciones_Visibilidades
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Publicaciones_Rubros') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Publicaciones DROP CONSTRAINT FK_Publicaciones_Rubros
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Publicaciones_Usuarios') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Publicaciones DROP CONSTRAINT FK_Publicaciones_Usuarios
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_RolesFuncionalidades_Funcionalidades') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE RolesFuncionalidades DROP CONSTRAINT FK_RolesFuncionalidades_Funcionalidades
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_RolesFuncionalidades_Roles') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE RolesFuncionalidades DROP CONSTRAINT FK_RolesFuncionalidades_Roles
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Subastas_Publicaciones') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Subastas DROP CONSTRAINT FK_Subastas_Publicaciones
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Usuarios_Localidades') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Usuarios DROP CONSTRAINT FK_Usuarios_Localidades
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_UsuariosRoles_Roles') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE UsuariosRoles DROP CONSTRAINT FK_UsuariosRoles_Roles
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_UsuariosRoles_Usuarios') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE UsuariosRoles DROP CONSTRAINT FK_UsuariosRoles_Usuarios
;



IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Calificaciones') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Calificaciones
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Clientes') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Clientes
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Comisiones') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Comisiones
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Compras') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Compras
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('ComprasInmediatas') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE ComprasInmediatas
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Empresas') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Empresas
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Estados') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Estados
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Facturaciones') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Facturaciones
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FormasPago') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE FormasPago
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Funcionalidades') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Funcionalidades
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Items') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Items
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Localidades') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Localidades
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Ofertas') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Ofertas
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Preguntas') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Preguntas
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('PublicacionCostos') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE PublicacionCostos
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Publicaciones') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Publicaciones
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Roles') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Roles
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('RolesFuncionalidades') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE RolesFuncionalidades
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Rubros') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Rubros
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Subastas') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Subastas
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Usuarios') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Usuarios
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('UsuariosRoles') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE UsuariosRoles
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Visibilidades') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Visibilidades
;


CREATE TABLE Calificaciones ( 
	codigoCalificacion numeric(18) identity(1,1)  NOT NULL,
	idCompra int NOT NULL,
	calificador int,
	cantEstrellas numeric(18),
	observacion nvarchar(255)
)
;

CREATE TABLE Clientes ( 
	idCliente int identity(1,1)  NOT NULL,
	idUsuario int,
	nombre nvarchar(255),
	apellido nvarchar(255),
	fechaNacimiento date,
	nroDNI numeric(18,2),
	tipoDocumento int,
	tipoCliente nvarchar(255)
)
;

CREATE TABLE Comisiones ( 
	idComision int identity(1,1)  NOT NULL,
	cTipoPublicacion numeric(10,2)
)
;

CREATE TABLE Compras ( 
	idCompra int identity(1,1)  NOT NULL,
	idPublicacion numeric(18),
	idClientes int,
	fecha datetime,
	cantidad numeric(18)
)
;

CREATE TABLE ComprasInmediatas ( 
	idCompraInmediata int identity(1,1)  NOT NULL,
	idPublicacion numeric(18) NOT NULL,
	stockDisponible int DEFAULT 1 NOT NULL,
	unidadesVendidas int DEFAULT 0 NOT NULL
)
;

CREATE TABLE Empresas ( 
	idEmpresa int identity(1,1)  NOT NULL,
	idUsuario int NOT NULL,
	razonSocial nvarchar(255),
	cuit nvarchar(50),
	nombreContacto nvarchar(255),
	nombreRubro nvarchar(255),
	ciudad nvarchar(255),
	rubro nvarchar(255)
)
;

CREATE TABLE Estados ( 
	idEstado int identity(1,1)  NOT NULL,
	descripcion nvarchar(255)
)
;

CREATE TABLE Facturaciones ( 
	nroFactura numeric(18) identity(1,1)  NOT NULL,
	idFormaPago int,
	idUsuario int,
	codPublicacion numeric(18),
	fecha date,
	monto numeric(10,2),
	total numeric(18,2),
	cTipoPublicacion numeric(10,2)
)
;

CREATE TABLE FormasPago ( 
	idFormaPago int identity(1,1)  NOT NULL,
	descripcion nvarchar(255)
)
;

CREATE TABLE Funcionalidades ( 
	idFuncionalidad int identity(1,1)  NOT NULL,
	nombre nvarchar(255) NOT NULL,
	descripcion nvarchar(255)
)
;

CREATE TABLE Items ( 
	idItem int identity(1,1)  NOT NULL,
	nroFactura numeric(18) NOT NULL,
	idCompra int NOT NULL,
	nombre nvarchar(255),
	cantidad numeric(18),
	montoItem numeric(18,2),
	comProdVendido numeric(10,2),
	cEnvioProducto numeric(10,2)
)
;

CREATE TABLE Localidades ( 
	codLocalidad int identity(1,1)  NOT NULL,
	descripcion nvarchar(255)
)
;

CREATE TABLE Ofertas ( 
	idOferta int identity(1,1)  NOT NULL,
	idCliente int NOT NULL,
	idSubasta int,
	fecha datetime,
	monto numeric(18,2)
)
;

CREATE TABLE Preguntas ( 
	idPregunta int identity(1,1)  NOT NULL,
	codPublicacion numeric(18),
	preguntaRealizada nvarchar(255)
)
;

CREATE TABLE PublicacionCostos ( 
	idCosto int identity(1,1)  NOT NULL,
	idFactura numeric(18) NOT NULL,
	idPublicacion numeric(18) NOT NULL,
	monto numeric(10,2)
)
;

CREATE TABLE Publicaciones ( 
	pCodigo numeric(18) identity(1,1)  NOT NULL,
	codVisibilidad numeric(18),
	codRubro int NOT NULL,
	idEstado int,
	idUsuario int,
	pDescripcion nvarchar(255),
	pStock numeric(18),
	pFecha datetime,
	pFecha_Venc datetime,
	pPrecio numeric(18,2),
	pCosto bigint,
	pEnvio bit DEFAULT 1,
	pPreguntar bit DEFAULT 1
)
;

CREATE TABLE Roles ( 
	idRol int identity(1,1)  NOT NULL,
	nombre nvarchar(255),
	habilitado bit DEFAULT 1 NOT NULL
)
;

CREATE TABLE RolesFuncionalidades ( 
	idRol int NOT NULL,
	idFuncionalidad int NOT NULL
)
;

CREATE TABLE Rubros ( 
	codRubro int identity(1,1)  NOT NULL,
	descripcionCorta nvarchar(255),
	descripcionLarga nvarchar(255)
)
;

CREATE TABLE Subastas ( 
	idSubasta int identity(1,1)  NOT NULL,
	idPublicacion numeric(18) NOT NULL,
	valorActual bigint NOT NULL
)
;

CREATE TABLE Usuarios ( 
	idUsuario int identity(1,1)  NOT NULL,
	codLocalidad int,
	password nvarchar(255) NOT NULL,
	username nvarchar(255) NOT NULL,
	flagHabilitado bit DEFAULT 1,
	tipoUsuario nvarchar(255),
	mail nvarchar(255),
	telefono nvarchar(255),
	nroPiso numeric(18),
	nroDpto nvarchar(50),
	fechaCreacion datetime,
	nroCalle numeric(18),
	domCalle nvarchar(255),
	codPostal nvarchar(50),
	intentosFallidos int DEFAULT 0 NOT NULL,
	reputacion int
)
;

CREATE TABLE UsuariosRoles ( 
	idUsuario int NOT NULL,
	idRol int NOT NULL
)
;

CREATE TABLE Visibilidades ( 
	Codigo numeric(18) NOT NULL,
	descripcion nvarchar(255),
	precio numeric(18,2),
	porcentaje numeric(18,2),
	Envio numeric(10,2),
	gratuita bit DEFAULT 1 NOT NULL
)
;


ALTER TABLE Calificaciones ADD CONSTRAINT PK_Clasificaciones 
	PRIMARY KEY CLUSTERED (codigoCalificacion)
;

ALTER TABLE Clientes ADD CONSTRAINT PK_Clientes 
	PRIMARY KEY CLUSTERED (idCliente)
;

ALTER TABLE Comisiones ADD CONSTRAINT PK_Comisiones 
	PRIMARY KEY CLUSTERED (idComision)
;

ALTER TABLE Compras ADD CONSTRAINT PK_Compra 
	PRIMARY KEY CLUSTERED (idCompra)
;

ALTER TABLE ComprasInmediatas ADD CONSTRAINT PK_ComprasInmediatas 
	PRIMARY KEY CLUSTERED (idCompraInmediata)
;

ALTER TABLE Empresas ADD CONSTRAINT PK_Empresas 
	PRIMARY KEY CLUSTERED (idEmpresa)
;

ALTER TABLE Estados ADD CONSTRAINT PK_Estados 
	PRIMARY KEY CLUSTERED (idEstado)
;

ALTER TABLE Facturaciones ADD CONSTRAINT PK_Facturaciones 
	PRIMARY KEY CLUSTERED (nroFactura)
;

ALTER TABLE FormasPago ADD CONSTRAINT PK_FormasPago 
	PRIMARY KEY CLUSTERED (idFormaPago)
;

ALTER TABLE Funcionalidades ADD CONSTRAINT PK_Funcionalidades 
	PRIMARY KEY CLUSTERED (idFuncionalidad)
;

ALTER TABLE Items ADD CONSTRAINT PK_Items 
	PRIMARY KEY CLUSTERED (idItem)
;

ALTER TABLE Localidades ADD CONSTRAINT PK_Localidades 
	PRIMARY KEY CLUSTERED (codLocalidad)
;

ALTER TABLE Ofertas ADD CONSTRAINT PK_Oferta 
	PRIMARY KEY CLUSTERED (idOferta)
;

ALTER TABLE Preguntas ADD CONSTRAINT PK_Preguntas 
	PRIMARY KEY CLUSTERED (idPregunta)
;

ALTER TABLE PublicacionCostos ADD CONSTRAINT PK_PublicacionCostos 
	PRIMARY KEY CLUSTERED (idCosto)
;

ALTER TABLE Publicaciones ADD CONSTRAINT PK_Publicaciones 
	PRIMARY KEY CLUSTERED (pCodigo)
;

ALTER TABLE Roles ADD CONSTRAINT PK_Roles 
	PRIMARY KEY CLUSTERED (idRol)
;

ALTER TABLE RolesFuncionalidades ADD CONSTRAINT PK_RolesFuncionalidades 
	PRIMARY KEY CLUSTERED (idRol, idFuncionalidad)
;

ALTER TABLE Rubros ADD CONSTRAINT PK_Rubros 
	PRIMARY KEY CLUSTERED (codRubro)
;

ALTER TABLE Subastas ADD CONSTRAINT PK_Subastas 
	PRIMARY KEY CLUSTERED (idSubasta)
;

ALTER TABLE Usuarios ADD CONSTRAINT PK_Usuarios 
	PRIMARY KEY CLUSTERED (idUsuario)
;

ALTER TABLE UsuariosRoles ADD CONSTRAINT PK_UsuariosRoles 
	PRIMARY KEY CLUSTERED (idUsuario, idRol)
;

ALTER TABLE Visibilidades ADD CONSTRAINT PK_Visibilidades 
	PRIMARY KEY CLUSTERED (Codigo)
;


ALTER TABLE Calificaciones
	ADD CONSTRAINT UQ_Calificaciones_codigoCalificacion UNIQUE (codigoCalificacion)
;

CREATE INDEX IDX_calificacionPK
ON Calificaciones (codigoCalificacion ASC)
;

CREATE INDEX IDX_calificacion_Calificador
ON Calificaciones (calificador ASC)
;

CREATE INDEX IDX_idCompra
ON Calificaciones (idCompra ASC)
;

ALTER TABLE Clientes
	ADD CONSTRAINT UQ_Clientes_idUsuario UNIQUE (idUsuario)
;

ALTER TABLE Clientes
	ADD CONSTRAINT UQ_Clientes_idCliente UNIQUE (idCliente)
;

CREATE INDEX IDX_Clientes_nombre
ON Clientes (nombre ASC)
;

CREATE INDEX IDX_Clientes_apellido
ON Clientes (apellido ASC)
;

CREATE INDEX IDX_Clientes_nroDNI_tipoDocumento
ON Clientes (nroDNI ASC, tipoDocumento ASC)
;

ALTER TABLE Clientes
	ADD CONSTRAINT UQ_Clientes_nroDni_tipoDocumento UNIQUE (nroDNI, tipoDocumento)
;

CREATE INDEX IDX_Clientes_Clientes_usuarios
ON Clientes (idUsuario ASC)
;

CREATE INDEX IDX_Clientes_PK
ON Clientes (idCliente ASC)
;

ALTER TABLE Comisiones
	ADD CONSTRAINT UQ_Comisiones_idComision UNIQUE (idComision)
;

CREATE INDEX IDX_indice_comision
ON Comisiones (idComision ASC)
;

ALTER TABLE Compras
	ADD CONSTRAINT UQ_Compra_idCompra UNIQUE (idCompra)
;

CREATE INDEX IDX_comprasPK
ON Compras (idCompra ASC)
;

CREATE INDEX IDX_compras_publicaciones
ON Compras (idPublicacion ASC)
;

CREATE INDEX IDX_compras_clientes
ON Compras (idClientes ASC)
;

ALTER TABLE ComprasInmediatas
	ADD CONSTRAINT UQ_ComprasInmediatas_idCompraInmediata UNIQUE (idCompraInmediata)
;

CREATE INDEX IDX_ComprasInmediataPK
ON ComprasInmediatas (idCompraInmediata ASC)
;

CREATE INDEX IDX_ComprasInmediata_idPublicacion
ON ComprasInmediatas (idPublicacion ASC)
;

ALTER TABLE Empresas
	ADD CONSTRAINT UQ_Empresas_idEmpresa UNIQUE (idEmpresa)
;

ALTER TABLE Empresas
	ADD CONSTRAINT UQ_Empresas_idUsuario UNIQUE (idUsuario)
;

ALTER TABLE Empresas
	ADD CONSTRAINT UQ_Empresas_RazonSocial_Cuit UNIQUE (razonSocial, cuit)
;

CREATE INDEX IDX_indice_empresas
ON Empresas (idEmpresa ASC)
;

CREATE INDEX IDX_Empresas_RazonSocial_Cuit
ON Empresas (razonSocial ASC, cuit ASC)
;

CREATE INDEX IDX_indice_idUsuario
ON Empresas (idUsuario ASC)
;

ALTER TABLE Estados
	ADD CONSTRAINT UQ_Estados_idEstado UNIQUE (idEstado)
;

CREATE INDEX IDX_Estados
ON Estados (idEstado ASC)
;

ALTER TABLE Facturaciones
	ADD CONSTRAINT UQ_Facturaciones_nroFactura UNIQUE (nroFactura)
;

CREATE INDEX IDX_FacturacionesPK
ON Facturaciones (nroFactura ASC)
;

CREATE INDEX IDX_Facturaciones_idFormaPago
ON Facturaciones (idFormaPago ASC)
;

CREATE INDEX IDX_Facturaciones_codPublicacion
ON Facturaciones (codPublicacion ASC)
;

CREATE INDEX IDX_Facturaciones_idUsuario
ON Facturaciones (idUsuario ASC)
;

ALTER TABLE FormasPago
	ADD CONSTRAINT UQ_FormasPago_idFormaPago UNIQUE (idFormaPago)
;

CREATE INDEX IDX_FormaPagoPK
ON FormasPago (idFormaPago ASC)
;

ALTER TABLE Funcionalidades
	ADD CONSTRAINT UQ_Funcionalidades_nombre UNIQUE (nombre)
;

ALTER TABLE Funcionalidades
	ADD CONSTRAINT UQ_Funcionalidades_idFuncionalidad UNIQUE (idFuncionalidad)
;

CREATE INDEX IDX_funcionalidadesPK
ON Funcionalidades (idFuncionalidad ASC)
;

ALTER TABLE Items
	ADD CONSTRAINT UQ_Items_idCompra UNIQUE (idCompra)
;

ALTER TABLE Items
	ADD CONSTRAINT UQ_Items_idItem UNIQUE (idItem)
;

CREATE INDEX IDX_itemsPK
ON Items (idItem ASC)
;

CREATE INDEX IDX_items_nroFactura
ON Items (nroFactura ASC)
;

ALTER TABLE Localidades
	ADD CONSTRAINT UQ_Localidades_codLocalidad UNIQUE (codLocalidad)
;

CREATE INDEX IDX_Localidades
ON Localidades (codLocalidad ASC)
;

ALTER TABLE Ofertas
	ADD CONSTRAINT UQ_Oferta_idOferta UNIQUE (idOferta)
;

CREATE INDEX IDX_ofertaPK
ON Ofertas (idOferta ASC)
;

CREATE INDEX IDX_oferta_idCliente
ON Ofertas (idCliente ASC)
;

CREATE INDEX IDX_oferta_idSubasta
ON Ofertas (idSubasta ASC)
;

ALTER TABLE Preguntas
	ADD CONSTRAINT UQ_Preguntas_idPregunta UNIQUE (idPregunta)
;

ALTER TABLE PublicacionCostos
	ADD CONSTRAINT UQ_PublicacionCostos_idCosto UNIQUE (idCosto)
;

ALTER TABLE PublicacionCostos
	ADD CONSTRAINT UQ_PublicacionCostos_idPublicacion UNIQUE (idPublicacion)
;

CREATE INDEX IDX_PublicacionCostosPK
ON PublicacionCostos (idCosto ASC)
;

CREATE INDEX IDX_ComprasInmediata_idFactura
ON PublicacionCostos (idFactura ASC)
;

CREATE INDEX IDX_ComprasInmediata_idPublicacion
ON PublicacionCostos (idPublicacion ASC)
;

ALTER TABLE Publicaciones
	ADD CONSTRAINT UQ_Publicaciones_pCodigo UNIQUE (pCodigo)
;

CREATE UNIQUE INDEX IDX_publicacionesPK
ON Publicaciones (pCodigo ASC)
;

CREATE INDEX IDX_publicaciones_pDescripcion
ON Publicaciones (pDescripcion ASC)
;

CREATE INDEX IDX_publicaciones_Estados
ON Publicaciones (idEstado ASC)
;

CREATE INDEX IDX_publicaciones_visibilidad
ON Publicaciones (codVisibilidad ASC)
;

CREATE INDEX IDX_publicaciones_usuarios
ON Publicaciones (idUsuario ASC)
;

ALTER TABLE Roles
	ADD CONSTRAINT UQ_Roles_nombre UNIQUE (nombre)
;

ALTER TABLE Roles
	ADD CONSTRAINT UQ_Roles_idRol UNIQUE (idRol)
;

CREATE INDEX IDX_indice_roles
ON Roles (idRol ASC)
;

CREATE INDEX IDX_indice_nombre
ON Roles (nombre ASC)
;

CREATE INDEX IDX_rolesFuncionalidadesPK
ON RolesFuncionalidades (idRol ASC, idFuncionalidad ASC)
;

ALTER TABLE RolesFuncionalidades
	ADD CONSTRAINT UQ_Funcionalidades_idRol_IdFuncionalidad UNIQUE (idRol, idFuncionalidad)
;

ALTER TABLE Rubros
	ADD CONSTRAINT UQ_Rubros_codRubro UNIQUE (codRubro)
;

CREATE INDEX IDX_Rubros
ON Rubros (codRubro ASC)
;

ALTER TABLE Subastas
	ADD CONSTRAINT UQ_Subastas_idSubasta UNIQUE (idSubasta)
;

CREATE INDEX IDX_SubastaPK
ON Subastas (idSubasta ASC)
;

CREATE INDEX IDX_subasta_idPublicacion
ON Subastas (idPublicacion ASC)
;

ALTER TABLE Usuarios
	ADD CONSTRAINT UQ_Usuarios_username UNIQUE (username)
;

ALTER TABLE Usuarios
	ADD CONSTRAINT UQ_Usuarios_idUsuario UNIQUE (idUsuario)
;

CREATE INDEX IDX_indice_Usuarios
ON Usuarios (idUsuario ASC)
;

CREATE INDEX IDX_usuarios_username
ON Usuarios (username ASC)
;

CREATE INDEX IDX_Usuarios_Localidades
ON Usuarios (codLocalidad ASC)
;

ALTER TABLE UsuariosRoles
	ADD CONSTRAINT UQ_IdUsuario_IdRol UNIQUE (idUsuario, idRol)
;

CREATE INDEX IDX_UsuariosRoles
ON UsuariosRoles (idUsuario ASC, idRol ASC)
;

ALTER TABLE Visibilidades
	ADD CONSTRAINT UQ_Visibilidades_Codigo UNIQUE (Codigo)
;

CREATE INDEX IDX_visibilidadesPK
ON Visibilidades (Codigo ASC)
;


ALTER TABLE Calificaciones ADD CONSTRAINT FK_Calificaciones_Compras 
	FOREIGN KEY (idCompra) REFERENCES Compras (idCompra)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Calificaciones ADD CONSTRAINT FK_Clasificaciones_Clientes 
	FOREIGN KEY (calificador) REFERENCES Clientes (idCliente)
;

ALTER TABLE Clientes ADD CONSTRAINT FK_Clientes_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Compras ADD CONSTRAINT FK_Compra_Clientes 
	FOREIGN KEY (idClientes) REFERENCES Clientes (idCliente)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Compras ADD CONSTRAINT FK_Compra_Publicaciones 
	FOREIGN KEY (idPublicacion) REFERENCES Publicaciones (pCodigo)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE ComprasInmediatas ADD CONSTRAINT FK_ComprasInmediatas_Publicaciones 
	FOREIGN KEY (idPublicacion) REFERENCES Publicaciones (pCodigo)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Empresas ADD CONSTRAINT FK_Empresas_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Facturaciones ADD CONSTRAINT FK_Facturaciones_FormasPago 
	FOREIGN KEY (idFormaPago) REFERENCES FormasPago (idFormaPago)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Facturaciones ADD CONSTRAINT FK_Facturaciones_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Items ADD CONSTRAINT FK_Items_Compras 
	FOREIGN KEY (idCompra) REFERENCES Compras (idCompra)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Items ADD CONSTRAINT FK_Items_Facturaciones 
	FOREIGN KEY (nroFactura) REFERENCES Facturaciones (nroFactura)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Ofertas ADD CONSTRAINT FK_Ofertas_Subastas 
	FOREIGN KEY (idSubasta) REFERENCES Subastas (idPublicacion)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Ofertas ADD CONSTRAINT FK_Ofertas_Clientes 
	FOREIGN KEY (idCliente) REFERENCES Clientes (idCliente)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Preguntas ADD CONSTRAINT FK_Preguntas_Publicaciones 
	FOREIGN KEY (codPublicacion) REFERENCES Publicaciones (pCodigo)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE PublicacionCostos ADD CONSTRAINT FK_PublicacionCostos_Facturaciones 
	FOREIGN KEY (idFactura) REFERENCES Facturaciones (nroFactura)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE PublicacionCostos ADD CONSTRAINT FK_PublicacionCostos_Publicaciones 
	FOREIGN KEY (idPublicacion) REFERENCES Publicaciones (pCodigo)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Estados 
	FOREIGN KEY (idEstado) REFERENCES Estados (idEstado)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Visibilidades 
	FOREIGN KEY (codVisibilidad) REFERENCES Visibilidades (Codigo)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Rubros 
	FOREIGN KEY (codRubro) REFERENCES Rubros (codRubro)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE RolesFuncionalidades ADD CONSTRAINT FK_RolesFuncionalidades_Funcionalidades 
	FOREIGN KEY (idFuncionalidad) REFERENCES Funcionalidades (idFuncionalidad)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE RolesFuncionalidades ADD CONSTRAINT FK_RolesFuncionalidades_Roles 
	FOREIGN KEY (idRol) REFERENCES Roles (idRol)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Subastas ADD CONSTRAINT FK_Subastas_Publicaciones 
	FOREIGN KEY (idPublicacion) REFERENCES Publicaciones (pCodigo)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Usuarios ADD CONSTRAINT FK_Usuarios_Localidades 
	FOREIGN KEY (codLocalidad) REFERENCES Localidades (codLocalidad)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE UsuariosRoles ADD CONSTRAINT FK_UsuariosRoles_Roles 
	FOREIGN KEY (idRol) REFERENCES Roles (idRol)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE UsuariosRoles ADD CONSTRAINT FK_UsuariosRoles_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
	ON DELETE CASCADE ON UPDATE CASCADE
;
