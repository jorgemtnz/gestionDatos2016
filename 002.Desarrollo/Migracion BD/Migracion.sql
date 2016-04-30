/*Orden de creación

	1- Tablas y vistas
	2- Claves primarias y foráneas para relación
	3- Contraints y trigers
	4- Indices
	5- Migración de datos
*/

USE [GD1C2016]
GO

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


	
	