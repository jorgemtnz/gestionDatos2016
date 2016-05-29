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
using MercadoEnvioDesktop.ABM_Visibilidad;
using MercadoEnvioDesktop.Generar_Publicación;
using MercadoEnvioDesktop.ABM_Rol;


namespace MercadoEnvioDesktop
{
    abstract class FactoryFormularios
    {

        public static Form crearForm(int unTipo, Boolean esModificacion)
        {
            switch (unTipo)
            {
                case 1:
                    return new FormABMRol();
                case 2:
                    return new FormConsultarPublicacion();
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
                case 9:
                    return new FormABMVisibilidad();  
                case 10:
                    return new FormPublicar();
                case 11:
                    return new FormModicacionUsuario();
                case 12:
                    return new FormAceptarCompra();
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
