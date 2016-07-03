IF (SELECT name FROM master.dbo.sysdatabases WHERE name = 'GD1C2016') IS NULL
BEGIN
EXEC('CREATE DATABASE GD1C2016')
END
GO
-- tiempo 1:40 
USE GD1C2016;
GO
--******************************************************
--**** DROP DE TODO LO CREADO ANTERIORMENTE    *********
--******************************************************
declare @schema_name varchar(max)				= 'TPGDD';
declare @schema_id int							= schema_id(@schema_name),
		@drop_schema_dependencies varchar(max)	= ''

-- DROP FKS 
SELECT @drop_schema_dependencies = @drop_schema_dependencies +
		'alter table [' + @schema_name + '].[' + OBJECT_NAME(parent_object_id) + '] ' +
		'drop CONSTRAINT [' + OBJECT_NAME(object_id) + '];' + CHAR(30)
	FROM sys.foreign_keys WHERE schema_id = @schema_id

-- DROP VIEWS 
SELECT @drop_schema_dependencies = @drop_schema_dependencies +
		'drop view [' + @schema_name + '].[' + OBJECT_NAME(object_id) + '];' + CHAR(30)
	FROM sys.views WHERE schema_id = @schema_id

-- DROP FUNCTIONS  
SELECT @drop_schema_dependencies = @drop_schema_dependencies +
		'drop function [' + @schema_name + '].[' + OBJECT_NAME(object_id) + '];' + CHAR(30)
	FROM sys.objects WHERE type in ('FN', 'IF', 'TF', 'FS', 'FT') and schema_id = @schema_id

-- DROP TABLES
SELECT @drop_schema_dependencies = @drop_schema_dependencies +
		'drop table [' + @schema_name + '].[' + OBJECT_NAME(object_id) + '];' + CHAR(30)
	FROM sys.tables WHERE schema_id = @schema_id
	
-- DROP SP
SELECT @drop_schema_dependencies = @drop_schema_dependencies +
		'drop procedure [' + @schema_name + '].[' + OBJECT_NAME(object_id) + '];' + CHAR(30)
	FROM sys.procedures WHERE schema_id = @schema_id

-- Drop Types --
SELECT @drop_schema_dependencies = @drop_schema_dependencies +
		'drop type [' + @schema_name + '].[' + name + '];' + CHAR(30)
	FROM sys.types WHERE schema_id = @schema_id	

exec (@drop_schema_dependencies)
go


--DROP SCHEMA
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = 'TPGDD')
DROP SCHEMA [TPGDD]
GO


create schema TPGDD authorization gd
Go 
--********************************************************
--***********  CREACION DE LAS TABLAS  *******************
--********************************************************
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
	habilitado bit DEFAULT 1 NOT NULL --1 SI HABILITADO
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
	intentosFallidos int DEFAULT 1 NOT NULL, -- 1 HABILITADO
	reputacion int DEFAULT 0 NULL,
	bajaLogica bit DEFAULT 0 NULL -- 0 NO BAJA LOGICA
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
	prioridad int  not NULL, 
	admiteEnvio bit DEFAULT 0 NULL--0 no admite envio
)
GO
/*
CREATE TABLE Configuracion (
	Config_Id	integer		identity(1,1) PRIMARY KEY,
	Config_Datetime_App	datetime,
	
	-- Con esto nos aseguramos que la configuraci�n contenga siempre un �nico registro. En caso de agregar otro par�metro de configuraci�n
	-- habr� que modificar el esquema y crear otro atributo. Para m�s pros y contras de este tipo de patr�n, ver http://stackoverflow.com/a/2300493
	Config_Solo_Un_Registro	bit DEFAULT 0			unique,
	CHECK(Config_Solo_Un_Registro = 0)
)
GO*/
--************************************************************
--**********  CREACION DE CONSTRAINTS FK, PK, INDICES ********
--************************************************************

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

