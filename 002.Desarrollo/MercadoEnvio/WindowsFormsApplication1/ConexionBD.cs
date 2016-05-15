using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace MercadoEnvioDesktop
{
    class ConexionBD
    {
        internal static System.Data.SqlClient.SqlConnection iniciarConexion()
        {
             SqlConnection conexion = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
             conexion.Open();
             return conexion;
        }

        internal static void terminarConexion(System.Data.SqlClient.SqlConnection conexion)
        {
            conexion.Close();
        }
    }
}
