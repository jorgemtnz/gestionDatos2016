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
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Clasificaciones_Clientes') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Calificaciones DROP CONSTRAINT FK_Clasificaciones_Clientes
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Clientes_Usuarios') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Clientes DROP CONSTRAINT FK_Clientes_Usuarios
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Compra_Clientes') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Compras DROP CONSTRAINT FK_Compra_Clientes
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Compra_Publicaciones') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Compras DROP CONSTRAINT FK_Compra_Publicaciones
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_ComprasInmediatas_Publicaciones') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE ComprasInmediatas DROP CONSTRAINT FK_ComprasInmediatas_Publicaciones
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Empresas_Usuarios') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Empresas DROP CONSTRAINT FK_Empresas_Usuarios
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Facturaciones_FormasPago') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Facturaciones DROP CONSTRAINT FK_Facturaciones_FormasPago
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Facturaciones_Usuarios') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Facturaciones DROP CONSTRAINT FK_Facturaciones_Usuarios
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Items_Compras') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Items DROP CONSTRAINT FK_Items_Compras
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Items_Facturaciones') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Items DROP CONSTRAINT FK_Items_Facturaciones
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Ofertas_Subastas') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Ofertas DROP CONSTRAINT FK_Ofertas_Subastas
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Ofertas_Clientes') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Ofertas DROP CONSTRAINT FK_Ofertas_Clientes
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Preguntas_Publicaciones') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Preguntas DROP CONSTRAINT FK_Preguntas_Publicaciones
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_PublicacionCostos_Facturaciones') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE PublicacionCostos DROP CONSTRAINT FK_PublicacionCostos_Facturaciones
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_PublicacionCostos_Publicaciones') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE PublicacionCostos DROP CONSTRAINT FK_PublicacionCostos_Publicaciones
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Publicaciones_Estados') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Publicaciones DROP CONSTRAINT FK_Publicaciones_Estados
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Publicaciones_Visibilidades') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Publicaciones DROP CONSTRAINT FK_Publicaciones_Visibilidades
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Publicaciones_Rubros') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Publicaciones DROP CONSTRAINT FK_Publicaciones_Rubros
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Publicaciones_Usuarios') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Publicaciones DROP CONSTRAINT FK_Publicaciones_Usuarios
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_RolesFuncionalidades_Funcionalidades') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE RolesFuncionalidades DROP CONSTRAINT FK_RolesFuncionalidades_Funcionalidades
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_RolesFuncionalidades_Roles') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE RolesFuncionalidades DROP CONSTRAINT FK_RolesFuncionalidades_Roles
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Subastas_Publicaciones') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Subastas DROP CONSTRAINT FK_Subastas_Publicaciones
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Usuarios_Localidades') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE Usuarios DROP CONSTRAINT FK_Usuarios_Localidades
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_UsuariosRoles_Roles') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE UsuariosRoles DROP CONSTRAINT FK_UsuariosRoles_Roles
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_UsuariosRoles_Usuarios') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE UsuariosRoles DROP CONSTRAINT FK_UsuariosRoles_Usuarios
GO



IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Calificaciones') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Calificaciones
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Clientes') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Clientes
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Compras') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Compras
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('ComprasInmediatas') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE ComprasInmediatas
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Empresas') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Empresas
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Estados') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Estados
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Facturaciones') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Facturaciones
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FormasPago') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE FormasPago
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Funcionalidades') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Funcionalidades
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Items') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Items
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Localidades') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Localidades
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Ofertas') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Ofertas
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Preguntas') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Preguntas
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('PublicacionCostos') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE PublicacionCostos
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Publicaciones') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Publicaciones
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Roles') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Roles
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('RolesFuncionalidades') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE RolesFuncionalidades
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Rubros') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Rubros
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Subastas') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Subastas
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Usuarios') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Usuarios
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('UsuariosRoles') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE UsuariosRoles
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Visibilidades') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Visibilidades
GO


