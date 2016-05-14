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

CREATE TABLE Visibilidades ( 
	idVisibilidad int identity(1,1)  NOT NULL,
	pVCod numeric(18),
	pVDesc nvarchar(255),
	pVPrecio numeric(18,2),
	pVPorcentaje numeric(18,2),
	idComision int
)
;


CREATE TABLE Preguntas ( 
	idPregunta int identity(1,1)  NOT NULL,
	idPublicacion int,
	preguntaRealizada nvarchar(255)
)
;

CREATE TABLE Estados ( 
	idEstado int identity(1,1)  NOT NULL,
	descripcion nvarchar(255)
)
;

CREATE TABLE Rubros ( 
	codRubro int identity(1,1)  NOT NULL,
	descripcionCorta nvarchar(255),
	descripcionLarga nvarchar(255)
)
;


CREATE TABLE Funcionalidades ( 
	idFuncionalidad int identity(1,1)  NOT NULL,
	nombre nvarchar(255),
	descripcion nvarchar(255)
)
;


CREATE TABLE Localidades ( 
	codLocalidad int identity(1,1)  NOT NULL,
	descripcion nvarchar(255)
)
;

CREATE TABLE Comisiones ( 
	idComision int identity(1,1)  NOT NULL,
	cTipoPublicacion numeric(10,2),
	cProductoVendido numeric(10,2),
	cEnvioProducto numeric(10,2)
)
;

CREATE TABLE FormasPago ( 
	idFormaPago int identity(1,1)  NOT NULL,
	descripcion nvarchar(255)
)
;

CREATE TABLE Items ( 
	idItem int identity(1,1)  NOT NULL,
	nombre nvarchar(255),
	cantidad numeric(18),
	montoItem numeric(18,2)
)
;

CREATE TABLE Facturaciones ( 
	nroFactura numeric(18) identity(1,1)  NOT NULL,
	idComision int,
	idItem int,
	idFormaPago int,
	idUsuario6 int,
	fecha date,
	monto numeric(10,2),
	maestroDetalle nvarchar(255),
	total numeric(18,2)
)
;

CREATE TABLE Publicaciones ( 
	pCodigo numeric(18) identity(1,1)  NOT NULL,
	pVisibilidad int,
	codRubro int NOT NULL,
	idFacturacion numeric(18),
	idEstado int,
	idUsuario int,
	idPregunta int,
	pDescripcion nvarchar(255),
	pStock numeric(18),
	pFecha datetime,
	pFecha_Venc datetime,
	pPrecio numeric(18,2),
	pTipo nvarchar(255),
	pEstado nvarchar(255),
	pRubro_Descripcion nvarchar(255),
	pCosto bigint,
	pIdUsuario int,
	pPreguntar bit,
	idEmpresa int,
	idCliente int,
	gratuita bit
)
;

CREATE TABLE Calificaciones ( 
	codigoCalificacion numeric(18) identity(1,1)  NOT NULL,
	calificador int,
	userVta nvarchar(255),
	cantEstrellas numeric(18),
	observacion nvarchar(255)
)
;

CREATE TABLE PublicacionClasificaciones ( 
	idPublicacion int NOT NULL,
	idClasificaciones int NOT NULL
)
;

CREATE TABLE Compras ( 
	idCompra int identity(1,1)  NOT NULL,
	idPublicacion int,
	idClientes int,
	fecha datetime,
	cantidad numeric(18)
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
	idHistorial int,
	tipoCliente nvarchar(255),
	beneficio1eraPublicacion bit
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
	rubro nvarchar(255),
	beneficio1eraPublicacion bit
)
;

CREATE TABLE Ofertas ( 
	idOferta int identity(1,1)  NOT NULL,
	idPublicacion numeric(18) NOT NULL,
	idUsuario int NOT NULL,
	fecha datetime,
	monto numeric(18,2)
)
;

CREATE TABLE Usuarios ( 
	idUsuario int identity(1,1)  NOT NULL,
	codLocalidad int,
	password nvarchar(255),
	username nvarchar(255),
	flagHabilitado bit,
	tipoUsuario nvarchar(255),
	mail nvarchar(255),
	telefono nvarchar(255),
	codigoPostal nvarchar(50),
	nroPiso numeric(18),
	nroDpto nvarchar(50),
	fechaCreacion datetime,
	nroCalle numeric(18),
	domCalle nvarchar(255)
)
;

CREATE TABLE UsuariosRoles ( 
	idUsuario int NOT NULL,
	idRol int NOT NULL
)
;

