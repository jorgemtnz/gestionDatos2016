using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MercadoEnvioDesktop
{
    class PasswordException : Exception
    {
        public PasswordException(string p) :base(p)
        {
        }
    }
}
