IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Localidades') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Localidades
;

CREATE TABLE Localidades ( 
	codLocalidad int identity(1,1)  NOT NULL,
	descripcion nvarchar(255)
)
;

ALTER TABLE Localidades ADD CONSTRAINT PK_Localidades 
	PRIMARY KEY CLUSTERED (codLocalidad)
;



