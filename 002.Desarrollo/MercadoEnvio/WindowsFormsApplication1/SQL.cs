using System.Data;
using System.Data.SqlClient;

namespace MercadoEnvioDesktop
{
    static class SQL
    {
        static public DataTable SQLQuery(string query)
        {
            SqlConnection conexion = new SqlConnection(Properties.Resources.conexion);
            SqlDataAdapter comando = new SqlDataAdapter(query, conexion);
            DataTable dta = new DataTable();
            comando.Fill(dta);
            conexion.Close();
            return dta;
        }
    }
}
