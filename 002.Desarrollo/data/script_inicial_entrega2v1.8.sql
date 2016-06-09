IF (SELECT name FROM master.dbo.sysdatabases WHERE name = 'GD1C2016') IS NULL
BEGIN
EXEC('CREATE DATABASE GD1C2016')
END
GO

--tiempo de carga del script:jorge 56 segundos
USE GD1C2016;
GO

declare @schema_name varchar(max)				= 'TPGDD';
declare @schema_id int							= schema_id(@schema_name),
		@drop_schema_dependencies varchar(max)	= ''

-- Drop FKs --
SELECT @drop_schema_dependencies = @drop_schema_dependencies +
		'alter table [' + @schema_name + '].[' + OBJECT_NAME(parent_object_id) + '] ' +
		'drop CONSTRAINT [' + OBJECT_NAME(object_id) + '];' + CHAR(30)
	FROM sys.foreign_keys WHERE schema_id = @schema_id

-- Drop Views --
SELECT @drop_schema_dependencies = @drop_schema_dependencies +
		'drop view [' + @schema_name + '].[' + OBJECT_NAME(object_id) + '];' + CHAR(30)
	FROM sys.views WHERE schema_id = @schema_id

-- Drop Functions --
SELECT @drop_schema_dependencies = @drop_schema_dependencies +
		'drop function [' + @schema_name + '].[' + OBJECT_NAME(object_id) + '];' + CHAR(30)
	FROM sys.objects WHERE type in ('FN', 'IF', 'TF', 'FS', 'FT') and schema_id = @schema_id

-- Drop Tables --
SELECT @drop_schema_dependencies = @drop_schema_dependencies +
		'drop table [' + @schema_name + '].[' + OBJECT_NAME(object_id) + '];' + CHAR(30)
	FROM sys.tables WHERE schema_id = @schema_id
	
-- Drop procedure --
SELECT @drop_schema_dependencies = @drop_schema_dependencies +
		'drop procedure [' + @schema_name + '].[' + OBJECT_NAME(object_id) + '];' + CHAR(30)
	FROM sys.procedures WHERE schema_id = @schema_id

-- Drop Types --
SELECT @drop_schema_dependencies = @drop_schema_dependencies +
		'drop type [' + @schema_name + '].[' + name + '];' + CHAR(30)
	FROM sys.types WHERE schema_id = @schema_id	

exec (@drop_schema_dependencies)
go


-- Drop Schema --
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = 'TPGDD')
DROP SCHEMA [TPGDD]
GO

create schema TPGDD authorization gd
Go 


CREATE TABLE TPGDD.Calificaciones ( 
	codigoCalificacion numeric(18) identity(112547,1)  NOT NULL,
	idCompra int NOT NULL,
	calificador int NULL, --IDUSUARIO
	cantEstrellas numeric(18) NULL,
	 CHECK  (cantEstrellas >0),
	observacion nvarchar(255) NULL,		
)
GO

CREATE TABLE TPGDD.Clientes ( 
	idCliente int identity(1,1)  NOT NULL,
	idUsuario int NULL,
	nombre nvarchar(255) NULL,
	apellido nvarchar(255) NULL,
	fechaNacimiento date NULL,
	nroDNI numeric(18,2) NULL,
	tipoDocumento nvarchar(255) NULL,	
	CONSTRAINT chk_Clientes CHECK (nroDNI > 0)
)
GO

CREATE TABLE TPGDD.Compras ( 
	idCompra int identity(1,1)  NOT NULL,
	idPublicacion numeric(18) NULL,
	idCliente int NULL,
	fecha datetime NULL,
	cantidad numeric(18) NULL,	
	CHECK (cantidad >0),
	calificada bit DEFAULT 0 NULL, --0 no calificada
	idVendedor int NULL,
	tipoPublicacion nvarchar(255) NULL,  --subasta o compraInmediata		
)
GO

CREATE TABLE TPGDD.ComprasInmediatas ( 
	idCompraInmediata int identity(1,1)  NOT NULL,
	idPublicacion numeric(18) NOT NULL,
	stockDisponible numeric(18) DEFAULT 0 NOT NULL,
	unidadesVendidas int DEFAULT 0 NOT NULL
	)
GO

CREATE TABLE TPGDD.Empresas ( 
	idEmpresa int identity(1,1)  NOT NULL,
	idUsuario int NOT NULL,
	razonSocial nvarchar(255) NULL,
	cuit nvarchar(50) NULL,
	nombreContacto nvarchar(255) NULL,
	nombreRubro nvarchar(255) NULL,
	ciudad nvarchar(255) NULL,	
)
GO

CREATE TABLE TPGDD.Estados ( 
	idEstado int identity(1,1)  NOT NULL,
	descripcion nvarchar(255) NULL
)
GO

CREATE TABLE TPGDD.Facturaciones ( 
	nroFactura numeric(18) identity(180041,1)  NOT NULL,
	idFormaPago int NULL,
	idUsuario int NULL,	
	fecha date NULL,
	total numeric(18,2) NULL,
		CHECK (total>=0),
)
GO

CREATE TABLE TPGDD.FormasPago ( 
	idFormaPago int identity(1,1)  NOT NULL,
	descripcion nvarchar(255) NULL
)
GO

CREATE TABLE TPGDD.Funcionalidades ( 
	idFuncionalidad int identity(1,1)  NOT NULL,
	nombre nvarchar(255) NOT NULL,
	descripcion nvarchar(255) NULL
)
GO

CREATE TABLE TPGDD.Items ( 
	idItem int identity(1,1)  NOT NULL,
	nroFactura numeric(18) NOT NULL,
	idCompra int NULL,
	nombre nvarchar(255) NULL,
	cantidad numeric(18) NULL,
	 CHECK(cantidad>=0),
	montoItem numeric(18,2) NULL,
	 CHECK(montoItem>=0),
	idPublicacion numeric(18) NULL
)
GO

CREATE TABLE TPGDD.Localidades ( 
	codLocalidad int identity(1,1)  NOT NULL,
	descripcion nvarchar(255) NULL
)
GO

CREATE TABLE TPGDD.Ofertas ( 
	idOferta int identity(1,1)  NOT NULL,
	idCliente int NOT NULL,
	idSubasta int NULL,
	fecha datetime NULL,
	monto numeric(18,2) NULL CHECK (monto>=0),
)
GO

CREATE TABLE TPGDD.Publicaciones ( 
	pCodigo numeric(18) identity(71079,1)  NOT NULL,
	codVisibilidad numeric(18) NULL,
	codRubro int NOT NULL,
	idEstado int NULL,
	idUsuario int NULL,
	pDescripcion nvarchar(255) NULL,
	pStock numeric(18) NULL, CHECK(pStock>=0),
	pFecha datetime NULL,
	pFecha_Venc datetime NULL,
	 CHECK(pFecha_Venc>=pFecha),
	pPrecio numeric(18,2) NULL,
	pEnvio bit DEFAULT 1 NULL,
	pPreguntar bit DEFAULT 1 NULL
)
GO

CREATE TABLE TPGDD.Roles ( 
	idRol int identity(1,1)  NOT NULL,
	nombre nvarchar(255) NULL,
	habilitado bit DEFAULT 1 NOT NULL
)
GO

CREATE TABLE TPGDD.RolesFuncionalidades ( 
	idRol int NOT NULL,
	idFuncionalidad int NOT NULL
)
GO

CREATE TABLE TPGDD.Rubros ( 
	codRubro int identity(1,1)  NOT NULL,
	descripcionCorta nvarchar(255) NULL,
	descripcionLarga nvarchar(255) NULL
)
GO

CREATE TABLE TPGDD.Subastas ( 
	idSubasta int identity(1,1)  NOT NULL,
	idPublicacion numeric(18) NOT NULL,
	valorActual numeric(18) NOT NULL
)
GO

CREATE TABLE TPGDD.Usuarios ( 
	idUsuario int identity(1,1)  NOT NULL,
	codLocalidad int NULL,
	username nvarchar(255) NOT NULL,
	password nvarchar(255) NOT NULL,	
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
	reputacion int DEFAULT 0 NULL,
	bajaLogica bit DEFAULT 0 NULL
)
GO

CREATE TABLE TPGDD.UsuariosRoles ( 
	idUsuario int NOT NULL,
	idRol int NOT NULL
)
GO