CREATE TABLE Calificaciones ( 
	codigoCalificacion numeric(18) identity(1,1)  NOT NULL,
	idCompra int NOT NULL,
	calificador int NULL,
	cantEstrellas numeric(18) NULL,
	observacion nvarchar(255) NULL
)
GO

CREATE TABLE Clientes ( 
	idCliente int identity(1,1)  NOT NULL,
	idUsuario int NULL,
	nombre nvarchar(255) NULL,
	apellido nvarchar(255) NULL,
	fechaNacimiento date NULL,
	nroDNI numeric(18,2) NULL,
	tipoDocumento int NULL,
	tipoCliente nvarchar(255) NULL
)
GO

CREATE TABLE Compras ( 
	idCompra int identity(1,1)  NOT NULL,
	idPublicacion numeric(18) NULL,
	idClientes int NULL,
	fecha datetime NULL,
	cantidad numeric(18) NULL
)
GO

CREATE TABLE ComprasInmediatas ( 
	idCompraInmediata int identity(1,1)  NOT NULL,
	idPublicacion numeric(18) NOT NULL,
	stockDisponible int DEFAULT 1 NOT NULL,
	unidadesVendidas int DEFAULT 0 NOT NULL
)
GO

CREATE TABLE Empresas ( 
	idEmpresa int identity(1,1)  NOT NULL,
	idUsuario int NOT NULL,
	razonSocial nvarchar(255) NULL,
	cuit nvarchar(50) NULL,
	nombreContacto nvarchar(255) NULL,
	nombreRubro nvarchar(255) NULL,
	ciudad nvarchar(255) NULL,
	rubro nvarchar(255) NULL
)
GO

CREATE TABLE Estados ( 
	idEstado int identity(1,1)  NOT NULL,
	descripcion nvarchar(255) NULL
)
GO

CREATE TABLE Facturaciones ( 
	nroFactura numeric(18) identity(1,1)  NOT NULL,
	idFormaPago int NULL,
	idUsuario int NULL,
	codPublicacion numeric(18) NULL,
	fecha date NULL,
	monto numeric(10,2) NULL,
	total numeric(18,2) NULL,
	cTipoPublicacion numeric(10,2) NULL
)
GO

CREATE TABLE FormasPago ( 
	idFormaPago int identity(1,1)  NOT NULL,
	descripcion nvarchar(255) NULL
)
GO

CREATE TABLE Funcionalidades ( 
	idFuncionalidad int identity(1,1)  NOT NULL,
	nombre nvarchar(255) NOT NULL,
	descripcion nvarchar(255) NULL
)
GO

CREATE TABLE Items ( 
	idItem int identity(1,1)  NOT NULL,
	nroFactura numeric(18) NOT NULL,
	idCompra int NOT NULL,
	nombre nvarchar(255) NULL,
	cantidad numeric(18) NULL,
	montoItem numeric(18,2) NULL,
	comProdVendido numeric(10,2) NULL,
	cEnvioProducto numeric(10,2) NULL
)
GO

CREATE TABLE Localidades ( 
	codLocalidad int identity(1,1)  NOT NULL,
	descripcion nvarchar(255) NULL
)
GO

CREATE TABLE Ofertas ( 
	idOferta int identity(1,1)  NOT NULL,
	idCliente int NOT NULL,
	idSubasta int NULL,
	fecha datetime NULL,
	monto numeric(18,2) NULL
)
GO

CREATE TABLE Preguntas ( 
	idPregunta int identity(1,1)  NOT NULL,
	codPublicacion numeric(18) NULL,
	preguntaRealizada nvarchar(255) NULL
)
GO

CREATE TABLE PublicacionCostos ( 
	idCosto int identity(1,1)  NOT NULL,
	idFactura numeric(18) NOT NULL,
	idPublicacion numeric(18) NOT NULL,
	monto numeric(10,2) NULL
)
GO

