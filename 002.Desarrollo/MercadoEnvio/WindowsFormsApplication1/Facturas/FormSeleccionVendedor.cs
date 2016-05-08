using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.Facturas
{
    public partial class FormSeleccionVendedor : Form
    {
        public FormSeleccionVendedor()
        {
            InitializeComponent();
            #region inicializarUserControls
            #endregion
            txtApellido.inicializar("Apellido", 50,400,false);
            txtNombre.inicializar("Nombre", 50, 400, false);
            txtUsuario.inicializar("Usuario", 50, 400, false);  
            
            #region inicializarGUI

            GUI gui = new GUI();
            gui.inicializar();
            gui.controles.AddRange(grpFiltros.Controls.Cast<IControlDeUsuario>());
            foreach (IBoton unBoton in grpBotonera.Controls)
            {
                unBoton.setGUI(gui);
            }

            #endregion
        }
    }
}
