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
    public partial class FormConsultaFacturas : Form
    {
        public FormConsultaFacturas()
        {
            InitializeComponent();
            #region inicializarUserControls

            calDesde.inicializar("Desde");
            calHasta.inicializar("Hasta");
            txtDetalle.inicializar("Detalle", 50, 400);
            txtImporteMaximo.inicializar("Maximo", 10,100);
            txtImporteMinimo.inicializar("Minimo", 10,100);
            txtVendedor.inicializar("Vendedor", 9);  
            grpFechas.inicializar("Intervalo de fechas");
            grpImportes.inicializar("Intervalo de importes");
            #endregion

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