CREATE TABLE Publicaciones ( 
	pCodigo numeric(18) identity(1,1)  NOT NULL,
	codVisibilidad numeric(18) NULL,
	codRubro int NOT NULL,
	idEstado int NULL,
	idUsuario int NULL,
	pDescripcion nvarchar(255) NULL,
	pStock numeric(18) NULL,
	pFecha datetime NULL,
	pFecha_Venc datetime NULL,
	pPrecio numeric(18,2) NULL,
	pCosto bigint NULL,
	pEnvio bit DEFAULT 1 NULL,
	pPreguntar bit DEFAULT 1 NULL
)
GO

CREATE TABLE Roles ( 
	idRol int identity(1,1)  NOT NULL,
	nombre nvarchar(255) NULL,
	habilitado bit DEFAULT 1 NOT NULL
)
GO

CREATE TABLE RolesFuncionalidades ( 
	idRol int NOT NULL,
	idFuncionalidad int NOT NULL
)
GO

CREATE TABLE Rubros ( 
	codRubro int identity(1,1)  NOT NULL,
	descripcionCorta nvarchar(255) NULL,
	descripcionLarga nvarchar(255) NULL
)
GO

CREATE TABLE Subastas ( 
	idSubasta int identity(1,1)  NOT NULL,
	idPublicacion numeric(18) NOT NULL,
	valorActual bigint NOT NULL
)
GO

CREATE TABLE Usuarios ( 
	idUsuario int identity(1,1)  NOT NULL,
	codLocalidad int NULL,
	password nvarchar(255) NOT NULL,
	username nvarchar(255) NOT NULL,
	flagHabilitado bit DEFAULT 1 NULL,
	tipoUsuario nvarchar(255) NULL,
	mail nvarchar(255) NULL,
	telefono nvarchar(255) NULL,
	nroPiso numeric(18) NULL,
	nroDpto nvarchar(50) NULL,
	fechaCreacion datetime NULL,
	nroCalle numeric(18) NULL,
	domCalle nvarchar(255) NULL,
	codPostal nvarchar(50) NULL,
	intentosFallidos int DEFAULT 0 NOT NULL,
	reputacion int NULL
)
GO

CREATE TABLE UsuariosRoles ( 
	idUsuario int NOT NULL,
	idRol int NOT NULL
)
GO

CREATE TABLE Visibilidades ( 
	Codigo numeric(18) NOT NULL,
	descripcion nvarchar(255) NULL,
	precio numeric(18,2) NULL,
	porcentaje numeric(18,2) NULL,
	Envio numeric(10,2) NULL,
	gratuita bit DEFAULT 1 NOT NULL
)
GO


ALTER TABLE Calificaciones ADD CONSTRAINT PK_Clasificaciones 
	PRIMARY KEY CLUSTERED (codigoCalificacion)
GO

ALTER TABLE Clientes ADD CONSTRAINT PK_Clientes 
	PRIMARY KEY CLUSTERED (idCliente)
GO

ALTER TABLE Compras ADD CONSTRAINT PK_Compra 
	PRIMARY KEY CLUSTERED (idCompra)
GO

ALTER TABLE ComprasInmediatas ADD CONSTRAINT PK_ComprasInmediatas 
	PRIMARY KEY CLUSTERED (idCompraInmediata)
GO

ALTER TABLE Empresas ADD CONSTRAINT PK_Empresas 
	PRIMARY KEY CLUSTERED (idEmpresa)
GO

ALTER TABLE Estados ADD CONSTRAINT PK_Estados 
	PRIMARY KEY CLUSTERED (idEstado)
GO

ALTER TABLE Facturaciones ADD CONSTRAINT PK_Facturaciones 
	PRIMARY KEY CLUSTERED (nroFactura)
GO

ALTER TABLE FormasPago ADD CONSTRAINT PK_FormasPago 
	PRIMARY KEY CLUSTERED (idFormaPago)
GO

ALTER TABLE Funcionalidades ADD CONSTRAINT PK_Funcionalidades 
	PRIMARY KEY CLUSTERED (idFuncionalidad)
GO

ALTER TABLE Items ADD CONSTRAINT PK_Items 
	PRIMARY KEY CLUSTERED (idItem)
GO

ALTER TABLE Localidades ADD CONSTRAINT PK_Localidades 
	PRIMARY KEY CLUSTERED (codLocalidad)
