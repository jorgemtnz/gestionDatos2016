using System;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace MercadoEnvioDesktop.Botones
{
    public partial class BotonLogin : UserControl, IBoton
    {
        GUI gui;

        public BotonLogin()
        {
            InitializeComponent();
        }

        #region eventos
        private void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                if (gui.validar())
                {
                    gui.buscar();
                }
                else
                {
                    gui.marcarErrores();
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
        #endregion

        #region metodos
            public void setGUI(GUI unaGui)
            {
                gui = unaGui;
            }
        #endregion
    }
}
