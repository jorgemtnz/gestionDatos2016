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
            cboListado.cargarCombo(TiposItemsCombos.tiposListado(),"listado","id") ;
            cboTrimestre.cargarCombo(TiposItemsCombos.trimestres(), "trimestre", "id");
            #endregion
        }

        #region eventos
        private void FormListadoEstadistico_Load(object sender, EventArgs e)
        {
            btnLimpiar.limpiar();
            cboRubro.Enabled = false;
            cboVisibilidad.Enabled = false;
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
                    return Convert.ToDateTime("31/01/" + anio);
                case 2:
                    return Convert.ToDateTime("30/04/" + anio);
                case 3:
                    return Convert.ToDateTime("30/06/" + anio);
                case 4:
                    return Convert.ToDateTime("30/09/" + anio);
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

            try
            {

                if (cboListado.getValor() == "1")
                {
                    string visibilidad = cboVisibilidad.getValor();
                    sql = "select top 5 idUsuario, username, TPGDD.FX_NO_VENDIDOS (idUsuario, '" + desde(trimestre, 1990) + "', '" + hasta(trimestre, 2090) + "'," + visibilidad + ") from TPGDD.usuarios";
                    dt = SQL.cargarDataTable(sql);
                    grdListado.cargarGrilla(dt);
                }
                if (cboListado.getValor() == "2")
                {//agregar los listados que faltan
                }
                if (cboListado.getValor() == "3")
                {
                }
                if (cboListado.getValor() == "4")
                {
                }
                //grdListado.cargarGrilla(dt);
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

            if (cboListado.getValor() == "1")
            {
                cboVisibilidad.cargarCombo(SQL.cargarDataTable("select id, descripcion from TPGDD.VW_VISIBILIDADES_OK  order by prioridad"), "descripcion", "id");
                cboVisibilidad.Enabled = true;
                cboRubro.Enabled = false;
                cboRubro.setText("");
                return;
            }
            if (cboListado.getValor() == "2")
            {
                cboRubro.cargarCombo(SQL.cargarDataTable("select * from TPGDD.VW_RUBROS_OK order by nombre"), "nombre", "id");
                cboVisibilidad.Enabled = false;
                cboRubro.Enabled = true;
                cboVisibilidad.setText("");
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
