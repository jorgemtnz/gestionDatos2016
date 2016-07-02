using MercadoEnvioDesktop.Interfaces;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.Calificar
{
    public partial class FormCalificaciones : Form, IForm
    {
        Usuario miUsuario;
        GUI gui = new GUI();
 
        public FormCalificaciones(Usuario miUsuario)
        {
            InitializeComponent();

            #region inicializarVariables
            this.miUsuario = miUsuario;
            #endregion

            #region inicializarGUI
            gridPendientes.inicializar(gui);
            gui.inicializar(this);
            botonRefrescar1.setGUI(gui);
            #endregion
        }

        #region eventos

        private void FormCalificaciones_Load(object sender, EventArgs e)
        {
            ejecutarSQL();
            gridPendientes.crearBotones();
        }

        #endregion

        #region metodosInterfase
        public void ejecutarSQL()
        {
            try
            {
                DataTable dt = SQL.cargarDataTable("select top 5 idCompra, detalleCompra, cantidad, fecha, operacion, vendedor,calificacion,observacion  from TPGDD.VW_CALIFICACIONES_REALIZADAS_OK where idUsuario= " + miUsuario.id + " order by codigoCalificacion desc");
                gridRealizadas.cargarGrilla(dt);
                DataTable dtPendientes = SQL.cargarDataTable("select top 5 idCompra, detalleCompra, cantidad, fecha, operacion, vendedor from TPGDD.VW_CALIFICACIONES_PENDIENTE_OK where calificada ='FALSE' AND idUsuario = " + miUsuario.id + " order by fecha");
                gridPendientes.cargarGrilla(dtPendientes);
                gridResumenes.cargarGrilla(SQL.cargarDataTable("select * FROM TPGDD.FX_RESUMEN_ESTRELLAS_OK (" + miUsuario.id + ")"));
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
            FactoryFormularios.crearForm(6, miUsuario,idSeleccionado).Show();
        }
        #endregion
    }
}