GO

ALTER TABLE Ofertas ADD CONSTRAINT PK_Oferta 
	PRIMARY KEY CLUSTERED (idOferta)
GO

ALTER TABLE Preguntas ADD CONSTRAINT PK_Preguntas 
	PRIMARY KEY CLUSTERED (idPregunta)
GO

ALTER TABLE PublicacionCostos ADD CONSTRAINT PK_PublicacionCostos 
	PRIMARY KEY CLUSTERED (idCosto)
GO

ALTER TABLE Publicaciones ADD CONSTRAINT PK_Publicaciones 
	PRIMARY KEY CLUSTERED (pCodigo)
GO

ALTER TABLE Roles ADD CONSTRAINT PK_Roles 
	PRIMARY KEY CLUSTERED (idRol)
GO

ALTER TABLE RolesFuncionalidades ADD CONSTRAINT PK_RolesFuncionalidades 
	PRIMARY KEY CLUSTERED (idRol, idFuncionalidad)
GO

ALTER TABLE Rubros ADD CONSTRAINT PK_Rubros 
	PRIMARY KEY CLUSTERED (codRubro)
GO

ALTER TABLE Subastas ADD CONSTRAINT PK_Subastas 
	PRIMARY KEY CLUSTERED (idSubasta)
GO

ALTER TABLE Usuarios ADD CONSTRAINT PK_Usuarios 
	PRIMARY KEY CLUSTERED (idUsuario)
GO

ALTER TABLE UsuariosRoles ADD CONSTRAINT PK_UsuariosRoles 
	PRIMARY KEY CLUSTERED (idUsuario, idRol)
GO

ALTER TABLE Visibilidades ADD CONSTRAINT PK_Visibilidades 
	PRIMARY KEY CLUSTERED (Codigo)
GO


ALTER TABLE Calificaciones
	ADD CONSTRAINT UQ_Calificaciones_codigoCalificacion UNIQUE (codigoCalificacion)
GO

CREATE INDEX IDX_calificacionPK
ON Calificaciones (codigoCalificacion ASC)
GO

CREATE INDEX IDX_calificacion_Calificador
ON Calificaciones (calificador ASC)
GO

CREATE INDEX IDX_idCompra
ON Calificaciones (idCompra ASC)
GO

ALTER TABLE Clientes
	ADD CONSTRAINT UQ_Clientes_idUsuario UNIQUE (idUsuario)
GO

ALTER TABLE Clientes
	ADD CONSTRAINT UQ_Clientes_idCliente UNIQUE (idCliente)
GO

CREATE INDEX IDX_Clientes_nombre
ON Clientes (nombre ASC)
GO

CREATE INDEX IDX_Clientes_apellido
ON Clientes (apellido ASC)
GO

CREATE INDEX IDX_Clientes_nroDNI_tipoDocumento
ON Clientes (nroDNI ASC, tipoDocumento ASC)
GO

ALTER TABLE Clientes
	ADD CONSTRAINT UQ_Clientes_nroDni_tipoDocumento UNIQUE (nroDNI, tipoDocumento)
GO

CREATE INDEX IDX_Clientes_Clientes_usuarios
ON Clientes (idUsuario ASC)
GO

CREATE INDEX IDX_Clientes_PK
ON Clientes (idCliente ASC)
GO

ALTER TABLE Compras
	ADD CONSTRAINT UQ_Compra_idCompra UNIQUE (idCompra)
GO

CREATE INDEX IDX_comprasPK
ON Compras (idCompra ASC)
GO

CREATE INDEX IDX_compras_publicaciones
ON Compras (idPublicacion ASC)
GO

CREATE INDEX IDX_compras_clientes
ON Compras (idClientes ASC)
GO

ALTER TABLE ComprasInmediatas
	ADD CONSTRAINT UQ_ComprasInmediatas_idCompraInmediata UNIQUE (idCompraInmediata)
GO

CREATE INDEX IDX_ComprasInmediataPK
ON ComprasInmediatas (idCompraInmediata ASC)
GO

