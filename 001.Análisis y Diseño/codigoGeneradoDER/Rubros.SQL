IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Rubros') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Rubros
;

CREATE TABLE Rubros ( 
	codRubro int identity(1,1)  NOT NULL,
	descripcionCorta nvarchar(255),
	descripcionLarga nvarchar(255)
)
;

ALTER TABLE Rubros
	ADD CONSTRAINT UQ_Rubros_codRubro UNIQUE (codRubro)
;

ALTER TABLE Rubros ADD CONSTRAINT PK_Rubros 
	PRIMARY KEY CLUSTERED (codRubro)
;




