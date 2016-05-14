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
            txtPrecio.inicializar("Precio", 10, 200, true);
            txtStock.inicializar("Stock", 10, 200, true);
            chkAdmiteEnvio.inicializar("Admite envio");
            chkAdmitePreguntas.inicializar("Admite preguntas");  
            #endregion

            #region inicializarGUI
            GUI gui = new GUI();
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