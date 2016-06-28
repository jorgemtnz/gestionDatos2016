using System;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace MercadoEnvioDesktop.Botones
{
    public partial class BotonRefrescar : UserControl, IBoton
    {
        GUI gui;

        public BotonRefrescar()
        {
            InitializeComponent();
        }

        #region eventos

        private void btnRefrescar_Click(object sender, EventArgs e)
        {
            try
            {
                if (gui.validar())
                {
                    gui.refrescar();
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
