using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MercadoEnvioDesktop
{
    class CamposObligatoriosNulosException : Exception
    {
        public CamposObligatoriosNulosException(string msg) : base(msg)
        {
           // TODO: Complete member initialization

        }

        public CamposObligatoriosNulosException()
            : base("Todos los parametros marcados cons (*) son obligatorios")
        {
            // TODO: Complete member initialization
        }
    }
}