CREATE TABLE TPGDD.Visibilidades ( 
	codigo numeric(18) NOT NULL,
	descripcion nvarchar(255) NULL,
	precio numeric(18,2) NULL,
	porcentaje numeric(18,2) NULL,
	Envio numeric(10,2) NULL,	
	prioridad int identity(1,1)  not NULL, 
	admiteEnvio bit DEFAULT 0 NULL--0 no admite envio
)
GO
/*
CREATE TABLE Configuracion (
	Config_Id	integer		identity(1,1) PRIMARY KEY,
	Config_Datetime_App	datetime,
	
	-- Con esto nos aseguramos que la configuración contenga siempre un único registro. En caso de agregar otro parámetro de configuración
	-- habrá que modificar el esquema y crear otro atributo. Para más pros y contras de este tipo de patrón, ver http://stackoverflow.com/a/2300493
	Config_Solo_Un_Registro	bit DEFAULT 0			unique,
	CHECK(Config_Solo_Un_Registro = 0)
)
GO*/

ALTER TABLE TPGDD.Calificaciones ADD CONSTRAINT PK_Calificaciones 
	PRIMARY KEY CLUSTERED (codigoCalificacion)
GO

ALTER TABLE TPGDD.Clientes ADD CONSTRAINT PK_Clientes 
	PRIMARY KEY CLUSTERED (idCliente)
GO

ALTER TABLE TPGDD.Compras ADD CONSTRAINT PK_Compra 
	PRIMARY KEY CLUSTERED (idCompra)
GO

ALTER TABLE TPGDD.ComprasInmediatas ADD CONSTRAINT PK_ComprasInmediatas 
	PRIMARY KEY CLUSTERED (idCompraInmediata)
GO

ALTER TABLE TPGDD.Empresas ADD CONSTRAINT PK_Empresas 
	PRIMARY KEY CLUSTERED (idEmpresa)
GO

ALTER TABLE TPGDD.Estados ADD CONSTRAINT PK_Estados 
	PRIMARY KEY CLUSTERED (idEstado)
GO

ALTER TABLE TPGDD.Facturaciones ADD CONSTRAINT PK_Facturaciones 
	PRIMARY KEY CLUSTERED (nroFactura)
GO

ALTER TABLE TPGDD.FormasPago ADD CONSTRAINT PK_FormasPago 
	PRIMARY KEY CLUSTERED (idFormaPago)
GO

ALTER TABLE TPGDD.Funcionalidades ADD CONSTRAINT PK_Funcionalidades 
	PRIMARY KEY CLUSTERED (idFuncionalidad)
GO

ALTER TABLE TPGDD.Items ADD CONSTRAINT PK_Items 
	PRIMARY KEY CLUSTERED (idItem)
GO

ALTER TABLE TPGDD.Localidades ADD CONSTRAINT PK_Localidades 
	PRIMARY KEY CLUSTERED (codLocalidad)
GO

ALTER TABLE TPGDD.Ofertas ADD CONSTRAINT PK_Oferta 
	PRIMARY KEY CLUSTERED (idOferta)
GO

ALTER TABLE TPGDD.Publicaciones ADD CONSTRAINT PK_Publicaciones 
	PRIMARY KEY CLUSTERED (pCodigo)
GO

ALTER TABLE TPGDD.Roles ADD CONSTRAINT PK_Roles 
	PRIMARY KEY CLUSTERED (idRol)
GO

ALTER TABLE TPGDD.RolesFuncionalidades ADD CONSTRAINT PK_RolesFuncionalidades 
	PRIMARY KEY CLUSTERED (idRol, idFuncionalidad)
GO

ALTER TABLE TPGDD.Rubros ADD CONSTRAINT PK_Rubros 
	PRIMARY KEY CLUSTERED (codRubro)
GO

ALTER TABLE TPGDD.Subastas ADD CONSTRAINT PK_Subastas 
	PRIMARY KEY CLUSTERED (idSubasta)
GO

ALTER TABLE TPGDD.Usuarios ADD CONSTRAINT PK_Usuarios 
	PRIMARY KEY CLUSTERED (idUsuario)
GO

ALTER TABLE TPGDD.UsuariosRoles ADD CONSTRAINT PK_UsuariosRoles 
	PRIMARY KEY CLUSTERED (idUsuario, idRol)
GO

ALTER TABLE TPGDD.Visibilidades ADD CONSTRAINT PK_Visibilidades 
	PRIMARY KEY CLUSTERED (Codigo)
GO


ALTER TABLE TPGDD.Calificaciones
	ADD CONSTRAINT UQ_Calificaciones_codigoCalificacion UNIQUE (codigoCalificacion)
GO

CREATE INDEX IDX_calificacionPK
ON TPGDD.Calificaciones (codigoCalificacion ASC)
GO

CREATE INDEX IDX_calificacion_Calificador
ON TPGDD.Calificaciones (calificador ASC)
GO

CREATE INDEX IDX_idCompra
ON TPGDD.Calificaciones (idCompra ASC)
GO

ALTER TABLE TPGDD.Clientes
	ADD CONSTRAINT UQ_Clientes_idUsuario UNIQUE (idUsuario)
GO

ALTER TABLE TPGDD.Clientes
	ADD CONSTRAINT UQ_Clientes_idCliente UNIQUE (idCliente)
GO

CREATE INDEX IDX_Clientes_nombre
ON TPGDD.Clientes (nombre ASC)
GO

CREATE INDEX IDX_Clientes_apellido
ON TPGDD.Clientes (apellido ASC)
GO

CREATE INDEX IDX_Clientes_nroDNI_tipoDocumento
ON TPGDD.Clientes (nroDNI ASC, tipoDocumento ASC)
GO

ALTER TABLE TPGDD.Clientes
	ADD CONSTRAINT UQ_Clientes_nroDni_tipoDocumento UNIQUE (nroDNI, tipoDocumento)
GO

CREATE INDEX IDX_Clientes_Clientes_usuarios
ON TPGDD.Clientes (idUsuario ASC)
GO

CREATE INDEX IDX_Clientes_PK
ON TPGDD.Clientes (idCliente ASC)
GO

CREATE INDEX IDX_comprasPK
ON TPGDD.Compras (idCompra ASC)
GO

CREATE INDEX IDX_compras_publicaciones
ON TPGDD.Compras (idPublicacion ASC)
GO

CREATE INDEX IDX_compras_clientes
ON TPGDD.Compras (idCliente ASC)
GO

ALTER TABLE TPGDD.ComprasInmediatas
	ADD CONSTRAINT UQ_ComprasInmediatas_idCompraInmediata UNIQUE (idCompraInmediata)
GO

CREATE INDEX IDX_ComprasInmediataPK
ON TPGDD.ComprasInmediatas (idCompraInmediata ASC)
GO

CREATE INDEX IDX_ComprasInmediata_idPublicacion
ON TPGDD.ComprasInmediatas (idPublicacion ASC)
GO

ALTER TABLE TPGDD.Empresas
	ADD CONSTRAINT UQ_Empresas_idEmpresa UNIQUE (idEmpresa)
GO

ALTER TABLE TPGDD.Empresas
	ADD CONSTRAINT UQ_Empresas_idUsuario UNIQUE (idUsuario)
GO

ALTER TABLE TPGDD.Empresas
	ADD CONSTRAINT UQ_Empresas_RazonSocial_Cuit UNIQUE (razonSocial, cuit)
GO

CREATE INDEX IDX_indice_empresas
ON TPGDD.Empresas (idEmpresa ASC)
GO

CREATE INDEX IDX_Empresas_RazonSocial_Cuit
ON TPGDD.Empresas (razonSocial ASC, cuit ASC)
GO

CREATE INDEX IDX_indice_idUsuario
ON TPGDD.Empresas (idUsuario ASC)
GO

ALTER TABLE TPGDD.Estados
	ADD CONSTRAINT UQ_Estados_idEstado UNIQUE (idEstado)
GO

CREATE INDEX IDX_Estados
ON TPGDD.Estados (idEstado ASC)
GO

CREATE INDEX IDX_FacturacionesPK
ON TPGDD.Facturaciones (nroFactura ASC)
GO

CREATE INDEX IDX_Facturaciones_idFormaPago
ON TPGDD.Facturaciones (idFormaPago ASC)
GO

CREATE INDEX IDX_Facturaciones_idUsuario
ON TPGDD.Facturaciones (idUsuario ASC)
GO

