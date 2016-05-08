using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.ABM_Usuario
{
    public partial class FormModicacionUsuario : Form
    {
        public FormModicacionUsuario()
        {
            InitializeComponent();

            #region inicializarUserControls

            //usuario
            txtUserName.inicializar("Usuario", true);
            cboRol.inicializar("Rol", true);
            checHabilitado.inicializar("Estado activo");

            //cliente
            txtNombre.inicializar("Nombre", true);
            txtApellido.inicializar("Apellido", true);
            cboTipoDoc.inicializar("Tipo doc.", true);
            txtDocumento.inicializar("Documento", true);
            txtEmail.inicializar("Correo electrónico", 40, 400, true);
            txtTelefono.inicializar("Telefono", true);

            txtCalle.inicializar("Calle");
            txtDepto.inicializar("Depto");
            txtNroCalle.inicializar("Nro");
            txtNroPiso.inicializar("Piso");
            cboLocalidad.inicializar("Localidad");
            txtCP.inicializar("CP");

            calFechaNac.inicializar("Fecha nacimiento", true);
            calFechaCreacion.inicializar("Fecha de creacion", true);

            //empresa
            txtCuit.inicializar("CUIT", true);
            txtRSocial.inicializar("Razón social", true);
            txtRubroEmpresa.inicializar("Rubro principal", true);
            txtTelefonoEmpresa.inicializar("Telefono", true);
            txtEmailEmpresa.inicializar("Correo electrónico", 40, 400, true);

            txtNombreContacto.inicializar("Nombre", true);
            txtApellidoContacto.inicializar("Apellido", true);

            txtCalleEmpresa.inicializar("Calle");
            txtNroDirEmpresa.inicializar("Nro");
            txtPisoEmpresa.inicializar("Piso");
            txtDeptoEmpresa.inicializar("Depto");
            txtCpEmpresa.inicializar("CP");
            cboLocalidadEmpresa.inicializar("Localidad");

            calFechaDia.inicializar("Fecha de creacion", true);

            grupContacto.inicializar("Contacto");
            grupDireccionEmpresa.inicializar("Direccion");
            grupDireccionCliente.inicializar("Direccion");
            #endregion

            #region inicializarGUI

            GUI gui = new GUI();
            gui.inicializar();
            gui.controles.AddRange(grpFiltros.Controls.Cast<IControlDeUsuario>());
            gui.controles.AddRange(tabPage1.Controls.Cast<IControlDeUsuario>());
            gui.controles.AddRange(tabPage2.Controls.Cast<IControlDeUsuario>());
            foreach (IBoton unBoton in grpBotonera.Controls)
            {
                unBoton.setGUI(gui);
            }

            #endregion
        }

    }
}
