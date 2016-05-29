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
        public static String SELECT_USER_BY_USERNAME = "SELECT U.username, U.habilitado, U.intentosFallidos, U.password FROM Usuario U WHERE U.username = @username";
        public static String UPDATE_USER_INTENTOS_FALLIDOS = "UPDATE Usuario set intentosFallidos = @intentosFallidos WHERE username = @username";
        public static String UPDATE_USER_INHABILITADO = "UPDATE Usuario set intentosFallidos = @intentosFallidos, habilitado = 0  WHERE username = @username";
        public static String UPDATE_USER_LIMPIAR_INTENTOS = "UPDATE Usuario set intentosFallidos = 0 where username = @username";
        private static SqlConnection conexion;
        private static SqlDataReader dataReader;

        internal static Usuario getUserbyUsername(string username)
        {
            Usuario user = null;
            
            conexion = ConexionBD.iniciarConexion();

            dataReader = ejecutarConsulta( SELECT_USER_BY_USERNAME, new SqlParameter("@username", username), conexion);
            
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
            return new Usuario((String)dataReader["username"], (Boolean)dataReader["habilitado"], (int)dataReader["intentosFallidos"], (String)dataReader["password"]);
            
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

        internal static void updatePorPasswordErroneo(Usuario user)
        {
            conexion = ConexionBD.iniciarConexion();

            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@intentosFallidos", user.intentosFallidos));
            parametros.Add(new SqlParameter("@username", user.username));
                         
            if (user.deshabilitado())
            {
                ejecutarTransaccion(UPDATE_USER_INHABILITADO, parametros , conexion);
                
            }
            else {
                ejecutarTransaccion(UPDATE_USER_INTENTOS_FALLIDOS, parametros, conexion);
            }

            ConexionBD.terminarConexion(conexion);            

        }

        private static void ejecutarTransaccion(string transaction, List<SqlParameter> parametros, SqlConnection conexion)
        {
            SqlCommand cmd = new SqlCommand(transaction, conexion);
            cmd.Parameters.AddRange(parametros.ToArray());
            cmd.ExecuteNonQuery();
        }

        private static void ejecutarTransaccion(string transaction, SqlParameter parametro, SqlConnection conexion)
        {
            SqlCommand cmd = new SqlCommand(transaction, conexion);
            cmd.Parameters.Add(parametro);
            cmd.ExecuteNonQuery();
        }

        internal static void updateLimpiarIntentosFallidos(Usuario user)
        {

            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@username", user.username));

            conexion = ConexionBD.iniciarConexion();
            ejecutarTransaccion(UPDATE_USER_LIMPIAR_INTENTOS, parametros, conexion);
            ConexionBD.terminarConexion(conexion);
        }
    }
}
