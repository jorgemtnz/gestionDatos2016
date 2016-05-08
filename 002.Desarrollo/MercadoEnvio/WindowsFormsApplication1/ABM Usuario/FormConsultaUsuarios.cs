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
    public partial class FormConsultaUsuarios : Form
    {
        public FormConsultaUsuarios(Boolean esModificacion)
        {
            InitializeComponent();

            #region inicializarUserControls
            //cliente
            txtNombre.inicializar("Nombre");
            txtApellido.inicializar("Apellido");
            txtEmail.inicializar("Correo electronico", 40, 400);
            txtNroDoc.inicializar("Nro de documento");
            //empresa
            txtCuit.inicializar("CUIT");
            txtEmailEmpresa.inicializar("Correo electronico", 40, 400);
            txtRSocial.inicializar("Razon social");
            #endregion

            grilla1.inicializar(new TextBox(), new DataTable(), esModificacion, 0);

            #region inicializarGUI
            GUI gui = new GUI();
            gui.inicializar();
            gui.controles.AddRange(tabCliente.Controls.Cast<IControlDeUsuario>());
            gui.controles.AddRange(tabEmpresa.Controls.Cast<IControlDeUsuario>());

            foreach (IBoton unBoton in grpBotonera.Controls)
            {
                unBoton.setGUI(gui);
            }
            #endregion
        }
    }
}
