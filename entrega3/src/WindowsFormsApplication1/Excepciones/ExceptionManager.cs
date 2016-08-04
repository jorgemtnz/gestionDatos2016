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
            MessageBox.Show(ex.Message, "Excepcion", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }
        public static void manejadorExcepcionesSQL(SqlException ex)
        {
            foreach (SqlError error in ex.Errors) //3621
            {
                Console.WriteLine("* " + error.Number);
                switch (error.Number)
                {
                    case 102:
                        MessageBox.Show("Error de sintaxis en la consulta", "Excepcion", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        break;
                    case 137:
                        MessageBox.Show("Variable no declarada", "Excepcion", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        break;
                    case 156:
                        MessageBox.Show("Error de sintaxis en la consulta", "Excepcion", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        break;
                    case 207://esta no es para el usuario
                        MessageBox.Show("El valor del nombre de la columna no es valido", "Excepcion", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        break;
                    case 208://esta no es para el usuario
                        MessageBox.Show("El nombre de la tabla o columna no es valido", "Excepcion", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        break;
                    case 245://esta no es para el usuario
                        MessageBox.Show("Error de conversion de tipos de datos.", "Excepcion", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        break;
                    case 515:
                        MessageBox.Show("No se permiten valores nulos para este campo.", "Excepcion", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        
                        break;
                    case 547://esta no es para el usuario
                        MessageBox.Show("Error de Foreign key.", "Excepcion", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        break;
                    case 8152:
                        MessageBox.Show("La longitud del dato ingresado excede el rango del campo especificado y se truncaria.", "Excepcion", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        break;
                    case 2627:
                        MessageBox.Show("Ya existe un registro con el valor especificado.", "Excepcion", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        break;
                    case 8114:
                        MessageBox.Show("Error de convercion de tipos.", "Excepcion", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        break;
                    case 18487:
                        MessageBox.Show("La contraseña de inicio de sesion expiró", "Excepcion", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        break;
                    default:
                        //throw new Exception(ex.Message, ex);
                        MessageBox.Show(ex.Message, "Excepcion", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        break;
                }
            }
        }
    }
}