ALTER TABLE TPGDD.FormasPago
	ADD CONSTRAINT UQ_FormasPago_idFormaPago UNIQUE (idFormaPago)
GO

CREATE INDEX IDX_FormaPagoPK
ON TPGDD.FormasPago (idFormaPago ASC)
GO

ALTER TABLE TPGDD.Funcionalidades
	ADD CONSTRAINT UQ_Funcionalidades_nombre UNIQUE (nombre)
GO

ALTER TABLE TPGDD.Funcionalidades
	ADD CONSTRAINT UQ_Funcionalidades_idFuncionalidad UNIQUE (idFuncionalidad)
GO

CREATE INDEX IDX_funcionalidadesPK
ON TPGDD.Funcionalidades (idFuncionalidad ASC)
GO

ALTER TABLE TPGDD.Items
	ADD CONSTRAINT UQ_Items_idItem UNIQUE (idItem)
GO

CREATE INDEX IDX_itemsPK
ON TPGDD.Items (idItem ASC)
GO

CREATE INDEX IDX_items_nroFactura
ON TPGDD.Items (nroFactura ASC)
GO

ALTER TABLE TPGDD.Localidades
	ADD CONSTRAINT UQ_Localidades_codLocalidad UNIQUE (codLocalidad)
GO

CREATE INDEX IDX_Localidades
ON TPGDD.Localidades (codLocalidad ASC)
GO

ALTER TABLE TPGDD.Ofertas
	ADD CONSTRAINT UQ_Oferta_idOferta UNIQUE (idOferta)
GO

CREATE INDEX IDX_ofertaPK
ON TPGDD.Ofertas (idOferta ASC)
GO

CREATE INDEX IDX_oferta_idCliente
ON TPGDD.Ofertas (idCliente ASC)
GO

CREATE INDEX IDX_oferta_idSubasta
ON TPGDD.Ofertas (idSubasta ASC)
GO

ALTER TABLE TPGDD.Publicaciones
	ADD CONSTRAINT UQ_Publicaciones_pCodigo UNIQUE (pCodigo)
GO

CREATE UNIQUE INDEX IDX_publicacionesPK
ON TPGDD.Publicaciones (pCodigo ASC)
GO

CREATE INDEX IDX_publicaciones_pDescripcion
ON TPGDD.Publicaciones (pDescripcion ASC)
GO

CREATE INDEX IDX_publicaciones_Estados
ON TPGDD.Publicaciones (idEstado ASC)
GO

CREATE INDEX IDX_publicaciones_visibilidad
ON TPGDD.Publicaciones (codVisibilidad ASC)
GO

CREATE INDEX IDX_publicaciones_usuarios
ON TPGDD.Publicaciones (idUsuario ASC)
GO

ALTER TABLE TPGDD.Roles
	ADD CONSTRAINT UQ_Roles_nombre UNIQUE (nombre)
GO

ALTER TABLE TPGDD.Roles
	ADD CONSTRAINT UQ_Roles_idRol UNIQUE (idRol)
GO

CREATE INDEX IDX_indice_roles
ON TPGDD.Roles (idRol ASC)
GO

CREATE INDEX IDX_indice_nombre
ON TPGDD.Roles (nombre ASC)
GO

CREATE INDEX IDX_rolesFuncionalidadesPK
ON TPGDD.RolesFuncionalidades (idRol ASC, idFuncionalidad ASC)
GO

ALTER TABLE TPGDD.RolesFuncionalidades
	ADD CONSTRAINT UQ_Funcionalidades_idRol_IdFuncionalidad UNIQUE (idRol, idFuncionalidad)
GO

ALTER TABLE TPGDD.Rubros
	ADD CONSTRAINT UQ_Rubros_codRubro UNIQUE (codRubro)
GO

CREATE INDEX IDX_Rubros
ON TPGDD.Rubros (codRubro ASC)
GO

CREATE INDEX IDX_SubastaPK
ON TPGDD.Subastas (idSubasta ASC)
GO

CREATE INDEX IDX_subasta_idPublicacion
ON TPGDD.Subastas (idPublicacion ASC)
GO

ALTER TABLE TPGDD.Usuarios
	ADD CONSTRAINT UQ_Usuarios_username UNIQUE (username)
GO

ALTER TABLE TPGDD.Usuarios
	ADD CONSTRAINT UQ_Usuarios_idUsuario UNIQUE (idUsuario)
GO

CREATE INDEX IDX_indice_Usuarios
ON TPGDD.Usuarios (idUsuario ASC)
GO

CREATE INDEX IDX_usuarios_username
ON TPGDD.Usuarios (username ASC)
GO

CREATE INDEX IDX_Usuarios_Localidades
ON TPGDD.Usuarios (codLocalidad ASC)
GO

ALTER TABLE TPGDD.UsuariosRoles
	ADD CONSTRAINT UQ_IdUsuario_IdRol UNIQUE (idUsuario, idRol)
GO

CREATE INDEX IDX_UsuariosRoles
ON TPGDD.UsuariosRoles (idUsuario ASC, idRol ASC)
GO

ALTER TABLE TPGDD.Visibilidades
	ADD CONSTRAINT UQ_Visibilidades_Codigo UNIQUE (Codigo)
GO

CREATE INDEX IDX_visibilidadesPK
ON TPGDD.Visibilidades (Codigo ASC)
GO


ALTER TABLE TPGDD.Calificaciones ADD CONSTRAINT FK_Calificaciones_Compras 
	FOREIGN KEY (idCompra) REFERENCES TPGDD.Compras (idCompra)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE TPGDD.Clientes ADD CONSTRAINT FK_Clientes_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES TPGDD.Usuarios (idUsuario)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE TPGDD.Compras ADD CONSTRAINT FK_Compra_Clientes 
	FOREIGN KEY (idCliente) REFERENCES TPGDD.Clientes (idCliente)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE TPGDD.Compras ADD CONSTRAINT FK_Compra_Publicaciones 
	FOREIGN KEY (idPublicacion) REFERENCES TPGDD.Publicaciones (pCodigo)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE TPGDD.ComprasInmediatas ADD CONSTRAINT FK_ComprasInmediatas_Publicaciones 
	FOREIGN KEY (idPublicacion) REFERENCES TPGDD.Publicaciones (pCodigo)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE TPGDD.Empresas ADD CONSTRAINT FK_Empresas_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES TPGDD.Usuarios (idUsuario)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE TPGDD.Facturaciones ADD CONSTRAINT FK_Facturaciones_FormasPago 
	FOREIGN KEY (idFormaPago) REFERENCES TPGDD.FormasPago (idFormaPago)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE TPGDD.Facturaciones ADD CONSTRAINT FK_Facturaciones_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES TPGDD.Usuarios (idUsuario)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE TPGDD.Items ADD CONSTRAINT FK_Items_Compras 
	FOREIGN KEY (idCompra) REFERENCES TPGDD.Compras (idCompra)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE TPGDD.Items ADD CONSTRAINT FK_Items_Facturaciones 
	FOREIGN KEY (nroFactura) REFERENCES TPGDD.Facturaciones (nroFactura)
GO

ALTER TABLE TPGDD.Ofertas ADD CONSTRAINT FK_Ofertas_Subastas 
	FOREIGN KEY (idSubasta) REFERENCES TPGDD.Subastas (idSubasta)
GO

ALTER TABLE TPGDD.Ofertas ADD CONSTRAINT FK_Ofertas_Clientes 
	FOREIGN KEY (idCliente) REFERENCES TPGDD.Clientes (idCliente)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE TPGDD.Publicaciones ADD CONSTRAINT FK_Publicaciones_Estados 
	FOREIGN KEY (idEstado) REFERENCES TPGDD.Estados (idEstado)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE TPGDD.Publicaciones ADD CONSTRAINT FK_Publicaciones_Visibilidades 
	FOREIGN KEY (codVisibilidad) REFERENCES TPGDD.Visibilidades (Codigo)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE TPGDD.Publicaciones ADD CONSTRAINT FK_Publicaciones_Rubros 
	FOREIGN KEY (codRubro) REFERENCES TPGDD.Rubros (codRubro)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE TPGDD.Publicaciones ADD CONSTRAINT FK_Publicaciones_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES TPGDD.Usuarios (idUsuario)
GO

