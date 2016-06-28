using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace MercadoEnvioDesktop
{
    class ExceptionManager //mejorar todo esto
    {
        public static void manejarExcepcion(Exception ex)//agregar aca los casos de excepciones comunes
        {
            Console.WriteLine("* " + ex.Message);
            MessageBox.Show(ex.Message);
        }
        public static void manejadorExcepcionesSQL(SqlException ex)
        {
            foreach (SqlError error in ex.Errors) //3621
            {
                Console.WriteLine("* " + error.Number);
             //   MessageBox.Show("* " + error.Number + " //// "+ ex.Message);
                switch (error.Number)
                {
                    case 102:
                        MessageBox.Show("Error de sintaxis en la consulta");
                        break;
                    case 137:
                        MessageBox.Show("Variable no declarada");
                        break;
                    case 156:
                        MessageBox.Show("Error de sintaxis en la consulta");
                        break;
                    case 207://esta no es para el usuario
                        MessageBox.Show("El valor del nombre de la columna no es valido");
                        break;
                    case 208://esta no es para el usuario
                        MessageBox.Show("El nombre de la tabla o columna no es valido");
                        break;
                    case 245://esta no es para el usuario
                        MessageBox.Show("Error de conversion de tipos de datos.");
                        break;
                    case 515:
                        MessageBox.Show("No se permiten valores nulos para este campo.");
                        break;
                    case 547://esta no es para el usuario
                        MessageBox.Show("Error de Foreign key.");
                        break;
                    case 8152:
                        MessageBox.Show("La longitud del dato ingresado excede el rango del campo especificado y se truncaria.");
                        break;
                    case 2627:
                        MessageBox.Show("Ya existe un registro con el valor especificado.");
                        break;
                    case 8114:
                        MessageBox.Show("Error de convercion de tipos.");
                        break;
                    case 18487:
                        MessageBox.Show("La contraseña de inicio de sesion expiró");
                        break;
                    default:
                        //throw new Exception(ex.Message, ex);
                        MessageBox.Show(ex.Message);
                        break;
                }
            }
        }
    }
}
