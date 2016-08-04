using MercadoEnvioDesktop.Interfaces;
using System;
using System.Data.SqlClient;
using System.Linq;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.ABM_Visibilidad
{
    public partial class FormABMVisibilidad : Form, IForm
    {
        GUI gui = new GUI();

        public FormABMVisibilidad()
        {
            InitializeComponent();

            #region inicializarUserControls
            grpComisiones.inicializar("Comisiones");
            txtComisionEnvio.inicializar("Por envio", 8, 60, true);
            txtComisionPorcentaje.inicializar("Porcentaje venta", 12, 60, true);
            txtComisionPrecio.inicializar("Por tipo publicacion", 12, 60, true);
            txtNombreVisibilidad.inicializar("Nombre", 254, 60, true);
            chkAdmiteEnvio.inicializar("Admite envio",true);
            txtPrioridad.inicializar("Prioridad en listado", 3, 25, true);
            #endregion

            #region inicializarGUI
            gui.inicializar((IForm)this);
            gui.controles.AddRange(grpVisibilidad.Controls.Cast<IControlDeUsuario>());

            foreach (IBoton unBoton in grpBotonera.Controls)
            {
                unBoton.setGUI(gui);
            }
            chkAdmiteEnvio.setGUI(gui);
            #endregion
        }

        #region metodosInterfase
        public void ejecutarSQL() 
        {
            try
            {
                int costoEnvio = 0;
                if (txtComisionEnvio.Enabled)
                {
                    costoEnvio = Convert.ToInt32(txtComisionEnvio.getValor());
                }
                SQL.ejecutar_SP("exec TPGDD.SP_INSERT_VISIBILIDAD_OK " +
                    "'" + txtNombreVisibilidad.getValor() + "', "
                    + txtComisionPrecio.getValor() + ", "
                    + txtComisionPorcentaje.getValor() + ", "
                    + costoEnvio + ", "
                    + txtPrioridad.getValor() + ", "
                    + "'" + chkAdmiteEnvio.getValor() + "'");
                botonLimpiar1.limpiar();
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
            txtComisionEnvio.Enabled = chkAdmiteEnvio.getValor();
            if (!txtComisionEnvio.Enabled)
            {
                txtComisionEnvio.setText("");
            }
        }
        public void manejarEventoGrilla(int numeroEvento, long idSeleccionado) { }
        #endregion
    }
}