ALTER TABLE TPGDD.RolesFuncionalidades ADD CONSTRAINT FK_RolesFuncionalidades_Funcionalidades 
	FOREIGN KEY (idFuncionalidad) REFERENCES TPGDD.Funcionalidades (idFuncionalidad)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE TPGDD.RolesFuncionalidades ADD CONSTRAINT FK_RolesFuncionalidades_Roles 
	FOREIGN KEY (idRol) REFERENCES TPGDD.Roles (idRol)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE TPGDD.Subastas ADD CONSTRAINT FK_Subastas_Publicaciones 
	FOREIGN KEY (idPublicacion) REFERENCES TPGDD.Publicaciones (pCodigo)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE TPGDD.Usuarios ADD CONSTRAINT FK_Usuarios_Localidades 
	FOREIGN KEY (codLocalidad) REFERENCES TPGDD.Localidades (codLocalidad)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE TPGDD.UsuariosRoles ADD CONSTRAINT FK_UsuariosRoles_Roles 
	FOREIGN KEY (idRol) REFERENCES TPGDD.Roles (idRol)
	ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE TPGDD.UsuariosRoles ADD CONSTRAINT FK_UsuariosRoles_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES TPGDD.Usuarios (idUsuario)
	ON DELETE CASCADE ON UPDATE CASCADE
GO


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++FUNCIONES AYUDADORAS++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
create  FUNCTION TPGDD.getCantidadCompras(@idVendedor int)
RETURNS  int
AS
BEGIN
	RETURN  (select count(*) from TPGDD.Compras C where C.idVendedor = @idVendedor)
END
go

create  FUNCTION TPGDD.getCantidadSubastas(@idVendedor int)
RETURNS  int
AS
BEGIN
	RETURN  (select count(*) from TPGDD.Publicaciones P, TPGDD.Subastas S 
	where P.pCodigo = S.idPublicacion and P.idUsuario = @idVendedor)
END
go

create  FUNCTION TPGDD.getIdVendedor(@idCompra int)
RETURNS  int
AS
BEGIN
	RETURN  (select top 1 T.idVendedor from TPGDD.Compras T where T.idCompra = @idCompra)
END
go
 
create  FUNCTION TPGDD.getComprasVendedor(@idCompra int)
RETURNS  @rtnTable TABLE 
(
	idCompra int NOT NULL,
	idPublicacion numeric(18) NULL,
	idCliente int NULL,
	fecha datetime NULL,
	cantidad numeric(18) NULL,	
	CHECK (cantidad >0),
	calificada bit DEFAULT 0 NULL, --0 no calificada
	idVendedor int NULL,
	tipoPublicacion nvarchar(255) NULL  --subasta o compraInmediata	
)
AS
BEGIN
    insert into @rtnTable 
	select * from TPGDD.Compras C where C.idVendedor = TPGDD.getIdVendedor(@idCompra)
	RETURN 
END
go

create  FUNCTION TPGDD.getPrecioVisibilidad(@codVisibildad numeric(18,0))
RETURNS  numeric(18,2)
AS
BEGIN
	RETURN  (select V.precio from Visibilidades V where V.codigo = @codVisibildad)
END
GO


create FUNCTION TPGDD.getMontoItemPorVentaSubasta(@idPublicacion numeric(18,0))
RETURNS  numeric(18,2)
AS
BEGIN

	return (select top 1 S.valorActual from TPGDD.Subastas S where S.idPublicacion = @idPublicacion)

END
GO
create FUNCTION TPGDD.getAdmiteEnvio(@idPublicacion numeric(18,0))
RETURNS  bit
AS
BEGIN
	return (select V.admiteEnvio from TPGDD.Publicaciones P, TPGDD.Visibilidades V where P.codVisibilidad = V.codigo and P.pCodigo = @idPublicacion)
END
GO

create  FUNCTION TPGDD.getMontoItemPorVentaCompraInmediata(@cantidad numeric(18,0), @idPublicacion numeric(18,0))
RETURNS  numeric(18,2)
AS
BEGIN
	return @cantidad * (select P.pPrecio from TPGDD.Publicaciones P where pCodigo = @idPublicacion) * 
			(select V.porcentaje from TPGDD.Publicaciones P, TPGDD.Visibilidades V 
			where P.codVisibilidad = V.codigo and P.pCodigo = @idPublicacion)
END
GO

create  FUNCTION TPGDD.getMontoItemPorEnvio(@idPublicacion numeric(18,0))
RETURNS  numeric(10,2)
AS
BEGIN
	return (select V.Envio from TPGDD.Publicaciones P, TPGDD.Visibilidades V 
	where P.codVisibilidad = V.codigo and P.pCodigo = @idPublicacion)
END
GO

create FUNCTION TPGDD.getTotalCompraSubasta( @idPublicacion numeric(18,0))
RETURNS  numeric(18,2)
AS
BEGIN
	declare @totalSinEnvio numeric(18,2)
		
	set @totalSinEnvio = TPGDD.getMontoItemPorVentaSubasta(@idPublicacion)
	
	if(TPGDD.getAdmiteEnvio(@idPublicacion) = 1)
	   return @totalSinEnvio + TPGDD.getMontoItemPorEnvio(@idPublicacion)
	
	return @totalSinEnvio
END
GO

create FUNCTION TPGDD.getTotalCompraInmediata(@cantidad numeric(18,0), @idPublicacion numeric(18,0))
RETURNS  numeric(18,2)
AS
BEGIN
	declare @totalSinEnvio numeric(18,2)
		
	set @totalSinEnvio = TPGDD.getMontoItemPorVentaCompraInmediata(@cantidad, @idPublicacion)
	
	if(TPGDD.getAdmiteEnvio(@idPublicacion) = 1)
	   return @totalSinEnvio + TPGDD.getMontoItemPorEnvio(@idPublicacion)
	
	return @totalSinEnvio
END
GO
------------------------------------------------------------------------------------------------
--TRIGGERS
------------------------------------------------------------------------------------------------
--1. Para actualizar la reputación del vendedor cuando se inserta una calificacion en calificaciones.
 
create  trigger TPGDD.updateReputacionVenderorTrigger
on  TPGDD.Calificaciones
after insert
as
   declare @idVendedor int
   set @idVendedor = TPGDD.getIdVendedor((select I.idCompra from inserted I))

   update Usuarios set reputacion =  (select avg(C2.cantEstrellas) + TPGDD.getCantidadCompras(@idVendedor) + TPGDD.getCantidadSubastas(@idVendedor)
                                     from 
										getComprasVendedor((select I.idCompra from inserted I)) C1, 
										Calificaciones C2 
									 where C1.idCompra = C2.idCompra)
  where Usuarios.idUsuario = @idVendedor
go

--2. para actualizar el stock disponible en comras inmediatas cuando se inserta una compra en compras.
create  trigger TPGDD.updateStockPublicacionTrigger
on TPGDD.Compras
after insert
as
   update Publicaciones set pStock = (select P.pStock - I.cantidad 
									from Publicaciones P, inserted I 
									where P.pCodigo = I.idPublicacion)
	where Publicaciones.pCodigo = (select I.idPublicacion from inserted I)
go

--3. para actualizar el valorActual de una subasta cuando se realiza una oferta en ofertas.
create  trigger TPGDD.updateValorActualSubastaTrigger
on TPGDD.Ofertas
after insert
as
   update Subastas set valorActual = (select I.monto from inserted I)
   where Subastas.idSubasta = (select I.idSubasta from inserted I)
go

--4. para eliminar los usuariosRoles cuando en roles cambio el habilitado.
create  trigger TPGDD.deleteUsuariosRolesTrigger
on TPGDD.Roles
after update
as
   if((select I.habilitado from inserted I) = 0)
		delete from UsuariosRoles where UsuariosRoles.idRol = (select I.idRol from inserted I)
go

--5. cuando una pubicacion se pone activa armar la factura de la publicacion y generar el item
create  trigger TPGDD.generarFacturacionPorPublicar
on TPGDD.Publicaciones
after update
as
   if((select D.idEstado from deleted D) = 1 and (select I.idEstado from inserted I) = 2 )
   begin
	insert into Facturaciones (idUsuario, fecha, total)
	values ((select I.idUsuario from inserted I), 
			GETDATE(),
			TPGDD.getPrecioVisibilidad((select I.codVisibilidad from inserted I)))
	insert into Items (nroFactura, nombre, cantidad, montoItem, idPublicacion)
	values(@@IDENTITY, 'comision x publicar', 1, TPGDD.getPrecioVisibilidad((select I.codVisibilidad from inserted I)), (select I.pCodigo from inserted I))
   end	
