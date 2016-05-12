using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Configuration;

namespace MercadoEnvioDesktop
{
    public class dbmanager
    {
        private SqlConnection con;
        private SqlDataReader recordset;//Almacena el resultado de una query select, rows...
   
        public dbmanager() // Conectar
        {
            try
            {
                string connectionString = ConfigurationManager.AppSettings["StringConexion"].ToString();
                this.con = new SqlConnection(connectionString);
                this.con.Open();
            }
            catch
            {
                MessageBox.Show("Error al conectar con la base de datos.");
                Environment.Exit(0);
            }
        }

        public void Desconectar()
        {
            this.con.Close();
        }

        public int Ejecutar(String query)
        {
            SqlCommand comando = this.con.CreateCommand();
            comando.CommandText = query;

            try
            {
                return comando.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                MessageBox.Show("Error al enviar consulta a la base de datos: " + e.Message);
                return 0;
            }
        }

        public Boolean Consultar(String query)
        {
            SqlCommand comando = this.con.CreateCommand();
            comando.CommandText = query;
            try
            {
                this.recordset = comando.ExecuteReader();
                return this.recordset.HasRows;
            }
            catch (Exception e)
            {
                MessageBox.Show("Error al enviar consulta a la base de datos: " + e.Message);
                return false;
            }
        }

        public String ObtenerValor(String campo)
        {
            int col = this.recordset.GetOrdinal(campo);
            return this.recordset.GetSqlValue(col).ToString();
        }

        public Boolean Leer()
        {
            if (!this.recordset.HasRows)
                return false;

            try
            {
                return this.recordset.Read();//avanza el ptr al proximo registro
            }
            catch (Exception e)
            {
                MessageBox.Show("Error al leer un registro de la base de datos: " + e.Message);
                return false;
            }
        }

        public String StringConexion()
        {
            return ConfigurationManager.AppSettings["StringConexion"].ToString();
        }
    }
}
