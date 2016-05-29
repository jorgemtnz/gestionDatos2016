using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.Listado_Estadistico
{
    public partial class FormListadoEstadistico : Form
    {
        GUI gui = new GUI();
        public FormListadoEstadistico()
        {
            InitializeComponent();
            #region inicializarUserControls

            txtAo.inicializar("Año", 4, 40, true);
            List<string> lista = new List<string>();
            lista.Add("1º trimestre");
            lista.Add("2º trimestre");
            lista.Add("3º trimestre");
            lista.Add("4º trimestre");
            cboTrimestre.inicializar("Trimestre", true, lista);
            cboRubro.inicializar("rubro");
            cboVisibilidad.inicializar("Visibilidad");
            cboListado.inicializar("Listado");
            #endregion

            #region inicializarGUI
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
