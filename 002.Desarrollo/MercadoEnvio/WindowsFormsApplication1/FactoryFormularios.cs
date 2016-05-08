using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ApplicationGdd1;
using MercadoEnvioDesktop.ABM_Usuario;
using MercadoEnvioDesktop.ComprarOfertar;
using MercadoEnvioDesktop.Calificar;
using MercadoEnvioDesktop.Listado_Estadistico;
using MercadoEnvioDesktop.Facturas;

namespace MercadoEnvioDesktop
{
    abstract class FactoryFormularios
    {
        public static Form crearForm(int unTipo, Boolean esModificacion)
        {
            switch (unTipo)
            { 

                case 3:
                    return new FormAltaUsuario();
                case 4:
                    return new FormConsultaUsuarios(esModificacion);
                case 5:
                    return new FormComprarOfertar();
                case 6:
                    return new FormCalificar();
                case 7:
                    return new FormListadoEstadistico();
                case 8:
                    return new FormConsultaFacturas();        
            }
            return new Form();
        }

        public static Form crearForm(int unTipo, TextBox unTextbox)
        {
            switch (unTipo)
            {
                case 1:
                    return new FormSeleccionVendedor();
            }
            return new Form();
        }
    }
}