CREATE INDEX IDX_ComprasInmediata_idPublicacion
ON ComprasInmediatas (idPublicacion ASC)
GO

ALTER TABLE Empresas
	ADD CONSTRAINT UQ_Empresas_idEmpresa UNIQUE (idEmpresa)
GO

ALTER TABLE Empresas
	ADD CONSTRAINT UQ_Empresas_idUsuario UNIQUE (idUsuario)
GO

ALTER TABLE Empresas
	ADD CONSTRAINT UQ_Empresas_RazonSocial_Cuit UNIQUE (razonSocial, cuit)
GO

CREATE INDEX IDX_indice_empresas
ON Empresas (idEmpresa ASC)
GO

CREATE INDEX IDX_Empresas_RazonSocial_Cuit
ON Empresas (razonSocial ASC, cuit ASC)
GO

CREATE INDEX IDX_indice_idUsuario
ON Empresas (idUsuario ASC)
GO

ALTER TABLE Estados
	ADD CONSTRAINT UQ_Estados_idEstado UNIQUE (idEstado)
GO

CREATE INDEX IDX_Estados
ON Estados (idEstado ASC)
GO

CREATE INDEX IDX_FacturacionesPK
ON Facturaciones (nroFactura ASC)
GO

CREATE INDEX IDX_Facturaciones_idFormaPago
ON Facturaciones (idFormaPago ASC)
GO

CREATE INDEX IDX_Facturaciones_codPublicacion
ON Facturaciones (codPublicacion ASC)
GO

CREATE INDEX IDX_Facturaciones_idUsuario
ON Facturaciones (idUsuario ASC)
GO

ALTER TABLE FormasPago
	ADD CONSTRAINT UQ_FormasPago_idFormaPago UNIQUE (idFormaPago)
GO

CREATE INDEX IDX_FormaPagoPK
ON FormasPago (idFormaPago ASC)
GO

ALTER TABLE Funcionalidades
	ADD CONSTRAINT UQ_Funcionalidades_nombre UNIQUE (nombre)
GO

ALTER TABLE Funcionalidades
	ADD CONSTRAINT UQ_Funcionalidades_idFuncionalidad UNIQUE (idFuncionalidad)
GO

CREATE INDEX IDX_funcionalidadesPK
ON Funcionalidades (idFuncionalidad ASC)
GO

ALTER TABLE Items
	ADD CONSTRAINT UQ_Items_idCompra UNIQUE (idCompra)
GO

ALTER TABLE Items
	ADD CONSTRAINT UQ_Items_idItem UNIQUE (idItem)
GO

CREATE INDEX IDX_itemsPK
ON Items (idItem ASC)
GO

CREATE INDEX IDX_items_nroFactura
ON Items (nroFactura ASC)
GO

ALTER TABLE Localidades
	ADD CONSTRAINT UQ_Localidades_codLocalidad UNIQUE (codLocalidad)
GO

CREATE INDEX IDX_Localidades
ON Localidades (codLocalidad ASC)
GO

ALTER TABLE Ofertas
	ADD CONSTRAINT UQ_Oferta_idOferta UNIQUE (idOferta)
GO

CREATE INDEX IDX_ofertaPK
ON Ofertas (idOferta ASC)
GO

CREATE INDEX IDX_oferta_idCliente
ON Ofertas (idCliente ASC)
GO

CREATE INDEX IDX_oferta_idSubasta
ON Ofertas (idSubasta ASC)
GO

ALTER TABLE Preguntas
	ADD CONSTRAINT UQ_Preguntas_idPregunta UNIQUE (idPregunta)
GO

ALTER TABLE PublicacionCostos
	ADD CONSTRAINT UQ_PublicacionCostos_idCosto UNIQUE (idCosto)
GO

ALTER TABLE PublicacionCostos
	ADD CONSTRAINT UQ_PublicacionCostos_idPublicacion UNIQUE (idPublicacion)
GO

CREATE INDEX IDX_PublicacionCostosPK
ON PublicacionCostos (idCosto ASC)
GO

