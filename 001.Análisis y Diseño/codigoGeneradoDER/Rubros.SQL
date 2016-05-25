IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('Rubros') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE Rubros
;

CREATE TABLE Rubros ( 
	codRubro int identity(1,1)  NOT NULL,
	descripcionCorta nvarchar(255) NULL,
	descripcionLarga nvarchar(255) NULL
)
;

ALTER TABLE Rubros
	ADD CONSTRAINT UQ_Rubros_codRubro UNIQUE (codRubro)
;

CREATE INDEX IDX_Rubros
ON Rubros (codRubro ASC)
;

ALTER TABLE Rubros ADD CONSTRAINT PK_Rubros 
	PRIMARY KEY CLUSTERED (codRubro)
;




