using MercadoEnvioDesktop.Interfaces;
using MercadoEnvioDesktop.Utiles;
using System;
using System.Data.SqlClient;
using System.Linq;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.Historial_Cliente
{
    public partial class FormHistorial : Form, IForm
    {
        GUI gui = new GUI();
        Usuario miUsuario;

        public FormHistorial(Usuario unUsuario)
        {
            this.miUsuario = unUsuario;
            InitializeComponent();

            #region inicializarGUI
            gui.inicializar((IForm)this);
            gui.controles.AddRange(grpFiltros.Controls.Cast<IControlDeUsuario>());
            calHasta.setGUI(gui);
            foreach (IBoton unBoton in grpBotonera.Controls)
            {
                unBoton.setGUI(gui);
            }
            #endregion

            #region inicializarGrillas
            grdCompras.inicializar(gui);
            PaginadorCompras.inicializar(grdCompras.getGrilla());

            grdOfertas.inicializar(gui);
            paginadorOfertas.inicializar(grdOfertas.getGrilla());
            #endregion
             
            #region inicializarUserControls
            calHasta.inicializar("Fecha aproximada", false);
            #endregion
        }

        #region eventos

        private void FormHistorial_Load(object sender, EventArgs e)
        {
            string[] array = new string[] { "faltan", "promedio" };
            try
            {
                array = SQL.buscarRegistro("SELECT * FROM TPGDD.FX_CALIFICACIONES_PROMEDIO_OK (" + miUsuario.id + ")", array);
                lblFaltanCalificar.inicializar("Falta calificar", array[0]);
                lblPromedioEstrellas.inicializar("Promedio estrellas", array[1]);
            }
            catch {}

            ejecutarSQL();
        }

        #endregion

        #region metodos
        private string armarFiltrosWhere()
        {
            string where = "";

            if (calHasta.getValor().Trim() != "")
            {
                if (where != "")
                {
                    where += " and ";
                }
                where += " fecha between '" + Convert.ToDateTime(calHasta.getValor()).AddDays(-5).ToShortDateString() + "' and '" + Convert.ToDateTime(calHasta.getValor()).AddDays(5).ToShortDateString() + "'";
            }
            if (where != "")
            {
                return " and " + where;
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
                PaginadorCompras.cargarGrilla("select id,descripcion,cantidad,operacion,fecha,estrellas from TPGDD.VW_HISTORIAL_OK where idUsuario=" + miUsuario.id + where);
                PaginadorCompras.cargarPaginas();

                paginadorOfertas.cargarGrilla("select  id, descripcion, monto, fecha, estado from TPGDD.VW_HISTORIAL_OFERTAS_OK where idUsuario=" + miUsuario.id + where);
                paginadorOfertas.cargarPaginas();
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

        public void manejarEventoGrilla(int numeroEvento, long idSeleccionado) { }
        #endregion
    }
}