CREATE INDEX IDX_ComprasInmediata_idFactura
ON PublicacionCostos (idFactura ASC)
GO

CREATE INDEX IDX_ComprasInmediata_idPublicacion
ON PublicacionCostos (idPublicacion ASC)
GO

ALTER TABLE Publicaciones
	ADD CONSTRAINT UQ_Publicaciones_pCodigo UNIQUE (pCodigo)
GO

CREATE UNIQUE INDEX IDX_publicacionesPK
ON Publicaciones (pCodigo ASC)
GO

CREATE INDEX IDX_publicaciones_pDescripcion
ON Publicaciones (pDescripcion ASC)
GO

CREATE INDEX IDX_publicaciones_Estados
ON Publicaciones (idEstado ASC)
GO

CREATE INDEX IDX_publicaciones_visibilidad
ON Publicaciones (codVisibilidad ASC)
GO

CREATE INDEX IDX_publicaciones_usuarios
ON Publicaciones (idUsuario ASC)
GO

ALTER TABLE Roles
	ADD CONSTRAINT UQ_Roles_nombre UNIQUE (nombre)
GO

ALTER TABLE Roles
	ADD CONSTRAINT UQ_Roles_idRol UNIQUE (idRol)
GO

CREATE INDEX IDX_indice_roles
ON Roles (idRol ASC)
GO

CREATE INDEX IDX_indice_nombre
ON Roles (nombre ASC)
GO

CREATE INDEX IDX_rolesFuncionalidadesPK
ON RolesFuncionalidades (idRol ASC, idFuncionalidad ASC)
GO

ALTER TABLE RolesFuncionalidades
	ADD CONSTRAINT UQ_Funcionalidades_idRol_IdFuncionalidad UNIQUE (idRol, idFuncionalidad)
GO

ALTER TABLE Rubros
	ADD CONSTRAINT UQ_Rubros_codRubro UNIQUE (codRubro)
GO

CREATE INDEX IDX_Rubros
ON Rubros (codRubro ASC)
GO

CREATE INDEX IDX_SubastaPK
ON Subastas (idSubasta ASC)
GO

CREATE INDEX IDX_subasta_idPublicacion
ON Subastas (idPublicacion ASC)
GO

ALTER TABLE Usuarios
	ADD CONSTRAINT UQ_Usuarios_username UNIQUE (username)
GO

ALTER TABLE Usuarios
	ADD CONSTRAINT UQ_Usuarios_idUsuario UNIQUE (idUsuario)
GO

CREATE INDEX IDX_indice_Usuarios
ON Usuarios (idUsuario ASC)
GO

CREATE INDEX IDX_usuarios_username
ON Usuarios (username ASC)
GO

CREATE INDEX IDX_Usuarios_Localidades
ON Usuarios (codLocalidad ASC)
GO

ALTER TABLE UsuariosRoles
	ADD CONSTRAINT UQ_IdUsuario_IdRol UNIQUE (idUsuario, idRol)
GO

CREATE INDEX IDX_UsuariosRoles
ON UsuariosRoles (idUsuario ASC, idRol ASC)
GO

ALTER TABLE Visibilidades
	ADD CONSTRAINT UQ_Visibilidades_Codigo UNIQUE (Codigo)
GO

CREATE INDEX IDX_visibilidadesPK
ON Visibilidades (Codigo ASC)
GO


ALTER TABLE Calificaciones ADD CONSTRAINT FK_Calificaciones_Compras 
	FOREIGN KEY (idCompra) REFERENCES Compras (idCompra)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE Calificaciones ADD CONSTRAINT FK_Clasificaciones_Clientes 
	FOREIGN KEY (calificador) REFERENCES Clientes (idCliente)
GO

