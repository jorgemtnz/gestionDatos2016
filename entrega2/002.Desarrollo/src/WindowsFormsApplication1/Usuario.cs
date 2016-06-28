using System;

namespace MercadoEnvioDesktop
{
    public class Usuario
    {
        public int id { get; set; }
        public String tipo { get; set; }//me dice si es admin, empresa o ciente 
        public String username { get; set; }
        public String rol { get; set; }
        public int idRol { get; set; }

        public Usuario(string[] array,string user,string rol)
        {
            id = Convert.ToInt32(array[0]);
            tipo = array[1];
            username = user;
            idRol = Convert.ToInt32(array[5]) - 1;
            this.rol = rol;
        }

         public Usuario(String tipo, String username, int idRol, String rol)
        {
            this.tipo = tipo;
            this.username = username;
            this.idRol = idRol;
            this.rol = rol;
        }

    }
}