go

--6. cuando genero una compra generar el item y agregarselo a la factura
create  trigger TPGDD.generarFacturacionPorComprar
on TPGDD.Compras
after insert
as
    declare @cantidad numeric (18,0)
	declare @idCompra int 
	declare @idPublicacion numeric (18,0)
	declare @nroFactura int
	declare @idVendedor int
    select @cantidad = I.cantidad, @idCompra = I.idCompra, @idPublicacion = I.idPublicacion,
		   @idVendedor = I.idVendedor	
	from inserted I

   if((select I.tipoPublicacion from inserted I) = 'compra inmediata' )
   begin
	  insert into Facturaciones (fecha, idUsuario, total)
	  values (GETDATE(), @idVendedor, TPGDD.getTotalCompraInmediata(@cantidad, @idPublicacion))
	  set @nroFactura = @@IDENTITY 

	  insert into Items (cantidad, idCompra, idPublicacion, montoItem, nombre, nroFactura) 
	  values(@cantidad, @idCompra, @idPublicacion, TPGDD.getMontoItemPorVentaCompraInmediata(@cantidad, @idPublicacion), 'comision x venta', @nroFactura)
		
	  if (TPGDD.getAdmiteEnvio(@idPublicacion) = 1)
		  insert into Items (cantidad, idCompra, idPublicacion, montoItem, nombre, nroFactura) 
		  values(1, @idCompra, @idPublicacion, TPGDD.getMontoItemPorEnvio(@idPublicacion), 'comision x envio', @nroFactura)
   end
   
   if((select I.tipoPublicacion from inserted I) = 'subasta' )
   begin
	  insert into Facturaciones (fecha, idUsuario, total)
	  values (GETDATE(), @idVendedor, TPGDD.getTotalCompraSubasta(@idPublicacion))
	  set @nroFactura = @@IDENTITY 

	  insert into Items (cantidad, idCompra, idPublicacion, montoItem, nombre, nroFactura) 
	  values(1, @idCompra, @idPublicacion, TPGDD.getMontoItemPorVentaSubasta(@idPublicacion), 'comision x venta', @nroFactura)
		
	  if (TPGDD.getAdmiteEnvio(@idPublicacion) = 1)
		  insert into Items (cantidad, idCompra, idPublicacion, montoItem, nombre, nroFactura) 
		  values(1, @idCompra, @idPublicacion, TPGDD.getMontoItemPorEnvio(@idPublicacion), 'comision x envio', @nroFactura)
   end	
go
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--+++++++++++DESHABILITO TRIGGERS++++++++++++++++++++++++++++++++++++++++++++
DISABLE TRIGGER TPGDD.updateReputacionVenderorTrigger ON TPGDD.Calificaciones;
DISABLE TRIGGER TPGDD.updateStockPublicacionTrigger ON TPGDD.Compras;
DISABLE TRIGGER TPGDD.updateValorActualSubastaTrigger ON TPGDD.Ofertas;
DISABLE TRIGGER TPGDD.deleteUsuariosRolesTrigger ON TPGDD.Roles;
DISABLE TRIGGER TPGDD.generarFacturacionPorPublicar ON TPGDD.Publicaciones;
DISABLE TRIGGER TPGDD.generarFacturacionPorComprar ON TPGDD.Compras;
go

------------------------------------------------------------------------------------
--LISTADO ESTADÍSTICO
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
--Vendedores con mayor cantidad de productos no vendidos
------------------------------------------------------------------------------------
create  PROCEDURE TPGDD.peoresVendedoresSP(@codigoVisbilidad numeric(18,0), @numeroTrimestre int, @year int) 
AS 
BEGIN

	SELECT TOP 5  U.idUsuario idVendedor, isnull (TPGDD.cantidadNoVendida(U.idUsuario, @codigoVisbilidad, @numeroTrimestre, @year), 0) cantidadNoVendida
				 
	FROM TPGDD.Usuarios  U
	where exists(select 1 from Publicaciones P where P.idUsuario = U.idUsuario)
	ORDER BY 2 desc
END
go

/*Para probar el store
exec TPGDD.peoresVendedoresSP 10002, 4, 2015
go
*/

--FUNCIONES AYUDADORAS
create  FUNCTION TPGDD.getPublicacionesFiltradas (@idVendedor int, @codigoVisbilidad numeric(18,0), @numeroTrimestre int, @year int)  
RETURNS TABLE  
AS  
RETURN   
(  
    SELECT *
	from TPGDD.Publicaciones P
	where P.idUsuario = @idVendedor 
		  and P.codVisibilidad = @codigoVisbilidad 
	      and year(P.pFecha_Venc) = @year
		  and TPGDD.getTrimestre(P.pFecha_Venc) = @numeroTrimestre
);  
GO

/*
select * from dbo.getPublicacionesFiltradas(86,10002,1,2016)
select * from Publicaciones
*/

GO

 create   FUNCTION TPGDD.cantidadNoVendida(@idVendedor int, @codigoVisbilidad numeric(18,0), @numeroTrimestre int, @year int)
RETURNS  int
AS
BEGIN
	
	RETURN  (TPGDD.stockTotalInicial(@idVendedor , @codigoVisbilidad , @numeroTrimestre , @year )
			- TPGDD.cantidadVendida(@idVendedor , @codigoVisbilidad , @numeroTrimestre , @year ))
END
go

 create   FUNCTION TPGDD.stockTotalInicial(@idVendedor int, @codigoVisbilidad numeric(18,0), @numeroTrimestre int, @year int)
RETURNS  int
AS
BEGIN
	return (select sum(P.pStock)
	from TPGDD.getPublicacionesFiltradas(@idVendedor,@codigoVisbilidad,@numeroTrimestre,@year) P)
	
END
go

create   FUNCTION TPGDD.getTrimestre(@fecha datetime)
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

 create   FUNCTION TPGDD.cantidadVendida(@idVendedor int, @codigoVisbilidad numeric(18,0), @numeroTrimestre int, @year int)
RETURNS  int
AS
BEGIN
	
	RETURN (select sum(C.cantidad)
			from TPGDD.getPublicacionesFiltradas(@idVendedor,@codigoVisbilidad,@numeroTrimestre,@year) P, TPGDD.Compras C
			where   P.pCodigo = C.idPublicacion)
END
go

------------------------------------------------------------------------------------
--2. Clientes con mayor cantidad de productos comprados, por mes y por año, dentro 
--de un rubro particular
------------------------------------------------------------------------------------
create  PROCEDURE TPGDD.mejoresCompradoresSP(@idRubro int, @numeroTrimestre int, @year int) 
AS 
BEGIN

	select top 5 C.idCliente, TPGDD.cantidadProductosComprados(C.idCliente, @idRubro ,@numeroTrimestre, @year)  as CantidadProductosComprados
	from TPGDD.Clientes C
	order by 2 desc
END
go


/*Para probar el sp
exec  mejoresCompradoresSP 22,4, 2015 
select top 3 * from Publicaciones
go
*/

--Funciones ayudadoras
create    FUNCTION TPGDD.cantidadProductosComprados(@idCliente int, @idRubro int, @numeroTrimestre int, @year int)
RETURNS  int
AS
BEGIN
	
	RETURN  (select sum(C2.cantidad)
			 from TPGDD.Clientes C1, TPGDD.Compras C2 
			 where C1.idCliente = @idCliente and
				   C1.idCliente = C2.idCliente and
				   year(C2.fecha) = @year and 
				   TPGDD.getTrimestre(C2.fecha) =  @numeroTrimestre and
				   TPGDD.getRubro(C2.idPublicacion) = @idRubro
			 )
END
go


create    FUNCTION TPGDD.getRubro(@idPublicacion numeric (18,0))
RETURNS  int
AS
BEGIN
	
	RETURN  (select P.codRubro
			 from TPGDD.Publicaciones P
			 where P.pCodigo = @idPublicacion
			 )
END
go

