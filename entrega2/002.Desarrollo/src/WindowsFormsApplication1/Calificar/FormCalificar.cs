using MercadoEnvioDesktop.Interfaces;
using System;
using System.Data.SqlClient;
using System.Linq;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.Calificar
{
    public partial class FormCalificar : Form, IForm
    {
        GUI gui = new GUI();
        Usuario miUsuario;
        long unID;

        public FormCalificar(Usuario miUsuario,long unID)
        {
            InitializeComponent();
            this.miUsuario = miUsuario;
            this.unID = unID;

            #region inicializarGUI
            gui.inicializar(this);
            gui.controles.AddRange(grpCalificar.Controls.Cast<IControlDeUsuario>());

            foreach (IBoton unBoton in grpBotonera.Controls)
            {
                unBoton.setGUI(gui);
            }
            #endregion

            #region inicializarUserControls
            txtComentarios.inicializar("Comentarios", 200, 128, false, true);

            string[] array = new string[] { "detalleCompra", "vendedor" };
            try
            {
                array = SQL.buscarRegistro("SELECT detalleCompra, vendedor FROM TPGDD.VW_CALIFICACIONES_OK where idCompra =" + unID, array);
                lblPublicacion.inicializar("Publicación", array[0]); 
                lblVendedor.inicializar("Vendedor", array[1]);
            }
            catch
            {
                lblPublicacion.inicializar("Publicación", "");
                lblVendedor.inicializar("Vendedor", "");
            }
            #endregion
        }

        #region eventos

        private void FormCalificar_Load(object sender, EventArgs e)
        {
        }

        #endregion

        #region metodosInterfase

        public void ejecutarSQL()
        {
            try
            {
                SQL.ejecutar_SP("EXEC TPGDD.SP_INSERT_CALIFICACION_OK " + miUsuario.id + ", " + unID + "," + option1.getValor() + ",'" + txtComentarios.getValor() + "'");
                botonLimpiar1.limpiar();
                this.Close();
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

        public void manejarEventoGrilla(int numeroEvento, long idSeleccionado) { }
        #endregion

    }
}

