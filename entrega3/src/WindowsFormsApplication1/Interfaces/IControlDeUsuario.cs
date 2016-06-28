using System;

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
