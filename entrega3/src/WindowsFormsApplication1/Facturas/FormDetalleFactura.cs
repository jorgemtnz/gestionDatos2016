using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.Facturas
{
    public partial class FormDetalleFactura : Form
    {
        GUI gui = new GUI();
        long id;

        public FormDetalleFactura(long unId)
        {
            InitializeComponent();

            #region inicializarVariables
            id = unId;
            #endregion

            #region inicializarGui
            grdDetalles.setGUI(gui);
            #endregion

            #region inicializarUserControls

            string[] array = new string[] { "fecha", "modoPago", "total","nroFactura","usuario"};
            try
            {
                array = SQL.buscarRegistro("SELECT fecha,modoPago,total,nroFactura,usuario FROM TPGDD.VW_FACTURAS_OK where nroFactura=" + unId, array);
                lblFecha.inicializar("Fecha",Convert.ToDateTime(array[0]).ToShortDateString());
                lblFormaPago.inicializar("Forma de pago", array[1]);
                lblMontoTotal.inicializar("Monto total", array[2]);
                lblNroFactura.inicializar("Nro Factura", array[3]);
                lblVendedor.inicializar("Vendedor", array[4]);
            }
            catch
            {
                lblFecha.inicializar("Fecha", "");
                lblFormaPago.inicializar("Forma de pago", "");
                lblMontoTotal.inicializar("Monto total", "");
                lblNroFactura.inicializar("Nro Factura", "");
                lblVendedor.inicializar("Vendedor", "");
            }
            #endregion
        }

        #region eventos
        private void FormDetalleFactura_Load(object sender, EventArgs e)
        {
            try
            {
                grdDetalles.cargarGrilla(SQL.cargarDataTable("select concepto, cantidad, montoItem, publicacion from TPGDD.VW_FACTURAS_OK where nroFactura =" + id));
            }
            catch (SqlException ex)
            {
                ExceptionManager.manejadorExcepcionesSQL(ex);

            }
            catch (Exception ex)
            {
                ExceptionManager.manejarExcepcion(ex);
            }
        }
        #endregion

    }
}
