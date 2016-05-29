/*----------------------------------------------------------------------------------------------------------*/
/*  GDD2016: NORMALIZACION Y MIGRACION DE TABLA MAESTRA														*/
/*  GRUPO: DCC																								*/
/*  INTEGRANTES:																							*/
/*		# CHUNGARA DANIEL		LEG:XXX.XXX-X       														*/
/*		# CONFEGGI LEONEL		LEG:124.193-0            													*/
/*		# MARTINEZ JORGE		LEG:140.831-8            													*/
/*		# UVIÑA GUADALUPE		LEG:143.470-6             													*/
/*----------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------------------*/
/* ETAPA #0: SETEOS GLOBALES.																				*/
/*----------------------------------------------------------------------------------------------------------*/
/* BASE DE DATOS */
USE GD1C2016
GO

/* ESQUEMA */
CREATE SCHEMA GRUPO AUTHORIZATION gd 
GO

/* PROPIEDADES GLOBALES */
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*----------------------------------------------------------------------------------------------------------*/
/* ETAPA #1: CREACION DE TABLAS Y VISTAS.																	*/
/*----------------------------------------------------------------------------------------------------------*/
begin
	CREATE TABLE [dbo].[Rubros](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](255) NOT NULL)		
end
Go

/*----------------------------------------------------------------------------------------------------------*/
/* ETAPA #2: CREACION DE CLAVES PRIMARIAS Y FORANEAS.														*/
/*----------------------------------------------------------------------------------------------------------*/
begin
	ALTER TABLE [dbo].[Rubros]
	ADD CONSTRAINT [PK_Rubros] PRIMARY KEY CLUSTERED (Id) 
end
GO

/*----------------------------------------------------------------------------------------------------------*/
/* ETAPA #3: CREACION DE CONTRAINTS Y TRIGERS.																*/
/*----------------------------------------------------------------------------------------------------------*/
begin
	ALTER TABLE [dbo].[Rubros]
	ADD CONSTRAINT [UQ_Rubros] UNIQUE NONCLUSTERED 
		(
		[Descripcion] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
end
GO

/*----------------------------------------------------------------------------------------------------------*/
/* ETAPA #4: CREACION DE INDICES SECUNDARIOS.																*/
/*----------------------------------------------------------------------------------------------------------*/
begin
end

/*----------------------------------------------------------------------------------------------------------*/
/* ETAPA #5: MIGRACION DE DATOS.																*/
/*----------------------------------------------------------------------------------------------------------*/
begin
	INSERT INTO [dbo].[Rubros] (Descripcion) 
		SELECT [Publicacion_Rubro_Descripcion] as Descripcion
		FROM [gd_esquema].[Maestra]
		group by [Publicacion_Rubro_Descripcion] 
end
GO


/****************************************************** AUTOGENERADO: SEPARAR EN ETAPAS ******************************************************/

/* TABLA ROL */
CREATE TABLE [GRUPO].ROL (
	[Rol_Id] numeric(5,0) NOT NULL IDENTITY(1,1),
	[Rol_Nombre] [varchar](255) NOT NULL,
	[Rol_Estado] char NOT NULL,
	PRIMARY KEY(
		[Rol_Id]
	)
)

/* TABLA FUNCIONALIDAD */
CREATE TABLE [GRUPO].FUNCIONALIDAD (
	[Funcionalidad_Id] numeric(5,0) NOT NULL IDENTITY(1,1),
	[Funcionalidad_Nombre] [varchar](255) NOT NULL,
    PRIMARY KEY(
		[Funcionalidad_Id]
	)
)

/* TABLA ROL_FUNCIONALIDAD */
CREATE TABLE [GRUPO].ROL_FUNCIONALIDAD (
	[Rol_Id] numeric(5,0) NOT NULL FOREIGN KEY REFERENCES GRUPO.ROL(Rol_Id),
	[Funcionalidad_Id] numeric(5,0) NOT NULL FOREIGN KEY REFERENCES GRUPO.FUNCIONALIDAD(Funcionalidad_Id),
	PRIMARY KEY(
		[Rol_Id],
		[Funcionalidad_Id]
	)
)

/* TABLA USUARIO */
CREATE TABLE [GRUPO].USUARIO (
	[Username] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Usu_Fec_Creacion] datetime NOT NULL,
    [Usu_Intentos_Fallidos] numeric(5,0) NULL DEFAULT 0,
	[Usu_Habilitado] char NOT NULL,
	[Usu_Cant_Pulibaciones] int,
    PRIMARY KEY(
		[Username]
	)
)