using MercadoEnvioDesktop.Interfaces;
using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.Generar_Publicación
{
    public partial class FormModificarPublicacion : Form, IForm
    {
        Usuario miUsuario;
        Boolean esModificacion;
        GUI gui = new GUI();

        public FormModificarPublicacion(Boolean esModificacion, Usuario miUsuario,long id)
        {
            InitializeComponent();

            #region inicializarVariables
            this.miUsuario = miUsuario;
            this.esModificacion = esModificacion;
            #endregion

            #region inicializarGui
            grdPublicaciones.inicializar(gui);
            gui.inicializar(this);
            botonRefrescar1.setGUI(gui);
            #endregion
        }

        #region eventos
        private void FormModificarPublicacion_Load(object sender, EventArgs e)
        {
            ejecutarSQL();
        }
        #endregion

        #region metodosInterfase
        public void ejecutarSQL()
        {
            try
            {
                if (esModificacion)
                {
                    grdPublicaciones.cargarGrillaBotones(SQL.cargarDataTable("select id, descripcion,visibilidad,precio, stock, rubro,fecha,finalizacion, estado, envio, preguntas "
                    + "from TPGDD.VW_PUBLICACIONES_OK where idUsuario=" + miUsuario.id + " and idEstado in (2,3) order by fecha, idEstado")); 
                }
                else
                {
                    grdPublicaciones.cargarGrilla(SQL.cargarDataTable("select id, descripcion, visibilidad, precio, stock, rubro, fecha, finalizacion, estado, envio, preguntas "
                    + "from TPGDD.VW_PUBLICACIONES_OK where idUsuario=" + miUsuario.id + " order by fecha, idEstado")); 
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
        }

        public void manejarEvento(int numeroEvento)
        { }
        public void manejarEventoGrilla(int numeroEvento, long idSeleccionado) 
        {
            if (esModificacion)
            {
                FactoryFormularios.crearFormModificacion(10, miUsuario, idSeleccionado).Show();
            }
        }
        #endregion

    }
}
