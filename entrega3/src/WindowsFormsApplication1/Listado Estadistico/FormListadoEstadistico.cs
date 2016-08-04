using MercadoEnvioDesktop.Interfaces;
using MercadoEnvioDesktop.Utiles;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.Listado_Estadistico
{
    public partial class FormListadoEstadistico : Form, IForm
    {
        GUI gui = new GUI();

        public FormListadoEstadistico()
        {
            InitializeComponent();

            #region inicializarGUI
            gui.inicializar(this);
            gui.controles.AddRange(grpFiltros.Controls.Cast<IControlDeUsuario>());
            foreach (IBoton unBoton in grpBotonera.Controls)
            {
                unBoton.setGUI(gui);
            }
            cboListado.setGUI(gui);
            cboRubro.setGUI(gui);
            cboTrimestre.setGUI(gui);
            cboVisibilidad.setGUI(gui);
            #endregion

            #region inicializarUserControls
            txtAo.inicializar("Año", 4, 40, true);
            cboTrimestre.inicializar("Trimestre", 100,true);
            cboListado.inicializar("Tipo listado", 360, true);
            cboRubro.inicializar("rubro",360);
            cboVisibilidad.inicializar("Visibilidad");

            cboVisibilidad.cargarCombo("select descripcion from TPGDD.VW_VISIBILIDADES_OK  order by prioridad", "descripcion");
            cboRubro.cargarCombo("select * from TPGDD.VW_RUBROS_OK order by nombre", "nombre");

            cboListado.cargarCombo(TiposItemsCombos.tiposListado(), "listado", "id");
            cboTrimestre.cargarCombo(TiposItemsCombos.trimestres(), "trimestre", "id");
            #endregion
        }

        #region eventos
        private void FormListadoEstadistico_Load(object sender, EventArgs e)
        {
        }
        #endregion

        #region metodos
        private DateTime desde(int opcion, int anio)
        {
            switch (opcion)
            {
                case 1:
                    return Convert.ToDateTime("01/01/" + anio);
                case 2:
                    return Convert.ToDateTime("01/04/" + anio);
                case 3:
                    return Convert.ToDateTime("01/06/" + anio);
                case 4:
                    return Convert.ToDateTime("01/09/" + anio);
            }
            return Convert.ToDateTime("01/01/1900");
        }
        private DateTime hasta(int opcion, int anio)
        {
            switch (opcion)
            {
                case 1:
                    return Convert.ToDateTime("30/04/" + anio);
                case 2:
                    return Convert.ToDateTime("30/06/" + anio);
                case 3:
                    return Convert.ToDateTime("30/09/" + anio);
                case 4:
                    return Convert.ToDateTime("31/12/" + anio);
            }
            return Convert.ToDateTime("31/01/2900");
        }
        #endregion

        #region metodosInterfase 
        public void ejecutarSQL()
        {
            int trimestre = Convert.ToInt32(cboTrimestre.getValor());
            string sql = "";
            DataTable dt;
            int anio = Convert.ToInt32( txtAo.getValor());
            try
            {
                if (cboListado.getValor() == "1")
                {
                    string visibilidad = cboVisibilidad.getValorSQL();
                    sql = "EXEC tpgdd.SP_LISTADOS_ESTADISTICOS_OK '" + desde(trimestre, anio) + "', '" + hasta(trimestre, anio) + "', " + cboVisibilidad.getValorSQL() + ", null, 1";
                    dt = SQL.cargarDataTable(sql);
                    grdListado.cargarGrilla(dt);
                }
                if (cboListado.getValor() == "2") //clientes con mas prod comprados
                {
                    sql = "EXEC tpgdd.SP_LISTADOS_ESTADISTICOS_OK '" + desde(trimestre, anio) + "', '" + hasta(trimestre, anio) + "',null, " + cboRubro.getValorSQL() + ", 2";
                    dt = SQL.cargarDataTable(sql);
                    grdListado.cargarGrilla(dt);
                }
                if (cboListado.getValor() == "3")
                {
                    sql = "EXEC tpgdd.SP_LISTADOS_ESTADISTICOS_OK '" + desde(trimestre, anio) + "', '" + hasta(trimestre, anio) + "', null, null, 3";
                    dt = SQL.cargarDataTable(sql);
                    grdListado.cargarGrilla(dt);
                }
                if (cboListado.getValor() == "4") //vendedores con mayor monto facturado
                {
                    sql = "EXEC tpgdd.SP_LISTADOS_ESTADISTICOS_OK '" + desde(trimestre, anio) + "', '" + hasta(trimestre, anio) + "', null, null, 4";
                    dt = SQL.cargarDataTable(sql);
                    grdListado.cargarGrilla(dt);
                }
            }
            catch (SqlException ex)
            {
                ExceptionManager.manejadorExcepcionesSQL(ex);
            }
            catch (Exception ex)
            {
                ExceptionManager.manejarExcepcion(ex);
            }
            gui.errorProviderClear();
        }
        public void manejarEvento(int numeroEvento)
        {

            if (cboListado.getValor() == "1")
            {
                cboVisibilidad.Enabled = true;
                cboRubro.Enabled = false;
                cboRubro.setText("");
                return;
            }
            if (cboListado.getValor() == "2")
            {
                cboRubro.Enabled = true;
                cboVisibilidad.setText("");
                cboVisibilidad.Enabled = false;
                
                return;
            }
            cboRubro.Enabled = false;
            cboVisibilidad.Enabled = false;
            cboVisibilidad.setText("");
            cboRubro.setText("");
        }

        public void manejarEventoGrilla(int numeroEvento, long idSeleccionado) { }

        #endregion
    }
}
