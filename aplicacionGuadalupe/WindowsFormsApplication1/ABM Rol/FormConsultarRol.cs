using MercadoEnvioDesktop.Interfaces;
using System;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.ABM_Rol
{
    public partial class FormConsultarRol : Form, IForm
    {
        GUI gui = new GUI();
        Boolean esModificacion;

        public FormConsultarRol(Boolean esModificacion)
        {
            InitializeComponent();
            this.esModificacion = esModificacion;

            #region inicializarGui
            grdRoles.inicializar(gui);
            gui.inicializar(this);
            botonRefrescar1.setGUI(gui);
            #endregion 
        }

        #region eventos
        private void FormConsultarRol_Load(object sender, EventArgs e)
        {
            ejecutarSQL();
            if (esModificacion)
            {
                grdRoles.crearBotones();
            }
        }
        #endregion

        #region metodosInterfase

        public void ejecutarSQL()
        {
            if (esModificacion)
            {
                grdRoles.cargarGrilla(SQL.cargarDataTable("select distinct idRol as id, rol as nombre, habilitado from TPGDD.VW_ROLES_OK "));
            }
            else
            {
                grdRoles.cargarGrilla(SQL.cargarDataTable("select  idRol as id, rol as nombre, habilitado, funcionalidad from TPGDD.VW_ROLES_OK"));
            }
        }

        public void manejarEvento(int numeroEvento)
        {
        }

        public void manejarEventoGrilla(int numeroEvento, long idSeleccionado)
        {
            if (esModificacion)
            {
                FactoryFormularios.crearFormModificacion(21, idSeleccionado).Show();
            }
        }

        #endregion
    }

}
