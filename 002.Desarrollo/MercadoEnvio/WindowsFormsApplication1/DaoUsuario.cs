    using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace MercadoEnvioDesktop
{
    class DaoUsuario
    {
        public static String SELECT_USER_BY_USERNAME = "SELECT U.username FROM Usuario U WHERE U.username = @username";
        private static Usuario user = null;    
        
        internal static Usuario getUserbyUsername(string username)
        {

            SqlConnection conexion = ConexionBD.iniciarConexion();

            SqlDataReader dataReader = ejecutarConsulta( SELECT_USER_BY_USERNAME, new SqlParameter("@username", username), conexion);
            
            if( tieneRegistros(dataReader)){
                user = crearUsuario(dataReader);
            }
            
            cerrarDataReader(dataReader);
           
            ConexionBD.terminarConexion(conexion);

            return user;
        }

        private static Usuario crearUsuario(SqlDataReader dataReader)
        {
            dataReader.Read();
            return new Usuario((String)dataReader["username"]);
            
        }

        private static void cerrarDataReader(SqlDataReader dataReader)
        {
                    dataReader.Close();
        }

        private static bool tieneRegistros(SqlDataReader dataReader)
        {
        return dataReader.HasRows;
        }

        private static SqlDataReader ejecutarConsulta(string consulta, SqlParameter parametro, SqlConnection conexion)
        {
            SqlCommand cmd = new SqlCommand(consulta , conexion);
            cmd.Parameters.Add(parametro);
            return cmd.ExecuteReader();
                
        }
    }
}