------------------------------------------------------------------------------------
--3. Vendedores con mayor cantidad de facturas dentro de un mes y año particular
------------------------------------------------------------------------------------
create  PROCEDURE TPGDD.mejoresVendedoresPorCantidadFacturasSP(@numeroTrimestre int, @year int) 
AS 
BEGIN

	select top 5 U.idUsuario idVendedor, TPGDD.cantidadFacturas(U.idUsuario,@numeroTrimestre, @year)  as CantidadFacturas
	from TPGDD.Usuarios U
	where exists(select 1 from TPGDD.Publicaciones P where P.idUsuario = U.idUsuario)
	order by 2 desc
END
go


/*Para probar el sp
exec  TPGDD.mejoresVendedoresPorCantidadFacturasSP 1, 2015 
select top 3 * from Publicaciones
go
*/

--Funciones ayudadoras
create    FUNCTION TPGDD.cantidadFacturas(@idVendedor int, @numeroTrimestre int, @year int)
RETURNS  int
AS
BEGIN
	
	RETURN  (select count(F.nroFactura)
			 from TPGDD.Facturaciones F
			 where F.idUsuario = @idVendedor and
				   year(F.fecha) = @year and 
				   TPGDD.getTrimestre(F.fecha) =  @numeroTrimestre 
			 )
END
go

------------------------------------------------------------------------------------
--4. Vendedores con mayor monto facturado dentro de un mes y año particular
------------------------------------------------------------------------------------
create  PROCEDURE TPGDD.mejoresVendedoresPorMontoFacturadoSP(@numeroTrimestre int, @year int) 
AS 
BEGIN

	select top 5 U.idUsuario idVendedor, TPGDD.montoFacturado(U.idUsuario,@numeroTrimestre, @year)  as MontoFacturado
	from TPGDD.Usuarios U
	where exists(select 1 from TPGDD.Publicaciones P where P.idUsuario = U.idUsuario)
	order by 2 desc
END
go
											

/*Para probar el sp
exec  TPGDD.mejoresVendedoresPorMontoFacturadoSP 2, 2015 
select top 3 * from Publicaciones
go
*/

--Funciones ayudadoras
create    FUNCTION TPGDD.montoFacturado(@idVendedor int, @numeroTrimestre int, @year int)
RETURNS  int
AS
BEGIN
	
	RETURN  (select sum(F.total)
			 from TPGDD.Facturaciones F
			 where F.idUsuario = @idVendedor and
				   year(F.fecha) = @year and 
				   TPGDD.getTrimestre(F.fecha) =  @numeroTrimestre 
			 )
END
go

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++COMIENZA MIGRACION+++++++++++++++++
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

/*
-- Se le inserta un valor por defecto, que luego será modificado por la app antes de ejecutarse, cuando se cargue el archivo configuracion.
INSERT INTO [dbo].[Configuracion]  (Config_Datetime_App) VALUES	(GETDATE())		
*/
--inserto las funcionalidades
SET IDENTITY_INSERT TPGDD.Funcionalidades ON
INSERT INTO [TPGDD].[Funcionalidades] (idFuncionalidad, nombre, descripcion) VALUES 
(1,'Login','Login')
,(2, 'Cambiar contraseña', 'Cambiar contraseña') 
,(3, 'iniciar sesión', 'iniciar sesión')
,(4, 'Roles', 'Roles' )
, (5, 'Alta rol', 'Alta rol')
, (6, 'Modificacion rol', 'Modificacion rol' )
,(7, 'ABM  roles','ABM  roles' )
,(8, 'Consultar roles', 'Consultar roles')
,(9, 'Usuarios', 'Usuarios')
,(10, 'Alta usuario', 'Alta usuario')
,(11, 'Modificación/Baja','Modificación/Baja' )
,(12, 'ABM Usuarios','ABM Usuarios' )
,(13, 'Consulta usuarios', 'Consulta usuarios')
,(14, 'Comprar/Ofertar', 'Comprar/Ofertar')
,(15, 'Calificaciones' ,'Calificaciones' )
,(16, 'Listado estadistico', 'Listado estadistico')
,(17,'Consulta facturas','Consulta facturas')
, (18, 'Visibilidades','Visibilidades' )
,(19, 'Alta visibilidad', 'Alta visibilidad')
,(20,'Modificación visibilidad', 'Modificación visibilidad')
,(21,'ABM visibilidad', 'ABM visibilidad')
,(22, 'Consulta visibilidades',  'Consulta visibilidades')
, (23, 'Publicaciones', 'Hacer_Publicaciones')
, (24, 'Alta publicacion', 'Alta publicacion')
, (25, 'Modificacion publicacion', 'Modificacion publicacion')
,(26,'ABM publicaciones', 'ABM publicaciones')
,(27,'Consulta publicaciones', 'Consulta publicaciones')
,(28, 'Rubros', 'Rubros' )
, (29, 'Historial clientes','Historial clientes' )
SET IDENTITY_INSERT TPGDD.Funcionalidades OFF
GO

--inserto Roles
SET IDENTITY_INSERT TPGDD.Roles ON
INSERT INTO TPGDD.Roles(idRol, nombre)
VALUES 	(1, 'Administrador'),
		(2, 'Cliente'),
		(3, 'Empresa')
SET IDENTITY_INSERT TPGDD.Roles OFF
GO
--inserto la forma de pago
SET IDENTITY_INSERT TPGDD.FormasPago ON
INSERT INTO TPGDD.FormasPago(idFormaPago, descripcion)
VALUES (1,'Efectivo' ), (2,'Contra Reembolso')
SET IDENTITY_INSERT TPGDD.FormasPago OFF
GO
--inserto la localidad vacia para la migracion
SET IDENTITY_INSERT TPGDD.Localidades ON
INSERT INTO TPGDD.Localidades(codLocalidad, descripcion)
VALUES (1, ' ' )
SET IDENTITY_INSERT TPGDD.Localidades OFF
GO
--inserto las funcionalidades
SET IDENTITY_INSERT TPGDD.Funcionalidades ON
INSERT INTO TPGDD.RolesFuncionalidades (idRol, idFuncionalidad)
VALUES (1,1), (1,2), (1,3), (1,4), (1,5), (1,6), (1,7), (1,8), --Funcionalidades iniciales Administrador 
(1,9), (1,10), (1,11),(1,12), (1,13), (1,14),(1,15), (1,16),
(1,17),(1,18),(1,19), (1,20), (1,21), (1,22), (1,23), (1,24),
(1,25),(1,26), (1,27), (1,28), (1,29),
(2,1),(2,2),(2,3), (2,14), (2,15),(2,16),(2,17),	--Funcionalidades iniciales Cliente 
(2,18),(2,19), (2,20), (2,21), (2,22), (2,23), (2,24),
(2,25),(2,26), (2,27), (2,28), 
(3,1), (3,2),(3,3),(3,16),(3,17),	                --Funcionalidades iniciales Empresa 
(3,18),(3,19), (3,20), (3,21), (3,22), (3,23), (3,24),
(3,25),(3,26), (3,27), (3,28)
SET IDENTITY_INSERT TPGDD.Funcionalidades OFF
GO
--inserto los estados de la publicacion
SET IDENTITY_INSERT TPGDD.Estados ON
INSERT INTO TPGDD.Estados(idEstado, descripcion)
VALUES (1,'Borrador'),(2,'Activa'),(3,'Pausada'), (4,'Finalizada'), (5, 'Publicada' )
SET IDENTITY_INSERT TPGDD.Estados OFF
GO
--inserto el administrador
 INSERT INTO TPGDD.Usuarios ( username, password, tipoUsuario,mail, codPostal, nroPiso,nroCalle,
  nroDpto,  telefono, fechaCreacion  )
 VALUES ('admin' , '26d6a8ad97c75ffc548f6873e5e93ce475479e3e1a1097381e54221fb53ec1d2', 'Administrador',
  'admin@admin.com ', ' ', 0 , 0,' ',' ', GETDATE() )
GO

--inserto los clientes en los usuarios , password "W23E"
INSERT INTO TPGDD.Usuarios (codLocalidad, username, password, tipoUsuario, mail, nroPiso, nroDpto,
 fechaCreacion, nroCalle,domCalle, codPostal    )
