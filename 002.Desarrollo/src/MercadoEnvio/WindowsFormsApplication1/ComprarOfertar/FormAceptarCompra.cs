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
    public partial class FormAceptarCompra : Form
    {
        GUI gui = new GUI();
        public FormAceptarCompra()
        {
            InitializeComponent();

            #region inicializarUserControls
            lblCodPublicacion.inicializar("Codigo Publicacion", "");
            lblDescripcionPublicacion.inicializar("Descripcion", "", 600);
            lblVendedor.inicializar("Vendedor", "", 400);
            txtCantidad.inicializar("Cantidad", 4, 50, true);
            cboMedioDePago.inicializar("Medio de pago",200, true);
            checkEnvio.inicializar("Envio");
            #endregion
            grpCompletar.inicializar("Completar");
            #region inicializarGUI
            GUI gui = new GUI();
            gui.inicializar();
            gui.controles.AddRange(grpComprar.Controls.Cast<IControlDeUsuario>());
            botonLimpiar1.setGUI(gui);
            btnComprar.setGUI(gui);
            #endregion
            btnComprar.setConfirmado();  
        }

    }
}
