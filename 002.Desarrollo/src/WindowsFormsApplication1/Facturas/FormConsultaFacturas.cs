using MercadoEnvioDesktop.Interfaces;
using System;
using System.Data.SqlClient;
using System.Linq;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.Facturas
{
    public partial class FormConsultaFacturas : Form,IForm
    {
        GUI gui = new GUI();

        public FormConsultaFacturas()
        {
            InitializeComponent();

            #region inicializarGUI
            gui.inicializar((IForm)this);
            gui.controles.AddRange(grpFiltros.Controls.Cast<IControlDeUsuario>());
            foreach (IBoton unBoton in grpBotonera.Controls)
            {
                unBoton.setGUI(gui);
            }
            calDesde.setGUI(gui);
            calHasta.setGUI(gui);
            #endregion

            #region inicializarGrilla
            grd.inicializar(gui);
            Paginador.inicializar(grd.getGrilla());
            #endregion

            #region inicializarUserControls
            calDesde.inicializar("Desde");
            calHasta.inicializar("Hasta");
            txtDetalle.inicializar("Detalle", 50, 400);
            txtImporteMaximo.inicializar("Maximo", 10,100);
            txtImporteMinimo.inicializar("Minimo", 10,100);
            txtVendedor.inicializar("Vendedor", 1);  
            grpFechas.inicializar("Intervalo de fechas");
            grpImportes.inicializar("Intervalo de importes");
            #endregion
        }

        #region eventos
        private void FormConsultaFacturas_Load(object sender, EventArgs e)
        {
            ejecutarSQL();
            grd.crearBotones();
        }
        #endregion

        #region metodos

        private string armarFiltrosWhere()
        {
            string where = "";
            if ((calDesde.getValor() != "") && (calHasta.getValor() != ""))
            {
                where = " fecha between '" + calDesde.getValor() + "' and '" + calHasta.getValor() + "'";
            }
            if ((txtImporteMinimo.getValor() != "") && (txtImporteMaximo.getValor() != ""))
            {
                if (where != "")
                {
                    where += " and ";
                }
                where += "  total between " + txtImporteMinimo.getValor() + " and " + txtImporteMaximo.getValor() + "";
            }
            if (txtDetalle.getValor() != "")
            {
                if (where != "")
                {
                    where += " and ";
                }
                where += "  concepto like '%" + txtDetalle.getValor() + "%' ";
            }
            if (txtVendedor.getValor() != "")
            {
                if (where != "")
                {
                    where += " and ";
                }
                where += " usuario like '" + txtVendedor.getValor() + "'";
            }
            if (where != "")
            {
                return " where " + where;
            }
            else
            {
                return "";
            }
        }
        #endregion

        #region metodosInterfase
        public void ejecutarSQL()
        {
            try
            {
                string where = armarFiltrosWhere();
                Paginador.cargarGrilla("select nroFactura, usuario, total, modoPago, fecha, concepto ,idPublicacion from TPGDD.VW_FACTURAS_OK " + where);
                Paginador.cargarPaginas();
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

        public void manejarEvento(int numeroEvento)
        {

        }
        public void manejarEventoGrilla(int numeroEvento, long idSeleccionado)
        {
            FactoryFormularios.crearFormModificacion(15, idSeleccionado).Show();
        }
        #endregion
    }
}
