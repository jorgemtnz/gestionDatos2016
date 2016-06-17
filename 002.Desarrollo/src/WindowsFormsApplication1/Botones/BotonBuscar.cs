using System;
using System.Windows.Forms;
using MercadoEnvioDesktop;
using System.Data.SqlClient;

namespace ApplicationGdd1
{
    public partial class BotonBuscar : UserControl, IBoton
    {
        GUI gui;

        public BotonBuscar()
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
