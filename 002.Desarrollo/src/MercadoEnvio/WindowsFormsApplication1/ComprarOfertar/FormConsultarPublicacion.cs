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
    public partial class FormConsultarPublicacion : Form
    {
        GUI gui = new GUI();
        public FormConsultarPublicacion()
        {
            InitializeComponent();

            #region inicializarUserControls
            lblCantidadDisponible.inicializar("Cantidad disponible","1");
            lblDescripcion.inicializar("Descripcion", "algo");
            lblDetalle.inicializar("Detalles", "10 Tips para desaprobar Gestión de Datos 1. No inscribirse en el grupo 2. No entregar el DER del modelado, y en caso de entregarlo, que el mismo sea legible 3. No consultar periódicamente el grupo de la materia 4. Entregar el script de migración y/o solución de C# con errores 5. Entregar TP de años anteriores 10. Si hay dudas, volver a leer los puntos anteriores o consultarlos con los ayudantes.",500,true);
            lblFechaFin.inicializar("Finaliza el dia ", "12/12/12");
            lblFechaInicio.inicializar("Fecha inicial", "12/12/12");
            lblReputacion.inicializar("Reputacion vendedor", "mala");
            lblRubro.inicializar("Rubro", "uno");
            lblUnidadesVendidas.inicializar("Unidades vendidas", "1");
            lblVendedor.inicializar("Vendedor", "alguno");
            txtPregunta.inicializar("Preguntar al vendedor",255,600,false,true);  
            
            #endregion
            //     this.grdPublicaciones.inicializar
            #region inicializarGUI
            gui.inicializar();
            gui.controles.AddRange(grpPublicacion.Controls.Cast<IControlDeUsuario>());
            #endregion
        }

        private void btnPreguntar_Click(object sender, EventArgs e)
        {

        }
    }
}