--********************************************************************
--***** FUNCIONES AUXILIARES DE TRIGGERS 1-6 *************************
--********************************************************************
/****** Object:  UserDefinedFunction [TPGDD].[getCantidadCompras]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  FUNCTION [TPGDD].[getCantidadCompras](@idVendedor int)
RETURNS  int
AS
BEGIN
	RETURN  (select count(*) from TPGDD.Compras C where C.idVendedor = @idVendedor)
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[getCantidadSubastas]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  FUNCTION [TPGDD].[getCantidadSubastas](@idVendedor int)
RETURNS  int
AS
BEGIN
	RETURN  (select count(*) from TPGDD.Publicaciones P, TPGDD.Subastas S 
	where P.pCodigo = S.idPublicacion and P.idUsuario = @idVendedor)
END

GO

/****** Object:  UserDefinedFunction [TPGDD].[getIdVendedor]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  FUNCTION [TPGDD].[getIdVendedor](@idCompra int)
RETURNS  int
AS
BEGIN
	RETURN  (select top 1 T.idVendedor from TPGDD.Compras T where T.idCompra = @idCompra)
END

GO

/****** Object:  UserDefinedFunction [TPGDD].[getComprasVendedor]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create  FUNCTION [TPGDD].[getComprasVendedor](@idCompra int)
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

GO


--********************************************************************
--***** FUNCIONES AUXILIARES DE TRIGGERS 1-6 *************************
--********************************************************************



 /****** Object:  UserDefinedFunction [TPGDD].[getPrecioVisibilidad]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  FUNCTION [TPGDD].[getPrecioVisibilidad](@codVisibildad numeric(18,0))
RETURNS  numeric(18,2)
AS
BEGIN
	RETURN  (select V.precio from Visibilidades V where V.codigo = @codVisibildad)
END

GO

/****** Object:  UserDefinedFunction [TPGDD].[getMontoItemPorVentaSubasta]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [TPGDD].[getMontoItemPorVentaSubasta](@idPublicacion numeric(18,0))
RETURNS  numeric(18,2)
AS
BEGIN

	return (select top 1 S.valorActual from TPGDD.Subastas S where S.idPublicacion = @idPublicacion)

END

GO


/****** Object:  UserDefinedFunction [TPGDD].[getAdmiteEnvio]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [TPGDD].[getAdmiteEnvio](@idPublicacion numeric(18,0))
RETURNS  bit
AS
BEGIN
	return (select V.admiteEnvio from TPGDD.Publicaciones P, TPGDD.Visibilidades V where P.codVisibilidad = V.codigo and P.pCodigo = @idPublicacion)
END

GO


/****** Object:  UserDefinedFunction [TPGDD].[getMontoItemPorEnvio]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  FUNCTION [TPGDD].[getMontoItemPorEnvio](@idPublicacion numeric(18,0))
RETURNS  numeric(10,2)
AS
BEGIN
	return (select V.Envio from TPGDD.Publicaciones P, TPGDD.Visibilidades V 
	where P.codVisibilidad = V.codigo and P.pCodigo = @idPublicacion)
END

GO



/****** Object:  UserDefinedFunction [TPGDD].[getMontoItemPorVentaCompraInmediata]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  FUNCTION [TPGDD].[getMontoItemPorVentaCompraInmediata](@cantidad numeric(18,0), @idPublicacion numeric(18,0))
RETURNS  numeric(18,2)
AS
BEGIN
	return @cantidad * (select P.pPrecio from TPGDD.Publicaciones P where pCodigo = @idPublicacion) * 
			(select V.porcentaje from TPGDD.Publicaciones P, TPGDD.Visibilidades V 
			where P.codVisibilidad = V.codigo and P.pCodigo = @idPublicacion)
END

GO




/****** Object:  UserDefinedFunction [TPGDD].[getTotalCompraInmediata]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [TPGDD].[getTotalCompraInmediata](@cantidad numeric(18,0), @idPublicacion numeric(18,0))
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
/****** Object:  UserDefinedFunction [TPGDD].[getTotalCompraSubasta]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [TPGDD].[getTotalCompraSubasta]( @idPublicacion numeric(18,0))
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


--************************************************************
--********     TRIGGERS                ***********************
--************************************************************
--*******************************************************************************************
--0. para actualizar que una compra ha sido calificada, cuando se ingresa una calificaci�n**
--*******************************************************************************************
--se hace un cursor que recorre la tabla de insertados y para cada insercion realiza la operaci�n
CREATE trigger TPGDD.TRIGGERUPDATECALIFICADACOMPRA
ON TPGDD.CALIFICACIONES
AFTER INSERT
AS
     DECLARE @idCompra int

      DECLARE cursorRecorre CURSOR  FOR
        SELECT I.idCompra from inserted I

      OPEN cursorRecorre

      FETCH NEXT FROM cursorRecorre INTO @idCompra

      WHILE ( @@FETCH_STATUS = 0 ) 
        BEGIN       
		
			Begin try
				UPDATE TPGDD.Compras SET CALIFICADA = 1
				WHERE idCompra = @idCompra	

			End try
			Begin catch												
				declare @msg nvarchar(255)
				set @msg = 'ERROR: No se pudo actualizar el estado calificada en la compra.'  + (SELECT  ERROR_MESSAGE() )
			Raiserror(@msg ,15,1)
			Rollback transaction--rollbackea TODO
			End catch				

		END
			
            FETCH  NEXT FROM cursorRecorre INTO @idCompra        

      CLOSE cursorRecorre

      DEALLOCATE cursorRecorre 
GO

--**************************************************************************************************
--1. Para actualizar la reputaci�n del vendedor cuando se inserta una calificacion en calificaciones.
 --*************************************************************************************************
CREATE  trigger TPGDD.updateReputacionVenderorTrigger
on  TPGDD.Calificaciones
after insert
as
	DECLARE cursor_compras CURSOR FOR select I.idCompra from inserted I; 
	declare @idCompra int
	OPEN cursor_compras;
	FETCH NEXT FROM cursor_compras INTO @idCompra
	WHILE @@FETCH_STATUS = 0  
	BEGIN
	--************************************************************************************************************************  		
			declare @idVendedor int
			Begin try
				set @idVendedor = TPGDD.getIdVendedor(@idCompra)
				update Usuarios set reputacion =  (select sum(C2.cantEstrellas)
													from  getComprasVendedor(@idCompra) C1, Calificaciones C2 
    												where C1.idCompra = C2.idCompra) / (TPGDD.getCantidadCompras(@idVendedor))
				where Usuarios.idUsuario = @idVendedor
			End try
			Begin catch
				declare @msg nvarchar(255)
				set @msg = 'ERROR: No se pudo actualizar la reputacion del vendedor.'  + (SELECT  ERROR_MESSAGE() )
				Raiserror(@msg ,15,1)
				Rollback transaction--rollbackea TODO
				break
			End catch
	--************************************************************************************************************************
			FETCH NEXT FROM cursor_compras INTO @idCompra
			
	END;
	CLOSE cursor_compras;
	DEALLOCATE cursor_compras;	
go



create function TPGDD.getStockComprasInmediatas(@idPublicacion numeric(18,0))
returns int
as
begin
	return (select top 1 stockDisponible from TPGDD.ComprasInmediatas where idPublicacion = @idPublicacion)
end
go

--****************************************************************************************************
--2. para actualizar el stock disponible en comras inmediatas cuando se inserta una compra en compras.
--*****************************************************************************************************
CREATE  trigger TPGDD.updateStockPublicacionTrigger
on TPGDD.Compras
after insert
as
	DECLARE cursor_compras CURSOR FOR select I.tipoPublicacion, I.cantidad, I.idPublicacion from inserted I
	declare @tipoPublicacion nvarchar(255)
    declare @cantidadComprada numeric(18,0)
    declare @idPublicacion numeric(18,0)
	OPEN cursor_compras;
	FETCH NEXT FROM cursor_compras INTO @tipoPublicacion, @cantidadComprada, @idPublicacion 
	WHILE @@FETCH_STATUS = 0  
	BEGIN
	--************************************************************************************************************************  		
			declare @stockDisponible numeric(18,0)
			
			begin try
			set  @stockDisponible = TPGDD.getStockComprasInmediatas(@idPublicacion) 

			   if @tipoPublicacion = 'Compra Inmediata'
			   begin
					if @cantidadComprada > @stockDisponible
					begin 
						RAISERROR ('ERROR. NO PUEDE COMPRAR LA CANTIDAD ELEGIDA NO HAY SUFICIENTE STOCK',15,1)
					end
					else
					begin
						update TPGDD.ComprasInmediatas set stockDisponible = @stockDisponible - @cantidadComprada  where idPublicacion = @idPublicacion
					end
  			   end
			end try
	
			begin catch
				declare @msg nvarchar(255)
				set @msg = 'ERROR: No se pudo actualizar el stock de la publicaci�n.'  + (SELECT  ERROR_MESSAGE() )
				Raiserror(@msg ,15,1)
				Rollback transaction--rollbackea TODO
				break	
			end catch
	--************************************************************************************************************************
			FETCH NEXT FROM cursor_compras INTO @tipoPublicacion, @cantidadComprada, @idPublicacion 
			
	END;
	CLOSE cursor_compras;
	DEALLOCATE cursor_compras;	  
go

--***************************************************************************************
--3. para actualizar el valorActual de una subasta cuando se realiza una oferta en ofertas.
--****************************************************************************************
CREATE  trigger TPGDD.updateValorActualSubastaTrigger
on TPGDD.Ofertas
after insert
as
	declare @montoOfertado numeric(18,2)
	declare	@idSubasta	int
	declare	@valorActualSubasta numeric(18,0)
	declare @valorActualStr nvarchar(255), @montoOfertadoStr nvarchar(255)	

	DECLARE cursor_ofertas CURSOR FOR select I.monto, I.idSubasta from inserted I;
	OPEN cursor_ofertas;
	FETCH NEXT FROM cursor_ofertas INTO @montoOfertado, @idSubasta 
	WHILE @@FETCH_STATUS = 0  
	BEGIN  		
	--************************************************************************************************************************
			begin try
				set @valorActualSubasta =  (select S.valorActual from Subastas S where S.idSubasta = @idSubasta)
	
				--validar que monot ofertado sea mayor que el valor actual de la subasta
			   if @montoOfertado <= @valorActualSubasta
			   begin
					set @valorActualStr = CONVERT(nvarchar(255), @valorActualSubasta)
					set @montoOfertadoStr = CONVERT(nvarchar(255), @montoOfertado)					 
					RAISERROR ('ERROR. DEBE OFERTAR UN MONTO MAYOR VALOR ACTUAL: %s, monto ofertado: %s',15,1, @valorActualStr, @montoOfertadoStr)
			   end
			   else
			   begin
					update Subastas set valorActual = @montoOfertado
					where Subastas.idSubasta = @idSubasta
			   end
			end try			

			Begin catch
				declare @msg nvarchar(255)
				set @msg = 'ERROR: No se pudo actualizar el valor actual de la subasta.'  + (SELECT  ERROR_MESSAGE() )
				Raiserror(@msg ,15,1)
				Rollback transaction--rollbackea TODO
				break	
			End catch
	--************************************************************************************************************************
			FETCH NEXT FROM cursor_ofertas INTO @montoOfertado, @idSubasta 
	END;
	CLOSE cursor_ofertas;
	DEALLOCATE cursor_ofertas;	
go


--************************************************************************
--4. para eliminar los usuariosRoles cuando en roles cambio el habilitado.
--*************************************************************************
CREATE  trigger TPGDD.deleteUsuariosRolesTrigger
on TPGDD.Roles
after update
as
   declare @estadoRolAnterior bit, @estadoRolNuevo bit, @idRol int

	DECLARE cursor_roles CURSOR FOR select I.habilitado, D.idRol, D.habilitado from inserted I, deleted D where I.idRol = D.idRol;
	OPEN cursor_roles;
	FETCH NEXT FROM cursor_roles INTO @estadoRolNuevo, @idRol, @estadoRolAnterior 
	WHILE @@FETCH_STATUS = 0  
	BEGIN  		
	--************************************************************************************************************************   
   begin try
	   if(@estadoRolAnterior = 1 and @estadoRolNuevo = 0)
	   begin
		delete from UsuariosRoles where UsuariosRoles.idRol = @idRol
	   end
   end try
	
	Begin catch
		declare @msg nvarchar(255), @idRolStr nvarchar(255)
		set @idRolStr = CONVERT(nvarchar(255), @idRol)
		set @msg = 'ERROR: No se pudieron eliminar las tuplas(usuarios,roles) para el idRol: ' + @idRolStr + (SELECT  ERROR_MESSAGE() )
		Raiserror(@msg ,15,1)
		Rollback transaction--rollbackea TODO
		break	
	End catch				
	--************************************************************************************************************************
	FETCH NEXT FROM cursor_roles INTO @estadoRolNuevo, @idRol, @estadoRolAnterior 
	END;
	CLOSE cursor_roles;
	DEALLOCATE cursor_roles;	
go


--*******************************************************************************************
--5. cuando una pubicacion se pone activa armar la factura de la publicacion y generar el item
--*******************************************************************************************
CREATE  trigger TPGDD.generarFacturacionPorPublicar
on TPGDD.Publicaciones
after update
as
    declare @costoPorPublicar numeric(18,2)
    declare @codigoVisbilidad numeric(18,0), @idVendedor int, @idEstadoPubViejo int, @idEstadoPubNuevo int, @codPublicacion numeric(18,0)

    DECLARE cursor_publicaciones CURSOR FOR select I.idEstado, D.codVisibilidad, D.idUsuario, D.idEstado, D.pCodigo from inserted I, deleted D where I.pCodigo = D.pCodigo;
	OPEN cursor_publicaciones;
	FETCH NEXT FROM cursor_publicaciones INTO @idEstadoPubNuevo, @codigoVisbilidad, @idVendedor, @idEstadoPubViejo, @codPublicacion   
	WHILE @@FETCH_STATUS = 0  
	BEGIN  		
	--************************************************************************************************************************   
	   begin try
		   set @costoPorPublicar = TPGDD.getPrecioVisibilidad(@codigoVisbilidad)
		    
		   if(@idEstadoPubViejo =  1 and @idEstadoPubNuevo = 2 )-- 1 = borrador , 2 = activa
		   begin
				insert into Facturaciones (idUsuario, fecha, total)
				values (@idVendedor, GETDATE(),@costoPorPublicar)
				insert into Items (nroFactura, nombre, cantidad, montoItem, idPublicacion)
				values(@@IDENTITY, 'comision x publicar', 1, @costoPorPublicar, @codPublicacion)
		   end	
	   end try

   		Begin catch
			declare @msg nvarchar(255), @codPublicacionStr nvarchar(255)
			set @codPublicacionStr = CONVERT(nvarchar(255), @codPublicacion)
			set @msg = 'ERROR: No se pudo generar la facturacion para la publicacion: ' + @codPublicacionStr + (SELECT  ERROR_MESSAGE() )
			Raiserror(@msg ,15,1)
			Rollback transaction--rollbackea TODO
			break	
		End catch
				
	--************************************************************************************************************************
	FETCH NEXT FROM cursor_publicaciones INTO @idEstadoPubNuevo, @codigoVisbilidad, @idVendedor, @idEstadoPubViejo, @codPublicacion   
	END;
	CLOSE cursor_publicaciones;
	DEALLOCATE cursor_publicaciones;	
go

--*************************************************************************
--6. cuando genero una compra generar el item y agregarselo a la factura
--*************************************************************************
create  trigger TPGDD.generarFacturacionPorComprar
on TPGDD.Compras
after insert
as
    declare @cantidad numeric (18,0)
	declare @idCompra int 
	declare @idPublicacion numeric (18,0)
	declare @nroFactura int
	declare @idVendedor int
	declare @tipoPublicacion nvarchar(255)

    DECLARE cursor_compras CURSOR FOR select I.cantidad, I.idCompra, I.idPublicacion,I.idVendedor, I.tipoPublicacion from inserted I
	OPEN cursor_compras;
	FETCH NEXT FROM cursor_compras INTO @cantidad, @idCompra, @idPublicacion, @idVendedor, @tipoPublicacion
	WHILE @@FETCH_STATUS = 0  
	BEGIN  		
	--************************************************************************************************************************   
	   begin try

		   if(@tipoPublicacion = 'Compra Inmediata')
		   begin
				insert into Facturaciones (fecha, idUsuario, total)
				values (GETDATE(), @idVendedor, TPGDD.getTotalCompraInmediata(@cantidad, @idPublicacion))
	  
				set @nroFactura = @@IDENTITY 
				insert into Items (cantidad, idCompra, idPublicacion, montoItem, nombre, nroFactura) 
				values(@cantidad, @idCompra, @idPublicacion, TPGDD.getMontoItemPorVentaCompraInmediata(@cantidad, @idPublicacion), 'comision x venta', @nroFactura)
		
				if (TPGDD.getAdmiteEnvio(@idPublicacion) = 1)
				begin
					insert into Items (cantidad, idCompra, idPublicacion, montoItem, nombre, nroFactura) 
					values(1, @idCompra, @idPublicacion, TPGDD.getMontoItemPorEnvio(@idPublicacion), 'comision x envio', @nroFactura)
				end
		   end
 
		   if(@tipoPublicacion = 'Subasta' )
		   begin
				insert into Facturaciones (fecha, idUsuario, total)
				values (GETDATE(), @idVendedor, TPGDD.getTotalCompraSubasta(@idPublicacion))
	  
				set @nroFactura = @@IDENTITY 
				insert into Items (cantidad, idCompra, idPublicacion, montoItem, nombre, nroFactura) 
				values(1, @idCompra, @idPublicacion, TPGDD.getMontoItemPorVentaSubasta(@idPublicacion), 'comision x venta', @nroFactura)
		
				if (TPGDD.getAdmiteEnvio(@idPublicacion) = 1)
				begin
					insert into Items (cantidad, idCompra, idPublicacion, montoItem, nombre, nroFactura) 
					values(1, @idCompra, @idPublicacion, TPGDD.getMontoItemPorEnvio(@idPublicacion), 'comision x envio', @nroFactura)	
				end
		   end	

	   end try

	   Begin catch
			declare @msg nvarchar(255)
			set @msg = 'ERROR TRIGGER: No se puede generar la facturacion para la compra id: ' + CONVERT(nvarchar(255), @idCompra)  + (SELECT  ERROR_MESSAGE() )
			Raiserror(@msg ,15,1)
			Rollback transaction--rollbackea TODO
			break	
		End catch
	
	--************************************************************************************************************************
	FETCH NEXT FROM cursor_compras INTO @cantidad, @idCompra, @idPublicacion, @idVendedor, @tipoPublicacion
	END;
	CLOSE cursor_compras;
	DEALLOCATE cursor_compras;	

  
go

alter FUNCTION TPGDD.getAdmiteEnvio(@idPublicacion numeric(18,0))
RETURNS  bit
AS
BEGIN
	return (select P.pEnvio from TPGDD.Publicaciones P where  P.pCodigo = @idPublicacion)
END
GO

--*************************************************************************
-- *** 7 y 8 PARA EVITAR QUE UN CLIENTE COMPRE  O OFERTE                ***
-- ****  CUANDO TIENE PENDIENTE MAS DE 3 CALIFICACIONES                 ***
--*************************************************************************
CREATE TRIGGER TPGDD.ClienteCalifPendienteCompTrigger
on TPGDD.COMPRAS
FOR INSERT AS
BEGIN 
	DECLARE @CALIFICADOR INT
	DECLARE @ComprasPendienteCalif int
	DECLARE @ComprasCalif int
	DECLARE @ComprasHechas int

	 DECLARE @idCliente int

      DECLARE cursorRecorre CURSOR  FOR
        SELECT I.idCliente from inserted I

      OPEN cursorRecorre

      FETCH NEXT FROM cursorRecorre INTO @idCliente

      WHILE ( @@FETCH_STATUS = 0 ) 
        BEGIN       
		
			begin try
			  SET @CALIFICADOR = @idCliente
			  SELECT @ComprasCalif =  COUNT (*)  from TPGDD.COMPRAS COMP	 
			  INNER JOIN TPGDD.CALIFICACIONES CAL ON CAL.IDCOMPRA = COMP.IDCOMPRA
			  WHERE CAL.CALIFICADOR = @CALIFICADOR AND COMP.IDCLIENTE= @CALIFICADOR

	   		  SELECT @ComprasHechas =  COUNT(*)  FROM TPGDD.COMPRAS COMP
			  WHERE COMP.IDCLIENTE = @CALIFICADOR
			  SET @ComprasPendienteCalif = @ComprasHechas - @ComprasCalif
			  if @ComprasPendienteCalif >3
			   Begin
				RAISERROR ('ERROR. NO ES POSIBLE COMPRAR. USTED TIENE PENDIENTE CALIFICAR MAS DE 3 COMPRAS.',15,1)
			   end
			end try

	        Begin catch
			declare @msg nvarchar(255)
			set @msg = (SELECT  ERROR_MESSAGE() )
			Raiserror(@msg ,15,1)
			Rollback transaction--rollbackea TODO	
			End catch

		END
			
            FETCH  NEXT FROM cursorRecorre INTO @idCliente       

      CLOSE cursorRecorre

      DEALLOCATE cursorRecorre 	

END
GO

CREATE TRIGGER TPGDD.ClienteCalifPendienteOferTrigger
on TPGDD.OFERTAS
FOR INSERT AS
BEGIN 
	DECLARE @CALIFICADOR INT
	DECLARE @ComprasPendienteCalif int
	DECLARE @ComprasCalif int
	DECLARE @ComprasHechas int
	     DECLARE @idCliente int

      DECLARE cursorRecorre CURSOR  FOR

	        SELECT I.idCliente from inserted I

      OPEN cursorRecorre

      FETCH NEXT FROM cursorRecorre INTO @idCliente

      WHILE ( @@FETCH_STATUS = 0 ) 
        BEGIN       
			begin try
				SET @CALIFICADOR = @idCliente
				SELECT @ComprasCalif =  COUNT (*)  from TPGDD.COMPRAS COMP
				INNER JOIN TPGDD.CALIFICACIONES CAL ON CAL.IDCOMPRA = COMP.IDCOMPRA
				WHERE CAL.CALIFICADOR = @CALIFICADOR AND COMP.IDCLIENTE= @CALIFICADOR

				SELECT @ComprasHechas =  COUNT(*)  FROM TPGDD.COMPRAS COMP
				WHERE COMP.IDCLIENTE = @CALIFICADOR
				SET @ComprasPendienteCalif = @ComprasHechas - @ComprasCalif
				if @ComprasPendienteCalif >3
				Begin
					RAISERROR ('ERROR. NO POSIBLE ES OFERTAR. USTED TIENE PENDIENTE CALIFICAR MAS DE 3 COMPRAS',15,1)
				end
			end	try
	
			Begin catch
			declare @msg nvarchar(255)
			set @msg = (SELECT  ERROR_MESSAGE() )
			Raiserror(@msg ,15,1)
			Rollback transaction--rollbackea TODO	
			End catch
		

		END
			
            FETCH  NEXT FROM cursorRecorre INTO @idCliente       

      CLOSE cursorRecorre

      DEALLOCATE cursorRecorre 


END
GO
--***********************************************************************
--**TRIGGER 9 USUARIO CON BAJAlOGICA SE PAUSAN SUS PUBLICACIONES  ******
--***********************************************************************

alter TRIGGER TPGDD.bajaLogicaPausaPublicacionesTrigger 
on TPGDD.USUARIOS
AFTER UPDATE AS
BEGIN 
 
  DECLARE @usuarioBaja int

    DECLARE @bajaLogica int
	DECLARE @username nvarchar(255)

      DECLARE cursorRecorre CURSOR  FOR
        SELECT I.bajaLogica, I.username from inserted I

      OPEN cursorRecorre

      FETCH NEXT FROM cursorRecorre INTO @bajaLogica, @username

      WHILE ( @@FETCH_STATUS = 0 ) 
        BEGIN       
		  begin try
		   SELECT @usuarioBaja =  D.idUsuario FROM DELETED D
		   where d.username = @username
		   IF update(bajaLogica) and (@bajaLogica = 1)
			BEGIN       
			DECLARE publicaciones_cursor CURSOR FOR 
			SELECT pCodigo FROM TPGDD.Publicaciones P where P.idUsuario = @usuarioBaja; 
			DECLARE @idPublicacion numeric(18,0);
			OPEN publicaciones_cursor;
			FETCH NEXT FROM publicaciones_cursor INTO @idPublicacion
			WHILE @@FETCH_STATUS = 0  
			  BEGIN  
				UPDATE TPGDD.Publicaciones 
				SET idEstado = 3 --PAUSADA
				WHERE pCodigo = @idPublicacion
			  end
			FETCH NEXT FROM publicaciones_cursor INTO @idPublicacion
			  
			CLOSE publicaciones_cursor;
			DEALLOCATE publicaciones_cursor;
		   END
         end try
  
         Begin catch
		  declare @msg nvarchar(255)
		  set @msg = 'ERROR TRIGGER: NO SE PUDIERON PAUSAR LAS PUBLICACIONES PARA LA BAJA LOGICA DE USUARIO.' + (SELECT  ERROR_MESSAGE() )
		  Raiserror(@msg ,15,1)
		  Rollback transaction--rollbackea TODO	
	     End catch	
					
           FETCH NEXT FROM cursorRecorre INTO @bajaLogica, @username    

		END

      CLOSE cursorRecorre

      DEALLOCATE cursorRecorre    
  

END
GO
--***********************************************************************
--**TRIGGER 10 USUARIO CON BAJAlOGICA SE ACTIVAN SUS PUBLICACIONES  *****
--***********************************************************************
alter TRIGGER TPGDD.activaUsuarioActivaPublicacionesTrigger
on TPGDD.USUARIOS
FOR update AS

BEGIN 
  DECLARE @usuarioAlta int

    DECLARE @bajaLogica int
	DECLARE @username nvarchar(255)

      DECLARE cursorRecorre CURSOR  FOR
        SELECT I.bajaLogica, I.username from inserted I

      OPEN cursorRecorre

      FETCH NEXT FROM cursorRecorre INTO @bajaLogica, @username

      WHILE ( @@FETCH_STATUS = 0 ) 
        BEGIN       
		    begin try
			  SELECT @usuarioAlta =  D.idUsuario FROM DELETED D
			  IF update(bajaLogica) and (SELECT I.bajaLogica FROM INSERTED I) = 0 
			  AND (SELECT D.bajaLogica FROM deleted D WHERE D.idUsuario = @usuarioAlta)= 1  
				BEGIN 
				 DECLARE publicaciones_cursor CURSOR FOR 
				 SELECT pCodigo FROM TPGDD.Publicaciones P where P.idUsuario = @usuarioAlta; 
				 DECLARE @idPublicacion numeric(18,0);
				 OPEN publicaciones_cursor;
				 FETCH NEXT FROM publicaciones_cursor INTO @idPublicacion
				 WHILE @@FETCH_STATUS = 0  
				  BEGIN  
					UPDATE TPGDD.Publicaciones 
					SET idEstado = 2 --activa
					WHERE pCodigo = @idPublicacion
				  END
				 FETCH NEXT FROM publicaciones_cursor INTO @idPublicacion
				  
				CLOSE publicaciones_cursor;
				DEALLOCATE publicaciones_cursor;
				END
			end try
  
			Begin catch
			  declare @msg nvarchar(255)
			  set @msg = 'ERROR TRIGGER: NO SE PUDIERON ACTIVAR LAS PUBLICACIONES PARA EL USUARIO.' + (SELECT  ERROR_MESSAGE() )
			  Raiserror(@msg ,15,1)
			  Rollback transaction--rollbackea TODO	
			End catch		
		  			
            FETCH  NEXT FROM cursorRecorre INTO @bajaLogica, @username   
		END
     

      CLOSE cursorRecorre

      DEALLOCATE cursorRecorre 

END
GO

--***********************************************************************
--**TRIGGER 11 GENERAR COMPRA DE SUBASTA                            *****
--***********************************************************************
CREATE TRIGGER TPGDD.generaCompdeSubastaTrigger
ON TPGDD.PUBLICACIONES
FOR  UPDATE AS
BEGIN
 DECLARE @estadoPubl int
 DECLARE @idPublicacion numeric(18)
 DECLARE @cantidad int
 DECLARE @idVendedor int

 begin try
	 SELECT @estadoPubl = I.idEstado  FROM inserted I

	 SELECT @idPublicacion = I.pCodigo FROM deleted I
 
	 SELECT @cantidad = I.pStock FROM deleted I
 
	 SELECT @idVendedor = I.idUsuario FROM deleted I

	 --ME FIJO SI ES UNA SUBASTA
	 IF(SELECT I.idEstado FROM INSERTED I) = 4  --finalizada
	 AND (SELECT COUNT(*) FROM TPGDD.Subastas S WHERE S.idPublicacion = @idPublicacion)>=1
	 --AND (SELECT COUNT(I.pCodigo) FROM INSERTED I INNER JOIN TPGDD.Subastas S ON S.idPublicacion = I.pCodigo) >= 1
	 BEGIN
		 INSERT INTO TPGDD.Compras(idPublicacion, idCliente, fecha, cantidad, calificada,idVendedor, tipoPublicacion)
		 VALUES ( @idPublicacion, 
		   (SELECT top 1 O.idCliente FROM TPGDD.Ofertas O INNER JOIN TPGDD.Subastas S ON S.idSubasta = O.idSubasta 
			WHERE S.idPublicacion = @idPublicacion AND S.valorActual = O.monto ),
			GETDATE(), @cantidad, 0, @idVendedor,'Subasta' )
	 END
 end try
   
 Begin catch
	declare @msg nvarchar(255)
	set @msg = 'ERROR TRIGGER: NO SE PUDO GENERAR LA COMPRA PARA LA SUBASTA.' + (SELECT  ERROR_MESSAGE() )
	Raiserror(@msg ,15,1)
	Rollback transaction--rollbackea TODO	
 End catch

END
go

--*****************************************************************
--********   DESHABILITO TRIGGERS *********************************
--*****************************************************************

DISABLE TRIGGER TPGDD.updateReputacionVenderorTrigger ON TPGDD.Calificaciones;--0
DISABLE TRIGGER TPGDD.updateStockPublicacionTrigger ON TPGDD.Compras;--1
DISABLE TRIGGER TPGDD.updateValorActualSubastaTrigger ON TPGDD.Ofertas;--2
DISABLE TRIGGER TPGDD.deleteUsuariosRolesTrigger ON TPGDD.Roles;--3
DISABLE TRIGGER TPGDD.generarFacturacionPorPublicar ON TPGDD.Publicaciones;--4
DISABLE TRIGGER TPGDD.generarFacturacionPorComprar ON TPGDD.Compras;--5
DISABLE TRIGGER TPGDD.TRIGGERUPDATECALIFICADACOMPRA ON TPGDD.Calificaciones;--6
DISABLE TRIGGER TPGDD.ClienteCalifPendienteCompTrigger ON TPGDD.Compras;--7
DISABLE TRIGGER TPGDD.ClienteCalifPendienteOferTrigger ON TPGDD.OFERTAS;--8
DISABLE TRIGGER TPGDD.bajaLogicaPausaPublicacionesTrigger ON TPGDD.USUARIOS ;--9
DISABLE TRIGGER TPGDD.activaUsuarioActivaPublicacionesTrigger ON TPGDD.USUARIOS ;--10
DISABLE TRIGGER TPGDD.generaCompdeSubastaTrigger ON TPGDD.PUBLICACIONES;--11
go

--******************************************************************
-- **** PROCEDURE Y FUNCION AUXILIARES DE MIGRACION      *************
--*********************************************************************
/****** Object:  UserDefinedFunction [TPGDD].[convierteEstrellas]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [TPGDD].[convierteEstrellas](@cantidadEstrellas int)
RETURNS INT AS
BEGIN
DECLARE @estrellasConvertidas INT

SET @estrellasConvertidas =
	CASE WHEN (@cantidadEstrellas = 10 OR @cantidadEstrellas =9) THEN 5 
	WHEN (@cantidadEstrellas = 8 OR @cantidadEstrellas =7) THEN 4
	WHEN (@cantidadEstrellas = 6 OR @cantidadEstrellas =5) THEN 3
	WHEN (@cantidadEstrellas = 4 OR @cantidadEstrellas =3) THEN 2
	WHEN (@cantidadEstrellas = 2 OR @cantidadEstrellas =1) THEN 1 
	END
RETURN  @estrellasConvertidas
END

GO
/****** Object:  UserDefinedFunction [TPGDD].[dameReputacionDe]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--LA USO LUEGO DE LA MIGRACION
CREATE FUNCTION [TPGDD].[dameReputacionDe](@idUsuario int)
RETURNS INT AS
BEGIN
DECLARE @reputacion INT
DECLARE @promedio  INT

SELECT @promedio = round(  avg  
     ( (cal.cantEstrellas)  ),0  )
  FROM TPGDD.Calificaciones cal
  INNER JOIN TPGDD.Compras C ON c.idCompra= cal.idCompra and  C.idVendedor = @idUsuario
  where c.calificada = 1  --para que sean compras concretadas
set @reputacion = ( @promedio )
  return @reputacion 
END

GO

--ES SOLAMENTE EL CURSOR PARA RECORRER LA TABLA y actualizar
CREATE PROCEDURE tpgdd.migraReputacionUser 
AS 
  BEGIN 
      DECLARE @idUsuario INT 
	  SET @idUsuario = 0
      DECLARE @reputacion INT 
	  DECLARE @tempReputacion INT
      DECLARE cursorRepUsuarios CURSOR  FOR
        SELECT U.reputacion, 
               U.idusuario 
        FROM   tpgdd.usuarios U 

      OPEN cursorRepUsuarios 

      FETCH NEXT FROM cursorRepUsuarios INTO @reputacion, @idUsuario 
	
      WHILE ( @@FETCH_STATUS = 0 ) 
        BEGIN             
		    SET @tempReputacion = tpgdd.dameReputacionDe(@idUsuario) 
            UPDATE tpgdd.usuarios 
            SET    reputacion =  @tempReputacion
			WHERE idUsuario =  @idUsuario       
		
            FETCH  NEXT FROM cursorRepUsuarios INTO @reputacion, @idUsuario 
        END 

      CLOSE cursorRepUsuarios 

      DEALLOCATE cursorRepUsuarios 
  END 
go 

--*************************************************************************
--**********     COMIENZA MIGRACION     *********************************
--*************************************************************************

--*************************************************************************
--inserto las funcionalidades
SET IDENTITY_INSERT TPGDD.Funcionalidades ON
INSERT INTO [TPGDD].[Funcionalidades] (idFuncionalidad, nombre, descripcion) VALUES 
(1,'Login','Login')
,(2, 'Cambiar contrase�a', 'Cambiar contrase�a') 
,(3, 'iniciar sesi�n', 'iniciar sesi�n')
,(4, 'Roles', 'Roles' )
, (5, 'Alta rol', 'Alta rol')
, (6, 'Modificacion rol', 'Modificacion rol' )
,(7, 'ABM  roles','ABM  roles' )
,(8, 'Consultar roles', 'Consultar roles')
,(9, 'Usuarios', 'Usuarios')
,(10, 'Alta usuario', 'Alta usuario')
,(11, 'Modificaci�n/Baja','Modificaci�n/Baja' )
,(12, 'ABM Usuarios','ABM Usuarios' )
,(13, 'Consulta usuarios', 'Consulta usuarios')
,(14, 'Comprar/Ofertar', 'Comprar/Ofertar')
,(15, 'Calificaciones' ,'Calificaciones' )
,(16, 'Listado estadistico', 'Listado estadistico')
,(17,'Consulta facturas','Consulta facturas')
, (18, 'Visibilidades','Visibilidades' )
,(19, 'Alta visibilidad', 'Alta visibilidad')
,(20,'Modificaci�n visibilidad', 'Modificaci�n visibilidad')
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
--PRINT 'MIGRO FUNCIONALIDADES OK'
GO
--*************************************************************************
--inserto Roles
SET IDENTITY_INSERT TPGDD.Roles ON
INSERT INTO TPGDD.Roles(idRol, nombre)
VALUES 	(1, 'Administrador'),
		(2, 'Cliente'),
		(3, 'Empresa')
SET IDENTITY_INSERT TPGDD.Roles OFF
--PRINT 'MIGRO Roles OK'
GO
--*************************************************************************
--inserto la forma de pago
SET IDENTITY_INSERT TPGDD.FormasPago ON
INSERT INTO TPGDD.FormasPago(idFormaPago, descripcion)
VALUES (1,'Efectivo' ), (2,'Contra Reembolso')
SET IDENTITY_INSERT TPGDD.FormasPago OFF
--PRINT 'MIGRO FormasPago OK'
GO
--*************************************************************************
--inserto la localidad vacia para la migracion
SET IDENTITY_INSERT TPGDD.Localidades ON
INSERT INTO TPGDD.Localidades(codLocalidad, descripcion)
VALUES (1, ' ' )
SET IDENTITY_INSERT TPGDD.Localidades OFF
--PRINT 'MIGRO Localidades OK'
GO

--SE INSERTAN ALGUNAS LOCALIDADES
	INSERT INTO [TPGDD].[Localidades]
           ([descripcion])
     VALUES
			 ('Acassuso') 
			,('Aeropuerto Internacional Ezeiza')
			,('Bancalari')
			,('Barrio Parque General San Mart�n')
			,('Campo de Mayo')
			,('Canning') 
			,('Del Viso')
			,('Dique Luj�n')
			,('El Jag�el') 
			,('El Libertador') 
			,('El Palomar') 
--PRINT 'AGREGO LOCALIDADES OK'
GO
--*************************************************************************
--inserto las funcionalidades
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
--PRINT 'MIGRO RolesFuncionalidades OK'
GO
--*************************************************************************
--inserto los estados de la publicacion
SET IDENTITY_INSERT TPGDD.Estados ON
INSERT INTO TPGDD.Estados(idEstado, descripcion)
VALUES (1,'Borrador'),(2,'Activa'),(3,'Pausada'), (4,'Finalizada'), (5, 'Publicada' )
SET IDENTITY_INSERT TPGDD.Estados OFF
--PRINT 'MIGRO Estados OK'
GO
--**********************************************************************
--***       INSERTO USUARIOS       *************************************
--**********************************************************************
--inserto el administrador
 INSERT INTO TPGDD.Usuarios ( username, password, tipoUsuario,mail, codPostal, nroPiso,nroCalle,
  nroDpto,  telefono, fechaCreacion,codLocalidad, domCalle)
 VALUES ('admin' , 'e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7', 'Administrador',
  'admin@admin.com ', ' ', 0 , 0,' ',' ', GETDATE(),1,' ' )
  --PRINT 'MIGRO USUARIO administrador OK'
GO
--*************************************************************************
--inserto los clientes en los usuarios , password "W23E"
INSERT INTO TPGDD.Usuarios (codLocalidad, username, password, tipoUsuario, mail, nroPiso, nroDpto,
 fechaCreacion, nroCalle,domCalle, codPostal, telefono)
SELECT  DISTINCT  1 AS codLocalidad, --codLocalidad 1 significa vacio
REPLACE(SUBSTRING(Cli_Mail,1,CHARINDEX('@',Cli_Mail)-1),' ','') AS username,
'e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7' AS password,
'Cliente' AS tipoUsuario,
Cli_Mail AS mail,
Cli_Piso AS nroPiso,
Cli_Depto AS nroDpto,
GETDATE() AS fechaCreacion,
Cli_Nro_Calle AS nroCalle,
Cli_Dom_Calle AS domCalle,
Cli_Cod_Postal AS codPostal, 
' '
FROM [GD1C2016].[gd_esquema].[Maestra]
 WHERE Cli_Dni IS NOT NULL
  UNION -- UNION ALL ME DA 56 FILAS PERO CON REPETIDOS, UNION no permite repetidos
   SELECT DISTINCT     1 AS codLocalidad, --codLocalidad 1 significa vacio
REPLACE(SUBSTRING(Publ_Cli_Mail,1,CHARINDEX('@',Publ_Cli_Mail)-1),' ','') AS username,
'e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7' AS password,
'Cliente' AS tipoUsuario,
Publ_Cli_Mail AS mail,
Publ_Cli_Piso AS nroPiso,
Publ_Cli_Depto AS nroDpto,
GETDATE() AS fechaCreacion,
Publ_Cli_Nro_Calle AS nroCalle,
Publ_Cli_Dom_Calle AS domCalle,
Publ_Cli_Cod_Postal AS codPostal,
' ' 
FROM [GD1C2016].[gd_esquema].[Maestra]
 WHERE Publ_Cli_Dni IS NOT NULL 
  ORDER BY username
  --PRINT 'MIGRO USUARIOS clientes OK'
GO
--*************************************************************************
--inserto las empresas en los usuarios,  password "w23e"
 INSERT INTO TPGDD.Usuarios (codLocalidad, username, password, tipoUsuario, mail, nroPiso, nroDpto,
 fechaCreacion, nroCalle,domCalle, codPostal,telefono    )
SELECT  DISTINCT  1 AS codLocalidad, --codLocalidad 1 significa vacio
REPLACE(SUBSTRING([Publ_Empresa_Mail],1,CHARINDEX('@',[Publ_Empresa_Mail])-1),' ','') AS username,
'e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7' AS password,
'Empresa' AS tipoUsuario,
[Publ_Empresa_Mail] AS mail,
[Publ_Empresa_Piso] AS nroPiso,
[Publ_Empresa_Depto] AS nroDpto,
[Publ_Empresa_Fecha_Creacion] AS fechaCreacion,
[Publ_Empresa_Nro_Calle] AS domCalle,
[Publ_Empresa_Dom_Calle] AS nroDom,
[Publ_Empresa_Cod_Postal]  AS codPostal, 
' '
FROM [GD1C2016].[gd_esquema].[Maestra]
   WHERE [Publ_Empresa_Razon_Social] IS NOT NULL 
--PRINT 'MIGRO USUARIOS empresas OK'
   GO
--*************************************************************************
--******  inserto a los Usuarios los roles   *****************************
--*************************************************************************

--inserto al administrador
INSERT INTO TPGDD.UsuariosRoles
 SELECT u.idUsuario , 1  FROM TPGDD.Usuarios AS u
WHERE u.tipoUsuario = 'Administrador' 
--PRINT 'MIGRO ADMINISTRADOR UsuariosRoles OK'
GO

--inserto los clientes
INSERT INTO TPGDD.UsuariosRoles
SELECT u.idUsuario, 2  FROM TPGDD.Usuarios AS u
WHERE u.tipoUsuario = 'Cliente'
--PRINT 'MIGRO Cliente UsuariosRoles OK'
GO

-- inserto las empresas
INSERT INTO TPGDD.UsuariosRoles
SELECT u.idUsuario, 3  FROM TPGDD.Usuarios AS u
WHERE u.tipoUsuario = 'Empresa'
--PRINT 'MIGRO Empresa UsuariosRoles OK'
GO

--*************************************************************************
   --inserto las empresas EN TABLA EMPRESAS
 INSERT INTO TPGDD.Empresas(   razonSocial, cuit, idUsuario )
SELECT DISTINCT MA.Publ_Empresa_Razon_Social AS razonSocial,MA.Publ_Empresa_Cuit,
 (SELECT idUsuario FROM TPGDD.Usuarios
 WHERE MA.Publ_Empresa_Razon_Social = SUBSTRING(mail,1,CHARINDEX('@',mail)-1) )  AS razonSocial 
 FROM [GD1C2016].[gd_esquema].[Maestra] MA
 WHERE MA.Publ_Empresa_Razon_Social IS NOT NULL 
 --PRINT 'MIGRO Empresa OK'
GO

--*************************************************************************
--inserto los clientes
 INSERT INTO TPGDD.Clientes( nombre, apellido, fechaNacimiento, nroDNI, tipoDocumento, idUsuario)
 SELECT DISTINCT MA.Cli_Nombre, Cli_Apeliido,Cli_Fecha_Nac, Cli_Dni, 'DNI' AS tipoDocumento, 
  (SELECT idUsuario FROM TPGDD.Usuarios AS u
 WHERE  SUBSTRING(MA.Cli_Nombre,1, 3)  = SUBSTRING( u.username, 1, 3) ) AS idUsuario 
  FROM [GD1C2016].[gd_esquema].[Maestra] MA
 WHERE MA.Cli_Dni IS NOT NULL
  --PRINT 'MIGRO clientes OK'
GO

--*************************************************************************
--INSERTO LAS VISIBILIDADES
INSERT INTO TPGDD.Visibilidades(codigo, descripcion, precio, porcentaje, Envio, prioridad) 
 SELECT DISTINCT MA.Publicacion_Visibilidad_Cod, MA.Publicacion_Visibilidad_Desc,
  MA.Publicacion_Visibilidad_Precio, MA.Publicacion_Visibilidad_Porcentaje, 0 AS Envio, 1
  FROM [GD1C2016].[gd_esquema].[Maestra] MA
  WHERE MA.Publicacion_Visibilidad_Cod IS NOT NULL
  ORDER BY MA.Publicacion_Visibilidad_Precio DESC
  --PRINT 'MIGRO Visibilidades OK'
GO

--ACTUALIZO LAS PRIORIDADES, SON SOLO 5
UPDATE TPGDD.Visibilidades
SET prioridad = 2 WHERE descripcion = 'Oro'

UPDATE TPGDD.Visibilidades
SET prioridad = 3 WHERE descripcion = 'Plata'

UPDATE TPGDD.Visibilidades
SET prioridad = 4 WHERE descripcion = 'Bronce'

UPDATE TPGDD.Visibilidades
SET prioridad = 5 WHERE descripcion = 'Gratis'



--inserto los rubros 
INSERT INTO TPGDD.Rubros(descripcionCorta, descripcionLarga)
SELECT DISTINCT MA.Publicacion_Rubro_Descripcion, MA.Publicacion_Rubro_Descripcion
 FROM [GD1C2016].[gd_esquema].[Maestra] MA 
 --PRINT 'MIGRO Rubros OK'
GO

--*************************************************************************
-- INSERTO TODAS LAS PUBLICACIONES  
SET IDENTITY_INSERT TPGDD.PUBLICACIONES ON
INSERT INTO TPGDD.Publicaciones(pCodigo,codVisibilidad, codRubro, idEstado, idUsuario, pDescripcion,
	pStock, pFecha, pFecha_Venc, pPrecio)
	 SELECT DISTINCT MA.Publicacion_Cod,
     ( SELECT V.codigo FROM TPGDD.Visibilidades V
    WHERE MA.Publicacion_Visibilidad_Cod = V.codigo) AS codVisibilidad,
	(SELECT r.codRubro  FROM TPGDD.Rubros r 
	WHERE MA.Publicacion_Rubro_Descripcion = r.descripcionLarga  )  AS codRubro, 
	4 AS idEstado,
	(SELECT u.idUsuario FROM TPGDD.Usuarios u
	WHERE Publ_Cli_Mail = u.mail OR Publ_Empresa_Mail = u.mail),	
	MA.Publicacion_Descripcion,   MA.Publicacion_Stock, MA.Publicacion_Fecha, 
	MA.Publicacion_Fecha_Venc,   MA.Publicacion_Precio 
	FROM [GD1C2016].[gd_esquema].[Maestra] MA
  WHERE MA.Factura_Total IS NULL and Calificacion_Codigo IS NULL AND Oferta_Monto IS NULL
   AND Compra_Fecha IS NULL AND Item_Factura_Monto IS NULL AND MA.Forma_Pago_Desc IS NULL
SET IDENTITY_INSERT TPGDD.PUBLICACIONES OFF
--PRINT 'MIGRO PUBLICACIONES'
GO
--************************************************************************************
--INSERTO LAS COMPRAS INMEDIATAS  
--ver pdf Estrategia
--***********************************************************************************
INSERT INTO TPGDD.ComprasInmediatas(idPublicacion ,unidadesVendidas,stockDisponible)
SELECT   MA.Publicacion_Cod,
ma.Publicacion_Stock,
0 
FROM [GD1C2016].[gd_esquema].[Maestra] MA
inner JOIN TPGDD.Publicaciones p ON P.pCodigo = MA.Publicacion_Cod
WHERE MA.Compra_Cantidad IS NOT NULL and MA.Publicacion_Tipo = 'Compra Inmediata' 
and ma.Calificacion_Codigo is null
GROUP BY MA.Publicacion_Cod, ma.Publicacion_Stock
ORDER BY  MA.Publicacion_Cod
--PRINT 'MIGRO ComprasInmediatas OK'
GO
--*************************************************************************
--INSERTO LAS SUBASTAS 
INSERT INTO TPGDD.Subastas(idPublicacion, valorActual)
 SELECT DISTINCT P.pCodigo,  
  (SELECT MAX(MA1.Item_Factura_Monto) 
  FROM  [GD1C2016].[gd_esquema].[Maestra] MA1
  WHERE MA1.Factura_Nro = MA.Factura_Nro) AS valorActual --mal
  FROM [GD1C2016].[gd_esquema].[Maestra] MA
   INNER JOIN TPGDD.Publicaciones P ON P.pCodigo = MA.Publicacion_Cod
  WHERE MA.Publicacion_Tipo  = 'Subasta' 
   AND MA.Factura_Total is not null
--PRINT 'MIGRO Subastas OK'
GO

--*************************************************************************
--INSERTO LAS OFERTAS REALIZADAS EN LAS SUBASTAS
INSERT INTO TPGDD.Ofertas(idCliente, idSubasta, fecha, monto)
SELECT DISTINCT C.idCliente, S.idSubasta,MA.Oferta_Fecha ,MA.Oferta_Monto
FROM [GD1C2016].[gd_esquema].[Maestra] MA
INNER JOIN TPGDD.Clientes C ON C.nroDNI = MA.Cli_Dni
INNER JOIN TPGDD.Subastas S ON S.idPublicacion = MA.Publicacion_Cod
WHERE MA.Oferta_Fecha IS NOT NULL AND MA.Oferta_Monto IS NOT NULL AND MA.Publicacion_Tipo = 'Subasta'
ORDER BY S.idSubasta, MA.Oferta_Monto
--PRINT 'MIGRO Ofertas OK'
GO

--*************************************************************************
--INSERTO LAS COMPRAS, 
INSERT INTO TPGDD.Compras(idPublicacion, idCliente,fecha, cantidad, tipoPublicacion, idVendedor, calificada)
SELECT DISTINCT MA.Publicacion_Cod,C.idCliente, MA.Compra_Fecha ,MA.Compra_Cantidad, MA.Publicacion_Tipo, P.idUsuario, 
(SELECT COUNT(*) FROM [GD1C2016].[gd_esquema].[Maestra] M 
 WHERE  M.[Calificacion_Codigo] IS NOT NULL AND MA.Compra_Fecha = M.Compra_Fecha  AND MA.Cli_Dni = M.Cli_Dni 
 AND MA.Compra_Cantidad = M.Compra_Cantidad AND MA.Publicacion_Cod = M.Publicacion_Cod) AS calificada
FROM [GD1C2016].[gd_esquema].[Maestra] MA
INNER JOIN TPGDD.Clientes C ON C.nroDNI = MA.Cli_Dni and c.nombre = ma.Cli_Nombre
INNER JOIN TPGDD.Publicaciones P ON P.pCodigo = MA.Publicacion_Cod and p.pFecha = ma.Publicacion_Fecha
 WHERE MA.Compra_Fecha IS NOT NULL AND MA.Compra_Cantidad IS NOT NULL 
ORDER BY MA.Publicacion_Cod
--PRINT 'MIGRO Compras OK'
GO

--*************************************************************************
--inserto las calificaciones
SET IDENTITY_INSERT TPGDD.Calificaciones ON
INSERT INTO TPGDD.Calificaciones(codigoCalificacion, idCompra, calificador,cantEstrellas, observacion  )
select DISTINCT MA.Calificacion_Codigo, comp.idCompra,cli.idCliente ,
TPGDD.convierteEstrellas(MA.Calificacion_Cant_Estrellas) AS cantEstrellas, Calificacion_Descripcion
 FROM [GD1C2016].[gd_esquema].[Maestra] MA
 inner join TPGDD.compras comp on comp.idPublicacion = ma.Publicacion_Cod and comp.fecha = ma.Compra_Fecha and comp.cantidad = ma.Compra_Cantidad
inner join TPGDD.Clientes cli on cli.idCliente = comp.idCliente and cli.nroDNI = ma.Cli_Dni
WHERE  MA.Calificacion_Codigo IS NOT NULL 
order by  MA.Calificacion_Codigo
 SET IDENTITY_INSERT TPGDD.Calificaciones OFF
 --PRINT 'MIGRO Calificaciones OK'
GO

--*************************************************************************
--SE AGREGAN LAS FACTURAS 
 SET IDENTITY_INSERT TPGDD.Facturaciones ON
 INSERT INTO TPGDD.Facturaciones(nroFactura, idFormaPago, idUsuario, fecha,total)
 SELECT DISTINCT MA.Factura_Nro, 
 (SELECT  F.idFormaPago FROM TPGDD.FormasPago F WHERE F.descripcion = MA.Forma_Pago_Desc) ,
 (SELECT U.idUsuario  FROM TPGDD.Usuarios U 
 WHERE U.mail = MA.Publ_Cli_Mail OR U.mail = MA.Publ_Empresa_Mail ) AS idUsuario
 , MA.Factura_Fecha, MA.Factura_Total
 FROM [GD1C2016].[gd_esquema].[Maestra] MA
 WHERE MA.Factura_Nro IS NOT NULL and MA.Factura_Total >=0
 order by idUsuario
  SET IDENTITY_INSERT TPGDD.Facturaciones OFF
   --PRINT 'MIGRO Facturaciones OK'
GO

--*************************************************************************
--inserto items 
insert into TPGDD.Items(nroFactura, idCompra,nombre, cantidad, montoItem, idPublicacion)
SELECT DISTINCT
	(SELECT F.nroFactura FROM TPGDD.Facturaciones F 
	  WHERE (F.nroFactura = MA.Factura_Nro AND F.total = MA.Factura_Total AND F.fecha = MA.Factura_Fecha))
	,COMP.idCompra
	, MA.Publicacion_Descripcion
	,[Item_Factura_Cantidad]
	,[Item_Factura_Monto]
	,(SELECT P.pCodigo FROM TPGDD.Publicaciones P 
	    WHERE ( P.pCodigo = MA.Publicacion_Cod AND P.pFecha = MA.Publicacion_Fecha AND P.pPrecio = MA.Publicacion_Precio) )
   
FROM [GD1C2016].[gd_esquema].[Maestra] MA
INNER JOIN TPGDD.Compras COMP ON (COMP.idPublicacion = MA.Publicacion_Cod AND COMP.cantidad = MA.Item_Factura_Cantidad )
WHERE MA.Item_Factura_Cantidad IS NOT NULL AND MA.Item_Factura_Monto IS NOT NULL
ORDER BY COMP.idCompra
--PRINT 'MIGRO Items OK'
GO

--MIGRAR LA REPUTACION
EXEC TPGDD.migraReputacionUser
--PRINT 'MIGRO REPUTACION OK'
GO
--actualizo la reputacion del administrador para que no este en NULL
update TPGDD.Usuarios
set reputacion = 0
where idUsuario = 1
--PRINT 'ACTUALIZO REPUTACION ADMIN, SOLO PARA QUE NO ESTE EN NULL'
GO
--*************************************************************************
--******    HABILITO TRIGGERS     **************************************
--*************************************************************************
ENABLE TRIGGER TPGDD.updateReputacionVenderorTrigger ON TPGDD.Calificaciones;
ENABLE TRIGGER TPGDD.updateStockPublicacionTrigger ON TPGDD.Compras;
ENABLE TRIGGER TPGDD.updateValorActualSubastaTrigger ON TPGDD.Ofertas;
ENABLE TRIGGER TPGDD.deleteUsuariosRolesTrigger ON TPGDD.Roles;
ENABLE TRIGGER TPGDD.generarFacturacionPorPublicar ON TPGDD.Publicaciones;
ENABLE TRIGGER TPGDD.generarFacturacionPorComprar ON TPGDD.Compras;
ENABLE TRIGGER TPGDD.TRIGGERUPDATECALIFICADACOMPRA ON TPGDD.Calificaciones;
ENABLE TRIGGER TPGDD.ClienteCalifPendienteCompTrigger ON TPGDD.Compras;
ENABLE TRIGGER TPGDD.ClienteCalifPendienteOferTrigger ON TPGDD.OFERTAS;
ENABLE TRIGGER TPGDD.bajaLogicaPausaPublicacionesTrigger ON TPGDD.USUARIOS ;
ENABLE TRIGGER TPGDD.activaUsuarioActivaPublicacionesTrigger ON TPGDD.USUARIOS ;
--ENABLE TRIGGER TPGDD.generaCompdeSubastaTrigger ON TPGDD.PUBLICACIONES;
go

--*************************************************************************
-- **** FUNCIONES AUXILIARES LOGIN *****************************
--*************************************************************************


/****** Object:  UserDefinedFunction [TPGDD].[intentosDe]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*************************************************************************
-- **** FUNCIONES AUXILIARES LOGIN *****************************
--*************************************************************************
Create function [TPGDD].[intentosDe](@username nvarchar(255))
Returns smallint 
As
Begin
	Declare @intentos int
	Select @intentos = u.intentosFallidos
		from TPGDD.Usuarios as u
		where @username = u.username
	Return @intentos
End

GO



/****** Object:  UserDefinedFunction [TPGDD].[es_usuario_bloqueado]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create function [TPGDD].[es_usuario_bloqueado](@username nvarchar(255))
Returns bit
As
Begin
	Declare @hab bit
	Select @hab = u.flagHabilitado
		from TPGDD.Usuarios as u 
		where @username = u.username
	Return @hab
End

GO

--*****************************************************************
--*******  LOGUEO    *************************************
--*****************************************************************
/****** Object:  View [TPGDD].[VW_LOGIN_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------

CREATE VIEW [TPGDD].[VW_LOGIN_OK]
AS 
SELECT UR.idRol , u.idUsuario, U.username , U.password, U.tipoUsuario ,U.intentosFallidos , U.bajaLogica, U.flagHabilitado 
FROM TPGDD.Usuarios u left join TPGDD.UsuariosRoles UR on u.idUsuario = UR.idUsuario 



GO
/****** Object:  StoredProcedure [TPGDD].[SP_USUARIO_LOGIN_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [TPGDD].[SP_USUARIO_LOGIN_OK]
	@username nvarchar(255),
	@password nvarchar(255),
	@rol nvarchar(255)
As
Begin
	Set nocount on
	Declare @usuario nvarchar(255)
	Declare @passwordPosta nvarchar(255)
	Declare @intentos int
	Declare @flagHabilitado bit
	Declare @baja bit

	 select  @baja= u.bajaLogica ,  @usuario = u.username, @flagHabilitado = u.flagHabilitado, @intentos = u.intentosFallidos, @passwordPosta = u.password 
	 from TPGDD.Usuarios as u
	 where u.username like @username
	
	If @usuario is null	--VERIFICO EXSITENCIA	
	Begin
		Raiserror('USUARIO INEXISTENTE.',15,1)
		return
	End

	else--USUARIO EXISTENTE
	begin
		--VERIFICO HABILITACION
		IF(@flagHabilitado = 0) or (@baja = 1)--no habilitado
		begin
			Raiserror('USTED SE ENCUENTRA DESHABILITADO NO PUEDE ENTRAR AL SISTEMA, CONSULTE AL ADMIN.',15,1)
			return
		end
		else--USUARIO HABILITADO
		BEGIN
		  --VERIFICO PASSWORD
		  if(@passwordPosta <> @password)--PASSWORD ERRONEO
		  BEGIN
			set @intentos = @intentos + 1 --INCREMENTO INTENTOS FALLIDOS
		    if (@intentos >= 3)
			Begin
				Raiserror ('TIENE 3 INTENTOS FALLIDOS, QUEDO DESHABILITADO PARA REALIZAR ACCIONES.',15,1)
				Update TPGDD.Usuarios 
				Set intentosFallidos = 0, flagHabilitado = 0 --SIGNIFICA NO HABILITADO
				Where  username = @username 
				Return
			End
			else --ACTUALIZO LOS INTENTO FALLIDOS
			BEGIN
				declare @intentosRestantes int
				set @intentosRestantes = 3 - @intentos 
				Raiserror ('PASSWORD ERRONEO. LE QUEDAN %d INTENTOS.',15,1, @intentosRestantes)
				Update TPGDD.Usuarios 
				Set intentosFallidos = @intentos
				Where  username = @username 
				Return
			END
		  END
	  end
	end
	-- TODO CORRECTO	  
	Update TPGDD.Usuarios
	Set intentosFallidos = 0
	Where username = @username 

	SELECT idUsuario, tipoUsuario, intentosFallidos, bajaLogica, flagHabilitado, IDROL 
    FROM TPGDD.VW_LOGIN_OK 
	WHERE  username = @username AND password LIKE @password and idRol =(select idrol from [TPGDD].roles where nombre = @rol)

	return	  
End

GO


--********************************************************
--*****   LISTADO ESTAD�STICO    *************************
--********************************************************


--****************************************************************
--****** FUNCIONES AUXILIARES  LIST1  ****************************
--****************************************************************
/****** Object:  UserDefinedFunction [TPGDD].[getTrimestre]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   FUNCTION [TPGDD].[getTrimestre](@fecha datetime)
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

GO
-------------------------------
--estaba duplicada
/****** Object:  UserDefinedFunction [TPGDD].[getPublicacionesFiltradas]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  FUNCTION [TPGDD].[getPublicacionesFiltradas] (@idVendedor int, @codigoVisbilidad numeric(18,0), @numeroTrimestre int, @year int)  
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

/****** Object:  UserDefinedFunction [TPGDD].[cantidadNoVendida]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 create   FUNCTION [TPGDD].[cantidadNoVendida](@idVendedor int, @codigoVisbilidad numeric(18,0), @numeroTrimestre int, @year int)
RETURNS  int
AS
BEGIN
	
	RETURN  (TPGDD.stockTotalInicial(@idVendedor , @codigoVisbilidad , @numeroTrimestre , @year )
			- TPGDD.cantidadVendida(@idVendedor , @codigoVisbilidad , @numeroTrimestre , @year ))
END

GO

/****** Object:  UserDefinedFunction [TPGDD].[stockTotalInicial]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create   FUNCTION [TPGDD].[stockTotalInicial](@idVendedor int, @codigoVisbilidad numeric(18,0), @numeroTrimestre int, @year int)
RETURNS  int
AS
BEGIN
	return (select sum(P.pStock)
	from TPGDD.getPublicacionesFiltradas(@idVendedor,@codigoVisbilidad,@numeroTrimestre,@year) P)
	
END

GO


/****** Object:  UserDefinedFunction [TPGDD].[cantidadVendida]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 create   FUNCTION [TPGDD].[cantidadVendida](@idVendedor int, @codigoVisbilidad numeric(18,0), @numeroTrimestre int, @year int)
RETURNS  int
AS
BEGIN
	
	RETURN (select sum(C.cantidad)
			from TPGDD.getPublicacionesFiltradas(@idVendedor,@codigoVisbilidad,@numeroTrimestre,@year) P, TPGDD.Compras C
			where   P.pCodigo = C.idPublicacion)
END

GO





--******************************************************
--1 . Vendedores con mayor cantidad de productos no vendidos
create  PROCEDURE TPGDD.peoresVendedoresSP(@codigoVisbilidad numeric(18,0), @numeroTrimestre int, @year int) 
AS 
BEGIN

	SELECT TOP 5  U.idUsuario idVendedor, isnull (TPGDD.cantidadNoVendida(U.idUsuario, @codigoVisbilidad, @numeroTrimestre, @year), 0) cantidadNoVendida
				 
	FROM TPGDD.Usuarios  U
	where exists(select 1 from Publicaciones P where P.idUsuario = U.idUsuario)
	ORDER BY 2 desc
END
go

--******************************************************
--*******  FUNCIONES AUXILIARES LIST2   ****************
--******************************************************
/****** Object:  UserDefinedFunction [TPGDD].[cantidadProductosComprados]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create    FUNCTION [TPGDD].[cantidadProductosComprados](@idCliente int, @idRubro int, @numeroTrimestre int, @year int)
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

GO


/****** Object:  UserDefinedFunction [TPGDD].[getRubro]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create    FUNCTION [TPGDD].[getRubro](@idPublicacion numeric (18,0))
RETURNS  int
AS
BEGIN
	
	RETURN  (select P.codRubro
			 from TPGDD.Publicaciones P
			 where P.pCodigo = @idPublicacion
			 )
END

GO
--*******************************************************************
------------------------------------------------------------------------------------
--2. Clientes con mayor cantidad de productos comprados, por mes y por a�o, dentro 
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

/****** Object:  UserDefinedFunction [TPGDD].[cantidadFacturas]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--******************************************************
--*********** FUNCIONES AUXILIARES LIST3 ***************
--******************************************************
--Funciones ayudadoras
create    FUNCTION [TPGDD].[cantidadFacturas](@idVendedor int, @numeroTrimestre int, @year int)
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

GO

--*****************************************************
------------------------------------------------------------------------------------
--3. esta siendo usado en la aplicacion
------------------------------------------------------------------------------------
/****** Object:  StoredProcedure [TPGDD].[mejoresVendedoresPorCantidadFacturasSP]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*****************************************************
------------------------------------------------------------------------------------
--3. Vendedores con mayor cantidad de facturas dentro de un mes y a�o particular
------------------------------------------------------------------------------------
create   PROCEDURE [TPGDD].[mejoresVendedoresPorCantidadFacturasSP](@numeroTrimestre int, @year int) 
AS 
BEGIN

	select top 5 U.idUsuario idVendedor, TPGDD.cantidadFacturas(U.idUsuario,@numeroTrimestre, @year)  as CantidadFacturas, U.username
	from TPGDD.Usuarios U
	where exists(select 1 from TPGDD.Publicaciones P where P.idUsuario = U.idUsuario)
	order by 2 desc
END

GO

--***************************************************
--***** FUNCIONES AUXILIARES LIST4  *****************
--***************************************************
/****** Object:  UserDefinedFunction [TPGDD].[montoFacturado]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create    FUNCTION [TPGDD].[montoFacturado](@idVendedor int, @numeroTrimestre int, @year int)
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

GO


--******************************************************
------------------------------------------------------------------------------------
--4.  se usa en la aplicacion
------------------------------------------------------------------------------------

/****** Object:  StoredProcedure [TPGDD].[mejoresVendedoresPorMontoFacturadoSP]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--******************************************************
------------------------------------------------------------------------------------
--4. Vendedores con mayor monto facturado dentro de un mes y a�o particular
------------------------------------------------------------------------------------

create   PROCEDURE [TPGDD].[mejoresVendedoresPorMontoFacturadoSP](@numeroTrimestre int, @year int) 
AS 
BEGIN

	select top 5 U.idUsuario idVendedor, TPGDD.montoFacturado(U.idUsuario,@numeroTrimestre, @year)  as MontoFacturado, U.username
	from TPGDD.Usuarios U
	where exists(select 1 from TPGDD.Publicaciones P where P.idUsuario = U.idUsuario)
	order by 2 desc
END

GO


--****************************************************************************************
--****aporte Guadalupe  de aca hasta el final y hizo toda la aplicacion desktop***********

--******************************************************************************
/****** Object:  UserDefinedTableType [TPGDD].[TABLA_NOMBRES_FUNCIONALIDADES]    Script Date: 02/07/2016 16:09:34 ******/
CREATE TYPE [TPGDD].[TABLA_NOMBRES_FUNCIONALIDADES] AS TABLE(
	[NOMBRE_FUNCIONALIDAD] [nvarchar](255) NULL
)
GO

