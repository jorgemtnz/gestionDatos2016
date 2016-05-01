/*Orden de creación

	1- Tablas y vistas
	2- Claves primarias y foráneas para relación
	3- Contraints y trigers
	4- Indices
	5- Migración de datos
*/

USE GD1C2016 -- Indica la base de datos a utilizar
GO

/* CREACIÓN DEL ESQUEMA */
CREATE SCHEMA GRUPO AUTHORIZATION gd 
GO

/****************************************************** CREACIÓN DE TABLAS ******************************************************/

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

/****** Object:  Table [dbo].[Rubros]    Script Date: 24/04/2016 13:59:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

begin /* 1- Tablas y vistas */
	CREATE TABLE [dbo].[Rubros](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](255) NOT NULL)		
end
Go

begin /* 2- Claves primarias y foráneas para relación */
	ALTER TABLE [dbo].[Rubros]
	ADD CONSTRAINT [PK_Rubros] PRIMARY KEY CLUSTERED (Id) 
end
GO

begin /* 3- Contraints y trigers */
	ALTER TABLE [dbo].[Rubros]
	ADD CONSTRAINT [UQ_Rubros] UNIQUE NONCLUSTERED 
		(
		[Descripcion] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
end
GO

begin /* 4- Indices */
end

begin /* 5- Migración de datos */
	INSERT INTO [dbo].[Rubros] (Descripcion) 
		SELECT [Publicacion_Rubro_Descripcion] as Descripcion
		FROM [gd_esquema].[Maestra]
		group by [Publicacion_Rubro_Descripcion] 
end
GO


	
	