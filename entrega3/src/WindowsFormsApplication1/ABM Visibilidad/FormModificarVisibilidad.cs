using MercadoEnvioDesktop.Interfaces;
using System;
using System.Windows.Forms;
using System.Linq;
using System.Data.SqlClient;

namespace MercadoEnvioDesktop.ABM_Visibilidad
{
    public partial class FormModificarVisibilidad : Form, IForm
    {
        GUI gui = new GUI();
        long idSeleccionado;

        public FormModificarVisibilidad(long unId)
        {
            InitializeComponent();

            #region inicializarVariables
            idSeleccionado = unId;
            #endregion

            #region inicializarGUI
            gui.inicializar((IForm)this);
            gui.controles.Add(txtNombreVisibilidad);
            gui.controles.Add(txtPrioridad);  
            foreach (IBoton unBoton in grpBotonera.Controls)
            {
                unBoton.setGUI(gui);
            }
            chkAdmiteEnvio.setGUI(gui);
            #endregion

            #region inicializarUserControls
            grpComisiones.inicializar("Comisiones");
            txtNombreVisibilidad.inicializar("Nombre", 254, 60, true);
            txtPrioridad.inicializar("Prioridad en listado", 3, 25, true);

            string[] array = new string[6] { "descripcion", "precio", "costoVenta", "costoEnvio", "prioridad", "admiteEnvio" };
            try
            {
                array = SQL.buscarRegistro("SELECT descripcion, precio, costoVenta, costoEnvio, prioridad, admiteEnvio FROM TPGDD.VW_VISIBILIDADES_OK where id =" + unId, array);
                lblComisionEnvio.inicializar("Por envio", array[3]);
                lblComisionPorcentaje.inicializar("Porcentaje venta", array[2]);
                lblComisionPrecio.inicializar("Por tipo publicacion", array[1]);
                txtPrioridad.setText(array[4]);
                txtNombreVisibilidad.setText(array[0]);
                chkAdmiteEnvio.inicializar("Admite envio", Convert.ToBoolean(array[5]));
            }
            catch
            {
                lblComisionEnvio.inicializar("Por envio", "");
                lblComisionPorcentaje.inicializar("Porcentaje venta", "");
                lblComisionPrecio.inicializar("Por tipo publicacion", "");
                chkAdmiteEnvio.inicializar("Admite envio");
            }
            #endregion
        }

        #region metodosInterfase
        public void ejecutarSQL()
        {
            try
            {
                SQL.ejecutar_SP("exec TPGDD.SP_UPDATE_VISIBILIDAD_OK '" + txtNombreVisibilidad.getValor() + "', " + txtPrioridad.getValor() + "," + idSeleccionado);
                botonLimpiar1.limpiar();
                botonGuardar1.Enabled = false;
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
