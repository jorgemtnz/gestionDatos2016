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
        Usuario miUsuario;

        public FormConsultaFacturas(Usuario unUsuario)
        {
            InitializeComponent();

            #region inicializarVariables
            miUsuario = unUsuario;
            #endregion

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
            txtDetalle.inicializar("Detalle", 254, 400);
            txtImporteMaximo.inicializar("Maximo", 12,100);
            txtImporteMinimo.inicializar("Minimo", 12,100);
            txtVendedor.inicializar("Vendedor", 1);  
            grpFechas.inicializar("Intervalo de fechas");
            grpImportes.inicializar("Intervalo de importes");
            if ((miUsuario.rol.ToLower() == "cliente") || (miUsuario.rol.ToLower() == "empresa"))
            {
                txtVendedor.Enabled = false;
                txtVendedor.setText(miUsuario.username);
            }
            else
            {
                txtVendedor.Enabled = true;
            }
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
            if (miUsuario.rol.ToLower() == "administrador")
            {
                if (where != "")
                {
                    return " where " + where;
                }
                else
                {
                    return "";
                }
            }
            else
            {
                if (where != "")
                {
                    return " where " + where + " and idRol =" + (miUsuario.idRol + 1);
                }
                else
                {
                    return " where idRol =" + (miUsuario.idRol + 1);
                }
            }
        }
        #endregion

        #region metodosInterfase
        public void ejecutarSQL()
        {
            try
            {
                string where = armarFiltrosWhere();
                Paginador.cargarGrilla("select nroFactura, usuario, total, modoPago, fecha, concepto from TPGDD.VW_FACTURAS_OK " + where);
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
