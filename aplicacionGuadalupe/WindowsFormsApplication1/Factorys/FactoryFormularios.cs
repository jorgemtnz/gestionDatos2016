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
using MercadoEnvioDesktop.Historial_Cliente;
using MercadoEnvioDesktop.Login;
using MercadoEnvioDesktop.ABM_Rubro;


namespace MercadoEnvioDesktop
{
    abstract class FactoryFormularios
    {
        public static Form crearForm(int unTipo)
        {
            switch (unTipo)
            {
                case 1:
                    return new FormAltaRol(false);
                case 3:
                    return new FormAltaUsuario();
                case 4:
                    return new FormConsultaUsuarios(false);
                case 7:
                    return new FormListadoEstadistico();

                case 9:
                    return new FormABMVisibilidad();
                case 14:
                    return new FormConsultaVisbilidades(false);
                case 17:
                    return new FrmMaster();
                case 20:
                    return new FormConsultarRol(false);
                case 23://no entra nunca acá
                    return new FormABMRubro();
            }
            return new FormABMRubro();
        }
        public static Form crearForm(int unTipo, FrmMaster master)
        {
            switch (unTipo)
            {
                case 16:
                    return new FrmLogIn( master);
            }
            return new FormABMRubro();
        }

        public static Form crearForm(int unTipo, Usuario unUsuario)
        {
            switch (unTipo)
            {

                case 5:
                    return new FormComprarOfertar(unUsuario);
                case 8:
                    return new FormConsultaFacturas(unUsuario);
                case 13:
                    return new FormCalificaciones(unUsuario);
                case 18:
                    return new FormHistorial(unUsuario);
                case 19:
                    return new FormCambiarContraseña(unUsuario);
            }
            return new FormABMRubro();
        }
        public static Form crearFormModificacion(int unTipo)
        {
            switch (unTipo)
            {
                case 1:
                    return new FormAltaRol(true);
                case 4:
                    return new FormConsultaUsuarios(true);
                case 14:
                    return new FormConsultaVisbilidades(true);
                case 20:
                    return new FormConsultarRol(true); 
            }
            return new FormABMRubro();
        }

        public static Form crearFormModificacion(int unTipo, long unId)
        {
            switch (unTipo)
            {
                case 9:
                    return new FormModificarVisibilidad(unId);
                case 11:
                    return new FormModificacionUsuario(unId);
                case 15:
                    return new FormDetalleFactura(unId);
                case 21:
                    return new FormModificarRol(unId);
            }
            return new FormABMRubro();
        }

        public static Form crearFormModificacion(int unTipo, Usuario unUsuario, long unId)
        {
            switch (unTipo)
            {
                case 2:
                    return new FormComprarPublicacion(unUsuario, unId);
                case 10:
                    return new FormPublicar(true, unUsuario, unId);
                case 22:
                    return new FormModificarPublicacion(true, unUsuario, unId);
            }
            return new FormABMRubro();
        }
        public static Form crearForm(int unTipo, Usuario unUsuario, long unId)
        {
            switch (unTipo)
            {
                case 6:
                    return new FormCalificar(unUsuario, unId);
                case 10:
                    return new FormPublicar(false, unUsuario, unId);
                case 22:
                    return new FormModificarPublicacion(false, unUsuario, unId);
            }
            return new FormABMRubro();
        }
        public static Form crearForm(int unTipo, TextoNoEditable unTextbox)
        {
            switch (unTipo)
            {
                case 1:
                    return new FormSeleccionVendedor(unTextbox); 
            }
            return new FormABMRubro();
        }

    }
}
