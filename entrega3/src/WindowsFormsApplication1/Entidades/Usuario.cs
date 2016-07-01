using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaHotel.Entidades
{
    public class Usuario
    {
        private static readonly object lockObject = new object();
        private static Usuario instance = null;

        public int Id_usuario { get; set; }
        public string User { get; set; }
        public string Password { get; set; }
        public byte Habilitado { get; set; }
        public int LoginFails { get; set; }
        public byte Primer_acceso { get; set; }
        public byte Usuario_eliminado { get; set; }
        public int hotel_logueado { get; set; }
        public string rol { get; set; }

        public Usuario() { }
        /*
        public Usuario(int uId_usuario, string uUser, string uPassword, byte uHabilitado,
            int uLoginFails, byte uPrimer_acceso, byte uUsuario_eliminado)
        {
            this.Id_usuario = uId_usuario;
            this.User = uUser;
            this.Password = uPassword;
            this.Habilitado = uHabilitado;
            this.LoginFails = uLoginFails;
            this.Primer_acceso = uPrimer_acceso;
            this.Usuario_eliminado = uUsuario_eliminado;
        }
        */
        public static Usuario Instance
        {
            get
            {
                if (instance == null)
                {
                    lock (lockObject)
                    {
                        if (instance == null)
                        {
                            instance = new Usuario();
                        }

                    }

                }

                return instance;
            }
        }
    }
}