CREATE TABLE Roles ( 
	idRol int identity(1,1)  NOT NULL,
	nombre nvarchar(255),
	habilitado bit,
	idUsuarioRol int
)
;

CREATE TABLE RolesFuncionalidades ( 
	idRol int NOT NULL,
	idFuncionalidad int NOT NULL
)
;

CREATE TABLE Funcionalidades ( 
	idFuncionalidad int identity(1,1)  NOT NULL,
	nombre nvarchar(255),
	descripcion nvarchar(255)
)
;

ALTER TABLE Funcionalidades
	ADD CONSTRAINT UQ_Funcionalidades_idFuncionalidad UNIQUE (idFuncionalidad)
;

CREATE INDEX IDX_indice_funcionalidades
ON Funcionalidades (idFuncionalidad ASC)
;

ALTER TABLE Funcionalidades ADD CONSTRAINT PK_Funcionalidades 
	PRIMARY KEY CLUSTERED (idFuncionalidad)
;

ALTER TABLE RolesFuncionalidades ADD CONSTRAINT PK_RolesFuncionalidades 
	PRIMARY KEY CLUSTERED (idRol, idFuncionalidad)
;

ALTER TABLE RolesFuncionalidades ADD CONSTRAINT FK_RolesFuncionalidades_Funcionalidades 
	FOREIGN KEY (idFuncionalidad) REFERENCES Funcionalidades (idFuncionalidad)
;

ALTER TABLE RolesFuncionalidades ADD CONSTRAINT FK_RolesFuncionalidades_Roles 
	FOREIGN KEY (idRol) REFERENCES Roles (idRol)
;

ALTER TABLE Roles
	ADD CONSTRAINT UQ_Roles_idRol UNIQUE (idRol)
;

CREATE INDEX IDX_indice_roles
ON Roles (idRol ASC)
;

ALTER TABLE Roles ADD CONSTRAINT PK_Roles 
	PRIMARY KEY CLUSTERED (idRol)
;

ALTER TABLE UsuariosRoles ADD CONSTRAINT PK_UsuariosRoles 
	PRIMARY KEY CLUSTERED (idUsuario, idRol)
;

ALTER TABLE UsuariosRoles ADD CONSTRAINT FK_UsuariosRoles_Roles 
	FOREIGN KEY (idRol) REFERENCES Roles (idRol)
;

ALTER TABLE UsuariosRoles ADD CONSTRAINT FK_UsuariosRoles_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
;

ALTER TABLE Usuarios
	ADD CONSTRAINT UQ_Usuarios_idUsuario UNIQUE (idUsuario)
;

CREATE INDEX IDX_indice_Usuarios
ON Usuarios (idUsuario ASC)
;

ALTER TABLE Usuarios ADD CONSTRAINT PK_Usuarios 
	PRIMARY KEY CLUSTERED (idUsuario)
;

ALTER TABLE Usuarios ADD CONSTRAINT FK_Usuarios_Localidades 
	FOREIGN KEY (codLocalidad) REFERENCES Localidades (codLocalidad)
;


ALTER TABLE Ofertas
	ADD CONSTRAINT UQ_Oferta_idOferta UNIQUE (idOferta)
;

ALTER TABLE Ofertas
	ADD CONSTRAINT UQ_Ofertas_idPublicacion UNIQUE (idPublicacion)
;

CREATE INDEX IDX_indice_oferta
ON Ofertas (idOferta ASC)
;

ALTER TABLE Ofertas ADD CONSTRAINT PK_Oferta 
	PRIMARY KEY CLUSTERED (idOferta)
;

ALTER TABLE Ofertas ADD CONSTRAINT FK_Oferta_Publicaciones 
	FOREIGN KEY (idPublicacion) REFERENCES Publicaciones (pCodigo)
;

ALTER TABLE Ofertas ADD CONSTRAINT FK_Oferta_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
;


ALTER TABLE Empresas
	ADD CONSTRAINT UQ_Empresas_idEmpresa UNIQUE (idEmpresa)
;

ALTER TABLE Empresas
	ADD CONSTRAINT UQ_Empresas_idUsuario UNIQUE (idUsuario)
;

CREATE INDEX IDX_indice_empresas
ON Empresas (idEmpresa ASC)
;

ALTER TABLE Empresas ADD CONSTRAINT PK_Empresas 
	PRIMARY KEY CLUSTERED (idEmpresa)
;

ALTER TABLE Empresas ADD CONSTRAINT FK_Empresas_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
;

ALTER TABLE Clientes
	ADD CONSTRAINT UQ_Clientes_idCliente UNIQUE (idCliente)
