use GD1C2016
go

exec GD1C2016.dbo.printTablaCociente
go

exec GD1C2016.dbo.dividir @dividendo = 100, @divisor = 1

create table dbo.cociente(
	resultado real
)
go

use GD1C2016
go

create procedure printTablaCociente as
begin
	DECLARE @cociente real

	DECLARE cur CURSOR FOR
	SELECT resultado FROM dbo.cociente

	OPEN cur

	FETCH NEXT FROM cur INTO @cociente;
	WHILE @@FETCH_STATUS = 0
	BEGIN   
	PRINT @cociente
	FETCH NEXT FROM cur INTO @cociente;
	END

	CLOSE cur;
	DEALLOCATE cur;
end
go

alter procedure dbo.dividir(@dividendo real, @divisor real) as
begin
	
	begin try
	print 'tabla antes de la transaccion'
	exec dbo.printTablaCociente

	begin tran
		insert into dbo.cociente values (1)
		insert into dbo.cociente values (@dividendo / @divisor)	
	commit tran
	end try
	
	begin catch
		print 'Tabla antes del rollback'
		exec dbo.printTablaCociente
		rollback tran
		print 'Tabla despues del rollback'
		exec dbo.printTablaCociente
	end catch
	print 'tabla despues de la transaccion'
	exec dbo.printTablaCociente

end
go

alter procedure dbo.holaMundoSPConcat( @string nvarchar(255))
as
begin
	print 'Hola mundo sp ' + @string
end

go
exec dbo.holaMundoSPConcat @string = 'Danielazo sos un novato!!!'