SELECT  DISTINCT  1 AS codLocalidad, --codLocalidad 1 significa vacio
REPLACE(SUBSTRING(Cli_Mail,1,CHARINDEX('@',Cli_Mail)-1),' ','') AS username,
'26d6a8ad97c75ffc548f6873e5e93ce475479e3e1a1097381e54221fb53ec1d2' AS password,
'Cliente' AS tipoUsuario,
Cli_Mail AS mail,
Cli_Piso AS nroPiso,
Cli_Depto AS nroDpto,
GETDATE() AS fechaCreacion,
Cli_Nro_Calle AS nroCalle,
Cli_Dom_Calle AS domCalle,
Cli_Cod_Postal AS codPostal FROM [GD1C2016].[gd_esquema].[Maestra]
 WHERE Cli_Dni IS NOT NULL
  UNION -- UNION ALL ME DA 56 FILAS PERO CON REPETIDOS, UNION solo no permite repetidos
   SELECT DISTINCT     1 AS codLocalidad, --codLocalidad 1 significa vacio
REPLACE(SUBSTRING(Publ_Cli_Mail,1,CHARINDEX('@',Publ_Cli_Mail)-1),' ','') AS username,
'26d6a8ad97c75ffc548f6873e5e93ce475479e3e1a1097381e54221fb53ec1d2' AS password,
'Cliente' AS tipoUsuario,
Publ_Cli_Mail AS mail,
Publ_Cli_Piso AS nroPiso,
Publ_Cli_Depto AS nroDpto,
GETDATE() AS fechaCreacion,
Publ_Cli_Nro_Calle AS nroCalle,
Publ_Cli_Dom_Calle AS domCalle,
Publ_Cli_Cod_Postal AS codPostal FROM [GD1C2016].[gd_esquema].[Maestra]
 WHERE Publ_Cli_Dni IS NOT NULL 
  ORDER BY username
GO

--inserto las empresas en los usuarios,  password "W23E"
 INSERT INTO TPGDD.Usuarios (codLocalidad, username, password, tipoUsuario, mail, nroPiso, nroDpto,
 fechaCreacion, nroCalle,domCalle, codPostal    )
SELECT  DISTINCT  1 AS codLocalidad, --codLocalidad 1 significa vacio
REPLACE(SUBSTRING([Publ_Empresa_Mail],1,CHARINDEX('@',[Publ_Empresa_Mail])-1),' ','') AS username,
'26d6a8ad97c75ffc548f6873e5e93ce475479e3e1a1097381e54221fb53ec1d2' AS password,
'Empresa' AS tipoUsuario,
[Publ_Empresa_Mail] AS mail,
[Publ_Empresa_Piso] AS nroPiso,
[Publ_Empresa_Depto] AS nroDpto,
[Publ_Empresa_Fecha_Creacion] AS fechaCreacion,
[Publ_Empresa_Nro_Calle] AS domCalle,
[Publ_Empresa_Dom_Calle] AS nroDom,
[Publ_Empresa_Cod_Postal]  AS codPostal FROM [GD1C2016].[gd_esquema].[Maestra]
   WHERE [Publ_Empresa_Razon_Social] IS NOT NULL 
   GO

   --inserto a los Usuarios los roles
--inserto al administrador
INSERT INTO TPGDD.UsuariosRoles
 SELECT u.idUsuario , 1  FROM TPGDD.Usuarios AS u
WHERE u.tipoUsuario = 'Administrador' 
GO

--inserto los clientes
INSERT INTO TPGDD.UsuariosRoles
SELECT u.idUsuario, 2  FROM TPGDD.Usuarios AS u
WHERE u.tipoUsuario = 'Cliente'
GO

-- inserto las empresas
INSERT INTO TPGDD.UsuariosRoles
SELECT u.idUsuario, 3  FROM TPGDD.Usuarios AS u
WHERE u.tipoUsuario = 'Empresa'
GO


   --inserto las empresas
 INSERT INTO TPGDD.Empresas(   razonSocial, cuit, idUsuario )
SELECT DISTINCT MA.Publ_Empresa_Razon_Social AS razonSocial,MA.Publ_Empresa_Cuit,
 (SELECT idUsuario FROM TPGDD.Usuarios
 WHERE MA.Publ_Empresa_Razon_Social = SUBSTRING(mail,1,CHARINDEX('@',mail)-1) )  AS razonSocial 
 FROM [GD1C2016].[gd_esquema].[Maestra] MA
 WHERE MA.Publ_Empresa_Razon_Social IS NOT NULL 
GO

--inserto los clientes
 INSERT INTO TPGDD.Clientes( nombre, apellido, fechaNacimiento, nroDNI, tipoDocumento, idUsuario)
 SELECT DISTINCT MA.Cli_Nombre, Cli_Apeliido,Cli_Fecha_Nac, Cli_Dni, 'DNI' AS tipoDocumento, 
  (SELECT idUsuario FROM TPGDD.Usuarios AS u
 WHERE  SUBSTRING(MA.Cli_Nombre,1, 3)  = SUBSTRING( u.username, 1, 3) ) AS idUsuario 
  FROM [GD1C2016].[gd_esquema].[Maestra] MA
 WHERE MA.Cli_Dni IS NOT NULL
GO

--INSERTO LAS VISIBILIDADES
INSERT INTO TPGDD.Visibilidades(codigo, descripcion, precio, porcentaje, Envio) 
 SELECT DISTINCT MA.Publicacion_Visibilidad_Cod, MA.Publicacion_Visibilidad_Desc,
  MA.Publicacion_Visibilidad_Precio, MA.Publicacion_Visibilidad_Porcentaje, 20 AS Envio
  FROM [GD1C2016].[gd_esquema].[Maestra] MA
  WHERE MA.Publicacion_Visibilidad_Cod IS NOT NULL
  ORDER BY MA.Publicacion_Visibilidad_Precio DESC
GO
--inserto los rubros son 23 rubros diferentes
INSERT INTO TPGDD.Rubros(descripcionCorta, descripcionLarga)
SELECT DISTINCT MA.Publicacion_Rubro_Descripcion, MA.Publicacion_Rubro_Descripcion
 FROM [GD1C2016].[gd_esquema].[Maestra] MA 
GO

-- INSERTO TODAS LAS PUBLICACIONES  QUE ESTAN PUBLICADAS 58.726, segun analisis todas estan finalizadas, pues tienen factura
SET IDENTITY_INSERT TPGDD.PUBLICACIONES ON
INSERT INTO TPGDD.Publicaciones(pCodigo,codVisibilidad, codRubro, idEstado, idUsuario, pDescripcion,
	pStock, pFecha, pFecha_Venc, pPrecio)
	 SELECT DISTINCT MA.Publicacion_Cod,
     ( SELECT V.codigo FROM TPGDD.Visibilidades V
    WHERE MA.Publicacion_Visibilidad_Cod = V.codigo) AS codVisibilidad,
	(SELECT r.codRubro  FROM TPGDD.Rubros r 
	WHERE MA.Publicacion_Rubro_Descripcion = r.descripcionLarga  )  AS codRubro, 
	4  AS idEstado,
	(SELECT u.idUsuario FROM TPGDD.Usuarios u
	WHERE Publ_Cli_Mail = u.mail OR Publ_Empresa_Mail = u.mail),	
	MA.Publicacion_Descripcion,   MA.Publicacion_Stock, MA.Publicacion_Fecha, 
	MA.Publicacion_Fecha_Venc,   MA.Publicacion_Precio 
	FROM [GD1C2016].[gd_esquema].[Maestra] MA
  WHERE MA.Factura_Total IS NULL and Calificacion_Codigo IS NULL AND Oferta_Monto IS NULL
   AND Compra_Fecha IS NULL AND Item_Factura_Monto IS NULL AND MA.Forma_Pago_Desc IS NULL
SET IDENTITY_INSERT TPGDD.PUBLICACIONES OFF

--INSERTO COMPRASINMEDIATAS, INCLUYO LAS GRATUITAS :92.422 es grande el numero porque es un registro por cada compra que se hizo
INSERT INTO TPGDD.ComprasInmediatas(idPublicacion, stockDisponible,unidadesVendidas)
SELECT  MA.Publicacion_Cod,
( MA.Publicacion_Stock - MA.Compra_Cantidad) AS stockDisponible, 
MA.Compra_Cantidad AS unidadesVendidas
FROM [GD1C2016].[gd_esquema].[Maestra] MA
inner JOIN TPGDD.Publicaciones p ON P.pCodigo = MA.Publicacion_Cod
WHERE MA.Compra_Cantidad IS NOT NULL and MA.Publicacion_Tipo = 'Compra Inmediata' and ma.Calificacion_Codigo is null
ORDER BY  MA.Publicacion_Cod
GO