;

ALTER TABLE Clientes ADD CONSTRAINT PK_Clientes 
	PRIMARY KEY CLUSTERED (idCliente)
;

ALTER TABLE Clientes ADD CONSTRAINT FK_Clientes_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
;


ALTER TABLE Compras
	ADD CONSTRAINT UQ_Compra_idCompra UNIQUE (idCompra)
;

CREATE INDEX IDX_indice_compras
ON Compras (idCompra ASC)
;

ALTER TABLE Compras ADD CONSTRAINT PK_Compra 
	PRIMARY KEY CLUSTERED (idCompra)
;

ALTER TABLE Compras ADD CONSTRAINT FK_Compra_Clientes 
	FOREIGN KEY (idClientes) REFERENCES Clientes (idCliente)
;

ALTER TABLE Compras ADD CONSTRAINT FK_Compra_Publicaciones 
	FOREIGN KEY (idPublicacion) REFERENCES Publicaciones (pCodigo)
;

ALTER TABLE PublicacionClasificaciones
	ADD CONSTRAINT UQ_PublicacionClasificaciones_idClasificaciones UNIQUE (idClasificaciones)
;

ALTER TABLE PublicacionClasificaciones
	ADD CONSTRAINT UQ_PublicacionClasificaciones_idPublicacion UNIQUE (idPublicacion)
;

ALTER TABLE PublicacionClasificaciones ADD CONSTRAINT PK_PublicacionClasificaciones 
	PRIMARY KEY CLUSTERED (idPublicacion, idClasificaciones)
;

ALTER TABLE PublicacionClasificaciones ADD CONSTRAINT FK_PublicacionClasificaciones_Clasificaciones 
	FOREIGN KEY (idClasificaciones) REFERENCES Calificaciones (codigoCalificacion)
;

ALTER TABLE PublicacionClasificaciones ADD CONSTRAINT FK_PublicacionClasificaciones_Publicaciones 
	FOREIGN KEY (idPublicacion) REFERENCES Publicaciones (pCodigo)
;

ALTER TABLE Calificaciones
	ADD CONSTRAINT UQ_Calificaciones_codigoCalificacion UNIQUE (codigoCalificacion)
;

CREATE INDEX IDX_indice_calificacion
ON Calificaciones (codigoCalificacion ASC)
;

ALTER TABLE Calificaciones ADD CONSTRAINT PK_Clasificaciones 
	PRIMARY KEY CLUSTERED (codigoCalificacion)
;

ALTER TABLE Calificaciones ADD CONSTRAINT FK_Clasificaciones_Clientes 
	FOREIGN KEY (calificador) REFERENCES Clientes (idCliente)
;

ALTER TABLE Publicaciones
	ADD CONSTRAINT UQ_Publicaciones_pCodigo UNIQUE (pCodigo)
;

CREATE UNIQUE INDEX IDX_indice_publicaciones
ON Publicaciones (pCodigo ASC)
;

ALTER TABLE Publicaciones ADD CONSTRAINT PK_Publicaciones 
	PRIMARY KEY CLUSTERED (pCodigo)
;

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Estados 
	FOREIGN KEY (idEstado) REFERENCES Estados (idEstado)
;

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Facturaciones 
	FOREIGN KEY (idFacturacion) REFERENCES Facturaciones (nroFactura)
;

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Preguntas 
	FOREIGN KEY (idPregunta) REFERENCES Preguntas (idPregunta)
;

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Rubros 
	FOREIGN KEY (codRubro) REFERENCES Rubros (codRubro)
;

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Usuarios 
	FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
;

ALTER TABLE Publicaciones ADD CONSTRAINT FK_Publicaciones_Visibilidades 
	FOREIGN KEY (pVisibilidad) REFERENCES Visibilidades (idVisibilidad)
;

ALTER TABLE Facturaciones
	ADD CONSTRAINT UQ_Facturaciones_nroFactura UNIQUE (nroFactura)
;

ALTER TABLE Facturaciones ADD CONSTRAINT PK_Facturaciones 
	PRIMARY KEY CLUSTERED (nroFactura)
;

ALTER TABLE Facturaciones ADD CONSTRAINT FK_Facturaciones_Comisiones 
	FOREIGN KEY (idComision) REFERENCES Comisiones (idComision)
;

ALTER TABLE Facturaciones ADD CONSTRAINT FK_Facturaciones_FormasPago 
	FOREIGN KEY (idFormaPago) REFERENCES FormasPago (idFormaPago)
;

