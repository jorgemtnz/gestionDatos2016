using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MercadoEnvioDesktop
{
    class Usuario
    {

        public string password { get; set; }
        public String username { get; set; }
        public Boolean habilitado { get; set; }
        public int intentosFallidos { get; set; }
        public static int MAX_INTENTOS = 3;

        public Usuario(String username)
        {
            // TODO: Complete member initialization
            this.username   = username;
        }

        public Usuario(string username, bool habilitado):this(username)
        {
            // TODO: Complete member initialization
             this.habilitado = habilitado;
        }

        public Usuario(string username, bool habilitado, int intentosFallidos, string password):this(username, habilitado)
        {
            // TODO: Complete member initialization
            this.intentosFallidos = intentosFallidos;
            this.password = password;
        }


        internal bool isValidPassword(string password)
        {
            return this.password == password;
        }



        internal void penalizarPorIntentoFallido()
        {
            this.intentosFallidos++;
            if (intentosFallidos >= MAX_INTENTOS) {
                this.habilitado = false;
            }
        }



        internal bool deshabilitado()
        {
            return habilitado == false;
        }

        public int intentosRestantes()
        {
            return MAX_INTENTOS - this.intentosFallidos;
        }
    }
}