--INSERTO LAS SUBASTAS FINALIZADAS , EL VALOR ACTUAL SIEMPRE SERA EL ULTIMO VALOR
-- O SEA EL VALOR CON QUE CIERRA LA SUBASTA. son subastas que tienen facturas 4.940
 --3946 con monto mayor a cero
INSERT INTO TPGDD.Subastas(idPublicacion, valorActual)
 SELECT DISTINCT P.pCodigo,   MA.Factura_Total AS valorActual 
  FROM [GD1C2016].[gd_esquema].[Maestra] MA
   INNER JOIN TPGDD.Publicaciones P ON P.pCodigo = MA.Publicacion_Cod
  WHERE MA.Publicacion_Tipo  = 'Subasta' 
   AND MA.Factura_Total is not null
GO

--INSERTO LAS OFERTAS REALIZADAS EN LAS SUBASTAS 14728
INSERT INTO TPGDD.Ofertas(idCliente, idSubasta, fecha, monto)
SELECT DISTINCT C.idCliente, S.idSubasta,MA.Oferta_Fecha ,MA.Oferta_Monto
FROM [GD1C2016].[gd_esquema].[Maestra] MA
INNER JOIN TPGDD.Clientes C ON C.nroDNI = MA.Cli_Dni
INNER JOIN TPGDD.Subastas S ON S.idPublicacion = MA.Publicacion_Cod
WHERE MA.Oferta_Fecha IS NOT NULL AND MA.Oferta_Monto IS NOT NULL AND MA.Publicacion_Tipo = 'Subasta'
ORDER BY S.idSubasta, MA.Oferta_Monto
GO

--INSERTO LAS COMPRAS,  total 97.265
INSERT INTO TPGDD.Compras(idPublicacion, idCliente,fecha, cantidad, tipoPublicacion, idVendedor, calificada)
SELECT DISTINCT MA.Publicacion_Cod,C.idCliente, MA.Compra_Fecha ,MA.Compra_Cantidad, MA.Publicacion_Tipo, P.idUsuario, 0
FROM [GD1C2016].[gd_esquema].[Maestra] MA
INNER JOIN TPGDD.Clientes C ON C.nroDNI = MA.Cli_Dni and c.nombre = ma.Cli_Nombre
INNER JOIN TPGDD.Publicaciones P ON P.pCodigo = MA.Publicacion_Cod and p.pFecha = ma.Publicacion_Fecha
 WHERE MA.Compra_Fecha IS NOT NULL AND MA.Compra_Cantidad IS NOT NULL 
ORDER BY MA.Publicacion_Cod
GO
--inserto las calificaciones 97.362
SET IDENTITY_INSERT TPGDD.Calificaciones ON
INSERT INTO TPGDD.Calificaciones(codigoCalificacion, idCompra, calificador,cantEstrellas, observacion  )
select DISTINCT MA.Calificacion_Codigo, comp.idCompra,cli.idCliente ,
CASE WHEN (MA.Calificacion_Cant_Estrellas = 10 OR MA.Calificacion_Cant_Estrellas =9) THEN 5 
WHEN (MA.Calificacion_Cant_Estrellas = 8 OR MA.Calificacion_Cant_Estrellas =7) THEN 4
WHEN (MA.Calificacion_Cant_Estrellas = 6 OR Calificacion_Cant_Estrellas =5) THEN 3
WHEN (MA.Calificacion_Cant_Estrellas = 4 OR MA.Calificacion_Cant_Estrellas =3) THEN 2
WHEN (MA.Calificacion_Cant_Estrellas = 2 OR MA.Calificacion_Cant_Estrellas =1) THEN 1 
 END AS cantEstrellas, Calificacion_Descripcion
 FROM [GD1C2016].[gd_esquema].[Maestra] MA
 inner join TPGDD.compras comp on comp.idPublicacion = ma.Publicacion_Cod and comp.fecha = ma.Compra_Fecha and comp.cantidad = ma.Compra_Cantidad
inner join TPGDD.Clientes cli on cli.idCliente = comp.idCliente and cli.nroDNI = ma.Cli_Dni
WHERE  MA.Calificacion_Codigo IS NOT NULL 
order by  MA.Calificacion_Codigo
 SET IDENTITY_INSERT TPGDD.Calificaciones OFF
GO

--SE AGREGAN LAS FACTURAS 58.726
 SET IDENTITY_INSERT TPGDD.Facturaciones ON
 INSERT INTO TPGDD.Facturaciones(nroFactura, idFormaPago, idUsuario, fecha,total)
 SELECT DISTINCT MA.Factura_Nro, 
 (SELECT  F.idFormaPago FROM TPGDD.FormasPago F WHERE F.descripcion = MA.Forma_Pago_Desc) ,
 (SELECT U.idUsuario  FROM TPGDD.Usuarios U WHERE U.mail = MA.Cli_Mail OR U.mail = MA.Publ_Empresa_Mail  ) AS idUsuario
 , MA.Factura_Fecha, MA.Factura_Total
 FROM [GD1C2016].[gd_esquema].[Maestra] MA
 WHERE MA.Factura_Nro IS NOT NULL
 order by idUsuario
  SET IDENTITY_INSERT TPGDD.Facturaciones OFF
GO
--inserto items 128.604 -> 144.078
insert into TPGDD.Items(nroFactura, idCompra,nombre, cantidad, montoItem, idPublicacion)

SELECT DISTINCT
	(SELECT F.nroFactura FROM TPGDD.Facturaciones F 
	  WHERE (F.nroFactura = MA.Factura_Nro AND F.total = MA.Factura_Total AND F.fecha = MA.Factura_Fecha))
	,COMP.idCompra
	, ' '
	,[Item_Factura_Cantidad]
	,[Item_Factura_Monto]
	,(SELECT P.pCodigo FROM TPGDD.Publicaciones P 
	    WHERE ( P.pCodigo = MA.Publicacion_Cod AND P.pFecha = MA.Publicacion_Fecha AND P.pPrecio = MA.Publicacion_Precio) )    
FROM [GD1C2016].[gd_esquema].[Maestra] MA
INNER JOIN TPGDD.Compras COMP ON (COMP.idPublicacion = MA.Publicacion_Cod AND COMP.cantidad = MA.Item_Factura_Cantidad )
WHERE MA.Item_Factura_Cantidad IS NOT NULL AND MA.Item_Factura_Monto IS NOT NULL
ORDER BY COMP.idCompra
GO


--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--+++++++++++HABILITO TRIGGERS++++++++++++++++++++++++++++++++++++++++++++
ENABLE TRIGGER TPGDD.updateReputacionVenderorTrigger ON TPGDD.Calificaciones;
ENABLE TRIGGER TPGDD.updateStockPublicacionTrigger ON TPGDD.Compras;
ENABLE TRIGGER TPGDD.updateValorActualSubastaTrigger ON TPGDD.Ofertas;
ENABLE TRIGGER TPGDD.deleteUsuariosRolesTrigger ON TPGDD.Roles;
ENABLE TRIGGER TPGDD.generarFacturacionPorPublicar ON TPGDD.Publicaciones;
ENABLE TRIGGER TPGDD.generarFacturacionPorComprar ON TPGDD.Compras;

/*
CREATE PROCEDURE dbo.set_datetime_app (
	@datetime_app		datetime
)
AS

SET XACT_ABORT ON	-- Si alguna instruccion genera un error en runtime, revierte la transacción.
SET NOCOUNT ON		-- No actualiza el número de filas afectadas. Mejora performance y reduce carga de red.

DECLARE @starttrancount int
DECLARE @error_message nvarchar(4000)

BEGIN TRY
	SELECT @starttrancount = @@TRANCOUNT	--@@TRANCOUNT lleva la cuenta de las transacciones abiertas.

	IF @starttrancount = 0
		BEGIN TRANSACTION

			UPDATE config
			SET config.Config_Datetime_App = @datetime_app
			FROM dbo.Configuracion config
			WHERE config.Config_Id = 1

	IF @starttrancount = 0
		COMMIT TRANSACTION
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @starttrancount = 0	--XACT_STATE() es cero sólo cuando no hay ninguna transacción activa para este usuario.
		ROLLBACK TRANSACTION
	SELECT @error_message = ERROR_MESSAGE()
	RAISERROR('Error al querer setear la fecha y hora del sistema según la app: %s',16,1, @error_message)
END CATCH
GO
*/