ALTER TABLE Facturaciones ADD CONSTRAINT FK_Facturaciones_Items 
	FOREIGN KEY (idItem) REFERENCES Items (idItem)
;

ALTER TABLE Facturaciones ADD CONSTRAINT FK_Facturaciones_Usuarios 
	FOREIGN KEY (idUsuario6) REFERENCES Usuarios (idUsuario)
;


ALTER TABLE Items
	ADD CONSTRAINT UQ_Items_idItem UNIQUE (idItem)
;

CREATE INDEX IDX_indice_items
ON Items (idItem ASC)
;

ALTER TABLE Items ADD CONSTRAINT PK_Items 
	PRIMARY KEY CLUSTERED (idItem)
;

ALTER TABLE FormasPago
	ADD CONSTRAINT UQ_FormasPago_idFormaPago UNIQUE (idFormaPago)
;

ALTER TABLE FormasPago ADD CONSTRAINT PK_FormasPago 
	PRIMARY KEY CLUSTERED (idFormaPago)
;


ALTER TABLE Comisiones
	ADD CONSTRAINT UQ_Comisiones_idComision UNIQUE (idComision)
;

CREATE INDEX IDX_indice_comision
ON Comisiones (idComision ASC)
;

ALTER TABLE Comisiones ADD CONSTRAINT PK_Comisiones 
	PRIMARY KEY CLUSTERED (idComision)
;

ALTER TABLE Localidades ADD CONSTRAINT PK_Localidades 
	PRIMARY KEY CLUSTERED (codLocalidad)
;

ALTER TABLE Funcionalidades
	ADD CONSTRAINT UQ_Funcionalidades_idFuncionalidad UNIQUE (idFuncionalidad)
;

CREATE INDEX IDX_indice_funcionalidades
ON Funcionalidades (idFuncionalidad ASC)
;

ALTER TABLE Funcionalidades ADD CONSTRAINT PK_Funcionalidades 
	PRIMARY KEY CLUSTERED (idFuncionalidad)
;

ALTER TABLE Rubros
	ADD CONSTRAINT UQ_Rubros_codRubro UNIQUE (codRubro)
;

ALTER TABLE Rubros ADD CONSTRAINT PK_Rubros 
	PRIMARY KEY CLUSTERED (codRubro)
;

ALTER TABLE Estados
	ADD CONSTRAINT UQ_Estados_idEstado UNIQUE (idEstado)
;

ALTER TABLE Estados ADD CONSTRAINT PK_Estados 
	PRIMARY KEY CLUSTERED (idEstado)
;

ALTER TABLE Preguntas
	ADD CONSTRAINT UQ_Preguntas_idPregunta UNIQUE (idPregunta)
;

ALTER TABLE Preguntas ADD CONSTRAINT PK_Preguntas 
	PRIMARY KEY CLUSTERED (idPregunta)
;

ALTER TABLE Visibilidades
	ADD CONSTRAINT UQ_Visibilidades_idVisibilidad UNIQUE (idVisibilidad)
;

CREATE INDEX IDX_indice_visibilidades
ON Visibilidades (idVisibilidad ASC)
;

ALTER TABLE Visibilidades ADD CONSTRAINT PK_Visibilidades 
	PRIMARY KEY CLUSTERED (idVisibilidad)
;


-------------------------------------------------------------

--ME ES DE UTILIDAD PARA ACTUALIZAR LOS DATOS DE UN CLIENTE EN LA BASE DE DATOS
--MODIFICADOS A TRAVÉS DEL APLICATIVO. 
CREATE PROCEDURE ACTUALIZAR_DATOS_CLI
@id_cli numeric(18,0),
@nombre varchar(50),
@apellido varchar(50),
@nro_ident numeric(18,0),
@id_tipo_ident numeric(18,0),
@id_pais numeric(18,0),
@mail varchar(100),
@calle varchar(50),
@nro_calle numeric(18,0),
@piso numeric(18,0),
@depto varchar(1),
@localidad varchar(50),
@nacionalidad varchar(50),
@fecha datetime
AS
BEGIN 
UPDATE CLIENTES 
SET NOMBRE = @nombre, APELLIDO= @apellido, NRO_IDENTIDAD=@nro_ident,ID_TIPO_IDENT=@id_tipo_ident,ID_PAIS=@id_pais,
MAIL=@mail, CALLE=@calle , NUMERO_CALLE= @nro_calle , PISO = @piso , DEPTO = @depto , LOCALIDAD = @localidad , NACIONALIDAD = @nacionalidad,
FECHA_NACIMIE = @fecha
WHERE ID_CLIENTE = @id_cli 
END
GO

