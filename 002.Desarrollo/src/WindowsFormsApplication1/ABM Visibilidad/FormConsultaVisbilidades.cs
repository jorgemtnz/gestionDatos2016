using MercadoEnvioDesktop.Interfaces;
using System;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.ABM_Visibilidad
{
    public partial class FormConsultaVisbilidades : Form, IForm
    {
        Boolean esModificacion;
        GUI gui = new GUI();

        public FormConsultaVisbilidades(Boolean esModificacion)
        {
            InitializeComponent();

            #region inicializarVariables
            this.esModificacion = esModificacion;

            #endregion

            #region inicializarGui
            gridVisibilidades.inicializar(gui);
            gui.inicializar(this);
         //   botonRefrescar1.setGUI(gui);
            #endregion
        }

        #region eventos
        private void FormVisbilidades_Load(object sender, EventArgs e)
        {
            ejecutarSQL();
        }
        #endregion

        #region metodosInterfase
        public void ejecutarSQL()
        {
            if (esModificacion)
            {
                gridVisibilidades.cargarGrillaBotones(SQL.cargarDataTable("SELECT * FROM TPGDD.VW_VISIBILIDADES_OK ORDER BY PRIORIDAD"));
            }
            else
            {
                gridVisibilidades.cargarGrilla(SQL.cargarDataTable("SELECT * FROM TPGDD.VW_VISIBILIDADES_OK ORDER BY PRIORIDAD"));
            }
        }

        public void manejarEvento(int numeroEvento)
        { 
        }

        public void manejarEventoGrilla(int numeroEvento, long idSeleccionado)
        {
            if (esModificacion)
            {
                FactoryFormularios.crearFormModificacion(9, idSeleccionado).Show();
            }
            else
            {
                FactoryFormularios.crearForm(9).Show();
            }
        }
        #endregion

    }
}
