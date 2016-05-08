using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.Calificar
{
    public partial class FormCalificar : Form
    {
        GUI gui = new GUI();
        public FormCalificar()
        {
            InitializeComponent();
            #region inicializarUserControls
            lblPublicacion.inicializar("Publicación",""); //cargar con datos bien
            lblVendedor.inicializar("Vendedor", "");//cargar con datos bien
            txtComentarios.inicializar("Comentarios",200, 128, false, true);  
            #endregion

            #region inicializarGUI
            GUI gui = new GUI();
            gui.inicializar();
            gui.controles.AddRange(grpCalificar.Controls.Cast<IControlDeUsuario>());

            foreach (IBoton unBoton in grpBotonera.Controls)
            {
                unBoton.setGUI(gui);
            }
            #endregion
        }

    }
}
