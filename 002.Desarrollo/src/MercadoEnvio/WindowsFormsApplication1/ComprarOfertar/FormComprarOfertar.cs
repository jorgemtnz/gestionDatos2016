using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.ComprarOfertar
{
    public partial class FormComprarOfertar : Form
    {
        GUI gui = new GUI();
        public FormComprarOfertar()
        {
            InitializeComponent();
            
            #region inicializarUserControls
            lstRubros.inicializar("Rubros");
            txtDescripcion.inicializar("Descripcion", 50, 400);
            #endregion
       //     this.grdPublicaciones.inicializar
            #region inicializarGUI
            gui.inicializar();
            gui.controles.AddRange(grpFiltros.Controls.Cast<IControlDeUsuario>());
            gui.controles.Add(lstRubros);
            foreach (IBoton unBoton in grpBotonera.Controls)
            {
                unBoton.setGUI(gui);
            }
            grdPublicaciones.inicializar(new TextBox(), new DataTable(), true, 2);
            #endregion
        }
    }
}
