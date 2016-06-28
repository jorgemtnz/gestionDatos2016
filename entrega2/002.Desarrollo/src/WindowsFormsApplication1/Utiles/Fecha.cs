using System;
using System.Configuration;

namespace MercadoEnvioDesktop
{
    class Fecha
    {
        public static DateTime fechaDeHoy()
        {
            return Convert.ToDateTime(ConfigurationManager.AppSettings["Fecha"]);
            
        }
    }
}
