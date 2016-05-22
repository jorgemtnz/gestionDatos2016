using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.ABM_Rol
{
    public partial class FormABMRol : Form
    {
        GUI gui = new GUI();
        public FormABMRol()
        {
            InitializeComponent();
            #region inicializarUserControls
            txtNombre.inicializar("Nombre rol", 255, 400, true);
            lstFuncionalidades.inicializar("Funcionalidades", true);
            #endregion
            #region inicializarGUI
            
            gui.inicializar();
            gui.controles.AddRange(grpRol.Controls.Cast<IControlDeUsuario>());

            foreach (IBoton unBoton in grpBotonera.Controls)
            {
                unBoton.setGUI(gui);
            }
            #endregion
        }
    }
}