ALTER TABLE Clientes ADD CONSTRAINT FK_Clientes_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE Compras ADD CONSTRAINT FK_Compra_Clientes 
	FOREIGN KEY (idClientes) REFERENCES Clientes (idCliente)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE Compras ADD CONSTRAINT FK_Compra_Publicaciones 
	FOREIGN KEY (idPublicacion) REFERENCES Publicaciones (pCodigo)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE ComprasInmediatas ADD CONSTRAINT FK_ComprasInmediatas_Publicaciones 
	FOREIGN KEY (idPublicacion) REFERENCES Publicaciones (pCodigo)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE Empresas ADD CONSTRAINT FK_Empresas_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE Facturaciones ADD CONSTRAINT FK_Facturaciones_FormasPago 
	FOREIGN KEY (idFormaPago) REFERENCES FormasPago (idFormaPago)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE Facturaciones ADD CONSTRAINT FK_Facturaciones_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE Items ADD CONSTRAINT FK_Items_Compras 
	FOREIGN KEY (idCompra) REFERENCES Compras (idCompra)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE Items ADD CONSTRAINT FK_Items_Facturaciones 
	FOREIGN KEY (nroFactura) REFERENCES Facturaciones (nroFactura)
GO

ALTER TABLE Ofertas ADD CONSTRAINT FK_Ofertas_Subastas 
	FOREIGN KEY (idSubasta) REFERENCES Subastas (idSubasta)
GO

ALTER TABLE Ofertas ADD CONSTRAINT FK_Ofertas_Clientes 
	FOREIGN KEY (idCliente) REFERENCES Clientes (idCliente)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE Preguntas ADD CONSTRAINT FK_Preguntas_Publicaciones 
	FOREIGN KEY (codPublicacion) REFERENCES Publicaciones (pCodigo)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE PublicacionCostos ADD CONSTRAINT FK_PublicacionCostos_Facturaciones 
	FOREIGN KEY (idFactura) REFERENCES Facturaciones (nroFactura)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE PublicacionCostos ADD CONSTRAINT FK_PublicacionCostos_Publicaciones 
	FOREIGN KEY (idPublicacion) REFERENCES Publicaciones (pCodigo)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Estados 
	FOREIGN KEY (idEstado) REFERENCES Estados (idEstado)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Visibilidades 
	FOREIGN KEY (codVisibilidad) REFERENCES Visibilidades (Codigo)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Rubros 
	FOREIGN KEY (codRubro) REFERENCES Rubros (codRubro)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
GO

ALTER TABLE RolesFuncionalidades ADD CONSTRAINT FK_RolesFuncionalidades_Funcionalidades 
	FOREIGN KEY (idFuncionalidad) REFERENCES Funcionalidades (idFuncionalidad)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE RolesFuncionalidades ADD CONSTRAINT FK_RolesFuncionalidades_Roles 
	FOREIGN KEY (idRol) REFERENCES Roles (idRol)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE Subastas ADD CONSTRAINT FK_Subastas_Publicaciones 
	FOREIGN KEY (idPublicacion) REFERENCES Publicaciones (pCodigo)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE Usuarios ADD CONSTRAINT FK_Usuarios_Localidades 
	FOREIGN KEY (codLocalidad) REFERENCES Localidades (codLocalidad)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE UsuariosRoles ADD CONSTRAINT FK_UsuariosRoles_Roles 
	FOREIGN KEY (idRol) REFERENCES Roles (idRol)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE UsuariosRoles ADD CONSTRAINT FK_UsuariosRoles_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
	ON DELETE CASCADE ON UPDATE CASCADE
GO
--+++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++insert en las tablas++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++

INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Login')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Cambiar contraseña')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('iniciar sesión')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Roles')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Alta rol')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Modificacion rol')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('ABM  roles')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Consultar roles')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Usuarios')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Alta usuario')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Modificación/Baja')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('ABM Usuarios')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Consulta usuarios')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Comprar/Ofertar')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Calificaciones')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Listado estadistico')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Consulta facturas')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Visibilidades')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Alta visibilidad')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Modificación visibilidad')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('ABM visibilidad')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Consulta visibilidades')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Publicaciones')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Alta publicacion')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Modificacion publicacion')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('ABM publicaciones')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Consulta publicaciones')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Rubros')
INSERT INTO [dbo].[Funcionalidades] ([nombre]) VALUES ('Historial clientes')