/****** Object:  StoredProcedure [TPGDD].[AgregarFuncionalidadRol]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*******************************************************************
--modificaciones

CREATE procedure [TPGDD].[AgregarFuncionalidadRol] (
	@nombre nvarchar(255),
	@Funcionalidad nvarchar(255)) 
AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		Declare @idRol int
		Select @idRol = idRol  from TPGDD.Roles R
		where R.nombre = @nombre 
		Insert into TPGDD.RolesFuncionalidades (idRol, idFuncionalidad)
			Values(@idRol, (select idFuncionalidad from Funcionalidades where nombre like  @Funcionalidad))

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	Raiserror('No se pudo agregar la funcionalidad %s al rol',15,1, @Funcionalidad)
END CATCH




GO
/****** Object:  StoredProcedure [TPGDD].[Dar_Baja_Rol]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*************************************************************************
Create procedure [TPGDD].[Dar_Baja_Rol] (
	@idRol int) as
	Begin
	Begin transaction
	Begin try
		Update TPGDD.Roles 
		Set habilitado = 0 --NO HABILITADO
		Where idRol = @idRol 
	Commit
	End try
	Begin catch
		Raiserror('No se pudo dar de baja el rol',15,1)
		Rollback
	End catch
	End

GO



/****** Object:  StoredProcedure [TPGDD].[SP_AGREGAR_FUNCIONALIDAD_ROL_BORRAR]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--*******************************************************************
--modificaciones

CREATE procedure [TPGDD].[SP_AGREGAR_FUNCIONALIDAD_ROL_BORRAR] (
	@nombre nvarchar(255),
	@Funcionalidad nvarchar(255)) 
AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		Declare @idRol int
		Select @idRol = idRol  from TPGDD.Roles R
		where R.nombre = @nombre 
		Insert into TPGDD.RolesFuncionalidades (idRol, idFuncionalidad)
			Values(@idRol, (select idFuncionalidad from Funcionalidades where nombre like  @Funcionalidad))

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	Raiserror('No se pudo agregar la funcionalidad %s al rol',15,1, @Funcionalidad)
END CATCH

GO
/****** Object:  StoredProcedure [TPGDD].[SP_BusquedaUsuarioCliente]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  procedure [TPGDD].[SP_BusquedaUsuarioCliente] (
	@username nvarchar(255),
	@nombre nvarchar(255),
	@apellido nvarchar(255))
	As
	Begin
		Select u.username, c.nombre, c.apellido, c.tipoDocumento, c.nroDNI
		from TPGDD.Clientes c, TPGDD.Usuarios u 
		where c.idUsuario = u.idUsuario and 
		(u.username like '%'+@username+'%' and c.apellido like '%'+@apellido+'%'
		and c.nombre like '%'+@nombre+'%') 
	End

GO
/****** Object:  StoredProcedure [TPGDD].[SP_BusquedaUsuarioEmpresa]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		
--exec TPGDD.SP_BusquedaUsuarioCliente '', '', 'art'
--si no se ingresa nada -> '' en GUI

 create  procedure [TPGDD].[SP_BusquedaUsuarioEmpresa] (
	@username nvarchar(255),
	@razonSocial nvarchar(255),
	@cuit nvarchar(50))
	As
	Begin
		Select u.username, c.razonSocial, c.cuit
		from TPGDD.Empresas c, TPGDD.Usuarios u 
		where c.idUsuario = u.idUsuario and 
		(u.username like '%'+@username+'%' and c.razonSocial like '%'+@razonSocial+'%'
		and c.cuit like '%'+@cuit+'%') 
	End

GO
/****** Object:  StoredProcedure [TPGDD].[SP_CAMBIAR_CONTRASE�A_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [TPGDD].[SP_CAMBIAR_CONTRASE�A_OK](@idUsuario int, @pass nvarchar(255),@nuevaPass nvarchar(255))
AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		if (exists(select * from TPGDD.Usuarios where idUsuario= @idUsuario AND password like @pass ))
		   UPDATE TPGDD.Usuarios SET password = @nuevaPass WHERE idUsuario= @idUsuario AND password like @pass
	   else
		   RAISERROR(N'La contrase�a anterio no es correcta',16,1)

	    IF @TRANSCOUNT = 0
	       COMMIT TRANSACTION
		PRINT N'Se actualiz� la contrase�a con exito'; 
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR(N'Ocurri� un error durante la operacion de actualizaci�n. %s ',16,1, @ERROR)

END CATCH



GO

Create procedure TPGDD.Dar_Alta_Roles (
	@nombre nvarchar(255)) As
	Begin
	Begin transaction
	Begin try
		Insert into TPGDD.Roles ( nombre) 
			Values (@nombre ) 
	Commit
	End try
	Begin catch
		Raiserror('No se pudo dar de alta el rol',15,1)
		Rollback transaction 
	End catch
	End
Go




/****** Object:  StoredProcedure [TPGDD].[SP_DAR_ALTA_ROL]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	
create  procedure [TPGDD].[SP_DAR_ALTA_ROL]  @nombreRol nvarchar(255), 
									   @nombresFuncionalidades TPGDD.TABLA_NOMBRES_FUNCIONALIDADES READONLY 
As
Begin
	--Validaciones
	IF EXISTS(SELECT 1 FROM TPGDD.Roles WHERE nombre = @nombreRol)
	BEGIN
		Raiserror('ERROR: YA EXISTE EL ROL.',15,1)
		RETURN
	END
		
	Begin transaction
	Begin try
	
		--DOY DE ALTA ROL
		EXEC TPGDD.Dar_Alta_Roles @nombreRol
			
		--AGREGO LAS FUNCIONALIDADES
		DECLARE cursor_funcionalidades CURSOR FOR select * from @nombresFuncionalidades; 
		DECLARE @nombreFuncionalidad nvarchar(255);
		OPEN cursor_funcionalidades;
		FETCH NEXT FROM cursor_funcionalidades INTO @nombreFuncionalidad;
		WHILE @@FETCH_STATUS = 0  
		BEGIN  
			   declare @idFuncionalidad int;
			   set @idFuncionalidad = (select idFuncionalidad from TPGDD.Funcionalidades where nombre= @nombreFuncionalidad); 
			   exec TPGDD.AgregarFuncionalidadRol @nombreRol, @idFuncionalidad;
			   FETCH NEXT FROM cursor_funcionalidades INTO @nombreFuncionalidad;
		END;
		CLOSE cursor_funcionalidades;
		DEALLOCATE cursor_funcionalidades;
		Commit

	End try
	Begin catch
		declare @msg nvarchar(255)
		set @msg = 'ERROR NO SE PUDO DAR DE ALTA EL ROL.' + (SELECT  ERROR_MESSAGE() )
		Raiserror(@msg,15,1)
		Rollback
	End catch
	
End

GO
/****** Object:  StoredProcedure [TPGDD].[SP_datosModificablesCliente]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create procedure [TPGDD].[SP_datosModificablesCliente] (
	@username nvarchar(255))
	As
	Begin
		Select u.password, u.mail, u.telefono, u.nroPiso, u.nroDpto, u.nroCalle, u.domCalle, u.codPostal,
			   c.nombre, c.apellido, c.fechaNacimiento, c.nroDNI, c.tipoDocumento 
		from TPGDD.Clientes c, TPGDD.Usuarios u 
		where c.idUsuario = u.idUsuario and 
			  u.username =  @username
	End

GO
/****** Object:  StoredProcedure [TPGDD].[SP_datosModificablesEmpresa]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec TPGDD.localidadesSP

create procedure [TPGDD].[SP_datosModificablesEmpresa] (
	@username nvarchar(255))
	As
	Begin
		Select u.password, u.mail, u.telefono, u.nroPiso, u.nroDpto, u.nroCalle, u.domCalle, u.codPostal,
			   c.razonSocial, c.cuit, c.nombreContacto, c.nombreRubro, c.ciudad 
		from TPGDD.Empresas c, TPGDD.Usuarios u 
		where c.idUsuario = u.idUsuario and 
			  u.username =  @username
	End

GO

-----------------------------------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [TPGDD].[SP_INSERT_USUARIO_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-------------------------------------------------------------------------------------

CREATE  PROCEDURE [TPGDD].[SP_INSERT_USUARIO_OK]
@LOC int,
@USER nvarchar(255),  
@PASS nvarchar(255), 
@MAIL nvarchar(255), 
@TEL nvarchar(255), 
@PISO numeric(18,0),
@DEPTO nvarchar(255), 
@F_CREAC datetime,
@NRO_CALLE numeric(18,0),  
@DOM_CALLE nvarchar(255),  
@CP nvarchar(255),
@TIPO nvarchar(255)
AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION
			IF not exists(SELECT idUsuario FROM [TPGDD].usuarios WHERE username like @USER)
				Begin  
					INSERT INTO [TPGDD].[Usuarios]
						([codLocalidad]
						,[username]
						,[password]
						,[flagHabilitado]
						,[tipoUsuario]
						,[mail]
						,[telefono]
						,[nroPiso]
						,[nroDpto]
						,[fechaCreacion]
						,[nroCalle]
						,[domCalle]
						,[codPostal]
						,[intentosFallidos]
						,[reputacion]
						,[bajaLogica])
					VALUES
						(@LOC
						,@USER
						,@PASS
						,'TRUE'
						,@TIPO
						,@MAIL
						,@TEL
						,@PISO
						,@DEPTO
						,@F_CREAC
						,@NRO_CALLE
						,@DOM_CALLE
						,@CP
						,0
						,0
						,'FALSE')
			
					END
				ELSE
					BEGIN
						RAISERROR('El usuario debe ser unico',16,1)
						return
					END


	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
	--	PRINT N'Operacion registrada con exito';
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR( '%s',16,1, @ERROR)
END CATCH

GO



/****** Object:  StoredProcedure [TPGDD].[SP_FINALIZAR_SUBASTAS_VENCIDAS_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




---------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [TPGDD].[SP_FINALIZAR_SUBASTAS_VENCIDAS_OK]
	@FECHA DATETIME

AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)


BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		--GENERO LA COMPRA ADJUDICANDO LAS SUBASTAS AL CLIENTE QUE OFERTO MAS
		INSERT INTO [TPGDD].[Compras]
				   ([idPublicacion]
				   ,[idCliente]
				   ,[fecha]
				   ,[cantidad]
				   ,[idVendedor]
				   ,[tipoPublicacion])
		   
		SELECT P.pCodigo,
			   (SELECT idCliente FROM TPGDD.Ofertas O 
			   WHERE O.idSubasta = S.idSubasta AND O.monto = (SELECT MAX(OO.monto) FROM TPGDD.Ofertas OO WHERE O.idSubasta = S.idSubasta)),
			   @FECHA,
			   1,
			   P.idUsuario,
			   'subasta'
        FROM TPGDD.Publicaciones P INNER JOIN TPGDD.Subastas S ON S.idPublicacion = P.pCodigo    
		WHERE pFecha_Venc < @FECHA AND P.idEstado = 2 --ESTADO ACTIVA

		IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se adjudicaron las subastas vencidas al mejor postor'; 
END TRY
BEGIN CATCH

	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR(N'Ocurri� un error durante la operacion de adjudicacion de subastas vencidas. %s',16,1, @ERROR)

END CATCH
		
BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		--inserto el item de la factura que corresponde con la mayor oferta recibida
		declare @idcompra int
		SET @idcompra = @@IDENTITY

		INSERT INTO [TPGDD].[Items]
			   ([nroFactura],
			   [idCompra],
			   [nombre],
			   [cantidad],
			   [montoItem],
			   [idPublicacion])
	
		select
		 (select top 1 nroFactura from TPGDD.Items i where i.idPublicacion = p.pCodigo),
		  @idcompra,
		   'costo por venta tipo subasta',
			1, 
			(select valorActual from TPGDD.Subastas s where s.idPublicacion = p.pCodigo),
			P.pCodigo 
	    from TPGDD.Publicaciones p inner join Subastas sub on sub.idPublicacion = p.pCodigo   
		WHERE pFecha_Venc < @FECHA AND P.idEstado = 2 --ESTADO ACTIVA

		IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se generaron las facturas por venta de las subastas vencidas'; 
END TRY
BEGIN CATCH

	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR(N'Ocurri� un error durante la operacion de generaci�n de facturas. %s',16,1, @ERROR)

END CATCH

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		UPDATE Publicaciones
		SET idEstado = 4--FINALIZADA
		WHERE pFecha_Venc < @FECHA and pCodigo in (select idPublicacion from Subastas)

		IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se actualizaron las fechas de finalizacion de las subastas vencidas'; 
END TRY
BEGIN CATCH

	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR(N'Ocurri� un error durante la operacion de actualizaci�n subastas vencidas. %s',16,1, @ERROR)

END CATCH

GO
/****** Object:  StoredProcedure [TPGDD].[SP_FUNCIONALIDADES]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [TPGDD].[SP_FUNCIONALIDADES]
AS
BEGIN 
	SELECT nombre FROM TPGDD.Funcionalidades
END

GO
/****** Object:  StoredProcedure [TPGDD].[SP_INSERT_CALIFICACION_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [TPGDD].[SP_INSERT_CALIFICACION_OK]
(@USER int,
 @idcompra INT ,
 @CALIFICACION NUMERIC(18),
 @OBSERVACION NVARCHAR(255))

AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
    BEGIN TRANSACTION
        INSERT INTO [TPGDD].[Calificaciones]
           ([idCompra]
           ,[calificador]
           ,[cantEstrellas]
           ,[observacion])
        VALUES
           (@idcompra
		   ,(SELECT idCliente FROM TPGDD.Clientes WHERE idUsuario = @USER)
           ,@CALIFICACION
           ,@OBSERVACION)

	    update TPGDD.Compras set calificada = 'true' where idCompra = @idcompra
 
		UPDATE TPGDD .Usuarios SET reputacion = ((reputacion + @CALIFICACION) / 2 ) WHERE idUsuario = (SELECT idVendedor FROM TPGDD.Compras WHERE idCompra = @idcompra)

		IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se registro la calificacion con exito'; 
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR(N'Ocurri� un error durante la operacion de calificacion: %s',16,1, '', @ERROR)

END CATCH

GO
/****** Object:  StoredProcedure [TPGDD].[SP_INSERT_CLIENTE_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------------------------------------------------------------
CREATE PROCEDURE [TPGDD].[SP_INSERT_CLIENTE_OK]
--PARA EL USUARIO
@LOC nvarchar(255),
@USER nvarchar(255),  
@PASS nvarchar(255), 
@MAIL nvarchar(255), 
@TEL nvarchar(255), 
@PISO numeric(18,0),
@DEPTO nvarchar(255), 
@F_CREAC datetime,
@NRO_CALLE numeric(18,0),  
@DOM_CALLE nvarchar(255),  
@CP nvarchar(255),
@TIPO nvarchar(255),
--PARA EL CLIENTE
@NOM nvarchar(255),
@APE nvarchar(255),
@FECHA_NAC datetime,
@NRO_DNI numeric(18,2),
@TIPODOC nvarchar(255)
AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

			DECLARE @idUsuario INT

			IF not EXISTS (select idCliente  from [TPGDD].Clientes  where tipoDocumento  like @TIPODOC  and nroDNI  like @NRO_DNI)
				BEGIN   
				   declare @idLocalidad int
				   select @idLocalidad = codLocalidad  from TPGDD.Localidades where descripcion like @LOC

				   EXEC TPGDD.SP_INSERT_USUARIO_OK @idLocalidad, @USER, @PASS,  @MAIL, @TEL, @PISO, @DEPTO, @F_CREAC, @NRO_CALLE, @DOM_CALLE, @CP, 'Cliente'
 				   SET @idUsuario = @@IDENTITY

				   INSERT INTO [TPGDD].[UsuariosRoles]
						([idUsuario]
						,[idRol])
					VALUES
						(@idUsuario,(select idRol from TPGDD.Roles where nombre like 'Cliente'))

				   INSERT INTO [TPGDD].[Clientes]
							([idUsuario]
							,[nombre]
							,[apellido]
							,[fechaNacimiento]
							,[nroDNI]
							,[tipoDocumento]
							)
						VALUES
							(@idUsuario
							,@NOM
							,@APE
							,@FECHA_NAC
							,@NRO_DNI
							,@TIPODOC)

					COMMIT
					PRINT N'Cliente registrado con exito';

			   END
			ELSE
				BEGIN
				  RAISERROR( N'Ya existe un cliente con el tipo de documento y nro ingresados.',16,1) 
				  ROLLBACK
				END

END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('Ocurri� un error al ingresar el cliente: %s',16,1, @ERROR)
END CATCH

GO
/****** Object:  StoredProcedure [TPGDD].[SP_INSERT_COMPRAS_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [TPGDD].[SP_INSERT_COMPRAS_OK]

@PUBLICACION int,
@IDUSUARIO INT,
@FECHA datetime,
@CANTIDAD numeric(18,0), 
@TIPO nvarchar(255), 
@VENDEDOR nvarchar(255)

AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		DECLARE @IDCLIENTE INT
		SELECT @IDCLIENTE = idCliente FROM TPGDD.Clientes WHERE idUsuario = @IDUSUARIO 

	    DECLARE @CALIFICACIONES INT
		SELECT @CALIFICACIONES = isnull(COUNT(*),0) FROM TPGDD.Compras WHERE calificada = 'FALSE' AND idCliente = @IDCLIENTE  

		IF @CALIFICACIONES > 3
			RAISERROR('No puede realizar la operacion hasta no realizar las calificaciones pendientes',16,1)
        ELSE
		BEGIN

			INSERT INTO [TPGDD].[Compras]
					   ([idPublicacion], [idCliente], [fecha], [cantidad], [idVendedor], [tipoPublicacion])
		    VALUES
					   (@PUBLICACION, @IDCLIENTE, @FECHA, @CANTIDAD, (SELECT IDUSUARIO FROM [TPGDD].USUARIOS WHERE USERNAME LIKE @VENDEDOR), @TIPO)

	    update TPGDD.ComprasInmediatas set stockDisponible = (stockDisponible - @CANTIDAD), unidadesVendidas = (unidadesVendidas + @CANTIDAD) where idPublicacion = @PUBLICACION

		--si vend� la ultima unidad actualizo el estado de la publicacion a finalizada
		if (select stockDisponible from TPGDD.ComprasInmediatas where idPublicacion = @PUBLICACION) = 0
		    update TPGDD.Publicaciones set idEstado = 4 where pCodigo = @PUBLICACION  

		END						
	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Operacion registrada con exito';
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('Ocurri� un error al ingresar el registro: %s',16,1, @ERROR)
END CATCH

GO
/****** Object:  StoredProcedure [TPGDD].[SP_INSERT_EMPRESA_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------------
CREATE  PROCEDURE [TPGDD].[SP_INSERT_EMPRESA_OK]
--PARA EL USUARIO
@LOC nvarchar(255),
@USER nvarchar(255),  
@PASS nvarchar(255), 
@MAIL nvarchar(255), 
@TEL nvarchar(255), 
@PISO numeric(18,0),
@DEPTO nvarchar(255), 
@F_CREAC datetime,
@NRO_CALLE numeric(18,0),  
@DOM_CALLE nvarchar(255),  
@CP nvarchar(255),
@TIPO nvarchar(255),
--PARA LA EMPRESA
@RAZON nvarchar(255),
@CUIT nvarchar(50),
@CONTACTO nvarchar(255),

@RUBRO nvarchar(255),
@CIUDAD nvarchar(255)

AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		DECLARE @idUsuario INT

		IF not EXISTS (select idEmpresa from [TPGDD].Empresas  where cuit like @CUIT and razonSocial like @RAZON)
			BEGIN   
				declare @idLocalidad int
				select @idLocalidad = codLocalidad  from TPGDD.Localidades where descripcion like @LOC
				EXEC [TPGDD].SP_INSERT_USUARIO_OK @idLocalidad, @USER, @PASS,  @MAIL, @TEL, @PISO, @DEPTO, @F_CREAC, @NRO_CALLE, @DOM_CALLE, @CP, 'Empresa'
 			
				SET @idUsuario = @@IDENTITY

				 INSERT INTO [TPGDD].[UsuariosRoles]
						([idUsuario]
						,[idRol])
				VALUES
				 (@idUsuario,(select idRol from TPGDD.Roles where nombre like 'Empresa'))

				INSERT INTO [TPGDD].Empresas
				([idUsuario]
				,[razonSocial]
				,[cuit]
				,[nombreContacto]
				,[nombreRubro]
				,[ciudad])
				VALUES
				(@idUsuario
				,@RAZON
				,@CUIT
				,@CONTACTO
				,@RUBRO
				,@CIUDAD)
			  IF @TRANSCOUNT = 0
			     COMMIT TRANSACTION
			  PRINT N'Usuario registrado con exito';
		   END
		ELSE
			BEGIN
			  RAISERROR( N'No se pudo agregar el registro, ya existe un registro con la razon social y cuit ingresados.',16,1) 
			  ROLLBACK
			END

END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('Ocurri� un error al ingresar el registro: %s',16,1, @ERROR)
END CATCH

GO
/****** Object:  StoredProcedure [TPGDD].[SP_INSERT_FACTURA_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [TPGDD].[SP_INSERT_FACTURA_OK]

@VISIBILIDAD numeric(18,2), 
@USER int,
@FECHA DATETIME,
@idPublicacion numeric(18),
@CONCEPTO NVARCHAR(255)
AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		INSERT INTO [TPGDD].[Facturaciones]
				   ([idFormaPago]
				   ,[idUsuario]
				   ,[fecha]
				   ,[total])
			 VALUES
				   (1
				   ,@USER
				   ,@FECHA
				   ,@VISIBILIDAD)

		   DECLARE @NROFACTURA numeric(18,0)
		   SET @NROFACTURA = @@IDENTITY

		   INSERT INTO [TPGDD].[Items]
           ([nroFactura]
           ,[nombre]
           ,[cantidad]
           ,[montoItem]
           ,[idPublicacion])
     VALUES
           (@NROFACTURA
           ,@CONCEPTO
           ,1
           ,@VISIBILIDAD
           ,@idPublicacion)

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		--PRINT N'Se agreg� con exito la publicacion';
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('Ocurri� un error en facturacion: %s',16,1, @ERROR)
END CATCH

GO
/****** Object:  StoredProcedure [TPGDD].[SP_INSERT_FUNCIONALIDAD_ROL_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--*******************************************************************
--modificaciones

CREATE procedure [TPGDD].[SP_INSERT_FUNCIONALIDAD_ROL_OK] (
	@nombre nvarchar(255),
	@Funcionalidad nvarchar(255)) 
AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		Declare @idRol int
		Select @idRol = idRol  from TPGDD.Roles R
		where R.nombre = @nombre 
		Insert into TPGDD.RolesFuncionalidades (idRol, idFuncionalidad)
			Values(@idRol, (select idFuncionalidad from Funcionalidades where nombre like  @Funcionalidad))

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	Raiserror('No se pudo agregar la funcionalidad %s al rol',15,1, @Funcionalidad)
END CATCH

GO
/****** Object:  StoredProcedure [TPGDD].[SP_INSERT_OFERTAS_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [TPGDD].[SP_INSERT_OFERTAS_OK]
(
@PUBLICACION int,
@IDUSUARIO INT,
@FECHA datetime,
@MONTO numeric(18,0)
)
AS
SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		DECLARE @CLIENTE INT
		SELECT @CLIENTE = idCliente FROM TPGDD.Clientes WHERE idUsuario = @IDUSUARIO  

		INSERT INTO [TPGDD].[Ofertas]
           ([idCliente]
           ,[idSubasta]
           ,[fecha]
           ,[monto])
        VALUES
           (@CLIENTE
           ,(SELECT idSubasta FROM [TPGDD].Subastas WHERE idPublicacion =@PUBLICACION)
           ,@FECHA
           ,@MONTO)

       UPDATE TPGDD.Subastas SET valorActual = @MONTO
	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Oferta registrada con exito';
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('Ocurri� un error al ingresar el registro: %s',16,1, @ERROR)
END CATCH

GO
/****** Object:  StoredProcedure [TPGDD].[SP_INSERT_PUBLICACION_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [TPGDD].[SP_INSERT_PUBLICACION_OK]
@TIPO nvarchar(255),

@VISIBILIDAD nvarchar(255), 
@RUBRO int,
@ESTADO int,
@USER int,
@DESCRIPCION nvarchar(255), 

@STOCK numeric(18,0),
@FECHA_CREACION DATETIME,
@FECHA_FIN DATETIME,
@PRECIO numeric(18,2),
@admiteEnvio bit

AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

--genero la publicacion
		INSERT INTO [TPGDD].[Publicaciones]
				   ([codVisibilidad], [codRubro], [idEstado], [idUsuario], [pDescripcion], [pStock]
				   ,[pFecha], [pFecha_Venc], [pPrecio], [pEnvio])
	    VALUES
				   ((select codigo from TPGDD.Visibilidades where descripcion like @VISIBILIDAD )
				   ,@RUBRO, @ESTADO, @USER, @DESCRIPCION, @STOCK
				   ,@FECHA_CREACION, @FECHA_FIN, @PRECIO, @admiteEnvio)

		DECLARE @idPublicacion numeric(18)
		SET @idPublicacion = @@IDENTITY

		IF @TIPO = 'compra inmediata'
			begin
				INSERT INTO [TPGDD].[ComprasInmediatas] ([idPublicacion], [stockDisponible], [unidadesVendidas])
				VALUES (@idPublicacion,@STOCK,0)
			end
		if @tipo ='subasta'
			begin
				INSERT INTO [TPGDD].[Subastas]
				([idPublicacion],[valorActual])
				VALUES
				(@idPublicacion, convert(numeric(18,0),@PRECIO))
			end

		if @ESTADO=2 --publicacion activa
			begin--genero la factura (el encabezado y el item)
				DECLARE @COSTOVISIBILIDAD numeric(18,2)
				SELECT @COSTOVISIBILIDAD = precio  FROM TPGDD.Visibilidades WHERE descripcion like @VISIBILIDAD

				EXEC [TPGDD].[SP_INSERT_FACTURA_OK] @COSTOVISIBILIDAD, @USER, @FECHA_CREACION, @idPublicacion, 'costo por publicar'
		end
	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se agreg� con exito la publicacion';
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('Ocurri� un error al agregar la publicacion: %s',16,1, @ERROR)
END CATCH

GO
/****** Object:  StoredProcedure [TPGDD].[SP_INSERT_ROL_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [TPGDD].[SP_INSERT_ROL_OK] (
	@nombre nvarchar(255))
AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT
	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		Insert into TPGDD.Roles ( nombre) 
			Values (@nombre ) 

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se agreg� con exito el rol';
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('Ocurri� un error al agregar el rol: %s',16,1, @ERROR)
END CATCH

/****** Object:  StoredProcedure [TPGDD].[SP_INSERT_VISIBILIDAD_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------------------

CREATE PROCEDURE [TPGDD].[SP_INSERT_VISIBILIDAD_OK](
@NOM nvarchar(255), 
@PRECIO numeric(18,2), 
@PORCENT numeric(18,2),
@ENVIO numeric(10,2),
@PRIORIDAD int,
@admiteEnvio bit
)

AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		INSERT INTO [TPGDD].[Visibilidades]
           ([codigo]
           ,[descripcion]
           ,[precio]
           ,[porcentaje]
           ,[Envio]
           ,[prioridad] --esto esta como identity y tira error
           ,[admiteEnvio])
     VALUES
           ((select max(codigo) from Visibilidades) + 1
           ,@NOM
           ,@PRECIO
           ,@PORCENT
           ,@ENVIO
           ,@PRIORIDAD --esto esta como identity y tira error
           ,@admiteEnvio)

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se agreg� con exito la visibilidad';
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('Ocurri� un error al agregar la visibilidad: %s',16,1, @ERROR)
END CATCH

GO

/****** Object:  StoredProcedure [TPGDD].[SP_UPDATE_VISIBILIDAD_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------

CREATE PROCEDURE [TPGDD].[SP_UPDATE_VISIBILIDAD_OK] (@DESCRIPCION NVARCHAR(255), @PRIORIDAD INT, @ID NUMERIC(18))
AS

SET XACT_ABORT ON	
SET NOCOUNT ON	

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		--ACTUALIZO LA VISIBILIDAD
		SET IDENTITY_INSERT TPGDD.VISIBILIDADES ON
			UPDATE [TPGDD].[Visibilidades]
			   SET descripcion = @DESCRIPCION, prioridad= @PRIORIDAD  --por alguna razon esto esta como identity y no se puede actualizar, modificar la base
            WHERE codigo = @ID
		SET IDENTITY_INSERT TPGDD.VISIBILIDADES OFF

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'La visibilidad fue actualizada con exito'; 
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('Ocurri� un error al actualizar la visibilidas de codigo %s: %s',16,1, @ID, @ERROR)
END CATCH
GO




/****** Object:  UserDefinedFunction [TPGDD].[FX_NO_VENDIDOS]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------------------------------

CREATE FUNCTION [TPGDD].[FX_NO_VENDIDOS] (@user int, @desde datetime, @hasta datetime, @visibilidad nvarchar(255))

RETURNS  nvarchar(255)
AS
BEGIN
	DECLARE @cantidad nvarchar(255)
	if @user is null return null

	if @visibilidad is null and @desde is null and @hasta is null
	 begin
		 select @cantidad = sum(pSTOCK) from [TPGDD].Publicaciones where idUsuario=@user and idEstado in (4,5) 
	end 
	if @visibilidad is null
	 begin 
		select @cantidad = sum(pSTOCK) from [TPGDD].Publicaciones where idUsuario=@user and idEstado in (4,5)  and pFecha between @desde and @hasta 
	 end
 	else
	 begin 
	 	 DECLARE @codigoVisbilidad numeric(18,0)
         SELECT @codigoVisbilidad = codigo FROM TPGDD.Visibilidades WHERE descripcion LIKE @visibilidad 
         select @cantidad = sum(pSTOCK) from [TPGDD].Publicaciones where idUsuario=@user and idEstado in (4,5)  and pFecha between @desde and @hasta  and codVisibilidad = @codigoVisbilidad   
	 end
	
	RETURN @cantidad;

END

GO

/****** Object:  UserDefinedFunction [TPGDD].[FX_CANTIDAD_COMPRADA_CLIENTE_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------------------------------
CREATE FUNCTION [TPGDD].[FX_CANTIDAD_COMPRADA_CLIENTE_OK] (@idCliente int, @desde datetime, @hasta datetime, @RUBRO nvarchar(255))
RETURNS nvarchar(255)
AS
BEGIN

	DECLARE  @cantidadComprada nvarchar(255)
	if @idCliente is null return null

	if @RUBRO is null and @desde is null and @hasta is null
	 begin 
		 select @cantidadComprada = sum(cantidad) from [TPGDD].compras where idcliente = @idCliente 
	 end 
	if @RUBRO is null
	 begin 
		 select @cantidadComprada = sum(cantidad) from [TPGDD].compras where  idcliente = @idCliente and fecha between @desde and @hasta 
	 end
 	else
	 begin 
	 	DECLARE @IDRUBRO INT
		SELECT @IDRUBRO = codRubro FROM TPGDD.Rubros WHERE descripcionCorta LIKE @RUBRO 

		select @cantidadComprada = sum(cantidad) from [TPGDD].compras c inner join [TPGDD].publicaciones p on c.idPublicacion = p.pCodigo
		 where  idcliente = @idCliente and fecha between @desde and @hasta and codRubro  = @IDRUBRO  
	 end
	RETURN @cantidadComprada

END

GO

/****** Object:  UserDefinedFunction [TPGDD].[FX_CANTIDAD_FACTURAS]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [TPGDD].[FX_CANTIDAD_FACTURAS] (@user int, @desde datetime, @hasta datetime)

RETURNS  nvarchar(255)
AS
BEGIN

	DECLARE @cantidad  nvarchar(255)
	if @user is null return null
	if  @desde is null OR @hasta is null
	 begin 
		 select @cantidad = COUNT(*) from [TPGDD].Facturaciones where idUsuario=@user
	 end 
 	else
	 begin 
		 select @cantidad = COUNT(*) from [TPGDD].Facturaciones where idUsuario=@user and fecha between @desde and @hasta
	 end

	RETURN @cantidad

END

GO

/****** Object:  UserDefinedFunction [TPGDD].[FX_MONTO_FACTURADO]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------------------------------

CREATE FUNCTION [TPGDD].[FX_MONTO_FACTURADO] (@user int, @desde datetime, @hasta datetime)

RETURNS nvarchar(255)
AS
BEGIN

	DECLARE @cantidad nvarchar(255)
	if @user is null return null
	if  @desde is null OR @hasta is null
	 begin 
		 select @cantidad = SUM(total) from [TPGDD].Facturaciones where idUsuario=@user
	 end 
 	else
	 begin 
		 select @cantidad = SUM(total) from [TPGDD].Facturaciones where idUsuario=@user and fecha between @desde and @hasta
	 end
	RETURN @cantidad

END

GO

/****** Object:  StoredProcedure [TPGDD].[SP_LISTADOS_ESTADISTICOS_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [TPGDD].[SP_LISTADOS_ESTADISTICOS_OK] 
    @desde datetime, 
	@hasta datetime,
	@Visbilidad NVARCHAR(255),
	@Rubro NVARCHAR(255),
	@TIPO INT --PARA PODER ELEGIR EL LISTADO QUE QUIERO
As
Begin
	Set nocount on

	DECLARE @user int

	IF (@TIPO=1) 

	    select distinct top 5 idUsuario, username, TPGDD.FX_NO_VENDIDOS(idUsuario, @desde, @hasta, @Visbilidad) as noVendidos 
		from TPGDD.usuarios
		where TPGDD.FX_NO_VENDIDOS(idUsuario, @desde, @hasta, @Visbilidad) is not null 
		order by noVendidos desc

	IF (@TIPO=2) 

	    select top 5 cli.idcliente, username,  TPGDD.FX_CANTIDAD_COMPRADA_CLIENTE_OK (cli.idcliente, @desde , @hasta, @Rubro)  as comprados
		from  TPGDD.usuarios u inner join TPGDD.Clientes cli on cli.idUsuario = u.idUsuario-- inner join compras co on co.idCliente = cli.idCliente order by fecha
		where TPGDD.FX_CANTIDAD_COMPRADA_CLIENTE_OK (cli.idcliente, @desde , @hasta, @Rubro) is not null


    IF (@TIPO=3)  

		select distinct top 5 idUsuario, username, TPGDD.[FX_CANTIDAD_FACTURAS] (idUsuario, @desde , @hasta) as  cantFacturas 
		from TPGDD.usuarios
		where TPGDD.[FX_CANTIDAD_FACTURAS] (idUsuario, @desde , @hasta) is not null
		order by cantFacturas desc

    IF (@TIPO=4) 
	
	    select distinct top 5 idUsuario, username,  TPGDD.[FX_MONTO_FACTURADO] (idUsuario, @desde , @hasta) as  montoFacturas
	    from TPGDD.usuarios 
		where TPGDD.[FX_MONTO_FACTURADO] (idUsuario, @desde , @hasta) is not null
		order by montoFacturas desc
	
	return	  
End

GO

/****** Object:  StoredProcedure [TPGDD].[sp_mejoresCompradores_ok]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--*******************************************************************
------------------------------------------------------------------------------------
--2. Clientes con mayor cantidad de productos comprados, por mes y por a�o, dentro 
--de un rubro particular
------------------------------------------------------------------------------------
CREATE   PROCEDURE [TPGDD].[sp_mejoresCompradores_ok](@idRubro int, @numeroTrimestre int, @year int) 
AS 
BEGIN

	select top 5 ci.idCliente  ,sum(Co.cantidad) as CantidadProductosComprados, R.descripcionCorta as Rubro, U.username
	from TPGDD.Clientes Ci, TPGDD.Compras Co, TPGDD.Publicaciones P, TPGDD.Rubros R, TPGDD.Usuarios U
	where U.idUsuario = Ci.idUsuario and Ci.idCliente = Co.idCliente and Co.idPublicacion = P.pCodigo and P.codRubro = R.codRubro and R.codRubro = @idRubro 
		  and year(P.pFecha_Venc) = @year and TPGDD.getTrimestre(P.pFecha_Venc) = @numeroTrimestre 
	group by Ci.idCliente, R.descripcionCorta, U.username
	order by 2 desc
END

GO


/****** Object:  StoredProcedure [TPGDD].[sp_mejoresVendedoresPorCantidadFacturas_ok]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*****************************************************
------------------------------------------------------------------------------------
--3. Vendedores con mayor cantidad de facturas dentro de un mes y a�o particular
------------------------------------------------------------------------------------
CREATE   PROCEDURE [TPGDD].[sp_mejoresVendedoresPorCantidadFacturas_ok](@numeroTrimestre int, @year int) 
AS 
BEGIN

	select top 5 U.idUsuario, TPGDD.cantidadFacturas(U.idUsuario,@numeroTrimestre, @year)  as CantidadFacturas, U.username
	from TPGDD.Usuarios U
	where exists(select 1 from TPGDD.Publicaciones P where P.idUsuario = U.idUsuario)
	order by 2 desc
END
GO


/****** Object:  StoredProcedure [TPGDD].[sp_mejoresVendedoresPorMontoFacturado_ok]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--******************************************************
------------------------------------------------------------------------------------
--4. Vendedores con mayor monto facturado dentro de un mes y a�o particular
------------------------------------------------------------------------------------

CREATE   PROCEDURE [TPGDD].[sp_mejoresVendedoresPorMontoFacturado_ok](@numeroTrimestre int, @year int) 
AS 
BEGIN

	select top 5 idUsuario, TPGDD.montoFacturado(U.idUsuario,@numeroTrimestre, @year)  as MontoFacturado, U.username
	from TPGDD.Usuarios U
	where exists(select 1 from TPGDD.Publicaciones P where P.idUsuario = U.idUsuario)
	order by 2 desc
END

GO


/****** Object:  StoredProcedure [TPGDD].[SP_MODIFICAR_ROLES_BORRAR]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [TPGDD].[SP_MODIFICAR_ROLES_BORRAR] (
	@idRol int,
	@nombre nvarchar(255)
	,@HABILITADO BIT) 

AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT
	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION


		Update TPGDD.Roles
		Set nombre = @nombre , habilitado =@HABILITADO
		Where idRol = @idRol

        DELETE FROM RolesFuncionalidades WHERE idRol = @idRol  

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se actualizo con exito el rol';
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('No se pudo modificar el rol: %s',16,1, @ERROR)
END CATCH
GO


/****** Object:  StoredProcedure [TPGDD].[SP_modificarPassword]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create  procedure  [TPGDD].[SP_modificarPassword] (
		@username nvarchar(255),
		@password nvarchar(255)
) 
As
Begin
	UPDATE [TPGDD].[Usuarios]
	SET
		[password] = @password
	WHERE username = @username
end

GO
/****** Object:  StoredProcedure [TPGDD].[sp_peoresVendedores_ok]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--******************************************************
--1 . Vendedores con mayor cantidad de productos no vendidos
CREATE   PROCEDURE [TPGDD].[sp_peoresVendedores_ok](@codigoVisbilidad numeric(18,0), @numeroTrimestre int, @year int) 
AS 
BEGIN

	SELECT TOP 5 C.idVendedor, P.pStock - sum(C.cantidad) as cantidadNoVendida, P.pFecha_Venc as [fecha fin], V.descripcion as visibilidad
				 
	FROM TPGDD.Compras C, TPGDD.Publicaciones P, TPGDD.Visibilidades V
	where C.idPublicacion = P.pCodigo and P.codVisibilidad = V.codigo 
		  and TPGDD.getTrimestre(P.pFecha_Venc) = @numeroTrimestre and year(P.pFecha_Venc) = @year and P.codVisibilidad = @codigoVisbilidad 
	group by C.idVendedor, P.pStock, P.pFecha_Venc, V.descripcion
	ORDER BY 3 desc, 4 desc
END
GO


/****** Object:  StoredProcedure [TPGDD].[SP_UPDATE_PUBLICACION_ESTADO_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------

CREATE PROCEDURE [TPGDD].[SP_UPDATE_PUBLICACION_ESTADO_OK](
@ESTADO nvarchar(255),
@ID  numeric(18), 
@FECHA DATETIME
)

AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		--ACTUALIZO EL ESTADO DE LA PUBLICACION
			UPDATE Publicaciones
		    SET idEstado = (SELECT [idEstado] FROM [TPGDD].[Estados] WHERE descripcion LIKE @ESTADO) 
		    WHERE pCodigo = @ID

			if @ESTADO= 'Activa'
			begin--genero la factura (el encabezado y el item)
				DECLARE @COSTOVISIBILIDAD numeric(18,2)
				DECLARE @USER INT 
				SELECT @COSTOVISIBILIDAD = precio, @USER = idUsuario   
				FROM TPGDD.Visibilidades v inner join TPGDD.Publicaciones p on p.codVisibilidad =v.codigo 
				  WHERE pCodigo = @ID

				EXEC [TPGDD].[SP_INSERT_FACTURA_OK] @COSTOVISIBILIDAD, @USER, @FECHA, @ID, 'costo por publicar'
		    end

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se actualiz� con exito el estado de la publicacion'; 
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('Ocurri� un error al actualizar el estado de la publicacion de codigo %s: %s',16,1, @ID, @ERROR)
END CATCH

GO


/****** Object:  StoredProcedure [TPGDD].[SP_UPDATE_PUBLICACION_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------------------------------------------
--*****************************************************************************************
--**********PROCEDURES

CREATE PROCEDURE [TPGDD].[SP_UPDATE_PUBLICACION_OK](

@VISIBILIDAD nvarchar(255),
@RUBRO nvarchar(255),
@ESTADO nvarchar(255),
@USER int,
@DESCRIPCION nvarchar(255),
@STOCK numeric(18,0),
@FECHA datetime,
@FIN datetime,
@PRECIO numeric(18,2),
@ENVIO BIT,
@ID  numeric(18, 0),
@TIPO nvarchar(255)
)

AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

		--ACTUALIZO LA PUBLICACION
			UPDATE [TPGDD].[Publicaciones]
			   SET [codVisibilidad] = (SELECT CODIGO FROM [TPGDD].Visibilidades WHERE descripcion LIKE @VISIBILIDAD) 
				  ,[codRubro] = (SELECT codRubro  FROM [TPGDD].Rubros WHERE descripcionCorta LIKE @RUBRO) 
				  ,[idEstado] = (SELECT idEstado FROM [TPGDD].Estados WHERE descripcion LIKE @ESTADO) 
				  ,[idUsuario] = @USER
				  ,[pDescripcion] = @DESCRIPCION
				  ,[pStock] = @STOCK
				  ,[pFecha] = @FECHA
				  ,[pFecha_Venc] = @FIN
				  ,[pPrecio] =@PRECIO
				  ,[pEnvio] = @ENVIO
			 WHERE pCodigo = @ID
			
			 --ACTUALIZO EN SUBASTAS O COMPRA INMEDIATAS
			 IF @TIPO='Subasta' 
			 BEGIN
				 IF exists(SELECT * FROM [TPGDD].ComprasInmediatas WHERE idPublicacion = @ID) 
				 BEGIN
					 DELETE FROM  [TPGDD].ComprasInmediatas WHERE idPublicacion = @ID 
					 INSERT INTO [TPGDD].Subastas (idPublicacion,valorActual) 
					 VALUES (@ID, @PRECIO)
				 END
				 ELSE
	 				 UPDATE [TPGDD].Subastas SET valorActual = @PRECIO WHERE idPublicacion = @ID
			END
			ELSE
			BEGIN
				 IF exists(SELECT * FROM [TPGDD].Subastas WHERE idPublicacion = @ID) 
				 BEGIN
					 DELETE FROM  [TPGDD].Subastas WHERE idPublicacion = @ID 
					 INSERT INTO [TPGDD].ComprasInmediatas (idPublicacion,stockDisponible ) 
					 VALUES (@ID, @STOCK)
				 END
				 ELSE
	 				 UPDATE [TPGDD].ComprasInmediatas SET stockDisponible = @STOCK WHERE idPublicacion = @ID

			END

			if @ESTADO= 'Activa'
			begin--genero la factura (el encabezado y el item)
				DECLARE @COSTOVISIBILIDAD numeric(18,2)
				SELECT @COSTOVISIBILIDAD = precio  FROM TPGDD.Visibilidades WHERE descripcion like @VISIBILIDAD

				EXEC [TPGDD].[SP_INSERT_FACTURA_OK] @COSTOVISIBILIDAD, @USER, @FECHA, @ID, 'costo por publicar'
		    end

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se actualiz� la publicacion con exito'; 
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR(N'Ocurri� un error al actualizar la publicacion, %s', 16, 1, @ERROR)

END CATCH
GO


/****** Object:  StoredProcedure [TPGDD].[SP_UPDATE_ROLES_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [TPGDD].[SP_UPDATE_ROLES_OK] (
	@idRol int,
	@nombre nvarchar(255)
	,@HABILITADO BIT) 

AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT
	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION


		Update TPGDD.Roles
		Set nombre = @nombre , habilitado =@HABILITADO
		Where idRol = @idRol

        DELETE FROM RolesFuncionalidades WHERE idRol = @idRol  

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se actualizo con exito el rol';
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR('No se pudo modificar el rol: %s',16,1, @ERROR)
END CATCH
GO


/****** Object:  StoredProcedure [TPGDD].[SP_UPDATE_USUARIO_CLIENTE_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [TPGDD].[SP_UPDATE_USUARIO_CLIENTE_OK]
(
--parametros usuarios
@ID int,
@localidad nvarchar(255),
@password nvarchar(255),
@HABILITADO BIT,--por intentos de logueo fallidos
@MAIL nvarchar(255),
@TEL  nvarchar(255),
@PISO numeric(18,0),
@DEPTO nvarchar(50),
@FECHA datetime,
@NROCALLE numeric(18),
@DOMICILIO nvarchar(255),
@CP nvarchar(50),
@TIPO nvarchar(255),

--parametros cliente
@BAJA  bit,--por baja logica por algun admin
@nombre nvarchar(255),
@apellido nvarchar(255),
@fechanac date,
@dni numeric(18,2),
@tipodni nvarchar(255)
)

AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION
--actualizo el usuario
		UPDATE [TPGDD].[Usuarios]
		   SET [codLocalidad] = (select codLocalidad from Localidades where descripcion = @localidad)
			  ,[password] = case when @password='' then [password] else  @password end
			  ,[flagHabilitado] = @HABILITADO
			  ,[tipoUsuario] ='Cliente'
			  ,[mail] = @MAIL
			  ,[telefono] = @TEL
			  ,[nroPiso] = @PISO
			  ,[nroDpto] = @DEPTO
			  ,[fechaCreacion] = case when @FECHA = '' then null else  @FECHA end 
			  ,[nroCalle] = @NROCALLE
			  ,[domCalle] = @DOMICILIO
			  ,[codPostal] = @CP 
			  ,[bajaLogica] = @BAJA
		 WHERE  idUsuario like @ID

--actualizo el cliente
		UPDATE [TPGDD].[Clientes]
			SET  [nombre] = @nombre
				,[apellido] = @apellido
				,[fechaNacimiento] = case when @fechanac = '' then null else  @fechanac end 
				,[nroDNI] =case when (@dni = null or @tipodni = '') then null else  @dni end   
				,[tipoDocumento] =case when (@dni = null or @tipodni = '') then '' else  @tipodni end     
			WHERE idUsuario =@ID

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se actualiz� el usuario con exito'; 
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR(N'Ocurri� un error al actualizar el usuario %s',16,1, @ERROR)

END CATCH
GO


/****** Object:  StoredProcedure [TPGDD].[SP_UPDATE_USUARIO_EMPRESA_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------------------------------------------------

CREATE PROCEDURE [TPGDD].[SP_UPDATE_USUARIO_EMPRESA_OK]
(
--parametros usuarios
@ID int,
@localidad nvarchar(255),
@password nvarchar(255),
@HABILITADO BIT,
@MAIL nvarchar(255),
@TEL  nvarchar(255),
@PISO numeric(18,0),
@DEPTO nvarchar(50),
@FECHA datetime,
@NROCALLE numeric(18),
@DOMICILIO nvarchar(255),
@CP nvarchar(50),
@TIPO nvarchar(255),
@BAJA  bit,

--parametros empresa
@razon nvarchar(255),
@cuit nvarchar(50),
@contacto nvarchar(50),
@rubro nvarchar(255),
@ciudad nvarchar(255)

)

AS

SET XACT_ABORT ON	
SET NOCOUNT ON		

DECLARE @TRANSCOUNT int
DECLARE @ERROR nvarchar(4000)

BEGIN TRY
	SELECT @TRANSCOUNT = @@TRANCOUNT

	IF @TRANSCOUNT = 0
		BEGIN TRANSACTION

--actualizo el usuario
		UPDATE [TPGDD].[Usuarios]
		   SET [codLocalidad] = (select codLocalidad from Localidades where descripcion = @localidad)
			  ,[password] = case when @password='' then [password] else  @password end
			  ,[flagHabilitado] = @HABILITADO
			  ,[tipoUsuario] ='Empresa'
			  ,[mail] = @MAIL
			  ,[telefono] = @TEL
			  ,[nroPiso] = @PISO
			  ,[nroDpto] = @DEPTO
			  ,[fechaCreacion] = case when @FECHA = '' then null else  @FECHA end 
			  ,[nroCalle] = @NROCALLE
			  ,[domCalle] = @DOMICILIO
			  ,[codPostal] = @CP 
			  ,[bajaLogica] = @BAJA
		 WHERE  idUsuario like @ID

--actualizo la empresa
		UPDATE [TPGDD].[Empresas]
		   SET [razonSocial] = @razon
			  ,[cuit] = @cuit
			  ,[nombreContacto] =@contacto
			  ,[nombreRubro] = @rubro
			  ,[ciudad] = @ciudad
		 WHERE  idUsuario =@ID

	IF @TRANSCOUNT = 0
		COMMIT TRANSACTION
		PRINT N'Se actualiz� el usuario con exito'; 
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 AND @TRANSCOUNT = 0	
		ROLLBACK TRANSACTION
	SELECT @ERROR = ERROR_MESSAGE()
	RAISERROR(N'Ocurri� un error al actualizar el usuario %s',16,1, @ERROR)

END CATCH
GO





/****** Object:  UserDefinedFunction [TPGDD].[FX_CALIFICACIONES_PROMEDIO_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION  [TPGDD].[FX_CALIFICACIONES_PROMEDIO_OK] (@IDUSUARIO INT)
RETURNS @RESUMEN  TABLE
(
	FALTAN INT, 
	PROMEDIO DECIMAL(18,2)
)
AS BEGIN

DECLARE @CUENTA INT
DECLARE @PROMEDIO DECIMAL(18,2)
DECLARE @IDCLIENTE INT

SELECT @IDCLIENTE = idCliente FROM [TPGDD].Clientes WHERE idUsuario = @IDUSUARIO
SELECT @CUENTA = COUNT(idCompra) FROM [TPGDD].COMPRAS WHERE CALIFICADA = 'FALSE' AND IDCLIENTE = @IDCLIENTE
SELECT @PROMEDIO = AVG(cantEstrellas)  FROM [TPGDD].Calificaciones WHERE calificador = @IDUSUARIO	
	
INSERT @RESUMEN (FALTAN, PROMEDIO ) VALUES (@CUENTA, @PROMEDIO)

  RETURN

END

GO



/****** Object:  UserDefinedFunction [TPGDD].[FX_COMPRAS_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------------------------------

CREATE FUNCTION [TPGDD].[FX_COMPRAS_OK]
(
	@CALIFICADA BIT, @USER INT, @TIPO NVARCHAR(255)
)
RETURNS INT
AS
BEGIN

DECLARE @RETORNO INT
IF @CALIFICADA='TRUE' --SOLO LAS COMPRAS O SUBASTAS CALIFICADAS
   SELECT @RETORNO =isnull(COUNT(*),0) FROM  Compras  
   WHERE idCliente =@USER  AND calificada='TRUE' AND tipoPublicacion LIKE @TIPO
	 
ELSE--TODAS LAS COMPRAS DEL CLIENTE O TODAS LAS SUBASTAS
	SELECT @RETORNO =isnull(COUNT(*),0)
	FROM  Compras  
	WHERE idCliente =@USER AND tipoPublicacion LIKE @TIPO


RETURN @RETORNO
END

GO


/****** Object:  UserDefinedFunction [TPGDD].[FX_FUNCIONALIDADES_NO_ASIGNADAS_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------

CREATE FUNCTION [TPGDD].[FX_FUNCIONALIDADES_NO_ASIGNADAS_OK](@IDROL INT)
RETURNS @FUNCIONALIDADES  TABLE
(
NOMBRE NVARCHAR(255)
)
AS BEGIN

INSERT @FUNCIONALIDADES
  Select f1.nombre from tpgdd.Funcionalidades f1
   EXCEPT

SELECT  

	  f.[nombre]
  --    ,[descripcion], r.nombre
  FROM [GD1C2016].[TPGDD].[Funcionalidades] f
  inner join TPGDD.RolesFuncionalidades rf on rf.idFuncionalidad = f.idFuncionalidad
  inner join TPGDD.Roles r on r.idRol = rf.idRol
  where r.idRol = @IDROL
  

  RETURN

END
GO


/****** Object:  UserDefinedFunction [TPGDD].[FX_RESUMEN_ESTRELLAS_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [TPGDD].[FX_RESUMEN_ESTRELLAS_OK](@IDUSUARIO INT)
RETURNS @RESUMEN  TABLE
(
	ESTRELLAS1 INT, 
	ESTRELLAS2 INT,
	ESTRELLAS3 INT,
	ESTRELLAS4 INT,
	ESTRELLAS5 INT, 
	tipoPublicacion NVARCHAR(255)
)
AS BEGIN

DECLARE @IDCLIENTE INT
SELECT @IDCLIENTE = idCliente FROM TPGDD.Clientes WHERE idUsuario = @IDUSUARIO   

INSERT @RESUMEN

  SELECT 
  (SELECT ISNULL(COUNT(*),0) FROM TPGDD.Compras CO INNER JOIN TPGDD.Calificaciones CA ON CO.idCompra =CA.idCompra 
  WHERE CO.idCliente = @IDCLIENTE AND CA.cantEstrellas = 1 AND tipoPublicacion LIKE 'Compra inmediata'),
  (SELECT ISNULL(COUNT(*),0) FROM TPGDD.Compras CO INNER JOIN TPGDD.Calificaciones CA ON CO.idCompra =CA.idCompra 
  WHERE CO.idCliente = @IDCLIENTE AND CA.cantEstrellas = 2 AND tipoPublicacion LIKE 'Compra inmediata'),
  (SELECT ISNULL(COUNT(*),0) FROM TPGDD.Compras CO INNER JOIN TPGDD.Calificaciones CA ON CO.idCompra =CA.idCompra 
  WHERE CO.idCliente = @IDCLIENTE AND CA.cantEstrellas = 3 AND tipoPublicacion LIKE 'Compra inmediata'),
  (SELECT ISNULL(COUNT(*),0) FROM TPGDD.Compras CO INNER JOIN TPGDD.Calificaciones CA ON CO.idCompra =CA.idCompra 
  WHERE CO.idCliente = @IDCLIENTE AND CA.cantEstrellas = 4 AND tipoPublicacion LIKE 'Compra inmediata'),
  (SELECT ISNULL(COUNT(*),0) FROM TPGDD.Compras CO INNER JOIN TPGDD.Calificaciones CA ON CO.idCompra =CA.idCompra 
  WHERE CO.idCliente = @IDCLIENTE AND CA.cantEstrellas = 5 AND tipoPublicacion LIKE 'Compra inmediata'),
  'Compra inmediata'
  FROM TPGDD.Compras  

  UNION 

  SELECT 
  (SELECT ISNULL(COUNT(*),0) FROM TPGDD.Compras CO INNER JOIN TPGDD.Calificaciones CA ON CO.idCompra =CA.idCompra 
  WHERE CO.idCliente = @IDCLIENTE AND CA.cantEstrellas = 1 AND tipoPublicacion LIKE 'Subasta'),
  (SELECT ISNULL(COUNT(*),0) FROM TPGDD.Compras CO INNER JOIN TPGDD.Calificaciones CA ON CO.idCompra =CA.idCompra 
  WHERE CO.idCliente = @IDCLIENTE AND CA.cantEstrellas = 2 AND tipoPublicacion LIKE 'Subasta'),
  (SELECT ISNULL(COUNT(*),0) FROM TPGDD.Compras CO INNER JOIN TPGDD.Calificaciones CA ON CO.idCompra =CA.idCompra 
  WHERE CO.idCliente = @IDCLIENTE AND CA.cantEstrellas = 3 AND tipoPublicacion LIKE 'Subasta'),
  (SELECT ISNULL(COUNT(*),0) FROM TPGDD.Compras CO INNER JOIN TPGDD.Calificaciones CA ON CO.idCompra =CA.idCompra 
  WHERE CO.idCliente = @IDCLIENTE AND CA.cantEstrellas = 4 AND tipoPublicacion LIKE 'Subasta'),
  (SELECT ISNULL(COUNT(*),0) FROM TPGDD.Compras CO INNER JOIN TPGDD.Calificaciones CA ON CO.idCompra =CA.idCompra 
  WHERE CO.idCliente = @IDCLIENTE AND CA.cantEstrellas = 5 AND tipoPublicacion LIKE 'Subasta'),
  'Subasta'
  FROM TPGDD.Compras 

  RETURN
END
GO


/****** Object:  UserDefinedFunction [TPGDD].[FX_RESUMEN_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--**************FUNCIONES*******************************************************
CREATE FUNCTION [TPGDD].[FX_RESUMEN_OK]
(
	@ESTRELLAS INT, @USER INT, @TIPO NVARCHAR(255)
)
RETURNS INT
AS
BEGIN

DECLARE @IDCLIENTE INT
SELECT @IDCLIENTE= IDCLIENTE FROM CLIENTES WHERE idUsuario = @USER

RETURN(	SELECT COUNT(*) 
FROM Calificaciones CA INNER JOIN Compras CO ON CA.idCompra = CO.idCompra 
WHERE idCliente = @IDCLIENTE  AND cantEstrellas = @ESTRELLAS AND tipoPublicacion LIKE @TIPO )	 

END

GO


/****** Object:  UserDefinedFunction [TPGDD].[getIdLocalidad]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*****************************************************************
--*****************************************************************
--******* PROCEDURES FUNCIONALIDADES*******************************
--*****************************************************************

--***************************************************
--******* AUXILIARES *******************************
--***************************************************
 create    FUNCTION [TPGDD].[getIdLocalidad](@nombreLocalidad nvarchar(255))
RETURNS  int
AS
BEGIN
	
	RETURN (select top 1 L.codLocalidad
			from TPGDD.Localidades L where L.descripcion = @nombreLocalidad)
END

GO


/****** Object:  UserDefinedFunction [TPGDD].[getIdRol]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   FUNCTION [TPGDD].[getIdRol](@nombreRol nvarchar(255))
RETURNS  int
AS
BEGIN
	
	RETURN (select T.idRol
			from TPGDD.Roles T where T.nombre = @nombreRol)
END

GO


/****** Object:  UserDefinedFunction [TPGDD].[getIdUsuario]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   FUNCTION [TPGDD].[getIdUsuario](@username nvarchar(255))
RETURNS  int
AS
BEGIN
	
	RETURN (select T.idUsuario
			from TPGDD.Usuarios T where T.username = @username)
END

GO


/****** Object:  UserDefinedFunction [TPGDD].[getTrimestre]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--*************************************************************************
--**** VISTAS DE DATOS SENSIBLES DE TABLAS                   *************
--*************************************************************************

/****** Object:  View [TPGDD].[VW_USUARIOS_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------

CREATE VIEW [TPGDD].[VW_USUARIOS_OK]
AS 
SELECT  U.password, U.bajaLogica,U.flagHabilitado, u.idUsuario as id,  username as usuario,
 nombre as nombre_razon, apellido as apellido_rubro, clientes.tipoDocumento + ' '
  + cast(nroDNI as varchar) as dni_cuit, reputacion, fechaCreacion, mail as Email, tipoUsuario 
  FROM TPGDD.Usuarios u inner join TPGDD.clientes on u.idUsuario = clientes.idUsuario 

union

SELECT  U.password, U.bajaLogica,U.flagHabilitado,  u.idUsuario, username, razonSocial,
 nombreRubro, cuit, reputacion ,fechaCreacion, mail as Email, tipoUsuario  
 FROM TPGDD.Usuarios u inner join TPGDD.Empresas on u.idUsuario = Empresas.idUsuario 
  
GO


/****** Object:  View [TPGDD].[VW_VENDEDORES_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [TPGDD].[VW_VENDEDORES_OK]
AS 
SELECT distinct VW.id, VW.usuario AS vendedor, VW.reputacion, VW.fechaCreacion, VW.Email 
FROM TPGDD.Publicaciones P INNER JOIN TPGDD.VW_USUARIOS_OK VW ON P.idUsuario = VW.id  

GO


/****** Object:  View [TPGDD].[VW_PUBLICACIONES_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------


CREATE VIEW [TPGDD].[VW_PUBLICACIONES_OK]
AS 
SELECT P.pCodigo as id, P.pDescripcion descripcion ,P.pPrecio as precio, P.codVisibilidad AS idVisibilidad, V.prioridad , 
V.descripcion as visibilidad, P.codRubro as idRubro, R.descripcionCorta as rubro, P.idEstado ,E.descripcion as estado, P.pStock as stock, 
p.idUsuario, u.username as vendedor,  p.pFecha as fecha, p.pFecha_Venc as finalizacion, p.pEnvio as envio, p.pPreguntar as preguntas,u.reputacion 
 FROM TPGDD.Publicaciones P 
 left join TPGDD.Visibilidades V on P.codVisibilidad =v.Codigo  
 left join TPGDD.Rubros R on P.codRubro =R.codRubro  
 left join TPGDD.Estados E on P.idEstado = E.idEstado  
 left join TPGDD.usuarios u on P.idUsuario =u.idUsuario 
 
GO


/****** Object:  View [TPGDD].[vw_publicaciones_tipo_ok]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------

CREATE view [TPGDD].[vw_publicaciones_tipo_ok]
as 

SELECT [id]
      ,[descripcion]
      ,[precio]
      ,[idVisibilidad]
      ,[prioridad]
      ,[visibilidad]
      ,[idRubro]
      ,[rubro]
      ,[idEstado]
      ,[estado]
      ,[stockDisponible] as stock
      ,[idUsuario]
      ,[vendedor]
      ,[fecha]
      ,[finalizacion]
      ,[envio]
      ,[preguntas]
      ,[reputacion], 'compra inmediata' as tipo
  FROM TPGDD.VW_PUBLICACIONES_OK vw
 inner join TPGDD.ComprasInmediatas ci on vw.id = ci.idPublicacion 

union

SELECT [id]
      ,[descripcion]
      ,[precio]
      ,[idVisibilidad]
      ,[prioridad]
      ,[visibilidad]
      ,[idRubro]
      ,[rubro]
      ,[idEstado]
      ,[estado]
      ,[stock]
      ,[idUsuario]
      ,[vendedor]
      ,[fecha]
      ,[finalizacion]
      ,[envio]
      ,[preguntas]
      ,[reputacion], 'subasta'
  FROM TPGDD.VW_PUBLICACIONES_OK vw inner join TPGDD.Subastas su  on vw.id = su.idPublicacion 
  
GO

/****** Object:  View [TPGDD].[VW_CALIFICACIONES_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [TPGDD].[VW_CALIFICACIONES_OK]
AS 

SELECT  CO.idCompra, CO.idPublicacion, USERNAME as vendedor, pDescripcion as detalleCompra 
  FROM TPGDD.COMPRAS CO 
  INNER JOIN TPGDD.PUBLICACIONES P ON P.pCodigo= CO.idPublicacion 
  INNER JOIN TPGDD.USUARIOS U ON CO.idVendedor=U.idUsuario

GO


/****** Object:  View [TPGDD].[VW_CALIFICACIONES_PENDIENTE_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [TPGDD].[VW_CALIFICACIONES_PENDIENTE_OK]
AS 

SELECT CO.idCompra, P.pDescripcion as detalleCompra, CO.calificada,
	  CO.fecha ,CO.cantidad ,CO.tipoPublicacion as operacion, (SELECT USERNAME FROM TPGDD.Usuarios US WHERE US.idUsuario = CO.idVendedor) as VENDEDOR ,
	  CI.idUsuario 

  FROM TPGDD.COMPRAS CO 
  INNER JOIN TPGDD.PUBLICACIONES P ON P.pCodigo= CO.idPublicacion 
  INNER JOIN TPGDD.Clientes CI ON CO.idCliente =CI.idCliente
GO


/****** Object:  View [TPGDD].[VW_CALIFICACIONES_REALIZADAS_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE VIEW [TPGDD].[VW_CALIFICACIONES_REALIZADAS_OK]
AS 

SELECT CO.idCompra, pDescripcion as detalleCompra, cantidad,  fecha,
	 tipoPublicacion as operacion, (SELECT USERNAME FROM TPGDD.Usuarios US WHERE US.idUsuario = CO.idVendedor) as VENDEDOR,
	  cantEstrellas calificacion, observacion ,
	   CI.idUsuario , codigoCalificacion
	  
  FROM TPGDD.COMPRAS CO 
  INNER JOIN TPGDD.PUBLICACIONES P ON P.pCodigo= CO.idPublicacion 
  INNER JOIN TPGDD.Clientes CI ON CO.idCliente =CI.idCliente
  INNER JOIN TPGDD.Calificaciones CA ON CO.idCompra=CA.idCompra


GO
/****** Object:  View [TPGDD].[VW_CLIENTES_EMPRESAS_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------

CREATE VIEW [TPGDD].[VW_CLIENTES_EMPRESAS_OK]
AS 

SELECT U.[idUsuario]
      ,[username]
      ,[flagHabilitado]
      ,[tipoUsuario]
      ,[mail]
      ,[telefono]
      ,[nroPiso]
      ,[nroDpto]
      ,[fechaCreacion]
      ,[nroCalle]
      ,[domCalle]
      ,[codPostal]
      ,[bajaLogica]
	  ,[idCliente]
      ,[nombre]
      ,[apellido]
      ,[fechaNacimiento]
      ,[nroDNI]
      ,[tipoDocumento]
	  ,[idEmpresa]
      ,[razonSocial]
      ,[cuit]
      ,[nombreContacto]
      ,[nombreRubro]
      ,[ciudad]
	  ,[descripcion]

  FROM [TPGDD].[Usuarios] U 
  LEFT JOIN  TPGDD.[Clientes] C ON U.idUsuario =C.idUsuario 
  LEFT JOIN TPGDD.[Empresas] E ON U.idUsuario = E.idUsuario
   LEFT JOIN TPGDD.[Localidades] L ON U.codLocalidad = L.codLocalidad 
   
GO


/****** Object:  View [TPGDD].[VW_ESTADOS_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------

CREATE VIEW [TPGDD].[VW_ESTADOS_OK]
AS 
SELECT idEstado as id,descripcion 
from TPGDD.Estados where descripcion not like 'Publicada' 


GO


/****** Object:  View [TPGDD].[VW_FACTURAS_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------

CREATE VIEW [TPGDD].[VW_FACTURAS_OK]
AS 
SELECT F.nroFactura, F.idUsuario, U.username AS usuario, FP.descripcion modoPago, F.total,
F.fecha, I.nombre concepto, cantidad, montoItem, idPublicacion, pDescripcion as publicacion , UR.idRol 

FROM TPGDD.facturaciones F 
inner join TPGDD.items I on F.nroFactura=I.nroFactura 
inner join TPGDD.formasPago FP on F.idFormaPago=FP.idFormaPago 
inner join TPGDD.usuarios U on F.idUsuario=U.idUsuario 
inner join TPGDD.publicaciones P on p.pCodigo=I.idPublicacion 
INNER JOIN TPGDD.UsuariosRoles UR ON UR.idUsuario = U.idUsuario  

GO


/****** Object:  View [TPGDD].[VW_FACTURAS_ROL_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [TPGDD].[VW_FACTURAS_ROL_OK]
AS 
SELECT F.nroFactura, F.idUsuario , U.username AS usuario , FP.descripcion modoPago, F.total ,
F.fecha, UR.idRol 
FROM TPGDD.facturaciones F 
inner join TPGDD.formasPago FP on F.idFormaPago=FP.idFormaPago 
inner join TPGDD.usuarios U on F.idUsuario=U.idUsuario 
inner join TPGDD.UsuariosRoles UR ON UR.idUsuario = U.idUsuario  

GO


/****** Object:  View [TPGDD].[VW_FUNCIONALIDADES_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------

CREATE VIEW [TPGDD].[VW_FUNCIONALIDADES_OK]
AS 
select nombre, idFuncionalidad as id from TPGDD.funcionalidades


GO


/****** Object:  View [TPGDD].[VW_HISTORIAL_OFERTAS_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create VIEW [TPGDD].[VW_HISTORIAL_OFERTAS_OK]
AS
select cli.idUsuario, pub.pCodigo as id, pub.pDescripcion as descripcion, o.monto, fecha,

 (case when exists (select idCompra  from TPGDD.Compras c inner join TPGDD.Publicaciones p on p.pCodigo = c.idPublicacion inner join TPGDD.Subastas s on s.idPublicacion = p.pCodigo where s.idSubasta = o.idSubasta)
      then 'adjudicada' 
	  else 'oferta' end) AS estado
						
from TPGDD.Publicaciones pub inner join TPGDD.Subastas sub on sub.idPublicacion = pub.pCodigo 
                             inner join TPGDD.Ofertas o on o.idSubasta = sub.idSubasta
						     inner join TPGDD.Clientes cli on cli.idCliente = o.idCliente 

GO


/****** Object:  View [TPGDD].[VW_HISTORIAL_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [TPGDD].[VW_HISTORIAL_OK]
AS
SELECT  U.idUsuario, p.pCodigo as id, P.pDescripcion as descripcion, CO.cantidad as cantidad, CO.tipoPublicacion as operacion, 
CO.fecha as fecha, CA.cantEstrellas as estrellas, CO.idCliente, U.username as cliente     
FROM TPGDD.Publicaciones p 
INNER JOIN TPGDD.Compras CO ON p.pCodigo = CO.idPublicacion 
INNER JOIN TPGDD.Clientes CLI ON CLI.idCliente = CO.idCliente  
INNER JOIN TPGDD.Usuarios U ON U.idUsuario = CLI.idUsuario 
LEFT JOIN TPGDD.Calificaciones CA ON  CO.idCompra =CA.idCompra 

GO


/****** Object:  View [TPGDD].[VW_LOCALIDADES_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------------
CREATE VIEW [TPGDD].[VW_LOCALIDADES_OK]
AS 
select codLocalidad as id, descripcion from TPGDD.Localidades

GO


/****** Object:  View [TPGDD].[VW_MEDIOS_PAGO_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------

CREATE VIEW [TPGDD].[VW_MEDIOS_PAGO_OK]
AS 
SELECT idFormaPago as id, descripcion  as nombre from TPGDD.FormasPago


GO


/****** Object:  View [TPGDD].[VW_RESUMEN_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------
CREATE VIEW [TPGDD].[VW_RESUMEN_OK]
AS 
SELECT ([TPGDD].[FX_RESUMEN_OK] (1, idCliente, tipoPublicacion )) AS ESTRELLAS1 ,
([TPGDD].[FX_RESUMEN_OK] (2, idCliente, tipoPublicacion )) AS ESTRELLAS2 ,
([TPGDD].[FX_RESUMEN_OK] (3, idCliente, tipoPublicacion )) AS ESTRELLAS3 ,
([TPGDD].[FX_RESUMEN_OK] (4, idCliente, tipoPublicacion )) AS ESTRELLAS4 ,
([TPGDD].[FX_RESUMEN_OK] (5, idCliente, tipoPublicacion )) AS ESTRELLAS5 ,
tipoPublicacion , idCliente , [TPGDD].[FX_COMPRAS_OK](idCliente,calificada , tipoPublicacion )  AS COMPRA
FROM  TPGDD.Compras
GO


/****** Object:  View [TPGDD].[VW_ROLES_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------
CREATE VIEW [TPGDD].[VW_ROLES_OK]
AS 
select R.idRol, R.nombre as rol, habilitado, F.idFuncionalidad, F.nombre  as funcionalidad 
from TPGDD.Roles R 
left join TPGDD.RolesFuncionalidades RF on R.idRol =RF.idRol   
left join TPGDD.Funcionalidades F on RF.idFuncionalidad =F.idFuncionalidad 
GO


/****** Object:  View [TPGDD].[VW_RUBROS_EMPRESAS_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------

CREATE VIEW [TPGDD].[VW_RUBROS_EMPRESAS_OK]
AS 
select DISTINCT nombreRubro as descripcion from TPGDD.Empresas 

GO


/****** Object:  View [TPGDD].[VW_RUBROS_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------
CREATE VIEW [TPGDD].[VW_RUBROS_OK]
AS 
SELECT codRubro AS id, descripcionCorta as nombre  FROM TPGDD.Rubros

GO


/****** Object:  View [TPGDD].[VW_VISIBILIDADES_OK]    Script Date: 03/07/2016 4:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------------------

CREATE VIEW [TPGDD].[VW_VISIBILIDADES_OK]
AS 
SELECT codigo as id, descripcion, precio, porcentaje as costoVenta, envio as costoEnvio, prioridad, admiteEnvio  
from TPGDD.Visibilidades 

GO


--****************************************************************************************************************
--***FIN SCRIPT tiempo de carga en pruebas: Entre 1 minuto y medio y dos minutos, seg�n las caracter�stias de la PC
--****************************************************************************************************************






