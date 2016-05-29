using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MercadoEnvioDesktop
{
    class LoginException : Exception
    {

        public LoginException(string msj) :base(msj) 
        {
        }
    }
}
