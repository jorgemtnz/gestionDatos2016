Dentro de este directorio se encuentra la solución entera de Visual Studio del proyecto “”.
Evitar enviar archivos de SVN, CVS u otros. No enviar archivos ejecutables ni DLLs. Limpiar
la solución desde Visual Studio (Proyecto => Limpiar Solución) antes de enviarla.
Además dentro del source deberá existir un archivo de configuración en donde se
encuentren los parámetros de conexión a la base de datos que de ser UNICA para todo el TP, (si
existiese más de un punto de conexión a la base de datos el TP no será corregido), la fecha que
tomará el sistema para funcionar (se utiliza este criterio para simplificar al alumno el uso de
fechas y así evitar el cambio de fechas del sistema operativo).
Sin ese archivo de configuración la entrega no será tomada como válida.


++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Archivo de configuración.
El archivo de configuración (config.txt) se encuentra dentro del directorio /src, el path completo es /src/config.txt Debe contener una cadena de 8 caracteres (de la forma DDMMAAAA) que representan la fecha que la aplicación asignará a la base de datos durante la ejecución como fecha actual. DD son dos dígitos que corresponden al número de día, MM al mes y AAAA al año. La aplicación ya viene con el archivo creado y con una fecha por defecto dentro del mismo. Es necesaria la presencia y formato correcto del mismo en la carpeta /src para el correcto funcionamiento de la aplicación.