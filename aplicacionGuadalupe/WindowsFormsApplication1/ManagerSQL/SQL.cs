using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Configuration;

namespace MercadoEnvioDesktop
{
    public class SQL
    {
        private static string cadenaConexion = ConfigurationManager.AppSettings["ConnectionString"];

        #region eventos
        static void connection_InfoMessage(object sender, SqlInfoMessageEventArgs e)
        {
            var outputFromStoredProcedure = e.Message;
            MessageBox.Show(e.Message, "Informacion", MessageBoxButtons.OK,MessageBoxIcon.Information );
        }
        #endregion

        #region metodos
        static public int ejecutar_SP(string sp)
        {
            SqlConnection conexion;
            SqlCommand com;
            Console.WriteLine(sp);
            try
            {
                conexion = new SqlConnection(cadenaConexion);
                com = new SqlCommand(sp, conexion);
                conexion.Open();
                conexion.InfoMessage += connection_InfoMessage;
                com.ExecuteScalar();
                conexion.Close();
                return 0;
            }
            catch (SqlException ex)
            {
                ExceptionManager.manejadorExcepcionesSQL(ex);

            }
            catch (Exception ex)
            {
                ExceptionManager.manejarExcepcion(ex);
            }
            return -1;
        }

        internal static void buscarRegistro(string consulta)
        {
            SqlConnection conexion = new SqlConnection(cadenaConexion);

            try
            {
                conexion.Open();

                SqlDataReader myReader = null;
                SqlCommand myCommand = new SqlCommand(consulta, conexion);
                Console.WriteLine(consulta);
                myReader = myCommand.ExecuteReader();

                while (myReader.Read())
                {
                    Console.WriteLine(myReader[0].ToString() + "\t" + myReader[1].ToString() + "\t" + myReader[2].ToString());
                }

                Console.WriteLine("  ...OK. Operacion exitosa!");
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }

        }
        internal static string[] buscarRegistro(string consultaSQL, string[] columnas)
        {
            string[] campos = new string[columnas.Length];
            SqlConnection conexion;
            SqlCommand com;
            SqlDataReader Dr;
            Console.WriteLine(consultaSQL);
            int i = 0;
            conexion = new SqlConnection(cadenaConexion);
            com = new SqlCommand(consultaSQL, conexion);
            conexion.Open();
            Dr = com.ExecuteReader();
            try
            {
                Dr.Read();
                foreach (string unaColumna in columnas)
                {
                    campos[i++] = Dr[unaColumna].ToString();
                }
            }
            catch (SqlException ex)
            {
                ExceptionManager.manejadorExcepcionesSQL(ex);
            }
            catch
            {
                campos[0]="vacio";
            }
            conexion.Close();
            Dr.Close();
            return campos;
        }

        internal static DataTable cargarDataTable(string consultaSQL)
        {
            DataTable Tabla = new DataTable();
            SqlConnection conexion = new SqlConnection(cadenaConexion);
            SqlCommand com = new SqlCommand(consultaSQL,conexion);
            SqlDataReader dataReader;
            Console.WriteLine(consultaSQL);
            try
            {
                conexion.Open();
                dataReader = com.ExecuteReader();
                Tabla.Load(dataReader);
                dataReader.Close();
                conexion.Close();
                return (Tabla);
            }
            catch (SqlException ex)
            {
                ExceptionManager.manejadorExcepcionesSQL(ex);

            }
            catch (Exception ex)
            {
                ExceptionManager.manejarExcepcion(ex);
            }
            return null;
        }

        #endregion
    }
}

