using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.Generar_Publicación
{
    public partial class FormPublicar : Form
    {
        GUI gui = new GUI();
        public FormPublicar()
        {

            InitializeComponent();
            #region inicializarUserControls
            calFechaInicio.inicializar("Fecha creacion");
            calFechaFin.inicializar("Fecha finalizacion", true);
            cboEstado.inicializar("Estado", true);
            cboRubro.inicializar("Rubro", true);
            cboTipoPublicacion.inicializar("Tipo Publicacion", true);
            cboVisibilidad.inicializar("Visibilidad", true);
            txtDescripcion.inicializar("Descripcion",10,800, true);
            txtPrecio.inicializar("Precio", 10, 80, true);
            txtStock.inicializar("Stock", 10, 80, true);
            chkAdmiteEnvio.inicializar("Admite envio");
            chkAdmitePreguntas.inicializar("Admite preguntas");  
            #endregion

            #region inicializarGUI

            gui.inicializar();
            gui.controles.AddRange(grpPublicacion.Controls.Cast<IControlDeUsuario>());

            foreach (IBoton unBoton in grpBotonera.Controls)
            {
                unBoton.setGUI(gui);
            }
            #endregion
        }

    }
}