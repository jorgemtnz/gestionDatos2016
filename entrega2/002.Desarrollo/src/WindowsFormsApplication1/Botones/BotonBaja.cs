using System;
using System.Windows.Forms;
using MercadoEnvioDesktop;
using System.Data.SqlClient;

namespace ApplicationGdd1
{
    public partial class BotonBaja : UserControl, IBoton
    {
        GUI gui;

        public BotonBaja()
        {
            InitializeComponent();
        }

        #region eventos

            private void btnBaja_Click(object sender, EventArgs e)
            {
                try
                {
                    if (gui.validar())
                    {
                       // gui.eliminar();
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
