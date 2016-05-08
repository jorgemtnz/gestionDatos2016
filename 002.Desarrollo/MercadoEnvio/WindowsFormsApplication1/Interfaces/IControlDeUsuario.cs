using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MercadoEnvioDesktop
{
    public interface IControlDeUsuario
    {
         void limpiar();
         String errorEnErrorProvider();
         Boolean esValido();
         Boolean esRequerido();
    }
}
