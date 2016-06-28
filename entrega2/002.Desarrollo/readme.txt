Dentro de este directorio se encuentra la soluci�n entera de Visual Studio del proyecto ��.
Evitar enviar archivos de SVN, CVS u otros. No enviar archivos ejecutables ni DLLs. Limpiar
la soluci�n desde Visual Studio (Proyecto => Limpiar Soluci�n) antes de enviarla.
Adem�s dentro del source deber� existir un archivo de configuraci�n en donde se
encuentren los par�metros de conexi�n a la base de datos que de ser UNICA para todo el TP, (si
existiese m�s de un punto de conexi�n a la base de datos el TP no ser� corregido), la fecha que
tomar� el sistema para funcionar (se utiliza este criterio para simplificar al alumno el uso de
fechas y as� evitar el cambio de fechas del sistema operativo).
Sin ese archivo de configuraci�n la entrega no ser� tomada como v�lida.


++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Archivo de configuraci�n.
El archivo de configuraci�n (config.txt) se encuentra dentro del directorio /src, el path completo es /src/config.txt Debe contener una cadena de 8 caracteres (de la forma DDMMAAAA) que representan la fecha que la aplicaci�n asignar� a la base de datos durante la ejecuci�n como fecha actual. DD son dos d�gitos que corresponden al n�mero de d�a, MM al mes y AAAA al a�o. La aplicaci�n ya viene con el archivo creado y con una fecha por defecto dentro del mismo. Es necesaria la presencia y formato correcto del mismo en la carpeta /src para el correcto funcionamiento de la aplicaci�n.